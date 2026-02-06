import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    print("[AppDelegate] *** didFinishLaunchingWithOptions started ***")
    
    GeneratedPluginRegistrant.register(with: self)
    print("[AppDelegate] GeneratedPluginRegistrant.register completed")
    
    // Register custom JACameraPlugin for iOS camera SDK
    print("[AppDelegate] About to register JACameraPlugin...")
    if let registrar = self.registrar(forPlugin: "JACameraPlugin") {
      print("[AppDelegate] Got registrar for JACameraPlugin: \(registrar)")
      JACameraPlugin.register(with: registrar)
      print("[AppDelegate] JACameraPlugin.register() completed")
    } else {
      print("[AppDelegate] ERROR: Failed to get registrar for JACameraPlugin!")
    }
    
    print("[AppDelegate] *** didFinishLaunchingWithOptions completed ***")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
