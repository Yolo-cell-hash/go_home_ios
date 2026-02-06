//
//  JACameraWrapper.m
//  Runner
//
//  Objective-C wrapper for JAJUAN SDK
//

#import "JACameraWrapper.h"
#import "JASDKHeader.h"
#import "JAPreviewMultipleViewController.h"
#import "JAPreviewBaseViewController.h"
#import "JAMultivideosPlayer.h"
#import "JAVideoPlayer.h"
#import "JAConnectorManager.h"
#import "JAConnector.h"

@interface JACameraWrapper ()
@property (nonatomic, strong) JAPreviewMultipleViewController *previewVC;
@property (nonatomic, copy) NSString *deviceID;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) NSInteger channelCount;
@property (nonatomic, assign) BOOL isInitialized;
@end

@implementation JACameraWrapper

- (void)initializeSDK {
    NSLog(@"[JACameraWrapper] *** initializeSDK called ***");
    _isInitialized = YES;
    NSLog(@"[JACameraWrapper] isInitialized set to YES");
}

- (void)configureWithDeviceID:(NSString *)deviceID
                   deviceName:(NSString *)deviceName
                     username:(NSString *)username
                     password:(NSString *)password
                 channelCount:(NSInteger)channelCount {
    NSLog(@"[JACameraWrapper] *** configureWithDeviceID called ***");
    NSLog(@"[JACameraWrapper] deviceID: %@", deviceID);
    NSLog(@"[JACameraWrapper] deviceName: %@", deviceName);
    NSLog(@"[JACameraWrapper] username: %@", username);
    NSLog(@"[JACameraWrapper] password: %@", password.length > 0 ? @"(set)" : @"(empty)");
    NSLog(@"[JACameraWrapper] channelCount: %ld", (long)channelCount);
    
    _deviceID = deviceID;
    _deviceName = deviceName.length > 0 ? deviceName : deviceID;
    _username = username;
    _password = password;
    _channelCount = channelCount;
    
    NSLog(@"[JACameraWrapper] Configuration saved");
}

- (UIView *)createPreviewView {
    NSLog(@"[JACameraWrapper] *** createPreviewView called ***");
    NSLog(@"[JACameraWrapper] Creating JAPreviewMultipleViewController...");
    
    @try {
        _previewVC = [[JAPreviewMultipleViewController alloc] init];
        NSLog(@"[JACameraWrapper] JAPreviewMultipleViewController created");
        
        // Set juanUI to NO FIRST to use custom UI
        _previewVC.juanUI = NO;
        
        // Configure all required properties
        _previewVC.channelCount = _channelCount;
        _previewVC.deviceID = _deviceID;
        _previewVC.deviceIP = @"";
        _previewVC.devicePort = @"";
        _previewVC.deviceUser = _username;
        _previewVC.devicePassword = _password;
        _previewVC.deviceName = _deviceName;
        
        NSLog(@"[JACameraWrapper] PreviewVC properties set:");
        NSLog(@"[JACameraWrapper]   juanUI: NO");
        NSLog(@"[JACameraWrapper]   channelCount: %ld", (long)_channelCount);
        NSLog(@"[JACameraWrapper]   deviceID: %@", _deviceID);
        NSLog(@"[JACameraWrapper]   deviceUser: %@", _username);
        NSLog(@"[JACameraWrapper]   deviceName: %@", _deviceName);
        
        // IMPORTANT: Access the view to trigger viewDidLoad
        // This is required for UIViewController lifecycle to initialize the view
        NSLog(@"[JACameraWrapper] Triggering viewDidLoad by accessing .view...");
        UIView *vcView = _previewVC.view;
        NSLog(@"[JACameraWrapper] VC .view accessed: %@", vcView);
        NSLog(@"[JACameraWrapper] VC .view frame: %@", NSStringFromCGRect(vcView.frame));
        
        // Set background to black for debugging visibility
        vcView.backgroundColor = [UIColor blackColor];
        
        // Check if screen property (JAMultivideosPlayer) is available
        JAMultivideosPlayer *screen = _previewVC.screen;
        NSLog(@"[JACameraWrapper] screen (JAMultivideosPlayer): %@", screen);
        
        // Check screenView
        UIView *screenView = _previewVC.screenView;
        NSLog(@"[JACameraWrapper] screenView: %@", screenView);
        
        if (screen) {
            NSLog(@"[JACameraWrapper] screen.class: %@", NSStringFromClass([screen class]));
            NSLog(@"[JACameraWrapper] screen.frame: %@", NSStringFromCGRect(screen.frame));
        }
        
        // Return the full view controller's view which contains all the SDK UI
        NSLog(@"[JACameraWrapper] Returning full VC.view for Flutter embedding");
        return vcView;
    }
    @catch (NSException *exception) {
        NSLog(@"[JACameraWrapper] EXCEPTION in createPreviewView: %@", exception);
        NSLog(@"[JACameraWrapper] Exception reason: %@", exception.reason);
        return nil;
    }
}

