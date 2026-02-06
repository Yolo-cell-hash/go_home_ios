//
//  JAODMAddDeviceKindItem.h
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMAddDeviceKindSubItem.h"

//typedef NS_ENUM(NSUInteger, JAODMAddDeviceKindItemConfigType) {
//    JAAddDeviceKindItemConfigWayAP,
//    JAAddDeviceKindItemConfigWayLAN,
//    JAAddDeviceKindItemConfigWayBuletooth,
//    JAAddDeviceKindItemConfigWayManual,
//    JAAddDeviceKindItemConfigWayNetworked,
//    JAAddDeviceKindItemConfigWayLANSearch,
//    JAAddDeviceKindItemConfigWayTabletNVR,
//    JAAddDeviceKindItemConfigWayRichScan,
//    JAAddDeviceKindItemConfigWaySuit
//};


typedef NS_ENUM(NSUInteger, JAODMAddDeviceKindItemType) {
    JAODMAddDeviceKindItemType1,
    JAODMAddDeviceKindItemType2,
};

@interface JAODMAddDeviceKindItem : NSObject

@property (nonatomic, assign) JAODMAddDeviceKindItemConfigType configType;
@property (nonatomic, assign) JAODMAddDeviceKindItemType itemType;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *nameKey;
    @property (nonatomic, copy) NSString *detailNameKey;
@property (nonatomic, copy) NSString *imageType;
@property (nonatomic, strong) NSArray<NSString *> *networkInterfaceImagePathArr;
@property (nonatomic, strong) NSArray<NSString *> *networkInterfaceTextArr;
@property (nonatomic, strong) NSArray<NSString *> *networkedImagePathArr;
@property (nonatomic, strong) NSArray<NSString *> *networkedTextArr;
@property (nonatomic, strong) NSArray<NSString *> *lightFlashImagePathArr;
@property (nonatomic, strong) NSArray<NSString *> *lightFlashTextArr;
@property (nonatomic, strong) NSArray<NSString *> *resetImagePathArr;
@property (nonatomic, strong) NSArray<NSString *> *resetTextArr;
@property (nonatomic, strong, readonly) NSMutableArray<JAODMAddDeviceKindSubItem *> *networkInterfaceBtnsArr;
//- (instancetype)initWithConfigType:(JAODMAddDeviceKindItemConfigType)configType itemType:(JAODMAddDeviceKindItemType)itemType
//                imagePath:(NSString *)imagePath  nameKey:(NSString *)nameKey
//                lightFlashImagePathArr:(NSArray<NSString *> *)lightFlashImagePathArr  lightFlashTextArr:(NSArray<NSString *> *)lightFlashTextArr
//                resetImagePathArr:(NSArray<NSString *>*)resetImagePathArr  resetTextArr:(NSArray<NSString *>*)resetTextArr;
- (instancetype)initWithDictionary:(NSDictionary *)kindInfo;

@end
