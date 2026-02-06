//
//  JAODMGeneral.m
//  eseecloud
//
//  Created by gxl on 2018/11/29.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMGeneral.h"
#define JA_FILE_NAME @"General.json"
@implementation JAODMGeneral
- (void)setup
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"General" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
//    self.isDefaultMonopoly = NO;
    self.themeColor = info[@"Color"][@"ThemeColor"];
    self.previewThemeColor = info[@"Color"][@"previewThemeColor"];
    self.previewSelectChannelColor = info[@"Color"][@"previewSelectChannelColor"];
    self.previewBackgroupColor = info[@"Color"][@"previewBackgroupColor"];
    self.previewToolBottomColor = info[@"Color"][@"previewToolBottomColor"];;
    self.previewToolTopColor = info[@"Color"][@"previewToolTopColor"];;
    self.previewToolSelectColor = info[@"Color"][@"previewToolSelectColor"];;
    
    
    
    self.appBundle = info[@"APPInfo"][@"AppBundle"];
    self.verifyMixStr = info[@"APPInfo"][@"AppBundleConfusing"];
    self.realBundle = info[@"APPInfo"][@"RealBundle"];
    self.realMixStr = info[@"APPInfo"][@"RealBundleConfusing"];
    
    self.loginModeEnable = [info[@"UserSettings"][@"LoginEnable"] boolValue];
    self.localModeEnable = [info[@"UserSettings"][@"LocalEnable"] boolValue];
    self.supportAddDeviceType = [info[@"SupportAddDeviceType"] integerValue];
    
    self.supportHomeSet = [info[@"SupportHomeSet"] boolValue];
    self.supportFullColorMode = [info[@"SupportFullColorMode"] boolValue];
    self.supportScreenshots = [info[@"SupportScreenshots"] boolValue];
    
    self.demoEnable = [info[@"SquareEnable"] boolValue];
    self.preconnectIPCCount = [info[@"preconnectIPCCount"] integerValue];
    self.preconnectNVRCount = [info[@"preconnectNVRCount"] integerValue];
    self.gatewayModeEnable = [info[@"gatewayModeEnable"] boolValue];
    self.tableNvrGatewayModeEnable = [info[@"tableNvrGatewayModeEnable"] boolValue];
    self.storeURL = info[@"StoreURL"];
    self.storeURLTest = info[@"StoreURLTest"];
    self.storeWebURL = info[@"StoreWebURL"];
    self.isDefaultMonopoly = [info[@"DefaultMonopoly"] boolValue];
    self.isShowDevicePasswordAndUser = [info[@"ShowDevicePasswordAndUser"] boolValue];
    self.appId = info[@"APPID"];
    self.project = info[@"Project"];
    NSArray *thirdArr = info[@"UserSettings"][@"Thirdparty"];
    self.thirdPartyArr = [NSMutableArray array];
    for (NSDictionary *thirdInfo in thirdArr) {
        NSInteger type = [thirdInfo[@"type"] integerValue];
        NSString *key = thirdInfo[@"key"];
        BOOL enble = [thirdInfo[@"enble"] boolValue];
        NSString *icon = thirdInfo[@"icon"];
        NSString *name = thirdInfo[@"name"];
        [self.thirdPartyArr addObject:[[JAODMThirdpartyItem alloc]initWithType:type Key:key Enble:enble Icon:icon Name:name]];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [languages objectAtIndex:0];
    
    NSArray *videoArr = info[@"temoVideo"];
    for (NSDictionary *videoInfo in videoArr) {
        NSString *lg = [videoInfo objectForKey:@"language"];
        if ([currentLanguage hasPrefix:lg]) {
            NSString *url = [videoInfo objectForKey:@"url"];
            self.teachingVideo = url;
            break;
        }
    }
    if (self.teachingVideo.length == 0 && videoArr.count > 0) {
        NSString *url = [videoArr[0] objectForKey:@"url"];
        self.teachingVideo = url;
    }
    
    self.autoConfigPassword = [info[@"autoConfigPassword"] boolValue];
    
    self.imageSolutionEnable = [info[@"capture"][@"supportImageSolution"] boolValue];
    self.imageWidth = [info[@"capture"][@"imageWidth"] integerValue];
    self.imageHeight = [info[@"capture"][@"imageHeight"] integerValue];
    
    self.dateFormat = [info[@"dateFormat"] integerValue];
    
    self.fixMode180Enable = [info[@"fixMode180Enable"] boolValue];
    self.fixMode360Enable = [info[@"fixMode360Enable"] boolValue];
    
    self.supportDeviceType = [info[@"supprotDeviceType"] integerValue];
    self.speakEnable = [info[@"speakEnable"] boolValue];
    
    self.wxpayDomain = info[@"wxpaydomain"];
    self.alipaySchemes = info[@"alipayschemes"];
}
@end


/***********
 {
 "Color":{
 "ThemeColor":""//主题颜色
 },
 "APIInfo":{
 "AppBundle":"",
 "APPBundleConfusing":"",
 "RealBundle":"",
 "RealBundleConfusing":"",
 },
 "APPID":"1369640400",//APP在store上的id，用于检查版本更新，跳转app对应的sore位置
 "UserSettings":{
 "LoginEnable":true,//是否使用登录模式
 "LocalEnable":true,//是否使用体验模式
 "DefaultCountry":"",//默认国家
 "UserIsolation":true,//是否用户隔离
 "Thirdparty":[
 {
 "type":0,//枚举    0:微信，2:Google
 "param":["param1","param2"]
 }
 ]
 },
 "SupportAddDeviceType":0,//支持的添加方式，具体参数参考备注第1条
 "SquareEnable":true,//是否支持演示中心
 "StoreURL":"",//空则代表不支持该功能
 "PushInfo":[
 {
 "type":0,//枚举    0:小米, 2:华为, 3:Google, 4:魅族, 5:极光
 "param":["p1","p2"],
 }
 ]
 }
*/
 
