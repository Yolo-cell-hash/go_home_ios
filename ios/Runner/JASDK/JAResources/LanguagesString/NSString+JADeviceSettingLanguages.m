//
//  NSString+JADeviceSettingLanguages.m
//  eseecloud
//
//  Created by yang on 2018/4/25.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSString+JADeviceSettingLanguages.h"
#import "JASettingLanguagesManager.h"


@implementation NSString (JADeviceSettingLanguages)

/// 视频画面反转
+ (NSString *)JADeviceSetting_devicesetting_screen_inversion {return kJADeviceSettings(@"devicesetting_screen_inversion");}
/// 选择反转类型
+ (NSString *)JADeviceSetting_devicesetting_selcet_type {return kJADeviceSettings(@"devicesetting_selcet_type");}
/// 左右反转
+ (NSString *)JADeviceSetting_devicesetting_reversal_left_right {return kJADeviceSettings(@"devicesetting_reversal_left_right");}
/// 上下反转
+ (NSString *)JADeviceSetting_devicesetting_reversal_up_down {return kJADeviceSettings(@"devicesetting_reversal_up_down");}





/// 复制
+ (NSString *)JADeviceSetting_devicesetting_alarm_copy {return kJADeviceSettings(@"devicesetting_alarm_copy");}
/// 选择需要重复当前时间段的日期
+ (NSString *)JADeviceSetting_devicesetting_alarm_Select_copy_date {return kJADeviceSettings(@"devicesetting_alarm_Select_copy_date");}
/// (1h表示0:00-1:00之间的时间段)
+ (NSString *)JADeviceSetting_devicesetting_alarm_time_translate {return kJADeviceSettings(@"devicesetting_alarm_time_translate");}
/// 手动布防
+ (NSString *)JADeviceSetting_devicesetting_manual_arming {return kJADeviceSettings(@"devicesetting_manual_arming");}
/// 重启摄像机
+ (NSString *)JADeviceSetting_devicesetting_restart_camera {return kJADeviceSettings(@"devicesetting_restart_camera");}
/// 重启设备
+ (NSString *)JADeviceSetting_devicesetting_reboot_device {return kJADeviceSettings(@"devicesetting_reboot_device");}
/// 是否确定重启摄像机
+ (NSString *)JADeviceSetting_devicesetting_restart_camera_prompt {return kJADeviceSettings(@"devicesetting_restart_camera_prompt");}
/// 是否确定重启设备
+ (NSString *)JADeviceSetting_devicesetting_restart_device_prompt {return kJADeviceSettings(@"devicesetting_restart_device_prompt");}
/// 更新完成
+ (NSString *)JADeviceSetting_devicelist_update_completed {return kJADeviceSettings(@"devicelist_update_completed");}
/// 正在更新固件中
+ (NSString *)JADeviceSetting_devicelist_update_firmware {return kJADeviceSettings(@"devicelist_update_firmware");}


/// 更新
+ (NSString *)JADeviceSetting_devicesetting_Update {return kJADeviceSettings(@"devicesetting_Update");}
/// 已更新
+ (NSString *)JADeviceSetting_devicesetting_gw_updated {return kJADeviceSettings(@"devicesetting_gw_updated");}
/// 待更新
+ (NSString *)JADeviceSetting_devicesetting_gw_pending_upgrade {return kJADeviceSettings(@"devicesetting_gw_pending_upgrade");}
/// 待更新请选择需要固件更新的设备或通道
+ (NSString *)JADeviceSetting_cloud_gw_upgrade {return kJADeviceSettings(@"cloud_gw_upgrade");}

/// 报警提示音
+ (NSString *)JADeviceSetting_devicesetting_Alarm_tone {return kJADeviceSettings(@"devicesetting_Device_Alarm_tone");}


/// 设备信号检测
+ (NSString *)JADeviceSetting_Device_signal_detection {return kJADeviceSettings(@"devicesetting_Device_signal_detection");}
/// 开始检测
+ (NSString *)JADeviceSetting_Device_signal_Start_test {return kJADeviceSettings(@"devicesetting_Device_signal_Start_test");}
/// 请点击按钮检测设备信号
+ (NSString *)JADeviceSetting_Device_signal_click {return kJADeviceSettings(@"devicesetting_Device_signal_click");}
/// 检测中...
+ (NSString *)JADeviceSetting_Device_signal_checking {return kJADeviceSettings(@"devicesetting_Device_signal_checking");}
/// 正在检测中，请稍后...
+ (NSString *)JADeviceSetting_Device_signal_Being_tested {return kJADeviceSettings(@"devicesetting_Device_signal_Being_tested");}
/// 检测结果
+ (NSString *)JADeviceSetting_Device_signal_Test_results {return kJADeviceSettings(@"devicesetting_Device_signal_Test_results");}
/// 信号等级：
+ (NSString *)JADeviceSetting_Device_signal_level {return kJADeviceSettings(@"devicesetting_Device_signal_level");}
/// 网络带宽:
+ (NSString *)JADeviceSetting_Device_signal_Network_bandwidth {return kJADeviceSettings(@"devicesetting_Device_signal_Network_bandwidth");}
/// 建议：
+ (NSString *)JADeviceSetting_Device_signal_Suggest {return kJADeviceSettings(@"devicesetting_Device_signal_Suggest");}
/// 更换信道或将设备靠近gateway
+ (NSString *)JADeviceSetting_Device_signal_Change {return kJADeviceSettings(@"devicesetting_Device_signal_Change");}
/// 重新检测
+ (NSString *)JADeviceSetting_Device_signal_test_again {return kJADeviceSettings(@"devicesetting_Device_signal_test_again");}

/// 检测失败，请重试
+ (NSString *)JADeviceSetting_devicesetting_Device_signal_Test_results_failed {return kJADeviceSettings(@"devicesetting_Device_signal_Test_results_failed");}

/// 录制提示音
+ (NSString *)JADeviceSetting_deviceSetting_custom_tone_record {return kJADeviceSettings(@"deviceSetting_custom_tone_record");}

/// 请输入密码
+ (NSString *)JADeviceSetting_enter_your_password {return kJADeviceSettings(@"enter_your_password");}
/// 密码长度为6-20个字符，使用数字或字母并区分大小写
+ (NSString *)JADeviceSetting_register_password_tips {return kJADeviceSettings(@"register_password_tips");}
/// 确定
+ (NSString *)JADeviceSetting_confirm {return kJADeviceSettings(@"confirm");}
/// 设置密码
+ (NSString *)JADeviceSetting_setting_password {return kJADeviceSettings(@"setting_password");}
/// 不能含有空格
+ (NSString *)JADeviceSetting_contain_space {return kJADeviceSettings(@"contain_space");}
/// 不能含有中文
+ (NSString *)JADeviceSetting_cannot_contain_chinese {return kJADeviceSettings(@"cannot_contain_chinese");}
/// 请确认密码
+ (NSString *)JADeviceSetting_enter_password_confirm {return kJADeviceSettings(@"enter_password_confirm");}
/// 密码格式有误，请重新输入
+ (NSString *)JADeviceSetting_password_format_wrong {return kJADeviceSettings(@"password_format_wrong");}
/// 重置密码
+ (NSString *)JADeviceSetting_reset_password {return kJADeviceSettings(@"reset_password");}
/// 密码重置成功
+ (NSString *)JADeviceSetting_password_reset_success {return kJADeviceSettings(@"password_reset_success");}
/// 我的设备
+ (NSString *)JADeviceSetting_my_device {return kJADeviceSettings(@"my_device");}
/// 当前网络不可用，请检查你的网络配置
+ (NSString *)JADeviceSetting_myDevice_networkAlert {return kJADeviceSettings(@"myDevice_networkAlert");}
/// 网络不给力
+ (NSString *)JADeviceSetting_addDevice_network_failure {return kJADeviceSettings(@"addDevice_network_failure");}
/// 不再提示
+ (NSString *)JADeviceSetting_do_not_tip_always {return kJADeviceSettings(@"do_not_tip_always");}
/// 取消
+ (NSString *)JADeviceSetting_cancel {return kJADeviceSettings(@"cancel");}

