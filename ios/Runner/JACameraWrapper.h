//
//  JACameraWrapper.h
//  Runner
//
//  Objective-C wrapper for JAJUAN SDK - hides SDK complexity from Swift
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JACameraWrapperPTZDirection) {
    JACameraWrapperPTZDirectionUp = 0,
    JACameraWrapperPTZDirectionDown = 1,
    JACameraWrapperPTZDirectionLeft = 2,
    JACameraWrapperPTZDirectionRight = 3,
    JACameraWrapperPTZDirectionStop = 99
};

@interface JACameraWrapper : NSObject

/// Whether the SDK is initialized
@property (nonatomic, readonly) BOOL isInitialized;

/// Get the camera view to display
@property (nonatomic, readonly, nullable) UIView *cameraView;

/// Initialize the SDK
- (void)initializeSDK;

/// Configure camera connection
- (void)configureWithDeviceID:(NSString *)deviceID
                   deviceName:(NSString *)deviceName
                     username:(NSString *)username
                     password:(NSString *)password
                 channelCount:(NSInteger)channelCount;

/// Create and return the camera preview view
- (UIView *)createPreviewView;

/// Start video streaming
- (void)startStream;

/// Stop video streaming  
- (void)stopStream;

/// PTZ control
- (void)ptzMove:(JACameraWrapperPTZDirection)direction;
- (void)ptzStop;

/// Capture screenshot
- (nullable NSString *)captureScreenshot;

/// Cleanup resources
- (void)dispose;

@end

NS_ASSUME_NONNULL_END
