//
//  JADevice+JAAddDevice.m
//  eseecloud
//
//  Created by gxl on 2018/5/16.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JADevice+JAAddDevice.h"
#import "NSString+JAAddDevice.h"
#import "JASettingLanguagesManager.h"

#define JA_MY_Group_STR(_KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_KEY tableName: @"JAMyGroup"]


#define CACHE_DEVICE_LIST_PATH [JA_PATH_DOC stringByAppendingPathComponent:@"CacheDeviceList.plist"]
#define CACHE_DEVICE_LIST_VERSION @"1.0"


@implementation JADevice (JAAddDevice)

+ (NSString *)autoGenerateNickName{
    NSArray *cacheDeviceList = [JADevice getCacheDeviceList];
    NSString *str = nil;
    int i;
    for (i=1; i<99; i++) {
        //跳过已存在的设备名称
        str = [NSString stringWithFormat:@"%@%d",JA_MY_Group_STR(@"devicelist_device"),i];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nickname == %@", str];
        NSArray *filteredArray = [cacheDeviceList filteredArrayUsingPredicate:predicate];
        if (filteredArray.count==0)
            break;
    }
    str = [NSString stringWithFormat:@"%@%d",JA_MY_Group_STR(@"devicelist_device"),i];
    return str;
}

+ (NSArray *)getCacheDeviceList{
    NSArray *cacheDeviceList = nil;
//    if ([JARealmDBManager manager].app.currentUser.accessToken && [JARealmDBManager manager].app.currentUser.accessToken.length > 0) {//非本地登录模式
//        NSArray *arr = [JADevice getUserCacheDeviceList];
//        NSMutableArray *deviceArr = @[].mutableCopy;
//        for (NSDictionary *info in arr) {
//            [deviceArr addObject:[[JADevice alloc]initWithDictionaryIDDevice:info]];
//        }
//        cacheDeviceList  = deviceArr;
//    }
//    else{
//        cacheDeviceList = [[JARealmDBManager manager] getLocalDevicesList];
//    }
    return cacheDeviceList;
}

+ (NSArray *)getUserCacheDeviceList
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:CACHE_DEVICE_LIST_PATH];
    if (!dict) {
        return nil;
    }
    CGFloat curVersion = [CACHE_DEVICE_LIST_VERSION floatValue];
    CGFloat lastVersion = [[dict objectForKey:@"Version"] floatValue];
    if (curVersion > lastVersion) {
        [[NSFileManager defaultManager] removeItemAtPath:CACHE_DEVICE_LIST_PATH error:nil];
        return nil;
    }
    NSArray *deviceList = [dict objectForKey:@"DeviceList"];
    
    
    
    return deviceList;
}

//判断设备名字是否存在设备列表了
+ (BOOL)isExistNickName:(NSString *)nickName
{
    NSArray *cacheDeviceList = [JADevice getCacheDeviceList];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nickname == %@", nickName];
    NSArray *filteredArray = [cacheDeviceList filteredArrayUsingPredicate:predicate];
    if (filteredArray.count >= 1) {
        return YES;
    }
    return NO;
}

//如果设备名已存在，则后面加一个(1)
+ (NSString *)existNickNameChange:(NSString *)nickName
{
    //如果设备名已经有以（1）为后缀的了，则把（1）改成（2）
    NSString *newNickName = @"";
    NSRange rangeBegin = [nickName rangeOfString:@"）" options:NSBackwardsSearch];
    if (rangeBegin.location != NSNotFound) {
        NSRange rangeFinish =  [nickName rangeOfString:@"（" options:NSBackwardsSearch];
        if (rangeFinish.location != NSNotFound) {
            NSString *rangeStr = [nickName substringWithRange:NSMakeRange(rangeFinish.location, rangeBegin.location - rangeFinish.location)];
            if ([nickName hasSuffix:rangeStr]) {
                NSString *str = [rangeStr substringWithRange:NSMakeRange(1, rangeStr.length - 2)];
                NSString *checkStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
                if(!checkStr.length) {
                    NSString *newStr = [NSString stringWithFormat:@"（%d）",(int)([str integerValue] + 1)];
                    newNickName = [nickName stringByReplacingOccurrencesOfString:rangeStr withString:newStr];
                    return newNickName;
                }
            }
        }
    }
    
    newNickName = [NSString stringWithFormat:@"%@（%d）",nickName,1];
    return newNickName;
}

/**
 获取设备类型
 用于录像回放时间轴是否偏移时区和夏令时
 @param eseeid 设备eseeid
 @return 1:单通道设备；2：gateway;3:nvr
 */
+ (NSInteger)getDeviceTypeWithEseeID:(NSString *)eseeid{
    NSArray* deviceList = [JADevice getCacheDeviceList];
    JADevice *devObj;
    for (JADevice *dev in deviceList) {
        if([eseeid isEqualToString:dev.eseeid]){
           devObj = dev;
           break;
        }
    }
    
    if (!devObj) {
        //是演示中心设备
        return 1;
    }
    else{
        NSString * serial_id = devObj.serial_id;
        NSInteger channel_count = devObj.channel_count;
        if (channel_count > 1) {
            if ([serial_id hasPrefix:@"JAG"] || [serial_id hasPrefix:@"JAR"] || [serial_id hasPrefix:@"R"] ||
                [serial_id hasPrefix:@"G"]){
                return 2;
            }
            else{
                return 3;
            }
        }
        else{
            return 1;
        }
    }
}
@end