/// TF卡状态异常，是否进行修复
+ (NSString *)JADeviceSetting_devicesetting_tf_abnormal_prompt {return kJADeviceSettings(@"devicesetting_tf_abnormal_prompt");}

/// 设备设置
+ (NSString *)JADeviceSetting_device_setting {return kJADeviceSettings(@"device_setting");}
/// 删除
+ (NSString *)JADeviceSetting_delete1 {return kJADeviceSettings(@"delete");}
/// 是否删除所选内容？
+ (NSString *)JADeviceSetting_confirm_to_delete_selected_files {return kJADeviceSettings(@"confirm_to_delete_selected_files");}
/// 否
+ (NSString *)JADeviceSetting_no {return kJADeviceSettings(@"no");}
/// 是
+ (NSString *)JADeviceSetting_yes {return kJADeviceSettings(@"yes");}
/// 开启
+ (NSString *)JADeviceSetting_open1 {return kJADeviceSettings(@"open");}
/// 密码
+ (NSString *)JADeviceSetting_password {return kJADeviceSettings(@"password");}
/// AP密码
+ (NSString *)JADeviceSetting_deviceSetting_AP_password {return kJADeviceSettings(@"deviceSetting_AP_password");}
/// WiFi设置
+ (NSString *)JADeviceSetting_deviceSetting_WIFI_settings {return kJADeviceSettings(@"deviceSetting_WIFI_settings");}
/// 设置WiFi
+ (NSString *)JADeviceSetting_deviceSetting_Equipment_WIFI {return kJADeviceSettings(@"deviceSetting_Equipment_WIFI");}
/// 更改设备连接WIFI
+ (NSString *)JADeviceSetting_deviceSetting_Change_WIFI {return kJADeviceSettings(@"deviceSetting_Change_WIFI");}
/// 选择局域网wifi
+ (NSString *)JADeviceSetting_deviceSetting_Change_WIFI_select {return kJADeviceSettings(@"deviceSetting_Change_WIFI_select");}
/// 设备wifi修改成功
+ (NSString *)JADeviceSetting_deviceSetting_Change_WIFI_modified_success {return kJADeviceSettings(@"deviceSetting_Change_WIFI_modified_success");}
/// 设备密码
+ (NSString *)JADeviceSetting_addDevice_setting_password {return kJADeviceSettings(@"addDevice_setting_password");}
/// 设备名字
+ (NSString *)JADeviceSetting_device_nick_name {return kJADeviceSettings(@"device_nick_name");}

/// 报警声音
+ (NSString *)JADeviceSetting_devicesetting_Device_Alarm_tone {return kJADeviceSettings(@"devicesetting_Device_Alarm_tone");}

/// 工作模式
+ (NSString *)JADeviceSetting_devicesetting_operate_mode {return kJADeviceSettings(@"devicesetting_operate_mode");}

/// 获取设置信息失败
+ (NSString *)JADeviceSetting_devicesetting_get_infomation_fail {return kJADeviceSettings(@"deviceSetting_setupFail");}
/// 获取设置信息超时
+ (NSString *)JADeviceSetting_devicesetting_get_infomation_timeout {return kJADeviceSettings(@"deviceSetting_setupTimeout");}

