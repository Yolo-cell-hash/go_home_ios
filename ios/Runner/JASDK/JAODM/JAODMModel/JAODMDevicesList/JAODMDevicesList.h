//
//  JAODMDevicesList.h
//  eseecloud
//
//  Created by gxl on 2018/11/5.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
//添加方式枚举
typedef NS_OPTIONS(NSUInteger, JAODMDevicesListAddType) {
    JAODMDevicesListAddGuide        = 1 << 0,
    JAODMDevicesListAddAP           = 1 << 1,
    JAODMDevicesListAddBLE          = 1 << 2,
    JAODMDevicesListAddNVR          = 1 << 3,
    JAODMDevicesListAddWireless     = 1 << 4,
    JAODMDevicesListAddNetwork      = 1 << 5,
    JAODMDevicesListItemLansearch    = 1 << 6,
    JAODMDevicesListItemScan         = 1 << 7,
    JAODMDevicesListItemSmarkLink    = 1 << 8,
    JAODMDevicesListItemQRcode       = 1 << 9
};
//设备列表设备item样式
typedef NS_OPTIONS(NSUInteger, JAODMDevicesListItemStyle) {
    JAODMDevicesListItemSingle        = 1 << 0,
    JAODMDevicesListItemMulti           = 1 << 1,
    JAODMDevicesListItemGateway          = 1 << 2,

};

NS_ASSUME_NONNULL_BEGIN

@interface JAODMDevicesList : NSObject
@property (nonatomic, assign) JAODMDevicesListItemStyle singleDeviceItemStyle;//注释看页尾
@property (nonatomic, assign) JAODMDevicesListItemStyle NvrItemStyle;
@property (nonatomic, assign) JAODMDevicesListItemStyle gatewayItemStyle;

@property (nonatomic, assign) JAODMDevicesListAddType bottomAddDeviceItems;
@property (nonatomic, assign) NSInteger navRightItems;//导航右键 -1、不显示+按钮 0、默认 

@property (nonatomic, copy) NSString *connectingColor;//正在连接
@property (nonatomic, copy) NSString *offlineColor;//离线
@property (nonatomic, copy) NSString *onlineColor;//在线
@property (nonatomic, copy) NSString *authFailColor;//密码错误

@property (nonatomic, assign) BOOL groupEnable;

- (void)setup;
@end

NS_ASSUME_NONNULL_END

/*
{
    "MyDevice":{
        "ItemStyle":{//备列表设备item样式, 具体值参考备注第2条
            "SingleDevice":0,
            "NVR":0,
            "Gateway":0,
        },
        "BottomAddDeviceItem":0,//底部可以添加快捷添加按钮，可选多个，具体值参考备注第1条
        "NavRightItem":0,//导航栏右边“+”按钮弹出窗口选项，-1:表示不添加该按钮, 可选多个，参考下发备注第1条添加方式枚举。当只选则了一个时，不弹窗直接跳转该种方式页面。
        "Color":{
            "DeviceStatusColor":{
                "Connecting":"",
                "Offline":"",
                "Online":"",
                "AuthFail":""
            }
        }
    },
    "CameraGroup":{
        "Enable":true,//是否使用分组功能
    }
}

 ********************备注********************
 
 1.添加方式枚举说明，枚举为位运算枚举，填0则表示默认。
 0        默认
 1<<0    跳转到添加引导主页
 1<<1    热点
 1<<2    蓝牙
 1<<3    录像机
 1<<4    无线触控
 1<<5    添加已联网设备
 1<<6    局域网扫描
 1<<7    扫一扫
 1<<8    SmarkLink
 1<<9    二维码配置
 
 2.设备列表设备item样式
 0    默认
 1    但窗口样式
 2    多路窗口样式
 3    横向显示通道样式
 
 */
