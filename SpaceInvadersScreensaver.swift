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
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
        // Crear WebView
        webView = WKWebView(frame: bounds, configuration: config)
        webView.autoresizingMask = [.width, .height]
        
        // Fondo negro mientras carga (API de macOS 13+)
        webView.underPageBackgroundColor = .black
        
        addSubview(webView)
        
        // Cargar el juego
        loadGame()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func loadGame() {
        guard let bundle = Bundle(for: type(of: self)),
              let htmlPath = bundle.path(forResource: "index", ofType: "html") else {
            NSLog("SpaceInvaders: No se encontró index.html en el bundle")
            return
        }
        
        let htmlURL = URL(fileURLWithPath: htmlPath)
        let resourcesURL = htmlURL.deletingLastPathComponent()
        
        // Cargar HTML con acceso completo a recursos locales
        webView.loadFileURL(htmlURL, allowingReadAccessTo: resourcesURL)
    }
    
    override func draw(_ rect: NSRect) {
        // Fondo negro
        NSColor.black.setFill()
        rect.fill()
    }
    
    override func animateOneFrame() {
        // El WebView maneja su propia animación
        super.animateOneFrame()
    }
    
    override var hasConfigureSheet: Bool {
        return false
    }
    
    override func startAnimation() {
        super.startAnimation()
        // Recargar el juego cada vez que se activa el screensaver
        loadGame()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
        // Detener audio y animación al desactivar
        webView.evaluateJavaScript("window.location.reload()", completionHandler: nil)
    }
}
