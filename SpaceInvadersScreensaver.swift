import Cocoa
import ScreenSaver
import WebKit

@available(macOS 13.0, *)
final class SpaceInvadersScreensaverView: ScreenSaverView, WKNavigationDelegate {

    private var webView: WKWebView!

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)

        let config = WKWebViewConfiguration()

        // Permitir autoplay de audio sin gesto del usuario
        if #available(macOS 10.15, *) {
            config.mediaTypesRequiringUserActionForPlayback = []
        }

        let webpagePrefs = WKWebpagePreferences()
        webpagePrefs.allowsContentJavaScript = true
        config.defaultWebpagePreferences = webpagePrefs

        // CRÍTICO: Permitir acceso a archivos locales
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

        // SOLUCIÓN: Usar loadFileURL en vez de loadHTMLString
        guard let htmlURL = bundle.url(forResource: "index", withExtension: "html") else {
            NSLog("❌ SpaceInvaders: No se encontró index.html")
            NSLog("   Bundle path: \(bundle.bundlePath)")
            return
        }

        // Obtener el directorio Resources para acceso a assets/
        let resourcesURL = htmlURL.deletingLastPathComponent()
        
        NSLog("✅ SpaceInvaders: Cargando HTML desde: \(htmlURL.path)")
        NSLog("   Resources URL: \(resourcesURL.path)")
        
        // CLAVE: loadFileURL permite rutas relativas como "assets/Ship.gif"
        webView.loadFileURL(htmlURL, allowingReadAccessTo: resourcesURL)
    }

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
        // Opcional: pausar el juego
        webView.evaluateJavaScript("window.location.reload()", completionHandler: nil)
    }

    override var hasConfigureSheet: Bool { false }

    // WKNavigationDelegate para debugging
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("✅ SpaceInvaders: WebView cargado exitosamente")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("❌ SpaceInvaders: Error en navegación: \(error.localizedDescription)")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("❌ SpaceInvaders: Error provisional: \(error.localizedDescription)")
    }
}
