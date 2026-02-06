//
//  NSString+JAPreviewDevice.m
//  eseecloud
//
//  Created by Mr.Z on 2018/4/19.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSString+JAPreviewDevice.h"

@implementation NSString (JAPreviewDevice)
#pragma mark -- 预览 -

+ (NSString *)ja_preview_date {
    
    return  PREVIEWSTRING(@"alarmMessage_selecteDate");
    
}

+ (NSString *)ja_preview_screen {
    return  PREVIEWSTRING(@"photos");
}

+ (NSString *)ja_preview_showModel {
    return  PREVIEWSTRING(@"play_display_mode");
}

+ (NSString *)ja_preview_playback {
    return  PREVIEWSTRING(@"playback");
}

+ (NSString *)ja_preview_live {
    return  PREVIEWSTRING(@"play_realTime");
}

+ (NSString *)ja_preview_lightControl {
    return  PREVIEWSTRING(@"play_lamp_control");
}

+ (NSString *)ja_preview_selectChannel {
    return  PREVIEWSTRING(@"channel_choose");
}


+ (NSString *)ja_preview_open {
    return  PREVIEWSTRING(@"play_lamp_open");
}

+ (NSString *)ja_preview_close {
    return  PREVIEWSTRING(@"play_lamp_close");
}

+ (NSString *)ja_preview_whiltLight {
    return  PREVIEWSTRING(@"play_lamp_whiteLight");
}

+ (NSString *)ja_preview_colorTemperature {
    return  PREVIEWSTRING(@"play_lamp_colorThermometry");
}


+ (NSString *)ja_preview_videoingPlaceStop {
    return PREVIEWSTRING(@"preview_video_stop");
}

+ (NSString *)ja_preview_dataman{
    return PREVIEWSTRING(@"userSettings_network_remind");
}

+ (NSString *)ja_preview_capturesuccess {
    return PREVIEWSTRING(@"play_screenshot_success");
}

+ (NSString *)ja_preview_capturefaile {
    return PREVIEWSTRING(@"play_screenshot_fail");
}

+ (NSString *)ja_preview_videosuccess {
    return PREVIEWSTRING(@"play_screenRecord_success");
}

+ (NSString *)ja_preview_record_completed {
    return PREVIEWSTRING(@"preview_record_completed");
}

+ (NSString *)ja_preview_videofaile {
    return PREVIEWSTRING(@"play_screenRecord_fail");
}

+ (NSString *)ja_preview_connectiong {
    return PREVIEWSTRING(@"myDevice_connection");
}

+ (NSString *)ja_preview_logining {
    return PREVIEWSTRING(@"logging_in");//
}

+ (NSString *)ja_preview_loading {
    return PREVIEWSTRING(@"loading");
}

+ (NSString *)ja_preview_connectiongfaile {
    return PREVIEWSTRING(@"myDevice_deviceStatus_authFail");
}

+ (NSString *)ja_preview_loginingfaile {
    return PREVIEWSTRING(@"login_failed");//
}

+ (NSString *)ja_preview_disconnectiong {
    return PREVIEWSTRING(@"connection_broken");//
}

+ (NSString *)ja_preview_passworderror {
    return PREVIEWSTRING(@"device_password_error");
}

+ (NSString *)ja_preview_connectiongtimeout {
    return PREVIEWSTRING(@"connection_timeout");//
}

+ (NSString *)ja_preview_noRecord {
    return PREVIEWSTRING(@"preview_playback_no_video");
}

+ (NSString *)ja_preview_havenoright {
    return PREVIEWSTRING(@"competence_lack");//
}

+ (NSString *)ja_preview_openMicrophone {
    return PREVIEWSTRING(@"setting_phone_turnOnMicrophone");//
}

+ (NSString *)ja_preview_zoom {
    return PREVIEWSTRING(@"play_ptz_zoom");
}

+ (NSString *)ja_preview_focal {
    return PREVIEWSTRING(@"play_ptz_focus");
}

+ (NSString *)ja_preview_aperture {
    return PREVIEWSTRING(@"play_ptz_iris");
}

+ (NSString *)ja_preview_at {
    return PREVIEWSTRING(@"auto");
}

