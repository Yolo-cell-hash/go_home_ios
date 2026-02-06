//
//  JACameraPlugin.swift
//  Runner
//
//  Flutter method channel plugin for JAJUAN iOS Camera SDK
//

import Flutter
import UIKit

/// Flutter plugin for JAJUAN Camera SDK - uses Objective-C wrapper
class JACameraPlugin: NSObject, FlutterPlugin {
    
    static let CHANNEL_NAME = "eseeiot_camera"
    static let EVENT_CHANNEL_NAME = "eseeiot_camera_events"
    
    private var channel: FlutterMethodChannel?
    private var eventChannel: FlutterEventChannel?
    private var eventSink: FlutterEventSink?
    
    // Camera wrapper - shared with native view
    private var cameraWrapper: JACameraWrapper?
    
    // Camera configuration
    private var deviceId: String = ""
    private var deviceName: String = ""
    private var username: String = "admin"
    private var password: String = ""
    private var channelCount: Int = 1
    
    static func register(with registrar: FlutterPluginRegistrar) {
        print("[JACameraPlugin] *** register() called ***")
        
        let channel = FlutterMethodChannel(name: CHANNEL_NAME, binaryMessenger: registrar.messenger())
        let instance = JACameraPlugin()
        instance.channel = channel
        registrar.addMethodCallDelegate(instance, channel: channel)
        print("[JACameraPlugin] Method channel registered")
        
        // Event channel for streaming events
        let eventChannel = FlutterEventChannel(name: EVENT_CHANNEL_NAME, binaryMessenger: registrar.messenger())
        instance.eventChannel = eventChannel
        eventChannel.setStreamHandler(instance)
        print("[JACameraPlugin] Event channel registered")
        
        // Register platform view factory
        let factory = JACameraViewFactory(messenger: registrar.messenger(), plugin: instance)
        registrar.register(factory, withId: "ja_camera_view")
        print("[JACameraPlugin] Platform view factory registered with id: ja_camera_view")
    }
    
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initializeSDK":
            initializeSDK(result: result)
            
        case "saveCamera":
            if let args = call.arguments as? [String: Any] {
                let cameraId = args["cameraId"] as? String ?? ""
                let cameraName = args["cameraName"] as? String ?? ""
                let username = args["username"] as? String ?? "admin"
                let password = args["password"] as? String ?? ""
                let channelCount = args["channelCount"] as? Int ?? 1
                saveCamera(cameraId: cameraId, cameraName: cameraName, username: username, password: password, channelCount: channelCount, result: result)
            } else {
                result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
            }
            
        case "connectCamera":
            if let args = call.arguments as? [String: Any],
               let cameraId = args["cameraId"] as? String {
                connectCamera(cameraId: cameraId, result: result)
            } else {
                result(FlutterError(code: "INVALID_ARGS", message: "Camera ID required", details: nil))
            }
            
        case "initLiveView":
            initLiveView(result: result)
            
        case "startPlay":
            startPlay(result: result)
            
        case "stopPlay":
            stopPlay(result: result)
            
        case "ptzMoveUp":
            ptzMove(direction: .up, result: result)
            
        case "ptzMoveDown":
            ptzMove(direction: .down, result: result)
            
        case "ptzMoveLeft":
            ptzMove(direction: .left, result: result)
            
        case "ptzMoveRight":
            ptzMove(direction: .right, result: result)
            
        case "ptzStop":
            ptzStop(result: result)
            
        case "captureScreenshot":
            captureScreenshot(result: result)
            
        case "dispose":
            dispose(result: result)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    // MARK: - Public Methods for sharing wrapper with native view
    
    /// Called by JACameraView to share its wrapper instance with the plugin
    func setCameraWrapper(_ wrapper: JACameraWrapper?) {
        NSLog("[JACameraPlugin] setCameraWrapper called - wrapper is \(wrapper != nil ? "set" : "nil")")
        self.cameraWrapper = wrapper
    }
    
    /// Get the current camera wrapper (for shared access)
    func getCameraWrapper() -> JACameraWrapper? {
        return cameraWrapper
    }
    
    // MARK: - Getter methods for configuration (used by JACameraView)
    
    func getDeviceId() -> String { return deviceId }
    func getDeviceName() -> String { return deviceName }
    func getUsername() -> String { return username }
    func getPassword() -> String { return password }
    func getChannelCount() -> Int { return channelCount }
    
