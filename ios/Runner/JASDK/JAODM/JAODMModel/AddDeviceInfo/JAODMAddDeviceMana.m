//
//  JAODMAddDeviceMana.m
//  eseecloud
//
//  Created by gxl on 2018/7/10.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMAddDeviceMana.h"
//#import "JAWiFiManager.h"
//#import "JABLEConfigManager.h"
//#import "JAAddDeviceManualViewController.h"
//
//#import "JAAlertView.h"
//#import "NSString+JAAddDevice.h"
//
//#import "JACodeScanController.h"
//
//#import "JAODMInfo.h"
//#import "JANewAddDeviceLightViewController.h"

static JAODMAddDeviceMana *manager = nil;
@implementation JAODMAddDeviceMana

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [super allocWithZone:zone];
        }
    });
    return manager;
}
+(instancetype)manager {
    return [[self alloc]init];
}

-(id)copyWithZone:(NSZone *)zone {
    return manager;
}
-(id)mutableCopyWithZone:(NSZone *)zone {
    return manager;
}


- (void)invokeByItem:(JAODMAddDeviceKindItem*)item currentController:(UIViewController*)controller{
    int nAddType = 0;

}

- (void)_alertToConnectLANWithDevice
{
//    JAAlertView *alertView = [[JAAlertView alloc] initWithTitle:[NSString ja_pleaseConnectLANWithSameOfDevice] message:nil];
//    [alertView addAlertViewItem:[JAAlertViewItem alertItemWithTitle:[NSString ja_ok] itemAction:nil]];
//    [alertView showAlertView];
}


@end
