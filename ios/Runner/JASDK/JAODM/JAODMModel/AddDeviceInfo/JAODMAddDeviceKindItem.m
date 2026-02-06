//
//  JAODMAddDeviceKindItem.m
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMAddDeviceKindItem.h"

@implementation JAODMAddDeviceKindItem

//- (instancetype)initWithConfigType:(JAODMAddDeviceKindItemConfigType)configType itemType:(JAODMAddDeviceKindItemType)itemType
//                         imagePath:(NSString *)imagePath  nameKey:(NSString *)nameKey
//            lightFlashImagePathArr:(NSArray<NSString *> *)lightFlashImagePathArr  lightFlashTextArr:(NSArray<NSString *> *)lightFlashTextArr
//                 resetImagePathArr:(NSArray<NSString *>*)resetImagePathArr  resetTextArr:(NSArray<NSString *>*)resetTextArr{
//
//    self = [super init];
//    if (self) {
//        _configType = configType;
//        _itemType = itemType;
//        _imagePath = imagePath;
//        _nameKey = nameKey;
//        _lightFlashImagePathArr = lightFlashImagePathArr;
//        _lightFlashTextArr = lightFlashTextArr;
//        _resetImagePathArr = resetImagePathArr;
//        _resetTextArr = resetTextArr;
//    }
//    return self;
//}


- (instancetype)initWithDictionary:(NSDictionary *)kindInfo{
    NSString *nameKey = kindInfo[@"name"];
    NSString *detailNameKey = kindInfo[@"detailName"];
    NSString *imagePath = kindInfo[@"image"];
    NSString *imageType = kindInfo[@"imageType"];
    NSInteger configType = [kindInfo[@"configWay"]integerValue];
    NSInteger itemType = [kindInfo[@"itemType"]integerValue];
    NSArray *networkInterfaceImages = kindInfo[@"networkInterfaceImages"];
    NSArray *networkInterfaceTexts = kindInfo[@"networkInterfaceTexts"];
    NSArray *networkedImages = kindInfo[@"networkedImages"];
    NSArray *networkedTexts = kindInfo[@"networkedTexts"];
    NSArray *lightFlashImagePathArr = kindInfo[@"lightFlashImages"];
    NSArray *lightFlashTextArr = kindInfo[@"lightFlashTexts"];
    NSArray *resetImagePathArr = kindInfo[@"resetImages"];
    NSArray *resetTextArr = kindInfo[@"resetTexts"];
    NSArray *networkInterfaceBtns = kindInfo[@"networkInterfaceBtns"];
    
    self = [super init];
    if (self) {
        _configType = configType;
        _itemType = itemType;
        _imagePath = imagePath;
        _nameKey = nameKey;
        _detailNameKey = detailNameKey;
        _imageType = imageType;
        _networkInterfaceImagePathArr = networkInterfaceImages;
        _networkInterfaceTextArr = networkInterfaceTexts;
        _networkedImagePathArr = networkedImages;
        _networkedTextArr = networkedTexts;
        _lightFlashImagePathArr = lightFlashImagePathArr;
        _lightFlashTextArr = lightFlashTextArr;
        _resetImagePathArr = resetImagePathArr;
        _resetTextArr = resetTextArr;
        _networkInterfaceBtnsArr =[NSMutableArray array];
        for (NSDictionary *dt in networkInterfaceBtns) {
            JAODMAddDeviceKindSubItem *item = [[JAODMAddDeviceKindSubItem alloc] initWithDictionary:dt];
            [_networkInterfaceBtnsArr addObject:item];
        }
    }
    return self;
}

@end
