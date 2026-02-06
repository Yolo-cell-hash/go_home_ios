//
//  JAPreviewSingleViewController.h
//  eseecloud
//
//  Created by gxl on 2019/5/17.
//  Copyright © 2019 juanvision. All rights reserved.
//

#import "JAPreviewBaseViewController.h"
#import "JAPanoramaScreen+Animation.h"
NS_ASSUME_NONNULL_BEGIN

@interface JAPreviewSingleViewController : JAPreviewBaseViewController

@property (nonatomic, strong) JAConnectorManager *connectorManager;

/// 视频数据
/// @param connecter connecter description
/// @param frame frame description
/// @param size size description
/// @param width width description
/// @param height height description
/// @param type type description
/// @param timestamp timestamp description
/// @param index index description
- (void)connector:(JAConnector *)connecter videoFrame:(void *)frame size:(NSUInteger)size width:(NSUInteger)width height:(NSUInteger)height type:(NSUInteger)type timestamp:(NSUInteger)timestamp index:(NSUInteger)index;

/// audio数据
/// @param connecter connecter description
/// @param frame frame description
/// @param size size description
/// @param sampleRate sampleRate description
/// @param channelCount channelCount description
/// @param bitrate bitrate description
/// @param type type description
/// @param index index description
- (void)connector:(JAConnector *)connecter audioFrame:(void *)frame size:(NSUInteger)size sampleRate:(NSUInteger)sampleRate channelCount:(NSUInteger)channelCount bitrate:(NSUInteger)bitrate type:(NSUInteger)type index:(NSUInteger)index;

/// 视频播放当前时间戳
/// @param connecter connecter description
/// @param time 时间戳
/// @param index index description
-(void)connector:(JAConnector *)connecter currentTime:(NSInteger)time Index:(NSInteger)index;

/// OSD
/// @param connecter connecter description
/// @param data data description
- (void)connector:(JAConnector *)connecter OSDData:(NSData *)data;

/// 连接状态变化
/// @param connecter connecter description
/// @param status status description
/// @param index index description
-(void)connector:(JAConnector *)connecter StatusChange:(JAConnectorStatus)status Index:(NSInteger)index;

/// 获取到DeviceMode
/// @param connecter connecter description
/// @param mode mode description
/// @param index index description
- (void)connector:(JAConnector *)connecter DeviceMode:(JAConnectorDeviceMode)mode Index:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
