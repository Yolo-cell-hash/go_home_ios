//
//  JADeviceSettingViewController.h
//  eseecloud
//
//  Created by Mr.Z on 2018/3/5.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAViewController.h"

//设置页面视频服务开关block
typedef void(^JAHandleVideoServeBlock)(BOOL close);

extern NSString *const kJAVideoServiceStatusChanegedNotification;
extern NSString *const kJAIPCPIRSwitchChanegedNotification;
extern NSString *const kJASetDelegateChangedNotification;
extern NSString *const kJABatteryStatusChangedNotification;


@interface JADeviceSettingViewController : JAViewController
@property (nonatomic, assign) BOOL connectedDevice;
@property (nonatomic, assign) BOOL isPreconnectAndSleepStatus;
@property (nonatomic, copy) JAHandleVideoServeBlock handleVideoServeBlock;
@property (nonatomic, copy) void(^JASettingDeviceStatusBlock)(JAConnectorStatus status);//设置设备连接状态回调

@end

