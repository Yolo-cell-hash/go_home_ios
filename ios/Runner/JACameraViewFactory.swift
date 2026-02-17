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
    
    // Timer for periodic cleanup
    private var cleanupTimer: Timer?
    
    private func performSdkSetup() {
        print("[JACameraView-Native] *** performSdkSetup started ***")
        
        // Create the preview view controller
        previewVC = JAPreviewMultipleViewController()
        
        guard let vc = previewVC else {
            print("[JACameraView-Native] ERROR: Failed to create JAPreviewMultipleViewController")
            showPlaceholder(message: "Error: Preview creation failed")
            return
        }
        
        // Configure with juanUI = YES for SDK's built-in video rendering + PTZ
        vc.juanUI = true
        vc.channelCount = channelCount
        vc.deviceID = deviceId
        vc.deviceIP = ""
        vc.devicePort = ""
        vc.deviceUser = username
        vc.devicePassword = password
        vc.deviceName = deviceName
        
        print("[JACameraView-Native] PreviewVC configured: juanUI=YES, ch=\(channelCount), id=\(deviceId)")
        
        // Trigger view loading
        _ = vc.view
        
        // Add to container on main thread
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let vc = self.previewVC else { return }
            
            let bounds = self.containerView.bounds
            print("[JACameraView-Native] Container bounds: \(bounds)")
            
            // Clear placeholder
            self.containerView.subviews.forEach { $0.removeFromSuperview() }
            
            // STRATEGY: Give SDK view a VERY tall frame.
            // The SDK lays out video at top, toolbars/panels below.
            // Container's clipsToBounds=true clips away everything outside visible bounds.
            let sdkHeight = max(bounds.height * 3, 2000)
            
            // Add as child VC for proper lifecycle
            if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
                rootVC.addChild(vc)
                vc.view.frame = CGRect(x: 0, y: 0, width: bounds.width, height: sdkHeight)
                // Only flex width, NOT height — we want height to stay tall
                vc.view.autoresizingMask = [.flexibleWidth]
                self.containerView.addSubview(vc.view)
                vc.didMove(toParent: rootVC)
            } else {
                vc.view.frame = CGRect(x: 0, y: 0, width: bounds.width, height: sdkHeight)
                vc.view.autoresizingMask = [.flexibleWidth]
                self.containerView.addSubview(vc.view)
            }
            
            // Register wrapper with the plugin so PTZ commands work
            let wrapper = JACameraWrapper()
            wrapper.setPreviewViewController(vc)
            self.plugin?.setCameraWrapper(wrapper)
            print("[JACameraView-Native] SDK view height set to \(sdkHeight), wrapper registered for PTZ")
            
            // Start stream
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.previewVC?.openVideoStream(true)
                print("[JACameraView-Native] openVideoStream called")
            }
            
            // Start periodic cleanup — runs every 2 seconds for the first 20 seconds
            // This catches SDKrelayouts reliably
            var cleanupCount = 0
            self.cleanupTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] timer in
                cleanupCount += 1
                self?.enforceCleanLayout()
                // Stop after 10 runs (20 seconds) — SDK should be stable by then
                if cleanupCount >= 10 {
                    timer.invalidate()
                    print("[JACameraView-Native] Cleanup timer stopped after \(cleanupCount) runs")
                }
            }
        }
    }
    
    /// Enforce clean layout: ensure video player fills the visible container area.
    /// All SDK panels (toolbars, PTZ, presets) overflow below and get clipped.
    private func enforceCleanLayout() {
        let bounds = containerView.bounds
        guard bounds.width > 0 && bounds.height > 0 else { return }
        
        // Ensure SDK view stays tall (SDK may try to resize it)
        if let sdkView = previewVC?.view, sdkView.frame.height < bounds.height * 2 {
            let sdkHeight = max(bounds.height * 3, 2000)
            sdkView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: sdkHeight)
        }
        
        // Find video player in the SDK hierarchy
        var videoPlayerView: UIView?
        
        func findVideoPlayer(in view: UIView) {
            let className = String(describing: type(of: view))
            if className == "JAMultivideosPlayer" {
                videoPlayerView = view
                return
            }
            for sub in view.subviews {
                findVideoPlayer(in: sub)
            }
        }
        
        if let sdkView = previewVC?.view {
            findVideoPlayer(in: sdkView)
        }
        
        // If we found the video player, ensure it fills the visible area
        if let videoPlayer = videoPlayerView {
            videoPlayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            resizeNestedVideoViews(in: videoPlayer, to: bounds.size)
        }
    }
    
    /// Recursively resize nested video/screen views to fill given size
    private func resizeNestedVideoViews(in view: UIView, to size: CGSize) {
        let targetRect = CGRect(origin: .zero, size: size)
        for subview in view.subviews {
            let className = String(describing: type(of: subview))
            if className == "JAVideoPlayer" || className == "JANormalScreen" || className == "UIScrollView" {
                subview.frame = targetRect
                subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                resizeNestedVideoViews(in: subview, to: size)
            } else if subview is UIImageView {
                subview.frame = targetRect
                subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            }
        }
    }
    
    private func showPlaceholder(message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.containerView.subviews.forEach { $0.removeFromSuperview() }
            
            let label = UILabel(frame: self.containerView.bounds)
            label.text = message
            label.textColor = .white
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 14)
            label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            label.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
            self.containerView.addSubview(label)
        }
    }
    
    deinit {
        print("[JACameraView-Native] deinit - cleaning up")
        cleanupTimer?.invalidate()
        cleanupTimer = nil
        
        // Stop streaming
        previewVC?.openVideoStream(false)
        
        // Clear wrapper from plugin so next open gets a fresh one
        plugin?.setCameraWrapper(nil)
        
        // Remove VC from parent
        if let vc = previewVC {
            vc.willMove(toParent: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
        
        previewVC = nil
        print("[JACameraView-Native] deinit - cleanup complete")
    }
}
