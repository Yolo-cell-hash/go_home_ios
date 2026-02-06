//
//  JAODMGeneral.h
//  eseecloud
//
//  Created by gxl on 2018/11/29.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMThirdpartyItem.h"

typedef NS_OPTIONS(NSUInteger, JAODMSupportDeviceType) {
    JAODMSupportDeviceTypePanorama = 1 << 0,
    JAODMSupportDeviceTypeCX       = 1 << 1,
    JAODMSupportDeviceTypeNVR      = 1 << 2,
    JAODMSupportDeviceTypeGateway  = 1 << 3
};
@interface JAODMGeneral : NSObject
@property (nonatomic, copy) NSString *project;
@property (nonatomic, copy) NSString *appBundle;
@property (nonatomic, copy) NSString *realBundle;
@property (nonatomic, copy) NSString *verifyMixStr;
@property (nonatomic, copy) NSString *realMixStr;

//gateway设备设备列表显示方式:yes:gateway方式显示；no：nvr方式显示
@property (nonatomic, assign) BOOL gatewayModeEnable;
////7寸屏设备设备列表显示方式:yes:gateway方式显示；no：nvr方式显示
@property (nonatomic, assign) BOOL tableNvrGatewayModeEnable;
//是否启用登录模式
@property (nonatomic, assign) BOOL loginModeEnable;
//是否启用本地模式
@property (nonatomic, assign) BOOL localModeEnable;
//是否显示演示中心
@property (nonatomic, assign) BOOL demoEnable;
//支持的添加方式 0表示默认
@property (nonatomic, assign) NSInteger supportAddDeviceType;
//是否支持在家离家模式 默认不支持
@property (nonatomic, assign) BOOL supportHomeSet;
//是否支持全彩模式 默认支持
@property (nonatomic, assign) BOOL supportFullColorMode;
//是否支持设备列表-更多-截图录像 默认支持
@property (nonatomic, assign) BOOL supportScreenshots;

//预连接数
@property (nonatomic, assign) NSInteger preconnectIPCCount;
@property (nonatomic, assign) NSInteger preconnectNVRCount;

//主题色
@property (nonatomic, copy) NSString *themeColor;
//预览主题色
@property (nonatomic, copy) NSString *previewThemeColor;
@property (nonatomic, copy) NSString *previewSelectChannelColor;
@property (nonatomic, copy) NSString *previewBackgroupColor;
@property (nonatomic, copy) NSString *previewToolBottomColor;
@property (nonatomic, copy) NSString *previewToolTopColor;
@property (nonatomic, copy) NSString *previewToolSelectColor;

//云商城URL
@property (nonatomic, copy) NSString *storeURL;
@property (nonatomic, copy) NSString *storeURLTest;
//商店URL
@property (nonatomic, copy) NSString *storeWebURL;

//教学视频
@property (nonatomic, copy) NSString *teachingVideo;

//是否支持独占
@property (nonatomic, assign) BOOL isDefaultMonopoly;

//是否在设备设置中显示用户名和密码 yes 显示 No隐藏
@property (nonatomic, assign) BOOL isShowDevicePasswordAndUser;
//第三方登录
@property (nonatomic, strong) NSMutableArray<JAODMThirdpartyItem *> *thirdPartyArr;

//APPID
@property (nonatomic, strong) NSString *appId;

@property (nonatomic, assign) BOOL autoConfigPassword;

//截图分辨率
@property (nonatomic, assign) BOOL imageSolutionEnable;
@property (nonatomic, assign) NSInteger imageWidth;
@property (nonatomic, assign) NSInteger imageHeight;

@property (nonatomic, assign) NSInteger dateFormat;

@property (nonatomic, assign) BOOL fixMode180Enable;
@property (nonatomic, assign) BOOL fixMode360Enable;

@property (nonatomic, assign) JAODMSupportDeviceType supportDeviceType;
@property (nonatomic, assign) BOOL speakEnable;

@property (nonatomic, copy) NSString *wxpayDomain;
@property (nonatomic, copy) NSString *alipaySchemes;
- (void)setup;
@end