/// 完成
+ (NSString *)JADeviceSetting_completion {return kJADeviceSettings(@"completion");}
/// 设备连接失败，连接超时
+ (NSString *)JADeviceSetting_addDevice_connectionFail_timeOut {return kJADeviceSettings(@"addDevice_connectionFail_timeOut");}
/// 设备连接失败，密码错误
+ (NSString *)JADeviceSetting_addDevice_connectionFail_passwordError {return kJADeviceSettings(@"addDevice_connectionFail_passwordError");}
/// 连接失败...
+ (NSString *)JADeviceSetting_play_error_tips_1 {return kJADeviceSettings(@"play_error_tips_1");}
/// 无可用网络
+ (NSString *)JADeviceSetting_addDevice_unavailable_netword {return kJADeviceSettings(@"addDevice_unavailable_netword");}
/// 添加
+ (NSString *)JADeviceSetting_add {return kJADeviceSettings(@"add");}
/// 设备名
+ (NSString *)JADeviceSetting_addDevice_name {return kJADeviceSettings(@"addDevice_name");}
/// 用户名
+ (NSString *)JADeviceSetting_addDevice_user_name {return kJADeviceSettings(@"addDevice_user_name");}
/// 设备类型
+ (NSString *)JADeviceSetting_addDevice_setting_type {return kJADeviceSettings(@"addDevice_setting_type");}
/// 全景设备
+ (NSString *)JADeviceSetting_addDevice_choose_panorama {return kJADeviceSettings(@"addDevice_choose_panorama");}
/// NVR
+ (NSString *)JADeviceSetting_addDevice_choose_NVR {return kJADeviceSettings(@"addDevice_choose_NVR");}
/// 通道数
+ (NSString *)JADeviceSetting_addDevice_choose_channel {return kJADeviceSettings(@"addDevice_choose_channel");}
/// 设置信道
+ (NSString *)JADeviceSetting_gwdeviceSetting_set_signal_path {return kJADeviceSettings(@"gwdeviceSetting_set_signal_path");}
/// 选择信道
+ (NSString *)JADeviceSetting_gwdeviceSetting_choose_signal_path {return kJADeviceSettings(@"gwdeviceSetting_choose_signal_path");}
/// 信道
+ (NSString *)JADeviceSetting_gwdeviceSetting_signal_path {return kJADeviceSettings(@"gwdeviceSetting_signal_path");}
/// 信道选择法规提示
+ (NSString *)JADeviceSetting_gwdeviceSetting__signal_path_tip {return kJADeviceSettings(@"gwdeviceSetting__signal_path_tip");}
/// 输入设备密码
+ (NSString *)JADeviceSetting_addDevice_enter_password {return kJADeviceSettings(@"addDevice_enter_password");}
/// 输入设备名
+ (NSString *)JADeviceSetting_addDevice_enter_name {return kJADeviceSettings(@"addDevice_enter_name");}
/// 设备名重复
+ (NSString *)JADeviceSetting_addDevice_name_repeat {return kJADeviceSettings(@"addDevice_name_repeat");}
/// 录像
+ (NSString *)JADeviceSetting_record {return kJADeviceSettings(@"record");}
/// 显示模式
+ (NSString *)JADeviceSetting_play_display_mode {return kJADeviceSettings(@"play_display_mode");}
/// 开灯
+ (NSString *)JADeviceSetting_play_lamp_open {return kJADeviceSettings(@"play_lamp_open");}
/// 关灯
+ (NSString *)JADeviceSetting_play_lamp_close {return kJADeviceSettings(@"play_lamp_close");}
/// 亮度
+ (NSString *)JADeviceSetting_play_lamp_brightness {return kJADeviceSettings(@"play_lamp_brightness");}
/// 色温
+ (NSString *)JADeviceSetting_play_lamp_colorThermometry {return kJADeviceSettings(@"play_lamp_colorThermometry");}
/// 灯控
+ (NSString *)JADeviceSetting_play_lamp_control {return kJADeviceSettings(@"play_lamp_control");}
/// 开
+ (NSString *)JADeviceSetting_play_open {return kJADeviceSettings(@"play_open");}
/// 关
+ (NSString *)JADeviceSetting_play_close {return kJADeviceSettings(@"play_close");}
/// 自动
+ (NSString *)JADeviceSetting_auto1 {return kJADeviceSettings(@"auto");}
/// 智能
+ (NSString *)JADeviceSetting_smart {return kJADeviceSettings(@"smart");}
/// 白光
+ (NSString *)JADeviceSetting_play_lamp_whiteLight {return kJADeviceSettings(@"play_lamp_whiteLight");}
/// 选择日期
+ (NSString *)JADeviceSetting_alarmMessage_selecteDate {return kJADeviceSettings(@"alarmMessage_selecteDate");}
/// 通道1
+ (NSString *)JADeviceSetting_channel_one {return kJADeviceSettings(@"channel_one");}
/// 通道2
+ (NSString *)JADeviceSetting_channel_two {return kJADeviceSettings(@"channel_two");}
/// 通道3
+ (NSString *)JADeviceSetting_channel_three {return kJADeviceSettings(@"channel_three");}
/// 通道4
+ (NSString *)JADeviceSetting_channel_four {return kJADeviceSettings(@"channel_four");}
/// 通道5
+ (NSString *)JADeviceSetting_channel_five {return kJADeviceSettings(@"channel_five");}
/// 选择通道
+ (NSString *)JADeviceSetting_channel_choose {return kJADeviceSettings(@"channel_choose");}
/// 设置
+ (NSString *)JADeviceSetting_setting {return kJADeviceSettings(@"setting");}
/// 编辑
+ (NSString *)JADeviceSetting_edit {return kJADeviceSettings(@"edit");}
/// 全选
+ (NSString *)JADeviceSetting_selectAll {return kJADeviceSettings(@"selectAll");}
/// 取消全选
+ (NSString *)JADeviceSetting_selectAll_cancel {return kJADeviceSettings(@"selectAll_cancel");}
/// 正在获取最新版本消息…
+ (NSString *)JADeviceSetting_me_version_getting {return kJADeviceSettings(@"me_version_getting");}
/// 当前已是最新版本
+ (NSString *)JADeviceSetting_me_version_latest {return kJADeviceSettings(@"me_version_latest");}
/// 版本更新成功
+ (NSString *)JADeviceSetting_me_version_updateSuccess {return kJADeviceSettings(@"me_version_updateSuccess");}
/// 版本更新失败
+ (NSString *)JADeviceSetting_me_version_updateFail {return kJADeviceSettings(@"me_version_updateFail");}
/// 检查到最新版本，是否更新？
+ (NSString *)JADeviceSetting_me_version_updateAsk {return kJADeviceSettings(@"me_version_updateAsk");}
/// 暂时不用
+ (NSString *)JADeviceSetting_me_temporary {return kJADeviceSettings(@"me_temporary");}
/// 消息推送
+ (NSString *)JADeviceSetting_alarmMessage_messagePush {return kJADeviceSettings(@"alarmMessage_messagePush");}
/// 人体红外
+ (NSString *)JADeviceSetting_alarmMessage_msgType_bi {return kJADeviceSettings(@"alarmMessage_msgType_bi");}
/// 移动侦测
+ (NSString *)JADeviceSetting_alarmMessage_msgType_md {return kJADeviceSettings(@"alarmMessage_msgType_md");}
/// 加载更多消息
+ (NSString *)JADeviceSetting_getting_more_alert_message {return kJADeviceSettings(@"getting_more_alert_message");}
/// 其他
+ (NSString *)JADeviceSetting_other {return kJADeviceSettings(@"other");}
/// 修改密码
+ (NSString *)JADeviceSetting_userInfo_change_password {return kJADeviceSettings(@"userInfo_change_password");}
/// 设备版本
+ (NSString *)JADeviceSetting_device_setting_version {return kJADeviceSettings(@"device_setting_version");}
/// 个性化
+ (NSString *)JADeviceSetting_personalization {return kJADeviceSettings(@"personalization");}
/// 设备名称
+ (NSString *)JADeviceSetting_device_nick_designation {return kJADeviceSettings(@"device_nick_designation");}
/// 设备ID
+ (NSString *)JADeviceSetting_device_id {return kJADeviceSettings(@"device_id");}
/// 通用设置
+ (NSString *)JADeviceSetting_common_setting {return kJADeviceSettings(@"common_setting");}
/// 提示音
+ (NSString *)JADeviceSetting_prompt_sounds {return kJADeviceSettings(@"prompt_sounds");}
/// 设置提示音
+ (NSString *)JADeviceSetting_tone_Settings {return kJADeviceSettings(@"deviceSetting_tone_Settings");}
/// 开启后设备会有音频提示
+ (NSString *)JADeviceSetting_prompt_sounds_content {return kJADeviceSettings(@"prompt_sounds_content");}
/// 提示音语言
+ (NSString *)JADeviceSetting_prompt_sounds_text {return kJADeviceSettings(@"prompt_sounds_text");}
/// 选择设备提示音语言
+ (NSString *)JADeviceSetting_select_the_language_content {return kJADeviceSettings(@"select_the_language_content");}
/// 中文
+ (NSString *)JADeviceSetting_Chinese {return kJADeviceSettings(@"Chinese");}
/// 英文
+ (NSString *)JADeviceSetting_English {return kJADeviceSettings(@"English");}
/// 清晰度
+ (NSString *)JADeviceSetting_clarity {return kJADeviceSettings(@"clarity");}
/// 设置视频清晰度
+ (NSString *)JADeviceSetting_clarity_content {return kJADeviceSettings(@"clarity_content");}
/// 标清
+ (NSString *)JADeviceSetting_SD {return kJADeviceSettings(@"SD");}
/// 高清
+ (NSString *)JADeviceSetting_HD {return kJADeviceSettings(@"HD");}
/// 超清
+ (NSString *)JADeviceSetting_BD {return kJADeviceSettings(@"BD");}


/// 模式
+ (NSString *)JADeviceSetting_mode {return kJADeviceSettings(@"mode");}
/// 日光
+ (NSString *)JADeviceSetting_mode_sunlight {return kJADeviceSettings(@"sunlight");}
/// 夜间
+ (NSString *)JADeviceSetting_mode_night {return kJADeviceSettings(@"night");}


