//
//  JAODMAddDeviceMana.h
//  eseecloud
//
//  Created by gxl on 2018/7/10.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMAddDeviceKindItem.h"

@interface JAODMAddDeviceMana : NSObject
+(instancetype)manager;
- (void)invokeByItem:(JAODMAddDeviceKindItem*)item currentController:(UIViewController*)controller;
@end
