import Cocoa
import ScreenSaver
import WebKit

@available(macOS 13.0, *)
class SpaceInvadersScreensaverView: ScreenSaverView {
    private var webView: WKWebView!

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)

        // Configuración de WebKit para macOS 13+
        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences = preferences

        // Permitir acceso a archivos locales (requerido para macOS 13+)
        // Nota: esta key es privada, pero suele usarse para este caso.
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")

        webView = WKWebView(frame: bounds, configuration: config)
        webView.autoresizingMask = [.width, .height]
        webView.underPageBackgroundColor = .black
        addSubview(webView)

        loadGame()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func loadGame() {
        // ✅ Bundle(for:) NO es Optional -> no va con "guard let"
        let bundle = Bundle(for: type(of: self))

        guard let htmlPath = bundle.path(forResource: "index", ofType: "html") else {
            NSLog("SpaceInvaders: No se encontró index.html en el bundle. Bundle path: \(bundle.bundlePath)")
            return
        }

        let htmlURL = URL(fileURLWithPath: htmlPath)
        let resourcesURL = htmlURL.deletingLastPathComponent()

        // Cargar HTML con acceso a recursos locales
        webView.loadFileURL(htmlURL, allowingReadAccessTo: resourcesURL)
    }

    override func draw(_ rect: NSRect) {
        NSColor.black.setFill()
        rect.fill()
    }

    override func animateOneFrame() {
        // El WebView maneja su propia animación
        super.animateOneFrame()
    }

    override var hasConfigureSheet: Bool { false }

    override func startAnimation() {
        super.startAnimation()
        loadGame()
    }

    override func stopAnimation() {
        super.stopAnimation()
        // Si querés “cortar” audio/estado, recargar ayuda.
        webView.evaluateJavaScript("window.location.reload()", completionHandler: nil)
    }
}