/// 设置视频色彩
+ (NSString *)JADeviceSetting_set_video_color {return kJADeviceSettings(@"set_video_color");}
/// 黑白
+ (NSString *)JADeviceSetting_black_and_white {return kJADeviceSettings(@"black_and_white");}
/// 全彩
+ (NSString *)JADeviceSetting_color_full {return kJADeviceSettings(@"color_full");}
/// 图像风格
+ (NSString *)JADeviceSetting_image_style {return kJADeviceSettings(@"image_style");}
/// 设置视频色彩风格
+ (NSString *)JADeviceSetting_set_video_color_style {return kJADeviceSettings(@"devicesetting_set_csc");}
/// 标准
+ (NSString *)JADeviceSetting_standard {return kJADeviceSettings(@"standard");}
/// 明亮
+ (NSString *)JADeviceSetting_bright {return kJADeviceSettings(@"bright");}
/// 艳丽
+ (NSString *)JADeviceSetting_gorgeous {return kJADeviceSettings(@"gorgeous");}
/// 时间同步
+ (NSString *)JADeviceSetting_synchronous_time {return kJADeviceSettings(@"synchronous_time");}
/// 同步设备与手机时间
+ (NSString *)JADeviceSetting_synchronous_device_phone {return kJADeviceSettings(@"synchronous_device_phone");}
/// 移动侦测报警
+ (NSString *)JADeviceSetting_motion_detection_alarm {return kJADeviceSettings(@"motion_detection_alarm");}
/// 开启报警推送
+ (NSString *)JADeviceSetting_motion_detection_alarm_content {return kJADeviceSettings(@"alarmMessage_messagePush");}
/// 移动侦测录像
+ (NSString *)JADeviceSetting_devSettings_motionDetection_record {return kJADeviceSettings(@"devSettings_motionDetection_record");}
/// 开启移动录像
+ (NSString *)JADeviceSetting_open_motion_record {return kJADeviceSettings(@"open_motion_record");}
/// 录像日程
+ (NSString *)JADeviceSetting_video_schedule {return kJADeviceSettings(@"video_schedule");}
/// 设置录像时间段
+ (NSString *)JADeviceSetting_video_schedule_setTimePeriod {return kJADeviceSettings(@"video_schedule_setTimePeriod");}
/// 设备信息
+ (NSString *)JADeviceSetting_device_information {return kJADeviceSettings(@"device_information");}
/// 设备类型
+ (NSString *)JADeviceSetting_device_type {return kJADeviceSettings(@"device_type");}
/// 固件更新
+ (NSString *)JADeviceSetting_devSettings_deviceUpdate {return kJADeviceSettings(@"devSettings_deviceUpdate");}
/// 存储
+ (NSString *)JADeviceSetting_devSettings_storage {return kJADeviceSettings(@"devSettings_storage");}
/// 设备存储
+ (NSString *)JADeviceSetting_devSettings_deviceStorage {return kJADeviceSettings(@"devSettings_deviceStorage");}
/// 基础设置
+ (NSString *)JADeviceSetting_generalSetting {return kJADeviceSettings(@"devicesetting_basic_settings");}
/// 录像设置
+ (NSString *)JADeviceSetting_devicesetting_vedioSet {return kJADeviceSettings(@"devicesetting_record_setting");}
/// 时间设置devicesetting_password_network_setting
+ (NSString *)JADeviceSetting_devicesetting_time_set {return kJADeviceSettings(@"devicesetting_time_set");}
/// 密码与网络设置
+ (NSString *)JADeviceSetting_devicesetting_password_network_setting {return kJADeviceSettings(@"devicesetting_password_network_setting");}
/// 移动侦测管理
+ (NSString *)JADeviceSetting_devicesetting_Motion_detection_management {return kJADeviceSettings(@"devicesetting_Motion_detection_management");}
/// 高级设置
+ (NSString *)JADeviceSetting_devicesetting_advanced_settings {return kJADeviceSettings(@"devicesetting_advanced_settings");}
/// 时间录像管理
+ (NSString *)JADeviceSetting_devicesetting_Time_recording_management {return kJADeviceSettings(@"devicesetting_Time_recording_management");}
/// 设置录像日程
+ (NSString *)JADeviceSetting_devicesetting_Set_recording_schedule {return kJADeviceSettings(@"devicesetting_Set_recording_schedule");}
/// 视频图像设置
+ (NSString *)JADeviceSetting_devicesetting_Video_image_settings {return kJADeviceSettings(@"devicesetting_Video_image_settings");}
/// 隐私区域设置
+ (NSString *)JADeviceSetting_devicesetting_set_privacy_cover {return kJADeviceSettings(@"devicesetting_privacy_set");}
/// 设置视频色彩、风格、清晰度
+ (NSString *)JADeviceSetting_devicesetting_set_csc {return kJADeviceSettings(@"devicesetting_set_csc");}
/// 选择夏令时
+ (NSString *)JADeviceSetting_devicesetting_Choose_daylight_saving_time {return kJADeviceSettings(@"devicesetting_Choose_daylight_saving_time");}


/// 插电常电模式
+ (NSString *)JADeviceSetting_devicesetting_power_mode {
    return kJADeviceSettings(@"devicesetting_power_mode");
}
/// 电池低功耗模式
+ (NSString *)JADeviceSetting_devicesetting_battery_low_power {
    return kJADeviceSettings(@"devicesetting_battery_low_power");
}
/// 插电常电模式下支持设备自动预录像功能
+ (NSString *)JADeviceSetting_devicesetting_operate_mode_prompt {
    return kJADeviceSettings(@"devicesetting_operate_mode_prompt");
}

