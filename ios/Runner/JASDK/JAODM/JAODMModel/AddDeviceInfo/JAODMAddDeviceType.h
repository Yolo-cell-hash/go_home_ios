//
//  JAODMAddDeviceType.h
//  eseecloud
//
//  Created by lixianliang on 2019/3/21.
//  Copyright © 2019年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JAODMAddDeviceKindType) {
    JAAddDeviceKinds = 0,
    JAAddDeviceKindsOne,
    JAAddDeviceKindsTwo
};

typedef NS_ENUM(NSUInteger, JAODMAddDeviceKindWay) {
    JAODMAddDeviceKindWayNone,
    JAODMAddDeviceKindWayAdd,   //添加
    JAODMAddDeviceKindWayScan   //扫一扫
};

@interface JAODMAddDeviceType : NSObject

@property (nonatomic, assign) JAODMAddDeviceKindType addDeviceType;
@property (nonatomic, assign) JAODMAddDeviceKindWay addDeviceWay;

@end

