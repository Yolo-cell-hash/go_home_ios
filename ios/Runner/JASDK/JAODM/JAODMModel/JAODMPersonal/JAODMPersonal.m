//
//  JAODMPersonal.m
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "JAODMPersonal.h"

#define JA_FILE_NAME @"me.json"

@implementation JAODMPersonal

- (void)setup
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:JA_FILE_NAME ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    self.horizontalItem = [info[@"HorizontalItem"] integerValue];
    self.ListItem = [info[@"ListItem"] integerValue];
    self.HistoryDateEnable = [info[@"HistoryDateEnable"] boolValue];
    self.userHeaderImageEnable = [info[@"userHeaderImageEnable"] boolValue];
    
}
/* ********************备注********************
 
 1. 功能入口枚举说明，枚举为位运算枚举，填0则表示默认。
 0        默认
 1<<0    录像截图
 1<<1    录像备份
 1<<2    报警信息
 1<<3    设置
 1<<4    分享管理
 1<<5    帮助
 1<<6    隐私协议
 1<<7    公司简介
 1<<8    声明
 1<<9    云商城
 */
@end