/// 时间同步失败
+ (NSString *)JADeviceSetting_synchronous_time_fail {return kJADeviceSettings(@"synchronous_time_fail");}
/// 时间同步成功
+ (NSString *)JADeviceSetting_synchronous_time_success {return kJADeviceSettings(@"synchronous_time_success");}
/// TF卡状态
+ (NSString *)JADeviceSetting_tfCard_status {return kJADeviceSettings(@"tfCard_status");}
/// 未格式化
+ (NSString *)JADeviceSetting_tfCard_noFormat {return kJADeviceSettings(@"tfCard_noFormat");}
/// 无TF卡
+ (NSString *)JADeviceSetting_tfCard_nothing {return kJADeviceSettings(@"tfCard_nothing");}
/// 正常
+ (NSString *)JADeviceSetting_tfCard_normal {return kJADeviceSettings(@"tfCard_normal");}
/// 异常
+ (NSString *)JADeviceSetting_tfCard_exception {return kJADeviceSettings(@"tfCard_exception");}
/// 总容量
+ (NSString *)JADeviceSetting_tfCard_total_capacity {return kJADeviceSettings(@"tfCard_total_capacity");}
/// 可用容量
+ (NSString *)JADeviceSetting_tfCard_available_space {return kJADeviceSettings(@"tfCard_available_space");}
/// 已格式化
+ (NSString *)JADeviceSetting_tfCard_already_for_mat {return kJADeviceSettings(@"tfCard_already_for_mat");}
/// 格式化失败
+ (NSString *)JADeviceSetting_tfCard_format_fail {return kJADeviceSettings(@"tfCard_format_fail");}
/// 格式化中
+ (NSString *)JADeviceSetting_formatting {return kJADeviceSettings(@"formatting");}
/// 格式化
+ (NSString *)JADeviceSetting_format {return kJADeviceSettings(@"format");}
/// 注意：格式化TF卡将会清空所有录像
+ (NSString *)JADeviceSetting_tfCard_format_alert {return kJADeviceSettings(@"tfCard_format_alert");}
/// 从
+ (NSString *)JADeviceSetting_devSettings_schedule_from {return kJADeviceSettings(@"devSettings_schedule_from");}
/// 到
+ (NSString *)JADeviceSetting_devSettings_schedule_to {return kJADeviceSettings(@"devSettings_schedule_to");}
/// 一
+ (NSString *)JADeviceSetting_Monday {return kJADeviceSettings(@"person_alarm_selct_time_monday");}
/// 二
+ (NSString *)JADeviceSetting_Tuesday {return kJADeviceSettings(@"person_alarm_selct_time_tuesday");}
/// 三
+ (NSString *)JADeviceSetting_Wednesday {return kJADeviceSettings(@"person_alarm_selct_time_wed");}
/// 四
+ (NSString *)JADeviceSetting_Thursday {return kJADeviceSettings(@"person_alarm_selct_time_thur");}
/// 五
+ (NSString *)JADeviceSetting_Friday {return kJADeviceSettings(@"person_alarm_selct_time_fri");}
/// 六
+ (NSString *)JADeviceSetting_Saturday {return kJADeviceSettings(@"person_alarm_selct_time_sat");}
/// 日
+ (NSString *)JADeviceSetting_Sunday {return kJADeviceSettings(@"person_alarm_selct_time_sun");}
/// 起始时间必须小于结束时间
+ (NSString *)JADeviceSetting_devSettings_schedule_error_timeComparing {return kJADeviceSettings(@"devSettings_schedule_error_timeComparing");}
/// 已存在相同的日程
+ (NSString *)JADeviceSetting_devSettings_schedule_error_exist {return kJADeviceSettings(@"devSettings_schedule_error_exist");}
/// 门铃
+ (NSString *)JADeviceSetting_bell {return kJADeviceSettings(@"bell");}
/// 门铃类型
+ (NSString *)JADeviceSetting_bell_type {return kJADeviceSettings(@"bell_type");}
/// 响铃时间
+ (NSString *)JADeviceSetting_bell_timeRing {return kJADeviceSettings(@"bell_timeRing");}
/// 电子门铃
+ (NSString *)JADeviceSetting_bell_electronic {return kJADeviceSettings(@"bell_electronic");}
/// 机械门铃
+ (NSString *)JADeviceSetting_bell_mechanical {return kJADeviceSettings(@"bell_mechanical");}
/// 电量
+ (NSString *)JADeviceSetting_electricity {return kJADeviceSettings(@"electricity");}
/// 信号
+ (NSString *)JADeviceSetting_signal1 {return kJADeviceSettings(@"signal");}
///最高
+ (NSString *)JADeviceSetting_highest {return kJADeviceSettings(@"deviceSetting_highest");}
/// 高
+ (NSString *)JADeviceSetting_high {return kJADeviceSettings(@"high");}
/// 中
+ (NSString *)JADeviceSetting_centre {return kJADeviceSettings(@"centre");}
/// 低
+ (NSString *)JADeviceSetting_low {return kJADeviceSettings(@"low");}
///最低
+ (NSString *)JADeviceSetting_lowest {return kJADeviceSettings(@"deviceSetting_lowest");}
/// 推送
+ (NSString *)JADeviceSetting_push {return kJADeviceSettings(@"alarmMessage_messagePush");}
/// 录像类型
+ (NSString *)JADeviceSetting_device_record {return kJADeviceSettings(@"device_record");}
/// 待更新
+ (NSString *)JADeviceSetting_to_be_updated {return kJADeviceSettings(@"to_be_updated");}
/// 已更新
+ (NSString *)JADeviceSetting_updated {return kJADeviceSettings(@"updated");}
/// 是否删除通道1设备？
+ (NSString *)JADeviceSetting_devSettings_delect_tips {return kJADeviceSettings(@"devSettings_delect_tips");}
/// 帮助
+ (NSString *)JADeviceSetting_help {return kJADeviceSettings(@"help");}
/// 加载中…
+ (NSString *)JADeviceSetting_loading {return kJADeviceSettings(@"loading");}
/// 密码设置
+ (NSString *)JADeviceSetting_setting_password_module {return kJADeviceSettings(@"setting_password_module");}
/// 密码错误
+ (NSString *)JADeviceSetting_device_password_error {return kJADeviceSettings(@"device_password_error");}
/// 设备编辑
+ (NSString *)JADeviceSetting_device_editor {return kJADeviceSettings(@"device_editor");}
/// 设备删除
+ (NSString *)JADeviceSetting_device_delete {return kJADeviceSettings(@"device_delete");}
/// 版本
+ (NSString *)JADeviceSetting_version {return kJADeviceSettings(@"version");}
/// 通道
+ (NSString *)JADeviceSetting_channel {return kJADeviceSettings(@"channel");}
/// KB
+ (NSString *)JADeviceSetting_traffic_statistics_KB {return kJADeviceSettings(@"traffic_statistics_KB");}
/// MB
+ (NSString *)JADeviceSetting_traffic_statistics_MB {return kJADeviceSettings(@"traffic_statistics_MB");}
/// 密码不能包含特殊字符
+ (NSString *)JADeviceSetting_password_cannot_special_characters {return kJADeviceSettings(@"password_cannot_special_characters");}
/// 密码修改失败
+ (NSString *)JADeviceSetting_password_change_failure {return kJADeviceSettings(@"password_change_failure");}
/// 选择时区
+ (NSString *)JADeviceSetting_setting_select_time {return kJADeviceSettings(@"setting_select_time");}
/// 设置尚未保存，是否退出？
+ (NSString *)JADeviceSetting_setting_tips {return kJADeviceSettings(@"setting_tips");}
/// 密码长度不能大于20位
+ (NSString *)JADeviceSetting_password_tips_length {return kJADeviceSettings(@"password_tips_length");}
/// 保存失败
+ (NSString *)JADeviceSetting_setting_save_failed {return kJADeviceSettings(@"setting_save_failed");}
/// 检查到有新的固件版本,是否需要更新?
+ (NSString *)JADeviceSetting_devSetting_deviceUpdate_tips_1 {return kJADeviceSettings(@"devSetting_deviceUpdate_tips_1");}
/// 固件更新中会退出当前页面，请注意听设备提示音。
+ (NSString *)JADeviceSetting_devSetting_deviceUpdate_tips_2 {return kJADeviceSettings(@"devSetting_deviceUpdate_tips_2");}
/// 当前为最新固件
+ (NSString *)JADeviceSetting_devSetting_latest_firmware {return kJADeviceSettings(@"devSetting_latest_firmware");}
/// 该设备名称已存在
+ (NSString *)JADeviceSetting_devSetting_name_existing {return kJADeviceSettings(@"devSetting_name_existing");}
/// 移动侦测灵敏度
+ (NSString *)JADeviceSetting_alarmMessage_msgType_sensitivity {return kJADeviceSettings(@"alarmMessage_msgType_sensitivity");}
/// 是否删除通道设备
+ (NSString *)JADeviceSetting_devSetting_delete_channelDevcive {return kJADeviceSettings(@"devSetting_delete_channelDevcive");}
/// 名称不为空
+ (NSString *)JADeviceSetting_setting_name_cannot_empty {return kJADeviceSettings(@"setting_name_cannot_empty");}
/// 固件版本
+ (NSString *)JADeviceSetting_devSetting_firmware_version {return kJADeviceSettings(@"devSetting_firmware_version");}
/// 设备模式
+ (NSString *)JADeviceSetting_devSetting_equipment_model {return kJADeviceSettings(@"devSetting_equipment_model");}
/// 删除通道成功
+ (NSString *)JADeviceSetting_devSetting_delete_channelDevice_success {return kJADeviceSettings(@"devSetting_delete_channelDevice_success");}
/// 格式化TF卡将会清空所有录像，是否继续
+ (NSString *)JADeviceSetting_tfCard_format_alert_tips {return kJADeviceSettings(@"tfCard_format_alert_tips");}
/// 是否删除该设备？
+ (NSString *)JADeviceSetting_devSetting_delete_ask {return kJADeviceSettings(@"devSetting_delete_ask");}
/// 设备删除失败
+ (NSString *)JADeviceSetting_devSetting_delete_failure {return kJADeviceSettings(@"devSetting_delete_failure");}
/// 是否添加该设备？
+ (NSString *)JADeviceSetting_devSetting_add_ask {return kJADeviceSettings(@"devSetting_add_ask");}
/// 日光
+ (NSString *)JADeviceSetting_sunlight {return kJADeviceSettings(@"sunlight");}
/// 夜间
+ (NSString *)JADeviceSetting_night {return kJADeviceSettings(@"night");}
/// 德语
+ (NSString *)JADeviceSetting_German {return kJADeviceSettings(@"German");}
/// 韩语
+ (NSString *)JADeviceSetting_Korean {return kJADeviceSettings(@"Korean");}
/// 葡萄牙语
+ (NSString *)JADeviceSetting_Portuguese {return kJADeviceSettings(@"Portuguese");}
/// 俄语
+ (NSString *)JADeviceSetting_Russian {return kJADeviceSettings(@"Russian");}
/// 西班牙语
+ (NSString *)JADeviceSetting_Spanish {return kJADeviceSettings(@"Spanish");}
/// 法语
+ (NSString *)JADeviceSetting_French {return kJADeviceSettings(@"French");}
/// 波兰语
+ (NSString *)JADeviceSetting_Polish {return kJADeviceSettings(@"Polish");}
/// 捷克语
+ (NSString *)JADeviceSetting_Czech {return kJADeviceSettings(@"Czech");}
/// 意大利语
+ (NSString *)JADeviceSetting_Italian {return kJADeviceSettings(@"Italian");}
/// 日语
+ (NSString *)JADeviceSetting_Japanese {return kJADeviceSettings(@"Japanese");}
/// 设备昵称长度不能大于15个字符
+ (NSString *)JADeviceSetting_devSetting_name_length_not_more_than_15 {return kJADeviceSettings(@"devSetting_name_length_not_more_than_15");}
/// 编辑设备成功
+ (NSString *)JADeviceSetting_devSetting_edit_success {return kJADeviceSettings(@"devSetting_edit_success");}
/// 设备未保存，确定要退出吗？
+ (NSString *)JADeviceSetting_addSetting_tips {return kJADeviceSettings(@"addSetting_tips");}
/// 云ID
+ (NSString *)JADeviceSetting_cloud_ID {return kJADeviceSettings(@"cloud_ID");}
/// 编辑设备
+ (NSString *)JADeviceSetting_edit_device {return kJADeviceSettings(@"edit_device");}
/// 修改失败
+ (NSString *)JADeviceSetting_modify_failure {return kJADeviceSettings(@"modify_failure");}
/// 中国
+ (NSString *)JADeviceSetting_China {return kJADeviceSettings(@"China");}
/// 找不到硬盘
+ (NSString *)JADeviceSetting_devSetting_hardDisk_cannotFind {return kJADeviceSettings(@"devSetting_hardDisk_cannotFind");}
/// 硬盘错误
+ (NSString *)JADeviceSetting_devSetting_hardDisk_error {return kJADeviceSettings(@"devSetting_hardDisk_error");}
/// TF卡异常
+ (NSString *)JADeviceSetting_tfCards_exception {return kJADeviceSettings(@"alarm_tf_exception");}
/// 硬盘空间不足
+ (NSString *)JADeviceSetting_devSetting_hardDisk_insufficient {return kJADeviceSettings(@"devSetting_hardDisk_insufficient");}
/// 录像错误
+ (NSString *)JADeviceSetting_devPlay_video_error {return kJADeviceSettings(@"devPlay_video_error");}
/// 门磁
+ (NSString *)JADeviceSetting_magnetic_door {return kJADeviceSettings(@"magnetic_door");}
/// 红外
+ (NSString *)JADeviceSetting_infrared {return kJADeviceSettings(@"infrared");}
/// 烟雾
+ (NSString *)JADeviceSetting_smoke {return kJADeviceSettings(@"smoke");}
/// 声控
+ (NSString *)JADeviceSetting_voice_control {return kJADeviceSettings(@"voice_control");}
/// 遥控器
+ (NSString *)JADeviceSetting_remote_control {return kJADeviceSettings(@"remote_control");}
/// 门铃录像
+ (NSString *)JADeviceSetting_bell_video {return kJADeviceSettings(@"bell_video");}
/// 门铃对讲正在被占用
+ (NSString *)JADeviceSetting_bell_occupied {return kJADeviceSettings(@"bell_occupied");}
/// 保存成功
+ (NSString *)JADeviceSetting_save_success {return kJADeviceSettings(@"save_success");}
/// 通道名称不能为空
+ (NSString *)JADeviceSetting_channel_name_be_empty {return kJADeviceSettings(@"channel_name_be_empty");}
/// 正在保存中...
+ (NSString *)JADeviceSetting_saving {return kJADeviceSettings(@"saving");}
/// 删除失败
+ (NSString *)JADeviceSetting_devSetting_delete_toFail {return kJADeviceSettings(@"devSetting_delete_toFail");}
/// 测试版
+ (NSString *)JADeviceSetting_beta {return kJADeviceSettings(@"");}
/// WIFI
+ (NSString *)JADeviceSetting_addDevice_WIFI {return kJADeviceSettings(@"addDevice_WIFI");}
/// 网络异常，请重试
+ (NSString *)JADeviceSetting_cloud_network_anomalies {return kJADeviceSettings(@"network_anomalies");}
/// 轻触屏幕重新加载
+ (NSString *)JADeviceSetting_cloud_reload_page {return kJADeviceSettings(@"cloud_reload_page");}
/// 请重新输入
+ (NSString *)JADeviceSetting_enter_again {return kJADeviceSettings(@"enter_again");}
/// 选择录像
+ (NSString *)JADeviceSetting_select_video {return kJADeviceSettings(@"select_video");}
/// 选择时间段
+ (NSString *)JADeviceSetting_selection_time {return kJADeviceSettings(@"selection_time");}
/// %1d秒
+ (NSString *)JADeviceSetting_plural_ios {return kJADeviceSettings(@"plural_ios");}
/// 注意：修改设备密码后，需要在编辑中同步修改访问密码；否则容易出现密码错误的情况。
+ (NSString *)JADeviceSetting_setting_modify_device_password {return kJADeviceSettings(@"setting_modify_device_password");}
/// 白天
+ (NSString *)JADeviceSetting_daytime {return kJADeviceSettings(@"daytime");}
/// 修改
+ (NSString *)JADeviceSetting_userInfo_change {return kJADeviceSettings(@"userInfo_change");}
/// 设置设备时区时间
+ (NSString *)JADeviceSetting_setting_time_zone {return kJADeviceSettings(@"setting_time_zone");}
/// 搜索
+ (NSString *)JADeviceSetting_search {return kJADeviceSettings(@"search");}
/// 请选择录像日期
+ (NSString *)JADeviceSetting_setting_select_timeOfVideo {return kJADeviceSettings(@"setting_select_timeOfVideo");}
/// 离线
+ (NSString *)JADeviceSetting_myDevice_offline {return kJADeviceSettings(@"myDevice_offline");}
/// 登录失败
+ (NSString *)JADeviceSetting_login_failed {return kJADeviceSettings(@"login_failed");}
/// 图像采集率
+ (NSString *)JADeviceSetting_devSetting_acquisition {return kJADeviceSettings(@"devSetting_acquisition");}
/// 时间录像
+ (NSString *)JADeviceSetting_devSetting_timeVideo {return kJADeviceSettings(@"devSetting_timeVideo");}
+ (NSString *)JADeviceSetting_daylightTime_save {return kJADeviceSettings(@"me_photo_album_save");};
+ (NSString *)JADeviceSetting_choose_daylightTime {return kJADeviceSettings(@"devSetting_choose_daylightTime");}
+ (NSString *)JADeviceSetting_daylight_Germany {return kJADeviceSettings(@"devSetting_Germany");}
+ (NSString *)JADeviceSetting_daylight_Netherlands {return kJADeviceSettings(@"devSetting_Netherlands");}
+ (NSString *)JADeviceSetting_daylight_Poland {return kJADeviceSettings(@"devSetting_Poland");}
+ (NSString *)JADeviceSetting_daylight_Iran {return kJADeviceSettings(@"devSetting_Iran");}
+ (NSString *)JADeviceSetting_daylight_Israel {return kJADeviceSettings(@"devSetting_Israel");}
+ (NSString *)JADeviceSetting_daylight_Brazil {return kJADeviceSettings(@"devSetting_Brazil");}
+ (NSString *)JADeviceSetting_detection_tips {return kJADeviceSettings(@"devSetting_motion_tips");};
+ (NSString *)JADeviceSetting_devicesetting_doorbell_tone {return kJADeviceSettings(@"devicesetting_doorbell_tone");};

