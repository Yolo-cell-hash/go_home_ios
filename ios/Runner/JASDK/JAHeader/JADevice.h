//
//  JADevice.h
//  JA_Item
//
//  Created by Mr.Z on 2018/1/11.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JACamera.h"
#import "JADeviceDetailMSG.h"
//#import "JADeviceSettingsUtil.h"
//#import "JAConnectorManager.h"
#import "JAPanoramaEnum.h"

typedef NS_OPTIONS(NSUInteger, JAShareStatus) {
    JASharePreview = 1 << 0,
    JASharePlayback = 1 << 1,
    JAShareDownload = 1 << 2,
    JAShareSet = 1 << 3,
    JASharePush = 1 << 4    // 推送消息查看
};

@class LCacheDevice;
@interface JADevice : NSObject
@property (nonatomic,   copy) NSString *nickname;  //昵称
@property (nonatomic,   copy) NSString *device_id; //设备id
@property (nonatomic,   copy) NSString *eseeid;    //易视云id
@property (nonatomic,   copy) NSString *tutkid;    //tutkid
@property (nonatomic,   copy) NSString *serial_id;  //序列号
@property (nonatomic,   copy) NSString *device_user;     //设备用户名
@property (nonatomic,   copy) NSString *device_password; //设备密码
//设备扫码添加（独占模式解析得到的密码）
@property (nonatomic,   copy) NSString *device_password_monopoly_server; //服务器拿到的密码（独占）
@property (nonatomic,   copy) NSString *device_password_monopoly; //解密后的密码 （独占）
@property (nonatomic,   copy) NSString *verify;

@property (nonatomic,   copy) NSString *connectStr; //用于设备连接
@property (nonatomic,   copy) NSString *verifyStr;  //用于设备连接

@property (nonatomic,   copy) NSString *origin_user;
@property (nonatomic,   copy) NSString *private_key; //用户与设备通讯所需的私钥。当当前用户并非该设备的独占模式开启者时该字段返回空
@property (nonatomic, assign) BOOL monopoly;     //设备是否独占的标识
@property (nonatomic, assign) BOOL is_editpwd;     //是否支持设置密码
@property (nonatomic, assign) BOOL status;         //在线状态 0: 在线  1: 离线
@property (nonatomic, assign) NSInteger channel_count;  //通道数
@property (nonatomic, assign) NSInteger devicetype;    //设备类型
@property (nonatomic, assign) NSInteger share_id;      //分享id
@property (nonatomic, assign) NSInteger share_status;  // 0: 自身的设备,其余表示是别人分享
/*
分享权限，参数格式4位二进制对应的整数，取值：
1:视频预览（第一位）
2:录像回放（第二位）
4:视频下载（第三位）
8:设备设置（第四位）
 */

 
@property (nonatomic, strong) NSArray <JACamera *> *cameralist;
@property (nonatomic,   copy) NSString *detail;   //设备detail
@property (nonatomic, strong) JADeviceDetailMSG *detailMSG;  //设备detail(转为模型)
@property (nonatomic,   copy) NSString *system;

@property (nonatomic, copy) NSNumber *port; //可用于判断是非为ip添加的设备

/**用于判断设备类型*/
@property (nonatomic, assign) JADeviceSceneType sceneType; //设备的视角
@property (nonatomic, assign,readonly) BOOL daylightEnable;//是否有夏令时
@property (nonatomic, assign,readonly) BOOL led; //是否有灯
@property (nonatomic, assign,readonly) BOOL ledProject;//灯是新设备还是就设备
@property (nonatomic, assign,readonly) BOOL ptz; //是否有云台
@property (nonatomic, assign,readonly) BOOL isCX;//是否为普通设备
@property (nonatomic, assign,readonly) BOOL isTableNVR;//是否7寸屏nvr
@property (nonatomic, assign,readonly) BOOL isBindCloud; //是否有绑定云存
@property (nonatomic, assign,readonly) DeviceChannelType showScreenPlayerType; //用于生成播放器
@property (nonatomic, assign) JADeviceFixType fixType;

@property (nonatomic, assign) JADeviceSceneType deviceSceneType; //设备的视角 //从设备信息中获取，有些设备是获取不到的

/**演示中心用到的属性*/
@property (nonatomic,   copy) NSNumber *channelid;
@property (nonatomic,   copy) NSNumber *ddns_mode;
@property (nonatomic,   copy) NSNumber *demo_mode;
@property (nonatomic,   copy) NSString *desc;
@property (nonatomic,   copy) NSNumber *playcount;
@property (nonatomic,   copy) NSNumber *praisecount;
@property (nonatomic,   copy) NSNumber *shareid;
@property (nonatomic,   copy) NSString *url;
@property (nonatomic, assign) BOOL isTeach;//是否教学视频,默认为NO,YES:演示中心视频
@property (nonatomic,copy) NSString *preview_url;   // 预览图地址