    // MARK: - Private Methods
    
    private func initializeSDK(result: @escaping FlutterResult) {
        print("[JACameraPlugin] Initializing SDK (configuration only)")
        // Don't create wrapper here - let native view create it
        result(true)
    }
    
    private func saveCamera(cameraId: String, cameraName: String, username: String, password: String, channelCount: Int, result: @escaping FlutterResult) {
        print("[JACameraPlugin] Saving camera: id=\(cameraId), name=\(cameraName)")
        self.deviceId = cameraId
        self.deviceName = cameraName
        self.username = username
        self.password = password
        self.channelCount = channelCount
        
        // Store config only - native view will create wrapper
        result(["success": true, "cameraId": cameraId, "cameraName": cameraName])
    }
    
    private func connectCamera(cameraId: String, result: @escaping FlutterResult) {
        print("[JACameraPlugin] Connecting to camera: \(cameraId)")
        self.deviceId = cameraId
        result(["success": true, "channelCount": channelCount])
    }
    
    private func initLiveView(result: @escaping FlutterResult) {
        print("[JACameraPlugin] Initializing live view")
        sendEvent(type: "liveViewInitialized", data: nil)
        result(["success": true])
    }
    
    private func startPlay(result: @escaping FlutterResult) {
        print("[JACameraPlugin] Starting playback")
        // Native view handles the actual stream start
        // Just send the event
        DispatchQueue.main.async { [weak self] in
            if let wrapper = self?.cameraWrapper {
                NSLog("[JACameraPlugin] startPlay - using shared wrapper")
                wrapper.startStream()
            } else {
                NSLog("[JACameraPlugin] startPlay - no wrapper yet, stream will start from native view")
            }
            self?.sendEvent(type: "playbackStarted", data: nil)
            result(["success": true])
        }
    }
    
    private func stopPlay(result: @escaping FlutterResult) {
        print("[JACameraPlugin] Stopping playback")
        DispatchQueue.main.async { [weak self] in
            self?.cameraWrapper?.stopStream()
            result(["success": true])
        }
    }
    
    // MARK: - PTZ Controls
    
    private func ptzMove(direction: JACameraWrapperPTZDirection, result: @escaping FlutterResult) {
        NSLog("[JACameraPlugin] PTZ move: \(direction.rawValue)")
        DispatchQueue.main.async { [weak self] in
            if let wrapper = self?.cameraWrapper {
                NSLog("[JACameraPlugin] PTZ move - calling wrapper")
                wrapper.ptzMove(direction)
                result(["success": true])
            } else {
                NSLog("[JACameraPlugin] PTZ move - ERROR: no wrapper!")
                result(["success": false, "error": "Camera not initialized"])
            }
        }
    }
    
    private func ptzStop(result: @escaping FlutterResult) {
        NSLog("[JACameraPlugin] PTZ stop")
        DispatchQueue.main.async { [weak self] in
            if let wrapper = self?.cameraWrapper {
                NSLog("[JACameraPlugin] PTZ stop - calling wrapper")
                wrapper.ptzStop()
                result(["success": true])
            } else {
                NSLog("[JACameraPlugin] PTZ stop - ERROR: no wrapper!")
                result(["success": false, "error": "Camera not initialized"])
            }
        }
    }
    
    private func captureScreenshot(result: @escaping FlutterResult) {
        print("[JACameraPlugin] Capturing screenshot")
        if let path = cameraWrapper?.captureScreenshot() {
            result(["success": true, "path": path])
        } else {
            result(["success": false, "error": "Camera not initialized"])
        }
    }
    
    private func dispose(result: @escaping FlutterResult) {
        print("[JACameraPlugin] Disposing")
        cameraWrapper?.dispose()
        cameraWrapper = nil
        result(["success": true])
    }
    
    // MARK: - Event Sending
    
    func sendEvent(type: String, data: [String: Any]?) {
        var event: [String: Any] = ["type": type]
        if let data = data {
            event.merge(data) { (_, new) in new }
        }
        eventSink?(event)
    }
}

// MARK: - FlutterStreamHandler

extension JACameraPlugin: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print("[JACameraPlugin] Event stream started")
        self.eventSink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print("[JACameraPlugin] Event stream cancelled")
        self.eventSink = nil
        return nil
    }
}