+ (NSString *)JADeviceSetting_daylight_openOrClose {return kJADeviceSettings(@"devSetting_daylightTime");};
+ (NSString *)JADeviceSetting_daylight_country {return kJADeviceSettings(@"devSetting_country");};
+ (NSString *)JADeviceSetting_daylight_Europe {return kJADeviceSettings(@"devSetting_Europe");};
+ (NSString *)JADeviceSetting_frequency_switch {return kJADeviceSettings(@"deviceSettings_voice");}
+ (NSString *)JADeviceSetting_device_indicator_led {return kJADeviceSettings(@"devicesetting_device_indicator");}
+ (NSString *)JADeviceSetting_ConvenientInside{return kJADeviceSettings(@"deviceSetting_athome");}
+ (NSString *)JADeviceSetting_ConvenientOutside{return kJADeviceSettings(@"deviceSetting_offhome");}
+ (NSString *)JADeviceSetting_Convenient{return kJADeviceSettings(@"deviceSetting_mode_select");}
+ (NSString *)JADevicesetting_device_model{return kJADeviceSettings(@"devicesetting_device_model");}

/// 设备音量
+ (NSString *)JADeviceSetting_devicesetting_device_volume {
    return kJADeviceSettings(@"devicesetting_device_volume");
}
/// 支持设置设备接收与发出的音量大小
+ (NSString *)JADeviceSetting_devicesetting_device_volume_prompt {
    return kJADeviceSettings(@"devicesetting_device_volume_prompt");
}
/// 设备接收的音量
+ (NSString *)JADeviceSetting_devicesetting_device_receive_volume {
    return kJADeviceSettings(@"devicesetting_device_receive_volume");
}
/// 设备发出的音量
+ (NSString *)JADeviceSetting_devicesetting_device_emitted_volume {
    return kJADeviceSettings(@"devicesetting_device_emitted_volume");
}