+ (NSString *)ja_preview_smart {
    return PREVIEWSTRING(@"smart");
}

+ (NSString *)ja_preview_selectDate {
    return PREVIEWSTRING(@"alarmMessage_selecteDate");
}

+ (NSString *)ja_preview_deviceConnectSuccess {
    return PREVIEWSTRING(@"preview_wait_tips");
}

+ (NSString *)ja_preview_video{
    return PREVIEWSTRING(@"record");
}

+ (NSString *)ja_preview_cancel{
    return PREVIEWSTRING(@"cancel");
}

+ (NSString *)ja_preview_confirm {
    return PREVIEWSTRING(@"confirm");
}

+ (NSString *)ja_preview_infrared {
    return PREVIEWSTRING(@"infrared");
}

+ (NSString *)ja_preview_night {
    return PREVIEWSTRING(@"night");
}

+ (NSString *)ja_preview_colorfull {
    return PREVIEWSTRING(@"color_full");
}

+ (NSString *)ja_preview_record_played {
    return PREVIEWSTRING(@"video_played_selectDateAgain");//
}

+ (NSString *)ja_preview_goto {
    return PREVIEWSTRING(@"interface_continue");//
}
+ (NSString *)ja_preview_setting {
    return PREVIEWSTRING(@"setting");
}

+ (NSString *)ja_preview_videobackup {
    return PREVIEWSTRING(@"deviceSetting_videoBackup");
}

+ (NSString *)ja_preview_port_not_support {
    return PREVIEWSTRING(@"addDevice_port_not_support");
}
//高清
+ (NSString *)ja_preview_play_changeHD_alert {
    return PREVIEWSTRING(@"play_changeHD_alert");
}
//标清
+ (NSString *)ja_preview_play_changeSD_alert {
    return PREVIEWSTRING(@"preview_sd_mode_switch_success");
}

+ (NSString *)ja_preview_presetSetting{
    return PREVIEWSTRING(@"person_setting_preview_Preset_setting");
}


+ (NSString *)ja_preview_preset{
    return PREVIEWSTRING(@"preview_Preset");
}
+ (NSString *)ja_preview_speedSetting{
    return PREVIEWSTRING(@"play_PTZ_speed_grade");
}

+ (NSString *)ja_preview_presetEnter{
    return PREVIEWSTRING(@"person_setting_preview_enterpreset");
}


+ (NSString *)ja_preview_presetDel{
    return PREVIEWSTRING(@"preview_delete_preset");
}

+ (NSString *)ja_preview_transfer{
    return PREVIEWSTRING(@"person_setting_preview_transfer");
}

+ (NSString *)ja_preview_delete{
    return PREVIEWSTRING(@"delete");
}

+ (NSString *)ja_preview_deleteSuccess{
    return PREVIEWSTRING(@"delete_success");
}

+ (NSString *)ja_preview_presetFormatFail{
    return PREVIEWSTRING(@"person_setting_preview_position_between_section");
}

+ (NSString *)ja_preview_playbackTotalTime{
    return PREVIEWSTRING(@"device_playback_Total_video_ios");
}

+ (NSString *)ja_preview_notSupportCruise{
    return PREVIEWSTRING(@"preview_does_not_support_cruise");
}

+ (NSString *)ja_preview_viewTip{
    return PREVIEWSTRING(@"device_view_tip");
}

+ (NSString *)ja_preview_sound_open{
    return PREVIEWSTRING(@"preview_sound_open");
}

+ (NSString *)ja_preview_sound_off{
    return PREVIEWSTRING(@"preview_sound_off");
}

+ (NSString *)ja_devicesetting_network_set{
    return PREVIEWSTRING(@"devicesetting_network_set");
}
/**
 普通模式
 @return 普通模式
 */
+ (NSString *)ja_preview_preset_normal_mode
{
    return PREVIEWSTRING(@"preview_preset_normal_mode");
}
/**
 快捷模式
 @return 快捷模式
 */
+ (NSString *)ja_preview_preset_shortcut_mode
{
    return PREVIEWSTRING(@"preview_preset_shortcut_mode");
}

