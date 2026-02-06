//
//  JAODMAddDevice.m
//  eseecloud
//
//  Created by gxl on 2018/11/29.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMAddDevice.h"

#define JA_FILE_NAME @"AddDevice.json"

@implementation JAODMAddDevice
- (void)setup
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:JA_FILE_NAME ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    self.addDeviceType = [info[@"AddDeviceType"] integerValue];
    self.rootStepItemType = [info[@"RootStepItemType"] integerValue];
}
@end
/* ********************备注********************
 
 1.添加方式枚举说明，枚举为位运算枚举，填0则表示默认。
 1<<0    跳转到添加引导主页
 1<<1    热点
 1<<2    蓝牙
 1<<3    录像机
 1<<4    无线触控
 1<<5    添加已联网设备
 1<<6    局域网扫描
 1<<7    扫一扫，
 1<<8    SmarkLink
 1<<9    二维码配置
 
 2.添加首页item的样式
 0    默认
 1    列表
 2    宫格
 */
