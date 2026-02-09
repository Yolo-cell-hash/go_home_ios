//
//  JACameraViewFactory.swift
//  Runner
//
//  Flutter platform view factory for native camera view
//

import Flutter
import UIKit

/// Factory for creating native camera platform views
class JACameraViewFactory: NSObject, FlutterPlatformViewFactory {
    
    private var messenger: FlutterBinaryMessenger
    private weak var plugin: JACameraPlugin?
    
    init(messenger: FlutterBinaryMessenger, plugin: JACameraPlugin) {
        self.messenger = messenger
        self.plugin = plugin
        super.init()
        print("[JACameraViewFactory] Factory initialized")
    }
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        print("[JACameraViewFactory] *** create called ***")
        print("[JACameraViewFactory] Frame: \(frame)")
        
        let view = JACameraView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger,
            plugin: plugin
        )
        return view
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

/// Native camera platform view with SDK integration
class JACameraView: NSObject, FlutterPlatformView {
    
    private var containerView: UIView
    private var messenger: FlutterBinaryMessenger
    private weak var plugin: JACameraPlugin?
    
    // Keep strong reference to the preview VC for proper lifecycle
    private var previewVC: JAPreviewMultipleViewController?
    
    private var deviceId: String = ""
    private var deviceName: String = ""
    private var username: String = "admin"
    private var password: String = ""
    private var channelCount: Int = 1
    private var sdkSetupAttempted: Bool = false
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger,
        plugin: JACameraPlugin?
    ) {
        print("[JACameraView-Native] *** init started ***")
        print("[JACameraView-Native] Input frame: \(frame)")
        
        // ALWAYS create container with reasonable default size
        let defaultSize = CGSize(width: 400, height: 300)
        var viewFrame = frame
        if viewFrame.width < 10 || viewFrame.height < 10 {
            viewFrame = CGRect(origin: frame.origin, size: defaultSize)
            print("[JACameraView-Native] Using default size: \(defaultSize)")
        }
        
        self.containerView = UIView(frame: viewFrame)
        self.containerView.backgroundColor = .black
        self.containerView.clipsToBounds = true
        self.messenger = messenger
        self.plugin = plugin
        super.init()
        
        print("[JACameraView-Native] Container created with frame: \(viewFrame)")
        
        // Parse args safely
        if let argsDict = args as? [String: Any] {
            deviceId = argsDict["deviceId"] as? String ?? plugin?.getDeviceId() ?? ""
            deviceName = argsDict["deviceName"] as? String ?? plugin?.getDeviceName() ?? ""
            username = argsDict["username"] as? String ?? plugin?.getUsername() ?? "admin"
            password = argsDict["password"] as? String ?? plugin?.getPassword() ?? ""
            channelCount = argsDict["channelCount"] as? Int ?? plugin?.getChannelCount() ?? 1
        } else {
            deviceId = plugin?.getDeviceId() ?? ""
            deviceName = plugin?.getDeviceName() ?? ""
            username = plugin?.getUsername() ?? "admin"
            password = plugin?.getPassword() ?? ""
            channelCount = plugin?.getChannelCount() ?? 1
        }
        
        print("[JACameraView-Native] Config: deviceId=\(deviceId), user=\(username), channelCount=\(channelCount)")
        
        // Show initial placeholder
        showPlaceholder(message: "Initializing camera...")
        
        // Delay SDK setup to ensure view is properly sized
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.attemptSdkSetup()
        }
        
        print("[JACameraView-Native] *** init completed ***")
    }
    
    func view() -> UIView {
        return containerView
    }
    
    private func attemptSdkSetup() {
        print("[JACameraView-Native] *** attemptSdkSetup ***")
        print("[JACameraView-Native] Container bounds: \(containerView.bounds)")
        
        guard !sdkSetupAttempted else {
            print("[JACameraView-Native] SDK setup already attempted, skipping")
            return
        }
        sdkSetupAttempted = true
        
        guard !deviceId.isEmpty else {
            print("[JACameraView-Native] ERROR: deviceId is empty!")
            showPlaceholder(message: "Error: No device ID")
            return
        }
        
        performSdkSetup()
    }
    
    private func performSdkSetup() {
        print("[JACameraView-Native] *** performSdkSetup started ***")
        
        // DEBUG: Verify bundle resources before SDK initialization
        print("[JACameraView-Native] *** Bundle Resource Verification ***")
        let bundle = Bundle.main
        print("[JACameraView-Native] Main bundle path: \(bundle.bundlePath)")
        
        // Check for General.json
        if let generalPath = bundle.path(forResource: "General", ofType: "json") {
            print("[JACameraView-Native] ✓ General.json FOUND at: \(generalPath)")
        } else {
            print("[JACameraView-Native] ✗ General.json NOT FOUND in main bundle!")
        }
        
        // Check for other critical files
        let criticalFiles = ["Cloud", "AddDevice", "PreviewPlayback", "JAHelp"]
        for file in criticalFiles {
            if let path = bundle.path(forResource: file, ofType: "json") {
                print("[JACameraView-Native] ✓ \(file).json FOUND")
            } else {
                print("[JACameraView-Native] ✗ \(file).json NOT FOUND")
            }
        }
        
        // List all JSON files in bundle (for debugging)
        if let resourcePath = bundle.resourcePath {
            do {
                let files = try FileManager.default.contentsOfDirectory(atPath: resourcePath)
                let jsonFiles = files.filter { $0.hasSuffix(".json") }
                print("[JACameraView-Native] JSON files in bundle root: \(jsonFiles)")
            } catch {
                print("[JACameraView-Native] Error listing bundle contents: \(error)")
            }
        }
        print("[JACameraView-Native] *** End Bundle Verification ***")
        
        // Create the preview view controller directly
        print("[JACameraView-Native] Creating JAPreviewMultipleViewController...")
        previewVC = JAPreviewMultipleViewController()
        
        guard let vc = previewVC else {
            print("[JACameraView-Native] ERROR: Failed to create JAPreviewMultipleViewController")
            showPlaceholder(message: "Error: Preview creation failed")
            return
        }
        print("[JACameraView-Native] JAPreviewMultipleViewController created: \(vc)")
        
        // Configure the view controller with juanUI = YES for full SDK rendering
        // Using juanUI = YES enables the SDK's built-in video rendering
        vc.juanUI = true
        vc.channelCount = channelCount
        vc.deviceID = deviceId
        vc.deviceIP = ""
        vc.devicePort = ""
        vc.deviceUser = username
        vc.devicePassword = password
        vc.deviceName = deviceName
        
        print("[JACameraView-Native] PreviewVC configured:")
        print("[JACameraView-Native]   juanUI: YES (using SDK's built-in UI)")
        print("[JACameraView-Native]   channelCount: \(channelCount)")
        print("[JACameraView-Native]   deviceID: \(deviceId)")
        print("[JACameraView-Native]   deviceUser: \(username)")
        print("[JACameraView-Native]   deviceName: \(deviceName)")
        
        // CRITICAL: Trigger view loading
        _ = vc.view
        print("[JACameraView-Native] VC view loaded: \(String(describing: vc.view))")
        print("[JACameraView-Native] VC view frame: \(vc.view.frame)")
        
        // Log screen property (JAMultivideosPlayer) - these are not optional in SDK
        let screen = vc.screen
        print("[JACameraView-Native] screen (JAMultivideosPlayer): \(String(describing: screen))")
        
        let screenView = vc.screenView
        print("[JACameraView-Native] screenView: \(String(describing: screenView))")
        
        // Add to container on main thread
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let vc = self.previewVC else { return }
            
            print("[JACameraView-Native] Adding preview VC view to container...")
            print("[JACameraView-Native] Container bounds: \(self.containerView.bounds)")
            
            // Clear placeholder
            self.containerView.subviews.forEach { $0.removeFromSuperview() }
            
            // CRITICAL: For UIViewController lifecycle, we need to add as child VC
            // Find the root view controller
            if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
                print("[JACameraView-Native] Found root VC: \(type(of: rootVC))")
                
                // Add as child view controller for proper lifecycle
                rootVC.addChild(vc)
                vc.view.frame = self.containerView.bounds
                vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                self.containerView.addSubview(vc.view)
                vc.didMove(toParent: rootVC)
                
                print("[JACameraView-Native] Preview VC added as child, view frame: \(vc.view.frame)")
            } else {
                // Fallback: just add the view
                print("[JACameraView-Native] No root VC found, adding view directly")
                vc.view.frame = self.containerView.bounds
                vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                self.containerView.addSubview(vc.view)
            }
            
            print("[JACameraView-Native] Preview view hierarchy:")
            self.logViewHierarchy(self.containerView, level: 0)
            
            // Start stream after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                print("[JACameraView-Native] Calling openVideoStream:YES...")
                self?.previewVC?.openVideoStream(true)
                print("[JACameraView-Native] openVideoStream called")
            }
        }
    }
    
    private func logViewHierarchy(_ view: UIView, level: Int) {
        let indent = String(repeating: "  ", count: level)
        print("\(indent)\(type(of: view)) frame: \(view.frame)")
        for subview in view.subviews {
            logViewHierarchy(subview, level: level + 1)
        }
    }
    
    private func showPlaceholder(message: String) {
        print("[JACameraView-Native] showPlaceholder: \(message)")
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.containerView.subviews.forEach { $0.removeFromSuperview() }
            
            let placeholderLabel = UILabel(frame: self.containerView.bounds)
            placeholderLabel.text = message
            placeholderLabel.textColor = .white
            placeholderLabel.textAlignment = .center
            placeholderLabel.numberOfLines = 0
            placeholderLabel.font = UIFont.systemFont(ofSize: 14)
            placeholderLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            placeholderLabel.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
            self.containerView.addSubview(placeholderLabel)
        }
    }
    
    deinit {
        print("[JACameraView-Native] deinit - cleaning up")
        
        // Stop streaming
        previewVC?.openVideoStream(false)
        
        // Remove from parent if added as child
        if let vc = previewVC {
            vc.willMove(toParent: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
        
        previewVC = nil
    }
}
