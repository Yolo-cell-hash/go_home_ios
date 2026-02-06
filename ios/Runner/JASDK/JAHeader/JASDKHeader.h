//
//  JASDKHeader.h
//  JAJUANKit
//
//  Created by 123 on 2022/8/31.
//  Copyright © 2022 juanvision. All rights reserved.
//

#ifndef JASDKHeader_h
#define JASDKHeader_h

#define JABackupStr(_KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_KEY tableName: @"JABackup"]
#define JA_MY_DEVICE_STR(_KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_KEY tableName: @"JAMyDevice"]
#define JA_Calendar_STR(_KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_KEY tableName: @"JACalendar"]


#import "Masonry.h"
#import "NSDate+JA.h"
#import "NSString+JA.h"
#import "NSString+JAStringFormat.h"
#import "UIFont+JAFont.h"
#import "UIImage+Rotate.h"
#import "UIColor+JAColor.h"
#import "JAPanoramaScreen+Animation.h"
#import "UIImage+JA.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

#import "JAConnector.h"
//#import "JAFileManager.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+JAStyle.h"
#import "MBProgressHUD+Common.h"
#import "JASettingLanguagesManager.h"
#import "JAConnectorNOPrelinkPool.h"
#import "NSString+GlobalMutiLanguage.h"
//#import "JATableViewSectionView.h"
#import "X35Language.h"
//#import "JATableViewManager.h"
//#import "JATableViewSection.h"
#import "JASettingLanguagesManager.h"
//#import "JAAlertController.h"
#import "NSString+JAPreviewDevice.h"
#import "JADevice.h"
//#import "JASetingInfoStoredManager.h"
//#import "JAEseeSDKSingleton.h"
#import "UIView+AddClickedEvent.h"
#import "UIDevice+ESC.h"

typedef NS_ENUM(NSUInteger, PlaybackCloudUrlErrorType) {
    PlaybackCloudUrlErrorNull,
    PlaybackCloudUrlErrorTypeM3u8Error, //M3u8 下载错误
    PlaybackCloudUrlErrorTypeDiskNotEnough,
};

typedef NS_ENUM(NSUInteger, JAPreviewFunction) {
    JAPreviewFunction_Audio = 1,//监听
    JAPreviewFunction_Speak,//对讲
    JAPreviewFunction_Playback,//回放
    JAPreviewFunction_FixMode,//安装模式
    JAPreviewFunction_DisplayMode,//显示模式
    JAPreviewFunction_Light,//灯控6
    JAPreviewFunction_Resolution,//分辨率
    JAPreviewFunction_Cruise,//巡航
    JAPreviewFunction_AspectRatio,//宽高比
    JAPreviewFunction_MultiScreen,//多画面切换
    JAPreviewFunction_PTZ,//云台、预置位 、速度等级11
    JAPreviewFunction_ChannelSwitch,//通道切换
    JAPreviewFunction_AlarmSwitch,//一键报警
    JAPreviewFunction_CloudSever,//云服务管理
    JAPreviewFunction_FastPlayer,//支持倍数播放
    JAPreviewFunction_doubleTalk,//双向通话
    JAPreviewFunction_BatteryIPC, //是电池机
    JAPreviewFunction_SceneMode, //全景设备
    JAPreviewFunction_PTZV, //垂直云台
    JAPreviewFunction_PTZH, //水平云台
    JAPreviewFunction_af, //af
    JAPreviewFunction_ir, //ir
};
typedef NS_ENUM(NSInteger, JAPreviewHaveTFStatus)  {
    JAPreviewHaveTFStatusUnknown             = -1, /// 未知
    JAPreviewHaveTFStatusExist               = 0,  /// 有插入tf卡
    JAPreviewHaveTFStatusNoExist             = 1,  /// 未插入tf卡
    JAPreviewHaveTFStatusRepair             = 2,  /// tf卡异常
};

typedef NS_OPTIONS(NSUInteger, JAPreviewTFPlayStatus) {
    /// 缓冲中
    JAPreviewTFPlayStatusBuffering = 0,
    /// 开始播放
    JAPreviewTFPlayStatusStartPlay = 1 << 1,
    /// 暂停播放
    JAPreviewTFPlayStatusPausePlay = 1 << 2,
};

typedef NS_ENUM(NSInteger, JAScreenAdaptType)  {
    JAScreenAdaptScale = 0,
    JAScreenAdaptAspetFit,
    JAScreenAdaptAspetFill
};

typedef NS_ENUM(NSUInteger, JABatteryStatusType) {
    JABatteryStatusTypeNone = 0,
    JABatteryStatusTypeOnline,
    JABatteryStatusTypeOffline,
    JABatteryStatusTypeSleep
};


#endif /* JASDKHeader_h */