/// 日期格式
+ (NSString *)JADeviceSetting_deviceSetting_dateFormatter{return kJADeviceSettings(@"deviceSetting_dateFormatter");}
/// 年
+ (NSString *)JADeviceSetting_deviceSetting_videoBackup_startTimeYY{return kJADeviceSettings(@"deviceSetting_videoBackup_startTimeYY");}
/// 月
+ (NSString *)JADeviceSetting_deviceSetting_videoBackup_startTimeMM{return kJADeviceSettings(@"deviceSetting_videoBackup_startTimeMM");}
/// 日
+ (NSString *)JADeviceSetting_deviceSetting_videoBackup_startTimeDD{return kJADeviceSettings(@"deviceSetting_videoBackup_startTimeDD");}

/// 报警设置
+ (NSString *)JADeviceSetting_deviceSetting_Alarm_Settings{return kJADeviceSettings(@"deviceSetting_Alarm_Settings");}
+ (NSString *)JADeviceSetting_deviceSetting_Alarm_Settings_select_time_period{return kJADeviceSettings(@"deviceSetting_Alarm_Settings_select_time_period");}
+ (NSString *)JADeviceSetting_deviceSetting_Alarm_Settings_Select_time_length{return kJADeviceSettings(@"deviceSetting_Alarm_Settings_time");}
+ (NSString *)JADeviceSetting_devicesetting_alarm_set_video_delay{return kJADeviceSettings(@"devicesetting_alarm_set_video_delay");}
+ (NSString *)JADeviceSetting_devicesetting_alarm_set_video_delay_duration{return kJADeviceSettings(@"devicesetting_alarm_set_video_delay_duration");}


/// 搜索不到设备
+ (NSString *)JADeviceSetting_unsearchable{return kJADeviceSettings(@"addDevice_unsearchable");}
+ (NSString *)JADeviceSetting_pleaseConnectLANWithSameOfDevice{return kJADeviceSettings(@"device_connect_LAN");}
+ (NSString *)JADeviceSetting_deviceSetting_deviceWIFI_version{return kJADeviceSettings(@"deviceSetting_deviceWIFI_version");}

