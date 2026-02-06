//
//  JAODMAddDeviceInfo.m
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMAddDeviceInfo.h"
#import "JAODMAddDeviceType.h"

#define FILE_NAME @"JAAddDeviceKinds"
#define FILE_NAME_One @"JAAddDeviceKindsTwo"
#define FILE_NAME_TWO @"JANewAddDeviceKindsTwo"
#define FILE_NAME_TYPE @"JAAddDeviceType"

@implementation JAODMAddDeviceInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *path;
        
        NSString *typePath = [[NSBundle mainBundle] pathForResource:FILE_NAME_TYPE ofType:@"json"];
        NSData *typeData = [[NSData alloc] initWithContentsOfFile:typePath];
        NSDictionary *typeInfo = [NSJSONSerialization JSONObjectWithData:typeData options:0 error:nil];
        JAODMAddDeviceKindType type = [[typeInfo objectForKey:@"addDeviceType"] integerValue];
        
        if(type == JAAddDeviceKinds) {
            path = [[NSBundle mainBundle] pathForResource:FILE_NAME ofType:@"json"];
        } else if (type == JAAddDeviceKindsOne) {
            path = [[NSBundle mainBundle] pathForResource:FILE_NAME_One ofType:@"json"];
        } else {
            path = [[NSBundle mainBundle] pathForResource:FILE_NAME_TWO ofType:@"json"];
        }
        
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.devicePasswordAuto = [info[@"devicePasswordAuto"] boolValue];
        self.columns = [info[@"columns"]integerValue];
        NSArray *kinds = info[@"kinds"];
        self.kindItemArr = [NSMutableArray array];
        for (NSDictionary *kindInfo in kinds) {
            JAODMAddDeviceKindItem *kindItem = [[JAODMAddDeviceKindItem alloc] initWithDictionary:kindInfo];
            [self.kindItemArr addObject:kindItem];
        }
        
        NSArray *deviceList_kinds = info[@"deviceList_addkinds"];
        self.deviceListkindItemArr = [NSMutableArray array];
        for (NSDictionary *kindInfo in deviceList_kinds) {
            JAODMAddDeviceKindItem *kindItem = [[JAODMAddDeviceKindItem alloc] initWithDictionary:kindInfo];
            [self.deviceListkindItemArr addObject:kindItem];
        }
        //        for (NSDictionary *kindInfo in kinds) {
        //            NSString *name = kindInfo[@"name"];
        //            NSString *image = kindInfo[@"image"];
        //            NSInteger configWay = [kindInfo[@"configWay"]integerValue];
        //            NSInteger itemType = [kindInfo[@"itemType"]integerValue];
        //            NSArray *lightFlashImages = kindInfo[@"lightFlashImages"];
        //            NSArray *lightFlashTexts = kindInfo[@"lightFlashTexts"];
        //            NSArray *resetImages = kindInfo[@"resetImages"];
        //            NSArray *resetTexts = kindInfo[@"resetTexts"];
        //
        //            JAODMAddDeviceKindItem *kindItem =[[JAODMAddDeviceKindItem alloc]initWithConfigType:configWay itemType:itemType imagePath:image nameKey:name lightFlashImagePathArr:lightFlashImages lightFlashTextArr:lightFlashTexts resetImagePathArr:resetImages resetTextArr:resetTexts];
        //            [self.kindItemArr addObject:kindItem];
        //        }
        //
        //        NSArray *deviceList_kinds = info[@"deviceList_addkinds"];
        //        self.deviceListkindItemArr = [NSMutableArray array];
        //        for (NSDictionary *kindInfo in deviceList_kinds) {
        //            NSString *name = kindInfo[@"name"];
        //            NSString *image = kindInfo[@"image"];
        //            NSInteger configWay = [kindInfo[@"configWay"]integerValue];
        //            NSInteger itemType = [kindInfo[@"itemType"]integerValue];
        //            NSArray *lightFlashImages = kindInfo[@"lightFlashImages"];
        //            NSArray *lightFlashTexts = kindInfo[@"lightFlashTexts"];
        //            NSArray *resetImages = kindInfo[@"resetImages"];
        //            NSArray *resetTexts = kindInfo[@"resetTexts"];
        //
        //            JAODMAddDeviceKindItem *kindItem =[[JAODMAddDeviceKindItem alloc]initWithConfigType:configWay itemType:itemType imagePath:image nameKey:name lightFlashImagePathArr:lightFlashImages lightFlashTextArr:lightFlashTexts resetImagePathArr:resetImages resetTextArr:resetTexts];
        //            [self.deviceListkindItemArr addObject:kindItem];
        //        }
    }
    return self;
}
- (NSArray<JAODMAddDeviceKindItem *> *)kindType1ItemArr{
    if (_kindType1ItemArr == nil) {
        _kindType1ItemArr = [NSMutableArray array];
        for (JAODMAddDeviceKindItem *kindItem in _kindItemArr) {
            if (kindItem.itemType == JAODMAddDeviceKindItemType1) {
                [_kindType1ItemArr addObject:kindItem];
            }
        }
    }
    return _kindType1ItemArr;
}
- (NSArray<JAODMAddDeviceKindItem *> *)kindType2ItemArr{
    if (_kindType2ItemArr == nil) {
        _kindType2ItemArr = [NSMutableArray array];
        for (JAODMAddDeviceKindItem *kindItem in _kindItemArr) {
            if (kindItem.itemType == JAODMAddDeviceKindItemType2) {
                [_kindType2ItemArr addObject:kindItem];
            }
        }
    }
    return _kindType2ItemArr;
}

@end



/*
 {
 "version": "1.0.0",
 "lastChanger": "Wynton",
 "columns": 1,
 "kinds": [
 {
 "name": "addDevice_choose_device_1",
 "image": "icon_wireless_products",
 "configWay": 0,
 "itemType": 0,
 "lightFlashImages": [
 "icon_add_light2"
 ],
 "lightFlashTexts": [
 "addDevice_help_text2",
 "addDevice_help_text12"
 ],
 "resetImages": [
 "icon_reset_success"
 ],
 "resetTexts": [
 "addDevice_help_text3",
 "addDevice_help_text9",
 "addDevice_help_text5",
 "addDevice_help_text13"
 ]
 },
 {
 "name": "addDevice_video_products",
 "image": "icon_add_nvr",
 "configWay": 3,
 "itemType": 0
 },
 {
 "name": "device_mini_NVR",
 "image": "icon_add_mini_nvr",
 "configWay": 1,
 "itemType": 0
 },
 {
 "name": "adddevice_Touch_screen_NVR",
 "image": "icon_add_touch_screen_nvr",
 "configWay": 6,
 "itemType": 0
 },
 {
 "name": "addDevice_networked",
 "configWay": 4,
 "itemType": 1
 },
 {
 "name": "scan_LAN",
 "configWay": 5,
 "itemType": 1
 },
 {
 "name": "addDevice_bluetooth_products",
 "image": "icon_add_bluetooth_blue",
 "configWay": 2,
 "itemType": 1,
 "lightFlashImages": [
 "icon_add_light2"
 ],
 "lightFlashTexts": [
 "addDevice_help_text2",
 "addDevice_help_text12"
 ],
 "resetImages": [
 "icon_reset_success"
 ],
 "resetTexts": [
 "addDevice_help_text3",
 "addDevice_help_text9",
 "addDevice_help_text5",
 "addDevice_help_text13"
 ]
 }
 ],
 
 "deviceList_addkinds":[
 
 
 ]
 }
 */