/** 云存相关属性 **/
@property (nonatomic, strong) NSArray<NSString *> *cap; // 设备支持特性：["cloudrecord"]
@property (nonatomic, assign) NSInteger trial_status; //是否支持试用
@property (nonatomic, assign) BOOL isSupportCloud; //是否支持云存 (分享设备默认不支持)
@property (nonatomic, assign) BOOL isCloudDevice; //是否支持云存 (只看设备支不支持)
@property (nonatomic, assign) BOOL isCloudCrard; //是否是云卡设备，能力集包含11的
@property (nonatomic,strong) NSMutableArray * transferCloudMuArr;//可以迁移的云存套餐

/** 电池机 是否支持OSD模式，既设备自己显示电池电量，不需要APP显示电池电量 **/
@property (nonatomic, assign) BOOL isSupportOSD;

/** 设备列表使用属性 **/
@property (nonatomic, assign) NSInteger itemIndex;

/** 查询设备状态服务器地址 **/
@property (nonatomic, strong) NSString *serverAddress;

/** 是否预连接 **/
@property (nonatomic, assign)BOOL isPreLink;

/** 连接状态 **/
//服务器返回连接状态
@property (nonatomic, assign) BOOL serverStatusOnline;
//预连接状态
@property (nonatomic, assign) JAConnectorStatus deviceConnectionStatus;

// 是否已经调用connect device
@property (nonatomic, assign) BOOL isConnectionRequested;

/**用于设备设置的对象*/
//@property (nonatomic, strong) JADeviceSettingsUtil *settingsUtil;
//@property (nonatomic, assign) JADeviceSettingTFCardStatus tfCardStatus;

@property (nonatomic, assign) BOOL is_virtualDevice;     //是否分组组装的虚拟设备


@property (nonatomic, assign, readonly) BOOL isUnsynchronized; //数据是否已同步到服务器
@property (nonatomic, strong) LCacheDevice *cacheDevice;

//设备是否支持云存 ，5，8，9  5是阿里，8是七牛云，9是aws, 11是云h卡录像功能_阿里去 如[5,9] 15:linkvisual 16:oneNet
@property (nonatomic, strong) NSArray *capabilities;
// 0 待修复 1 修复中 2修复成功 3修复失败 -1 不在白名单
@property (nonatomic, assign) NSInteger updateStatus;

/**阿里link相关参数 */
@property (nonatomic, assign) BOOL isSupportLinkvisual;
@property (nonatomic, strong) NSString *bind; //0:未绑定 1:已绑定
@property (nonatomic, strong) NSString *thirdChannel; //第三方平台标识,1:九安;2:阿里link visual 3:oneNET ;N:其它对接后再定
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceSecret;
@property (nonatomic, strong) NSString *productKey; //
@property (nonatomic, strong) NSString *iotID;
@property (nonatomic, strong) NSNumber *timeZone;//设备时区

/**oneNET相关参数 */
@property (nonatomic, assign) BOOL isSupportOneNET;
@property (nonatomic, strong) NSString *masterKey;
@property (nonatomic, strong) NSString *thirdDeviceId;
//本地直连----------
@property (nonatomic, assign) BOOL isLocalConnect; //本地直连设备
@property (nonatomic, strong) NSString *localWiFiName;//本地直连自定义Wi-Fi名称
///能力级包含15，但不包含thirdDeviceInfo的thirdParam（无三元组），使用link visual远程设置上传appBounld
@property (nonatomic, assign) BOOL supportNew4GCard;

/**tuya相关参数 */
@property (nonatomic, assign) BOOL isTuya;
@property (nonatomic, strong) NSString *iconUrl;

@property (nonatomic, assign) BOOL batteryDevice;

/**thirdDeviceInfo相关参数 end */

/**
  //阿里link
 thirdDeviceInfo =             {
     bind = 1;
     thirdChannel = 2;
     thirdParam =                 {
         deviceName = D2rpTXd7mKLPksNt2KTD;
         deviceSecret = ZYByiUfuUAWDX7wIotgUivCNT17XWn0v;
         productKey = a125FvzDq1d;
     };
 };
 
 //oneNET
 thirdDeviceInfo =     {
        bind = 1;
        thirdChannel = 3;
        thirdDeviceId = 590500904;
        thirdParam =         {
            masterKey = "lqHo5Wae3zQ0mxlE64C8549NZZE=";
            productKey = 324682;
        };
    };

 */

//id设备列表初始化
- (instancetype)initWithDictionaryIDDevice:(NSDictionary *)dictionary;
//ip设备列表初始化
- (instancetype)initWithDictionaryIpDevice:(NSDictionary *)dictionary;
- (instancetype)initWithCacheDevice:(LCacheDevice *)device;

///天钺定制Device
- (instancetype)initWithDictionaryTYDevice:(NSDictionary *)dictionary;

- (void)setupStatusNotification;

- (void)removeStatusNotification;

@end
