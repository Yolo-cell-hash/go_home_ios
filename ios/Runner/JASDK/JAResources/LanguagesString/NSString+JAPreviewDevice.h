//
//  NSString+JAPreviewDevice.h
//  eseecloud
//
//  Created by Mr.Z on 2018/4/19.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JASettingLanguagesManager.h"

#define PREVIEWSTRING(KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:KEY tableName: @"Preview"]


@interface NSString (JAPreviewDevice)
+ (NSString *)ja_preview_preset;

+ (NSString *)ja_preview_date;

+ (NSString *)ja_preview_screen;

+ (NSString *)ja_preview_showModel;

+ (NSString *)ja_preview_playback;

+ (NSString *)ja_preview_live;

+ (NSString *)ja_preview_lightControl;

+ (NSString *)ja_preview_selectChannel;

+ (NSString *)ja_preview_open;

+ (NSString *)ja_preview_close;

+ (NSString *)ja_preview_whiltLight;

+ (NSString *)ja_preview_colorTemperature;

+ (NSString *)ja_preview_videoingPlaceStop;

+ (NSString *)ja_preview_dataman;

+ (NSString *)ja_preview_capturesuccess;

+ (NSString *)ja_preview_capturefaile;

+ (NSString *)ja_preview_videosuccess;

+ (NSString *)ja_preview_record_completed;

+ (NSString *)ja_preview_videofaile;

+ (NSString *)ja_preview_connectiong;

+ (NSString *)ja_preview_logining;

+ (NSString *)ja_preview_loading;

+ (NSString *)ja_preview_presetDel;

+ (NSString *)ja_preview_connectiongfaile;

+ (NSString *)ja_preview_loginingfaile;

+ (NSString *)ja_preview_disconnectiong;

+ (NSString *)ja_preview_passworderror;

+ (NSString *)ja_preview_connectiongtimeout;

+ (NSString *)ja_preview_noRecord;

+ (NSString *)ja_preview_havenoright;

+ (NSString *)ja_preview_openMicrophone;

+ (NSString *)ja_preview_zoom;

+ (NSString *)ja_preview_focal;

+ (NSString *)ja_preview_aperture;

+ (NSString *)ja_preview_at;

+ (NSString *)ja_preview_smart;

+ (NSString *)ja_preview_selectDate;

+ (NSString *)ja_preview_deviceConnectSuccess;

+ (NSString *)ja_preview_video;

+ (NSString *)ja_preview_cancel;

+ (NSString *)ja_preview_confirm;

+ (NSString *)ja_preview_infrared;

+ (NSString *)ja_preview_night;

+ (NSString *)ja_preview_colorfull;

+ (NSString *)ja_preview_record_played;

+ (NSString *)ja_preview_goto;

+ (NSString *)ja_preview_setting;

+ (NSString *)ja_preview_videobackup;

+ (NSString *)ja_preview_port_not_support;

+ (NSString *)ja_preview_play_changeHD_alert;

+ (NSString *)ja_preview_play_changeSD_alert;

+ (NSString *)ja_preview_presetSetting;

+ (NSString *)ja_preview_speedSetting;

+ (NSString *)ja_preview_presetEnter;

+ (NSString *)ja_preview_transfer;

+ (NSString *)ja_preview_delete;

+ (NSString *)ja_preview_deleteSuccess;

+ (NSString *)ja_preview_presetFormatFail;

+ (NSString *)ja_preview_playbackTotalTime;

+ (NSString *)ja_preview_notSupportCruise;

+ (NSString *)ja_preview_viewTip;

+ (NSString *)ja_preview_sound_open;

+ (NSString *)ja_preview_sound_off;

+ (NSString *)ja_devicesetting_network_set;

+ (NSString *)ja_newPreview_playback_cloud;
/**
 普通模式
 @return 普通模式
 */
+ (NSString *)ja_preview_preset_normal_mode;
/**
 快捷模式
 @return 快捷模式
 */
+ (NSString *)ja_preview_preset_shortcut_mode;

#pragma mark -----新预览
/**
 比例
 @return 比例
 */
+ (NSString *)ja_newPreview_proportion;
/**
 模式
 @return 模式
 */
+ (NSString *)ja_newPreview_mode;
//显示
+ (NSString *)ja_newPreview_display;
//回放通道
+ (NSString *)ja_newPreview_playback_channel;
//回放
+ (NSString *)ja_newPreview_playback;
//高清
+ (NSString *)ja_newPreview_HD;
//标清
+ (NSString *)ja_newPreview_SD;
//窗口
+ (NSString *)ja_newPreview_window;
//对讲
+ (NSString *)ja_newPreview_intercom;
//云台
+ (NSString *)ja_newPreview_ptz;
//声音
+ (NSString *)ja_newPreview_sound;
//挂断
+ (NSString *)ja_newPreview_hang_up;
//按住说话
+ (NSString *)ja_newPreview_hold_intercom;
//录像中
+ (NSString *)ja_newPreview_in_the_video;
//对讲中
+ (NSString *)ja_newPreview_In_the_intercom;
//正在录像中，请关闭后再退出
+ (NSString *)ja_newPreview_play_screenRecord_closeAndExit;
//云台数据调控（镜头控制）
+ (NSString *)ja_newPreview_ptz_data_control;
//返回
+ (NSString *)ja_newPreview_back;
//变倍
+ (NSString *)ja_newPreview_play_ptz_zoom;
//焦距
+ (NSString *)ja_newPreview_play_ptz_focus;
//速度等级
+ (NSString *)ja_newPreview_speed_grade;
//云台调控
+ (NSString *)ja_newPreview_ptz_regulation;
//开启自动巡航
+ (NSString *)ja_newPreview_turn_on_auto_cruise;
//关闭自动巡航
+ (NSString *)ja_newPreview_turn_off_auto_cruise;
//当天没有录像
+ (NSString *)ja_newPreview_todayNoVideo;

//切换回放通道
+ (NSString *)ja_newPreview_playback_select_channel;

//选择预览通道
+ (NSString *)ja_newPreview_switch_channel;

@end
