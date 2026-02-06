//
//  JAODMAddDeviceKindSubItem.h
//  eseecloud
//
//  Created by gxl on 2018/12/24.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, JAODMAddDeviceKindItemConfigType) {
    JAAddDeviceKindItemConfigWayNONE = -1, //无效值
    JAAddDeviceKindItemConfigWayAP = 0, //ap添加
    JAAddDeviceKindItemConfigWayLAN =1, //gateway添加
    JAAddDeviceKindItemConfigWayBuletooth =2,//蓝牙添加
    JAAddDeviceKindItemConfigWayManual = 3, //ID添加
    JAAddDeviceKindItemConfigWayNetworked = 4, //已联网设备添加 (也是ID添加)
    JAAddDeviceKindItemConfigWayLANSearch = 5, //局域网添加
    JAAddDeviceKindItemConfigWayTabletNVR = 6, //7寸屏添加
    JAAddDeviceKindItemConfigWayRichScan = 7, //扫码添加
    JAAddDeviceKindItemConfigWaySuit = 8, //套餐组合 （录像机 3 ，触屏NVR 6 ，mini NVR 1）
    JAAddDeviceKindItemConfigWayWiredConfig = 9 , //有线配置添加(局域网添加后配置WiFi,先显示是否闪灯界面)
    JAAddDeviceKindItemConfigWayNewAP = 10, //易视云3.2.7上架版本 新的ap添加
    JAAddDeviceKindItemConfigWayWired = 19, //有线添加
    JAAddDeviceKindItemConfigWayMultiple = 20, //多种添加集合
    JAAddDeviceKindItemConfigWayMultiple_HuaYi = 21, //多种添加集合(华熠品牌)
};

@interface JAODMAddDeviceKindSubItem : NSObject
@property (nonatomic, assign) JAODMAddDeviceKindItemConfigType configType;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
