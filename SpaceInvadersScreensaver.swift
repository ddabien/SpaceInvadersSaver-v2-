import Cocoa
import ScreenSaver
import WebKit

@available(macOS 13.0, *)
final class SpaceInvadersScreensaverView: ScreenSaverView, WKNavigationDelegate {

    private var webView: WKWebView!

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)

        let config = WKWebViewConfiguration()
        let webpagePrefs = WKWebpagePreferences()
        webpagePrefs.allowsContentJavaScript = true
        config.defaultWebpagePreferences = webpagePrefs

        // Ayuda mucho cuando se carga HTML local con assets locales en .saver
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        config.setValue(true, forKey: "allowUniversalAccessFromFileURLs")

        webView = WKWebView(frame: bounds, configuration: config)
        webView.autoresizingMask = [.width, .height]
        webView.underPageBackgroundColor = .black
        webView.navigationDelegate = self

        addSubview(webView)

        loadGame()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func loadGame() {
        let bundle = Bundle(for: type(of: self))

        guard let htmlURL = bundle.url(forResource: "index", withExtension: "html") else {
            NSLog("SpaceInvaders: No se encontró index.html en Resources. Bundle: \(bundle.bundlePath)")
            return
        }

        guard let resourcesURL = bundle.resourceURL else {
            NSLog("SpaceInvaders: bundle.resourceURL es nil. Bundle: \(bundle.bundlePath)")
            return
        }

        do {
            let html = try String(contentsOf: htmlURL, encoding: .utf8)
            // ✅ Clave: baseURL = Resources. Así 'assets/...' resuelve dentro de Contents/Resources/
            webView.loadHTMLString(html, baseURL: resourcesURL)
        } catch {
            NSLog("SpaceInvaders: Error leyendo index.html: \(error)")
        }
    }

    // Fondo negro (por las dudas)
    override func draw(_ rect: NSRect) {
        NSColor.black.setFill()
        rect.fill()
    }

    override func startAnimation() {
        super.startAnimation()
        loadGame()
    }

    override func stopAnimation() {
        super.stopAnimation()
        // No es obligatorio, pero ayuda a “resetear” JS cuando se apaga/enciende
        webView.evaluateJavaScript("window.location.reload()", completionHandler: nil)
    }

    override var hasConfigureSheet: Bool { false }

    // MARK: - WKNavigationDelegate (logs útiles)

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("SpaceInvaders: WebView didFail navigation: \(error)")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("SpaceInvaders: WebView didFailProvisionalNavigation: \(error)")
    }
}

}
