//
//  JADevice+JAAddDevice.h
//  eseecloud
//
//  Created by gxl on 2018/5/16.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JADevice.h"

@interface JADevice (JAAddDevice)

/**
 自动生成设备名称
 @return 设备名称
 */
+ (NSString *)autoGenerateNickName;

/**
 获取缓存设备列表
 @return 缓存设备列表
 */
+ (NSArray *)getCacheDeviceList;

/**
 获取设备类型
 用于录像回放时间轴是否偏移时区和夏令时
 @param eseeid 设备eseeid
 @return 1:单通道设备；2：gateway;3:nvr
 */
+ (NSInteger)getDeviceTypeWithEseeID:(NSString *)eseeid;

//判断设备名字是否存在设备列表了 yes存在 ,no不存在
+ (BOOL)isExistNickName:(NSString *)nickName;

@end
