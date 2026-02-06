//
//  JAODMAddDevice.h
//  eseecloud
//
//  Created by gxl on 2018/11/29.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, JAODMAddDeviceTypeEnum) {
    JAODMAddDeviceTypeToGuide      = 1 << 0,
    JAODMAddDeviceTypeAP           = 1 << 1,
    JAODMAddDeviceTypeBLE          = 1 << 2,
    JAODMAddDeviceTypeNVR          = 1 << 3,
    JAODMAddDeviceTypeWireless     = 1 << 4,
    JAODMAddDeviceTypeNetwork      = 1 << 5,
    JAODMAddDeviceTypeLansearch    = 1 << 6,
    JAODMAddDeviceTypeScan         = 1 << 7,
    JAODMAddDeviceTypeSmarkLink    = 1 << 8,
    JAODMAddDeviceTypeQRcode       = 1 << 9
};
typedef NS_OPTIONS(NSUInteger, JAODMRootStepItemType) {
    JAODMRootStepItemTypeDefault        = 1 << 0,
    JAODMRootStepItemTypeList           = 1 << 1,
    JAODMRootStepItemTypeGrid           = 1 << 2
};
@interface JAODMAddDevice : NSObject
@property (nonatomic, assign) JAODMAddDeviceTypeEnum addDeviceType;
@property (nonatomic, assign) JAODMRootStepItemType rootStepItemType;
@end
