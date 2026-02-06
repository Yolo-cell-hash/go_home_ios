//
//  JAODMDevicesList.m
//  eseecloud
//
//  Created by gxl on 2018/11/5.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMDevicesList.h"

#define JA_FILE_NAME @"index"

@implementation JAODMDevicesList

- (void)setup
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:JA_FILE_NAME ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    self.singleDeviceItemStyle = [info[@"MyDevice"][@"ItemStyle"][@"SingleDevice"] integerValue];
    self.NvrItemStyle = [info[@"MyDevice"][@"ItemStyle"][@"NVR"] integerValue];
    self.gatewayItemStyle = [info[@"MyDevice"][@"ItemStyle"][@"Gateway"] integerValue];
    
    self.bottomAddDeviceItems = [info[@"MyDevice"][@"BottomAddDeviceItem"] integerValue];
    self.navRightItems = [info[@"MyDevice"][@"NavRightItem"] integerValue];
    
    self.connectingColor = info[@"MyDevice"][@"Color"][@"DeviceStatusColor"][@"Connecting"];
    self.offlineColor = info[@"MyDevice"][@"Color"][@"DeviceStatusColor"][@"Offline"];
    self.onlineColor = info[@"MyDevice"][@"Color"][@"DeviceStatusColor"][@"Online"];
    self.authFailColor = info[@"MyDevice"][@"Color"][@"DeviceStatusColor"][@"AuthFail"];
    
    self.groupEnable = [info[@"CameraGroup"][@"Enable"] boolValue];
    
}

@end