#pragma mark -----新预览
/**
 比例
 @return 比例
 */
+ (NSString *)ja_newPreview_proportion
{
    return PREVIEWSTRING(@"preview_proportion");
}
/**
 模式
 @return 模式
 */
+ (NSString *)ja_newPreview_mode
{
    return PREVIEWSTRING(@"mode");
}
//显示
+ (NSString *)ja_newPreview_display
{
    return PREVIEWSTRING(@"preview_display");
}
//回放通道
+ (NSString *)ja_newPreview_playback_channel
{
    return PREVIEWSTRING(@"preview_playback_channel");
}
//服务管理
+ (NSString *)ja_newPreview_playback_cloud
{
    return PREVIEWSTRING(@"devicesetting_service_management");
}
//回放
+ (NSString *)ja_newPreview_playback
{
    return PREVIEWSTRING(@"devicelis_playback");
}
//高清
+ (NSString *)ja_newPreview_HD
{
    return PREVIEWSTRING(@"HD");
}
//标清
+ (NSString *)ja_newPreview_SD
{
    return PREVIEWSTRING(@"SD");
}
//窗口
+ (NSString *)ja_newPreview_window
{
    return PREVIEWSTRING(@"preview_window");
}
//对讲
+ (NSString *)ja_newPreview_intercom
{
    return PREVIEWSTRING(@"preview_intercom");
}
//云台
+ (NSString *)ja_newPreview_ptz
{
    return PREVIEWSTRING(@"preview_ptz");
}
//声音
+ (NSString *)ja_newPreview_sound
{
    return PREVIEWSTRING(@"preview_sound");
}
//挂断
+ (NSString *)ja_newPreview_hang_up
{
    return PREVIEWSTRING(@"preview_speak_hang_up");
}
//按住说话
+ (NSString *)ja_newPreview_hold_intercom
{
    return PREVIEWSTRING(@"preview_hold_intercom");
}
//录像中
+ (NSString *)ja_newPreview_in_the_video
{
    return PREVIEWSTRING(@"preview_in_the_video");
}
//对讲中
+ (NSString *)ja_newPreview_In_the_intercom
{
    return PREVIEWSTRING(@"preview_In_the_intercom");
}
//正在录像中，请关闭后再退出
+ (NSString *)ja_newPreview_play_screenRecord_closeAndExit
{
    return PREVIEWSTRING(@"play_screenRecord_closeAndExit");
}
//云台数据调控 镜头控制
+ (NSString *)ja_newPreview_ptz_data_control
{
    return PREVIEWSTRING(@"preview_ptz_data_control");
}
//返回
+ (NSString *)ja_newPreview_back
{
    return PREVIEWSTRING(@"interface_return");
}
//变倍
+ (NSString *)ja_newPreview_play_ptz_zoom
{
    return PREVIEWSTRING(@"play_ptz_zoom");
}
//焦距
+ (NSString *)ja_newPreview_play_ptz_focus
{
    return PREVIEWSTRING(@"preview_focus");
}
//速度等级
+ (NSString *)ja_newPreview_speed_grade
{
    return PREVIEWSTRING(@"preview_ptz_speed_grade");
}
//云台调控
+ (NSString *)ja_newPreview_ptz_regulation
{
    return PREVIEWSTRING(@"preview_ptz_regulation");
}
//开启自动巡航
+ (NSString *)ja_newPreview_turn_on_auto_cruise
{
    return PREVIEWSTRING(@"preview_turn_on_auto_cruise");
}
//关闭自动巡航
+ (NSString *)ja_newPreview_turn_off_auto_cruise
{
    return PREVIEWSTRING(@"preview_turn_off_auto_cruise");
}
+ (NSString *)ja_newPreview_todayNoVideo
{
    return PREVIEWSTRING(@"meDevice_playback_no_video_thisDay");
}
+ (NSString *)ja_newPreview_playback_select_channel
{
    return PREVIEWSTRING(@"playback_select_channel");
}

//选择预览通道
+ (NSString *)ja_newPreview_switch_channel {
    return PREVIEWSTRING(@"preview_switch_channel");
}

@end