- (UIView *)cameraView {
    NSLog(@"[JACameraWrapper] cameraView getter called");
    return _previewVC.view;
}

- (void)startStream {
    NSLog(@"[JACameraWrapper] *** startStream called ***");
    if (_previewVC) {
        NSLog(@"[JACameraWrapper] previewVC exists");
        NSLog(@"[JACameraWrapper] previewVC.deviceID: %@", _previewVC.deviceID);
        NSLog(@"[JACameraWrapper] previewVC.deviceUser: %@", _previewVC.deviceUser);
        NSLog(@"[JACameraWrapper] Calling openVideoStream:YES on previewVC");
        [_previewVC openVideoStream:YES];
        NSLog(@"[JACameraWrapper] openVideoStream:YES called");
    } else {
        NSLog(@"[JACameraWrapper] ERROR: previewVC is nil, cannot start stream!");
    }
}

- (void)stopStream {
    NSLog(@"[JACameraWrapper] *** stopStream called ***");
    if (_previewVC) {
        NSLog(@"[JACameraWrapper] Calling openVideoStream:NO to stop stream");
        [_previewVC openVideoStream:NO];
    }
}

- (void)ptzMove:(JACameraWrapperPTZDirection)direction {
    NSLog(@"[JACameraWrapper] *** ptzMove called with direction: %ld ***", (long)direction);
    
    if (_previewVC) {
        JAConnectorPTZType ptzType;
        switch (direction) {
            case JACameraWrapperPTZDirectionUp:
                ptzType = JAConnectorPTZTypeUP;
                NSLog(@"[JACameraWrapper] PTZ direction: UP");
                break;
            case JACameraWrapperPTZDirectionDown:
                ptzType = JAConnectorPTZTypeDOWN;
                NSLog(@"[JACameraWrapper] PTZ direction: DOWN");
                break;
            case JACameraWrapperPTZDirectionLeft:
                ptzType = JAConnectorPTZTypeLEFT;
                NSLog(@"[JACameraWrapper] PTZ direction: LEFT");
                break;
            case JACameraWrapperPTZDirectionRight:
                ptzType = JAConnectorPTZTypeRIGHT;
                NSLog(@"[JACameraWrapper] PTZ direction: RIGHT");
                break;
            default:
                ptzType = JAConnectorPTZTypeSTOP;
                NSLog(@"[JACameraWrapper] PTZ direction: UNKNOWN -> STOP");
                break;
        }
        
        NSLog(@"[JACameraWrapper] Calling doConsoleDirection with ptzType: %ld", (long)ptzType);
        [_previewVC doConsoleDirection:ptzType];
        NSLog(@"[JACameraWrapper] doConsoleDirection called");
    } else {
        NSLog(@"[JACameraWrapper] ERROR: previewVC is nil, cannot move PTZ!");
    }
}

- (void)ptzStop {
    NSLog(@"[JACameraWrapper] *** ptzStop called ***");
    if (_previewVC) {
        NSLog(@"[JACameraWrapper] Calling doConsoleDirection with JAConnectorPTZTypeStop");
        [_previewVC doConsoleDirection:JAConnectorPTZTypeSTOP];
    } else {
        NSLog(@"[JACameraWrapper] ERROR: previewVC is nil, cannot stop PTZ!");
    }
}

- (NSString *)captureScreenshot {
    NSLog(@"[JACameraWrapper] *** captureScreenshot called ***");
    if (_previewVC) {
        NSLog(@"[JACameraWrapper] Calling screenShot on previewVC");
        NSString *path = [_previewVC screenShot];
        NSLog(@"[JACameraWrapper] Screenshot result path: %@", path);
        return path;
    } else {
        NSLog(@"[JACameraWrapper] ERROR: previewVC is nil, cannot capture!");
    }
    return nil;
}

- (void)dispose {
    NSLog(@"[JACameraWrapper] *** dispose called ***");
    if (_previewVC) {
        NSLog(@"[JACameraWrapper] Stopping stream before dispose...");
        [_previewVC openVideoStream:NO];
        _previewVC = nil;
        NSLog(@"[JACameraWrapper] previewVC set to nil");
    }
    _isInitialized = NO;
}

@end