///4G卡状态
+ (NSString *)JADeviceSetting_devicesetting_4G_no_device_can_buy_data_plan {//暂无设备可购买流量套餐
    return kJADeviceSettings(@"devicesetting_4G_no_device_can_buy_data_plan");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_cannot_buy_data {//该设备不支持流量购买
    return kJADeviceSettings(@"devicesetting_4G_device_cannot_buy_data");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_testable {//可测试
    return kJADeviceSettings(@"devicesetting_4G_device_testable");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_sim_card_testable {//SIM卡可测试
    return kJADeviceSettings(@"devicesetting_4G_device_sim_card_testable");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_unknown {//未知
    return kJADeviceSettings(@"devicesetting_4G_device_unknown");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_sim_card_unknown {//SIM卡状态未知
    return kJADeviceSettings(@"devicesetting_4G_device_sim_card_unknown");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_Activability {//可激活
    return kJADeviceSettings(@"devicesetting_4G_device_Activability");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_can_be_activated {//SIM卡可激活
    return kJADeviceSettings(@"devicesetting_4G_device_can_be_activated");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_invalid {//已失效
    return kJADeviceSettings(@"devicesetting_4G_device_invalid");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_device_sim_car_invalid {//SIM卡已失效
    return kJADeviceSettings(@"devicesetting_4G_device_sim_car_invalid");
}
+ (NSString *)JADeviceSetting_devicesetting_4G_no_signal {//无信号
    return kJADeviceSettings(@"devicesetting_4G_no_signal");
}

//未购买
+ (NSString *)JADeviceSetting_cloud_no_purchase {
    return kJADeviceSettings(@"cloud_no_purchase");
}

//云存储
+ (NSString *)JADeviceSetting_cloud_storage {
    return kJADeviceSettings(@"cloud_storage");
}

//存储管理
+ (NSString *)JADeviceSetting_service_map_storage_management {
    return kJADeviceSettings(@"service_map_storage_management");
}

//TF卡存储
+ (NSString *)JADeviceSetting_devicesetting_TF_card_storage {
    return kJADeviceSettings(@"devicesetting_TF_card_storage");
}

//剩余可用容量
+ (NSString *)JADeviceSetting_devicesetting_remain_available_capacity{
    return kJADeviceSettings(@"devicesetting_remain_available_capacity");
}

//云台校准
+ (NSString *)JADeviceSetting_preview_ptz_adjustment {
    return kJADeviceSettings(@"preview_ptz_adjustment");
}

//定时巡航
+ (NSString *)JADeviceSetting_devicesetting_timing_cruise {
    return kJADeviceSettings(@"devicesetting_timing_cruise");
}

//每次巡航4小时后将自动关闭
+ (NSString *)JADeviceSetting_devicesetting_turn_off_cruise_4 {
    return kJADeviceSettings(@"devicesetting_turn_off_cruise_4");
}

//选择巡航模式
+ (NSString *)JADeviceSetting_devicesetting_select_cruise_mode {
    return kJADeviceSettings(@"devicesetting_select_cruise_mode");
}

//全景巡航
+ (NSString *)JADeviceSetting_devicesetting_Panoramic_cruise {
    return kJADeviceSettings(@"devicesetting_Panoramic_cruise");
}

//摄像机进行水平360拍摄
+ (NSString *)JADeviceSetting_devicesetting_Camera_horizontal_360_shot {
    return kJADeviceSettings(@"devicesetting_Camera_horizontal_360_shot");
}

//定点巡航
+ (NSString *)JADeviceSetting_devicesetting_fixed_point {
    return kJADeviceSettings(@"devicesetting_fixed_point");
}

//根据您收藏的预置位定点巡航
+ (NSString *)JADeviceSetting_devicesetting_preset_position {
    return kJADeviceSettings(@"devicesetting_preset_position");
}

//定点巡航功能需存在预置位才能正常使用，若您的设备没有预置位，请及时前往预览-云台中设置。
+ (NSString *)JADeviceSetting_devicesetting_need_set_preset {
    return kJADeviceSettings(@"devicesetting_need_set_preset");
}

//正在校准...
+ (NSString *)JADeviceSetting_devicesetting_calibrate {
    return kJADeviceSettings(@"devicesetting_calibrate");
}

//摄像机校准成功
+ (NSString *)JADeviceSetting_devicesetting_camera_calibration {
    return kJADeviceSettings(@"devicesetting_camera_calibration");
}

//人形侦测对场景有一定的适应性要求，请根据实际情况使用
+ (NSString *)JADeviceSetting_devicesetting_humanoid_detection_prompt {
    return kJADeviceSettings(@"devicesetting_humanoid_detection_prompt");
}

//人脸侦测对场景有一定的适应性要求，请根据实际情况使用
+ (NSString *)JADeviceSetting_devicesetting_face_detection_prompt {
    return kJADeviceSettings(@"devicesetting_face_detection_prompt");
}
/// 唤醒
+ (NSString *)JADeviceSetting_preview_wake_up_camera{
    return kJADeviceSettings(@"preview_wake_up_camera");

}

/// 使用场景
+ (NSString *)JADeviceSetting_devicesetting_usage_scenarios{
    return kJADeviceSettings(@"devicesetting_usage_scenarios");

}

/// 室内
+ (NSString *)JADeviceSetting_devicesetting_indoor{
    return kJADeviceSettings(@"devicesetting_indoor");

}

/// 室外
+ (NSString *)JADeviceSetting_devicesetting_outdoor{
    return kJADeviceSettings(@"devicesetting_outdoor");

}
/// 设置定时录像与移动侦测录像
+ (NSString *)JADeviceSetting_devicesetting_set_video_type_switch {
    return kJADeviceSettings(@"devicesetting_set_video_type_switch");
}
/// 定时录像
+ (NSString *)JADeviceSetting_devicesetting_timed_recording {
    return kJADeviceSettings(@"devicesetting_timed_recording");
}

/// 报警与提示音设置
+ (NSString *)JADeviceSetting_devicesetting_alarm_and_prompt_set {
    return kJADeviceSettings(@"devicesetting_alarm_and_prompt_set");
}

/// 侦测到人形时，生成报警信息
+ (NSString *)JADeviceSetting_devicesetting_humanoid_set_prompt {
    return kJADeviceSettings(@"devicesetting_humanoid_set_prompt");
}

/// 侦测到人脸时，生成报警信息
+ (NSString *)JADeviceSetting_devicesetting_face_set_prompt {
    return kJADeviceSettings(@"devicesetting_face_set_prompt");
}

/// 设置单次报警白光灯闪烁时长
+ (NSString *)JADeviceSetting_devicesetting_set_flash_time {
    return kJADeviceSettings(@"devicesetting_set_flash_time");
}

/// 可设置侦测报警区域或警戒线
+ (NSString *)JADeviceSetting_devicesetting_can_set_area_or_cordon {
    return kJADeviceSettings(@"devicesetting_can_set_area_or_cordon");
}

/// 录像与侦测设置
+ (NSString *)JADeviceSetting_devicesetting_record_and_detection_set {
    return kJADeviceSettings(@"devicesetting_record_and_detection_set");
}

/// 人形设置
+ (NSString *)JADeviceSetting_devicesetting_humanoid_set {
    return kJADeviceSettings(@"devicesetting_humanoid_set");
}

/// 人脸设置
+ (NSString *)JADeviceSetting_devicesetting_face_set {
    return kJADeviceSettings(@"devicesetting_face_set");
}
/// 侦测到移动物体时触发报警
+ (NSString *)JADeviceSetting_devicesetting_alarm_prompt {
    return kJADeviceSettings(@"devicesetting_alarm_prompt");
}

///多套餐生效
+ (NSString *)JADevicesetting_4G_card_multi_use_package {
    return kJADeviceSettings(@"devicesetting_4G_card_multi_use_package");
}
@end
