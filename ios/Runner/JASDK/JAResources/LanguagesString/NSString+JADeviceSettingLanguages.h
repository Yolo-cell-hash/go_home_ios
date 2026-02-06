//
//  NSString+JADeviceSettingLanguages.h
//  eseecloud
//
//  Created by yang on 2018/4/25.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JASettingLanguagesManager.h"

#define DEVICESETTINGSTRING(KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:KEY tableName: @"JADeviceSettings"]

@interface NSString (JADeviceSettingLanguages)

/// 视频画面反转
+ (NSString *)JADeviceSetting_devicesetting_screen_inversion;
/// 选择反转类型
+ (NSString *)JADeviceSetting_devicesetting_selcet_type;
/// 左右反转
+ (NSString *)JADeviceSetting_devicesetting_reversal_left_right;
/// 上下反转
+ (NSString *)JADeviceSetting_devicesetting_reversal_up_down;

/// 模式
+ (NSString *)JADeviceSetting_mode;
/// 日光
+ (NSString *)JADeviceSetting_mode_sunlight;
/// 夜间
+ (NSString *)JADeviceSetting_mode_night;


/// 复制
+ (NSString *)JADeviceSetting_devicesetting_alarm_copy;
/// 选择需要重复当前时间段的日期
+ (NSString *)JADeviceSetting_devicesetting_alarm_Select_copy_date;
/// (1h表示0:00-1:00之间的时间段)
+ (NSString *)JADeviceSetting_devicesetting_alarm_time_translate;
/// 手动布防
+ (NSString *)JADeviceSetting_devicesetting_manual_arming;

/// 重启摄像机
+ (NSString *)JADeviceSetting_devicesetting_restart_camera;
/// 重启设备
+ (NSString *)JADeviceSetting_devicesetting_reboot_device;
/// 是否确定重启摄像机
+ (NSString *)JADeviceSetting_devicesetting_restart_camera_prompt;
/// 是否确定重启设备
+ (NSString *)JADeviceSetting_devicesetting_restart_device_prompt;
/// 更新完成
+ (NSString *)JADeviceSetting_devicelist_update_completed;
/// 正在更新固件中
+ (NSString *)JADeviceSetting_devicelist_update_firmware;

/// 插电常电模式
+ (NSString *)JADeviceSetting_devicesetting_power_mode;
/// 电池低功耗模式
+ (NSString *)JADeviceSetting_devicesetting_battery_low_power;
/// 插电常电模式下支持设备自动预录像功能
+ (NSString *)JADeviceSetting_devicesetting_operate_mode_prompt;


/// 更新
+ (NSString *)JADeviceSetting_devicesetting_Update;
/// 已更新
+ (NSString *)JADeviceSetting_devicesetting_gw_updated;
/// 待更新
+ (NSString *)JADeviceSetting_devicesetting_gw_pending_upgrade;

/// 待更新请选择需要固件更新的设备或通道
+ (NSString *)JADeviceSetting_cloud_gw_upgrade;

/// 录制提示音
+ (NSString *)JADeviceSetting_deviceSetting_custom_tone_record;

/// 报警提示音
+ (NSString *)JADeviceSetting_devicesetting_Alarm_tone;

/// 检测失败，请重试
+ (NSString *)JADeviceSetting_devicesetting_Device_signal_Test_results_failed;

/// 设备信号检测
+ (NSString *)JADeviceSetting_Device_signal_detection;
/// 开始检测
+ (NSString *)JADeviceSetting_Device_signal_Start_test;
/// 请点击按钮检测设备信号
+ (NSString *)JADeviceSetting_Device_signal_click;
/// 检测中...
+ (NSString *)JADeviceSetting_Device_signal_checking;
/// 正在检测中，请稍后...
+ (NSString *)JADeviceSetting_Device_signal_Being_tested;
/// 检测结果
+ (NSString *)JADeviceSetting_Device_signal_Test_results;
/// 信号等级：
+ (NSString *)JADeviceSetting_Device_signal_level;
/// 网络带宽:
+ (NSString *)JADeviceSetting_Device_signal_Network_bandwidth;
/// 建议：
+ (NSString *)JADeviceSetting_Device_signal_Suggest;
/// 更换信道或将设备靠近gateway
+ (NSString *)JADeviceSetting_Device_signal_Change;
/// 重新检测
+ (NSString *)JADeviceSetting_Device_signal_test_again;

/// 请输入密码
+ (NSString *)JADeviceSetting_enter_your_password;
/// 密码长度为6-20个字符，使用数字或字母并区分大小写
+ (NSString *)JADeviceSetting_register_password_tips;
/// 确定
+ (NSString *)JADeviceSetting_confirm;
/// 设置密码
+ (NSString *)JADeviceSetting_setting_password;
/// 不能含有空格
+ (NSString *)JADeviceSetting_contain_space;
/// 不能含有中文
+ (NSString *)JADeviceSetting_cannot_contain_chinese;
/// 请确认密码
+ (NSString *)JADeviceSetting_enter_password_confirm;
/// 密码格式有误，请重新输入
+ (NSString *)JADeviceSetting_password_format_wrong;
/// 重置密码
+ (NSString *)JADeviceSetting_reset_password;
/// 密码重置成功
+ (NSString *)JADeviceSetting_password_reset_success;
/// 我的设备
+ (NSString *)JADeviceSetting_my_device;
/// 当前网络不可用，请检查你的网络配置
+ (NSString *)JADeviceSetting_myDevice_networkAlert;
/// 网络不给力
+ (NSString *)JADeviceSetting_addDevice_network_failure;
/// 不再提示
+ (NSString *)JADeviceSetting_do_not_tip_always;
/// 取消
+ (NSString *)JADeviceSetting_cancel;

/// TF卡状态异常，是否进行修复
+ (NSString *)JADeviceSetting_devicesetting_tf_abnormal_prompt;
/// 设备设置
+ (NSString *)JADeviceSetting_device_setting;
/// 删除
+ (NSString *)JADeviceSetting_delete1;
/// 是否删除所选内容？
+ (NSString *)JADeviceSetting_confirm_to_delete_selected_files;
/// 否
+ (NSString *)JADeviceSetting_no;
/// 是
+ (NSString *)JADeviceSetting_yes;
/// 开启
+ (NSString *)JADeviceSetting_open1;
/// 密码
+ (NSString *)JADeviceSetting_password;
/// AP密码
+ (NSString *)JADeviceSetting_deviceSetting_AP_password;
/// WiFi设置
+ (NSString *)JADeviceSetting_deviceSetting_WIFI_settings;
/// 设置WiFi
+ (NSString *)JADeviceSetting_deviceSetting_Equipment_WIFI;
/// 更改设备连接WIFI
+ (NSString *)JADeviceSetting_deviceSetting_Change_WIFI;
/// 选择局域网wifi
+ (NSString *)JADeviceSetting_deviceSetting_Change_WIFI_select;
/// 设备wifi修改成功
+ (NSString *)JADeviceSetting_deviceSetting_Change_WIFI_modified_success;
/// 设备密码
+ (NSString *)JADeviceSetting_addDevice_setting_password;
/// 设备名字
+ (NSString *)JADeviceSetting_device_nick_name;
/// 完成
+ (NSString *)JADeviceSetting_completion;

/// 报警声音
+ (NSString *)JADeviceSetting_devicesetting_Device_Alarm_tone;

/// 工作模式
+ (NSString *)JADeviceSetting_devicesetting_operate_mode;

/// 获取设置信息失败
+ (NSString *)JADeviceSetting_devicesetting_get_infomation_fail;
/// 获取设置信息超时
+ (NSString *)JADeviceSetting_devicesetting_get_infomation_timeout;

/// 设备连接失败，连接超时
+ (NSString *)JADeviceSetting_addDevice_connectionFail_timeOut;
/// 设备连接失败，密码错误
+ (NSString *)JADeviceSetting_addDevice_connectionFail_passwordError;
/// 连接失败...
+ (NSString *)JADeviceSetting_play_error_tips_1;
/// 无可用网络
+ (NSString *)JADeviceSetting_addDevice_unavailable_netword;
/// 添加
+ (NSString *)JADeviceSetting_add;
/// 设备名
+ (NSString *)JADeviceSetting_addDevice_name;
/// 用户名
+ (NSString *)JADeviceSetting_addDevice_user_name;
/// 设备类型
+ (NSString *)JADeviceSetting_addDevice_setting_type;
/// 全景设备
+ (NSString *)JADeviceSetting_addDevice_choose_panorama;
/// NVR
+ (NSString *)JADeviceSetting_addDevice_choose_NVR;
/// 通道数
+ (NSString *)JADeviceSetting_addDevice_choose_channel;
/// 设置信道
+ (NSString *)JADeviceSetting_gwdeviceSetting_set_signal_path;
/// 选择信道
+ (NSString *)JADeviceSetting_gwdeviceSetting_choose_signal_path;
/// 信道
+ (NSString *)JADeviceSetting_gwdeviceSetting_signal_path;
/// 信道选择法规提示
+ (NSString *)JADeviceSetting_gwdeviceSetting__signal_path_tip;
/// 输入设备密码
+ (NSString *)JADeviceSetting_addDevice_enter_password;
/// 输入设备名
+ (NSString *)JADeviceSetting_addDevice_enter_name;
/// 设备名重复
+ (NSString *)JADeviceSetting_addDevice_name_repeat;
/// 录像
+ (NSString *)JADeviceSetting_record;
/// 显示模式
+ (NSString *)JADeviceSetting_play_display_mode;
/// 开灯
+ (NSString *)JADeviceSetting_play_lamp_open;
/// 关灯
+ (NSString *)JADeviceSetting_play_lamp_close;
/// 亮度
+ (NSString *)JADeviceSetting_play_lamp_brightness;
/// 色温
+ (NSString *)JADeviceSetting_play_lamp_colorThermometry;
/// 灯控
+ (NSString *)JADeviceSetting_play_lamp_control;
/// 开
+ (NSString *)JADeviceSetting_play_open;
/// 关
+ (NSString *)JADeviceSetting_play_close;
/// 自动
+ (NSString *)JADeviceSetting_auto1;
/// 智能
+ (NSString *)JADeviceSetting_smart;
/// 白光
+ (NSString *)JADeviceSetting_play_lamp_whiteLight;
/// 选择日期
+ (NSString *)JADeviceSetting_alarmMessage_selecteDate;
/// 通道1
+ (NSString *)JADeviceSetting_channel_one;
/// 通道2
+ (NSString *)JADeviceSetting_channel_two;
/// 通道3
+ (NSString *)JADeviceSetting_channel_three;
/// 通道4
+ (NSString *)JADeviceSetting_channel_four;
/// 通道5
+ (NSString *)JADeviceSetting_channel_five;
/// 选择通道
+ (NSString *)JADeviceSetting_channel_choose;
/// 设置
+ (NSString *)JADeviceSetting_setting;
/// 编辑
+ (NSString *)JADeviceSetting_edit;
/// 全选
+ (NSString *)JADeviceSetting_selectAll;
/// 取消全选
+ (NSString *)JADeviceSetting_selectAll_cancel;
/// 正在获取最新版本消息…
+ (NSString *)JADeviceSetting_me_version_getting;
/// 当前已是最新版本
+ (NSString *)JADeviceSetting_me_version_latest;
/// 版本更新成功
+ (NSString *)JADeviceSetting_me_version_updateSuccess;
/// 版本更新失败
+ (NSString *)JADeviceSetting_me_version_updateFail;
/// 检查到最新版本，是否更新？
+ (NSString *)JADeviceSetting_me_version_updateAsk;
/// 暂时不用
+ (NSString *)JADeviceSetting_me_temporary;
/// 消息推送
+ (NSString *)JADeviceSetting_alarmMessage_messagePush;
/// 人体红外
+ (NSString *)JADeviceSetting_alarmMessage_msgType_bi;
/// 移动侦测
+ (NSString *)JADeviceSetting_alarmMessage_msgType_md;
/// 加载更多消息
+ (NSString *)JADeviceSetting_getting_more_alert_message;
/// 其他
+ (NSString *)JADeviceSetting_other;
/// 修改密码
+ (NSString *)JADeviceSetting_userInfo_change_password;
/// 设备版本
+ (NSString *)JADeviceSetting_device_setting_version;
/// 个性化
+ (NSString *)JADeviceSetting_personalization;
/// 设备名称
+ (NSString *)JADeviceSetting_device_nick_designation;
/// 设备ID
+ (NSString *)JADeviceSetting_device_id;
/// 通用设置
+ (NSString *)JADeviceSetting_common_setting;
/// 提示音
+ (NSString *)JADeviceSetting_prompt_sounds;
/// 设置提示音
+ (NSString *)JADeviceSetting_tone_Settings;
/// 开启后设备会有音频提示
+ (NSString *)JADeviceSetting_prompt_sounds_content;
/// 提示音语言
+ (NSString *)JADeviceSetting_prompt_sounds_text;
/// 选择设备提示音语言
+ (NSString *)JADeviceSetting_select_the_language_content;
/// 中文
+ (NSString *)JADeviceSetting_Chinese;
/// 英文
+ (NSString *)JADeviceSetting_English;
/// 清晰度
+ (NSString *)JADeviceSetting_clarity;
/// 设置视频清晰度
+ (NSString *)JADeviceSetting_clarity_content;
/// 标清
+ (NSString *)JADeviceSetting_SD;
/// 高清
+ (NSString *)JADeviceSetting_HD;
/// 超清
+ (NSString *)JADeviceSetting_BD;
/// 设置视频色彩
+ (NSString *)JADeviceSetting_set_video_color;
/// 黑白
+ (NSString *)JADeviceSetting_black_and_white;
/// 全彩
+ (NSString *)JADeviceSetting_color_full;
/// 图像风格
+ (NSString *)JADeviceSetting_image_style;
/// 设置视频色彩风格
+ (NSString *)JADeviceSetting_set_video_color_style;
/// 标准
+ (NSString *)JADeviceSetting_standard;
/// 明亮
+ (NSString *)JADeviceSetting_bright;
/// 艳丽
+ (NSString *)JADeviceSetting_gorgeous;
/// 时间同步
+ (NSString *)JADeviceSetting_synchronous_time;
/// 同步设备与手机时间
+ (NSString *)JADeviceSetting_synchronous_device_phone;
/// 移动侦测报警
+ (NSString *)JADeviceSetting_motion_detection_alarm;
/// 开启报警推送
+ (NSString *)JADeviceSetting_motion_detection_alarm_content;
/// 移动侦测录像
+ (NSString *)JADeviceSetting_devSettings_motionDetection_record;
/// 开启移动录像
+ (NSString *)JADeviceSetting_open_motion_record;
/// 录像日程
+ (NSString *)JADeviceSetting_video_schedule;
/// 设置录像时间段
+ (NSString *)JADeviceSetting_video_schedule_setTimePeriod;
/// 设备信息
+ (NSString *)JADeviceSetting_device_information;
/// 设备类型
+ (NSString *)JADeviceSetting_device_type;
/// 固件更新
+ (NSString *)JADeviceSetting_devSettings_deviceUpdate;
/// 存储
+ (NSString *)JADeviceSetting_devSettings_storage;
/// 设备存储
+ (NSString *)JADeviceSetting_devSettings_deviceStorage;
/// 基础设置
+ (NSString *)JADeviceSetting_generalSetting;
/// 录像设置
+ (NSString *)JADeviceSetting_devicesetting_vedioSet;
/// 时间设置
+ (NSString *)JADeviceSetting_devicesetting_time_set;
/// 密码与网络设置
+ (NSString *)JADeviceSetting_devicesetting_password_network_setting ;
/// 时间同步失败
+ (NSString *)JADeviceSetting_synchronous_time_fail;
/// 时间同步成功
+ (NSString *)JADeviceSetting_synchronous_time_success;

/// 设备音量
+ (NSString *)JADeviceSetting_devicesetting_device_volume;
/// 支持设置设备接收与发出的音量大小
+ (NSString *)JADeviceSetting_devicesetting_device_volume_prompt;
/// 设备接收的音量
+ (NSString *)JADeviceSetting_devicesetting_device_receive_volume;
/// 设备发出的音量
+ (NSString *)JADeviceSetting_devicesetting_device_emitted_volume;

/// 移动侦测管理
+ (NSString *)JADeviceSetting_devicesetting_Motion_detection_management;
/// 高级设置
+ (NSString *)JADeviceSetting_devicesetting_advanced_settings;
/// 时间录像管理
+ (NSString *)JADeviceSetting_devicesetting_Time_recording_management;
/// 设置录像日程
+ (NSString *)JADeviceSetting_devicesetting_Set_recording_schedule;
/// 视频图像设置
+ (NSString *)JADeviceSetting_devicesetting_Video_image_settings;
/// 设置视频色彩、风格、清晰度
+ (NSString *)JADeviceSetting_devicesetting_set_csc;
/// 选择夏令时
+ (NSString *)JADeviceSetting_devicesetting_Choose_daylight_saving_time;

/// TF卡状态
+ (NSString *)JADeviceSetting_tfCard_status;
/// 未格式化
+ (NSString *)JADeviceSetting_tfCard_noFormat;
/// 无TF卡
+ (NSString *)JADeviceSetting_tfCard_nothing;
/// 正常
+ (NSString *)JADeviceSetting_tfCard_normal;
/// 异常
+ (NSString *)JADeviceSetting_tfCard_exception;
/// 总容量
+ (NSString *)JADeviceSetting_tfCard_total_capacity;
/// 可用容量
+ (NSString *)JADeviceSetting_tfCard_available_space;
/// 已格式化
+ (NSString *)JADeviceSetting_tfCard_already_for_mat;
/// 格式化失败
+ (NSString *)JADeviceSetting_tfCard_format_fail;
/// 格式化中
+ (NSString *)JADeviceSetting_formatting;
/// 格式化
+ (NSString *)JADeviceSetting_format;
/// 注意：格式化TF卡将会清空所有录像
+ (NSString *)JADeviceSetting_tfCard_format_alert;
/// 从
+ (NSString *)JADeviceSetting_devSettings_schedule_from;
/// 到
+ (NSString *)JADeviceSetting_devSettings_schedule_to;
/// 一
+ (NSString *)JADeviceSetting_Monday;
/// 二
+ (NSString *)JADeviceSetting_Tuesday;
/// 三
+ (NSString *)JADeviceSetting_Wednesday;
/// 四
+ (NSString *)JADeviceSetting_Thursday;
/// 五
+ (NSString *)JADeviceSetting_Friday;
/// 六
+ (NSString *)JADeviceSetting_Saturday;
/// 日
+ (NSString *)JADeviceSetting_Sunday;
/// 起始时间必须小于结束时间
+ (NSString *)JADeviceSetting_devSettings_schedule_error_timeComparing;
/// 已存在相同的日程
+ (NSString *)JADeviceSetting_devSettings_schedule_error_exist;
/// 门铃
+ (NSString *)JADeviceSetting_bell;
/// 门铃类型
+ (NSString *)JADeviceSetting_bell_type;
/// 响铃时间
+ (NSString *)JADeviceSetting_bell_timeRing;
/// 电子门铃
+ (NSString *)JADeviceSetting_bell_electronic;
/// 机械门铃
+ (NSString *)JADeviceSetting_bell_mechanical;
/// 电量
+ (NSString *)JADeviceSetting_electricity;
/// 信号
+ (NSString *)JADeviceSetting_signal1;
+ (NSString *)JADeviceSetting_highest;
/// 高
+ (NSString *)JADeviceSetting_high;
/// 中
+ (NSString *)JADeviceSetting_centre;
/// 低
+ (NSString *)JADeviceSetting_low;
+ (NSString *)JADeviceSetting_lowest;
/// 推送
+ (NSString *)JADeviceSetting_push;
/// 录像类型
+ (NSString *)JADeviceSetting_device_record;
/// 待更新
+ (NSString *)JADeviceSetting_to_be_updated;
/// 已更新
+ (NSString *)JADeviceSetting_updated;
/// 是否删除通道1设备？
+ (NSString *)JADeviceSetting_devSettings_delect_tips;
/// 帮助
+ (NSString *)JADeviceSetting_help;
/// 加载中…
+ (NSString *)JADeviceSetting_loading;
/// 密码设置
+ (NSString *)JADeviceSetting_setting_password_module;
/// 密码错误
+ (NSString *)JADeviceSetting_device_password_error;
/// 设备编辑
+ (NSString *)JADeviceSetting_device_editor;
/// 设备删除
+ (NSString *)JADeviceSetting_device_delete;
/// 版本
+ (NSString *)JADeviceSetting_version;
/// 通道
+ (NSString *)JADeviceSetting_channel;
/// KB
+ (NSString *)JADeviceSetting_traffic_statistics_KB;
/// MB
+ (NSString *)JADeviceSetting_traffic_statistics_MB;
/// 密码不能包含特殊字符
+ (NSString *)JADeviceSetting_password_cannot_special_characters;
/// 密码修改失败
+ (NSString *)JADeviceSetting_password_change_failure;
/// 选择时区
+ (NSString *)JADeviceSetting_setting_select_time;
/// 设置尚未保存，是否退出？
+ (NSString *)JADeviceSetting_setting_tips;
/// 密码长度不能大于20位
+ (NSString *)JADeviceSetting_password_tips_length;
/// 保存失败
+ (NSString *)JADeviceSetting_setting_save_failed;
/// 检查到有新的固件版本,是否需要更新?
+ (NSString *)JADeviceSetting_devSetting_deviceUpdate_tips_1;
/// 固件更新中会退出当前页面，请注意听设备提示音。
+ (NSString *)JADeviceSetting_devSetting_deviceUpdate_tips_2;
/// 当前为最新固件
+ (NSString *)JADeviceSetting_devSetting_latest_firmware;
/// 该设备名称已存在
+ (NSString *)JADeviceSetting_devSetting_name_existing;
/// 移动侦测灵敏度
+ (NSString *)JADeviceSetting_alarmMessage_msgType_sensitivity;
/// 是否删除通道设备
+ (NSString *)JADeviceSetting_devSetting_delete_channelDevcive;
/// 名称不为空
+ (NSString *)JADeviceSetting_setting_name_cannot_empty;
/// 固件版本
+ (NSString *)JADeviceSetting_devSetting_firmware_version;
/// 设备模式
+ (NSString *)JADeviceSetting_devSetting_equipment_model;
/// 删除通道成功
+ (NSString *)JADeviceSetting_devSetting_delete_channelDevice_success;
/// 格式化TF卡将会清空所有录像，是否继续
+ (NSString *)JADeviceSetting_tfCard_format_alert_tips;
/// 是否删除该设备？
+ (NSString *)JADeviceSetting_devSetting_delete_ask;
/// 设备删除失败
+ (NSString *)JADeviceSetting_devSetting_delete_failure;
/// 是否添加该设备？
+ (NSString *)JADeviceSetting_devSetting_add_ask;
/// 日光
+ (NSString *)JADeviceSetting_sunlight;
/// 夜间
+ (NSString *)JADeviceSetting_night;
/// 德语
+ (NSString *)JADeviceSetting_German;
/// 韩语
+ (NSString *)JADeviceSetting_Korean;
/// 葡萄牙语
+ (NSString *)JADeviceSetting_Portuguese;
/// 俄语
+ (NSString *)JADeviceSetting_Russian;
/// 西班牙语
+ (NSString *)JADeviceSetting_Spanish;
/// 法语
+ (NSString *)JADeviceSetting_French;
/// 波兰语
+ (NSString *)JADeviceSetting_Polish;
/// 捷克语
+ (NSString *)JADeviceSetting_Czech;
/// 意大利语
+ (NSString *)JADeviceSetting_Italian;
/// 日语
+ (NSString *)JADeviceSetting_Japanese;
/// 设备昵称长度不能大于15个字符
+ (NSString *)JADeviceSetting_devSetting_name_length_not_more_than_15;
/// 编辑设备成功
+ (NSString *)JADeviceSetting_devSetting_edit_success;
/// 设备未保存，确定要退出吗？
+ (NSString *)JADeviceSetting_addSetting_tips;
/// 云ID
+ (NSString *)JADeviceSetting_cloud_ID;
/// 编辑设备
+ (NSString *)JADeviceSetting_edit_device;
/// 修改失败
+ (NSString *)JADeviceSetting_modify_failure;
/// 中国
+ (NSString *)JADeviceSetting_China;
/// 找不到硬盘
+ (NSString *)JADeviceSetting_devSetting_hardDisk_cannotFind;
/// 硬盘错误
+ (NSString *)JADeviceSetting_devSetting_hardDisk_error;
/// TF卡异常
+ (NSString *)JADeviceSetting_tfCards_exception;
/// 硬盘空间不足
+ (NSString *)JADeviceSetting_devSetting_hardDisk_insufficient;
/// 录像错误
+ (NSString *)JADeviceSetting_devPlay_video_error;
/// 门磁
+ (NSString *)JADeviceSetting_magnetic_door;
/// 红外
+ (NSString *)JADeviceSetting_infrared;
/// 烟雾
+ (NSString *)JADeviceSetting_smoke;
/// 声控
+ (NSString *)JADeviceSetting_voice_control;
/// 遥控器
+ (NSString *)JADeviceSetting_remote_control;
/// 门铃录像
+ (NSString *)JADeviceSetting_bell_video;
/// 门铃对讲正在被占用
+ (NSString *)JADeviceSetting_bell_occupied;
/// 保存成功
+ (NSString *)JADeviceSetting_save_success;
/// 通道名称不能为空
+ (NSString *)JADeviceSetting_channel_name_be_empty;
/// 正在保存中...
+ (NSString *)JADeviceSetting_saving;
/// 删除失败
+ (NSString *)JADeviceSetting_devSetting_delete_toFail;
/// 测试版
+ (NSString *)JADeviceSetting_beta;
/// WIFI
+ (NSString *)JADeviceSetting_addDevice_WIFI;
/// 网络异常，请重试
+ (NSString *)JADeviceSetting_cloud_network_anomalies;
/// 轻触屏幕重新加载
+ (NSString *)JADeviceSetting_cloud_reload_page;
/// 请重新输入
+ (NSString *)JADeviceSetting_enter_again;
/// 选择录像
+ (NSString *)JADeviceSetting_select_video;
/// 选择时间段
+ (NSString *)JADeviceSetting_selection_time;
/// %1d秒
+ (NSString *)JADeviceSetting_plural_ios;
/// 注意：修改设备密码后，需要在编辑中同步修改访问密码；否则容易出现密码错误的情况。
+ (NSString *)JADeviceSetting_setting_modify_device_password;
/// 白天
+ (NSString *)JADeviceSetting_daytime;
/// 修改
+ (NSString *)JADeviceSetting_userInfo_change;
/// 设置设备时区时间
+ (NSString *)JADeviceSetting_setting_time_zone;
/// 搜索
+ (NSString *)JADeviceSetting_search;
/// 请选择录像日期
+ (NSString *)JADeviceSetting_setting_select_timeOfVideo;
/// 离线
+ (NSString *)JADeviceSetting_myDevice_offline;
/// 登录失败
+ (NSString *)JADeviceSetting_login_failed;
/// 图像采集率
+ (NSString *)JADeviceSetting_devSetting_acquisition;
/// 时间录像
+ (NSString *)JADeviceSetting_devSetting_timeVideo;

+ (NSString *)JADeviceSetting_choose_daylightTime;
+ (NSString *)JADeviceSetting_daylightTime_save;
+ (NSString *)JADeviceSetting_daylight_Germany;
+ (NSString *)JADeviceSetting_daylight_Netherlands;
+ (NSString *)JADeviceSetting_daylight_Poland;
+ (NSString *)JADeviceSetting_daylight_Iran;
+ (NSString *)JADeviceSetting_daylight_Israel;
+ (NSString *)JADeviceSetting_daylight_Brazil;
+ (NSString *)JADeviceSetting_detection_tips;
+ (NSString *)JADeviceSetting_devicesetting_doorbell_tone;
+ (NSString *)JADeviceSetting_daylight_openOrClose;
+ (NSString *)JADeviceSetting_daylight_country;
+ (NSString *)JADeviceSetting_daylight_Europe;
+ (NSString *)JADeviceSetting_frequency_switch;
+ (NSString *)JADeviceSetting_device_indicator_led;
+ (NSString *)JADeviceSetting_ConvenientInside;
+ (NSString *)JADeviceSetting_ConvenientOutside;
+ (NSString *)JADeviceSetting_Convenient;
+ (NSString *)JADevicesetting_device_model;

//隐私区域设置
+ (NSString *)JADeviceSetting_devicesetting_set_privacy_cover;

/// 日期格式
+ (NSString *)JADeviceSetting_deviceSetting_dateFormatter;
/// 年
+ (NSString *)JADeviceSetting_deviceSetting_videoBackup_startTimeYY;
/// 月
+ (NSString *)JADeviceSetting_deviceSetting_videoBackup_startTimeMM;
/// 日
+ (NSString *)JADeviceSetting_deviceSetting_videoBackup_startTimeDD;

/// 报警设置
+ (NSString *)JADeviceSetting_deviceSetting_Alarm_Settings;
+ (NSString *)JADeviceSetting_deviceSetting_Alarm_Settings_select_time_period;
+ (NSString *)JADeviceSetting_deviceSetting_Alarm_Settings_Select_time_length;
+ (NSString *)JADeviceSetting_devicesetting_alarm_set_video_delay;
+ (NSString *)JADeviceSetting_devicesetting_alarm_set_video_delay_duration;

/// 搜索不到设备
+ (NSString *)JADeviceSetting_unsearchable;
+ (NSString *)JADeviceSetting_pleaseConnectLANWithSameOfDevice;
+ (NSString *)JADeviceSetting_deviceSetting_deviceWIFI_version;

///4G卡状态
+ (NSString *)JADeviceSetting_devicesetting_4G_no_device_can_buy_data_plan;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_cannot_buy_data;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_testable;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_sim_card_testable;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_unknown;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_sim_card_unknown;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_Activability;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_can_be_activated;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_invalid;
+ (NSString *)JADeviceSetting_devicesetting_4G_device_sim_car_invalid;
+ (NSString *)JADeviceSetting_devicesetting_4G_no_signal;

//未购买
+ (NSString *)JADeviceSetting_cloud_no_purchase;
//云存储
+ (NSString *)JADeviceSetting_cloud_storage;
//存储管理
+ (NSString *)JADeviceSetting_service_map_storage_management;
//TF卡存储
+ (NSString *)JADeviceSetting_devicesetting_TF_card_storage;
//剩余可用容量
+ (NSString *)JADeviceSetting_devicesetting_remain_available_capacity;

//云台校准
+ (NSString *)JADeviceSetting_preview_ptz_adjustment;

//定时巡航
+ (NSString *)JADeviceSetting_devicesetting_timing_cruise;

//每次巡航4小时后将自动关闭
+ (NSString *)JADeviceSetting_devicesetting_turn_off_cruise_4;

//选择巡航模式
+ (NSString *)JADeviceSetting_devicesetting_select_cruise_mode;

//全景巡航
+ (NSString *)JADeviceSetting_devicesetting_Panoramic_cruise;

//摄像机进行水平360拍摄
+ (NSString *)JADeviceSetting_devicesetting_Camera_horizontal_360_shot;

//定点巡航
+ (NSString *)JADeviceSetting_devicesetting_fixed_point;

//根据您收藏的预置位定点巡航
+ (NSString *)JADeviceSetting_devicesetting_preset_position;

//定点巡航功能需存在预置位才能正常使用，若您的设备没有预置位，请及时前往预览-云台中设置。
+ (NSString *)JADeviceSetting_devicesetting_need_set_preset;

//正在校准...
+ (NSString *)JADeviceSetting_devicesetting_calibrate;

//摄像机校准成功
+ (NSString *)JADeviceSetting_devicesetting_camera_calibration;


/// 人形侦测对场景有一定的适应性要求，请根据实际情况使用
+ (NSString *)JADeviceSetting_devicesetting_humanoid_detection_prompt;

/// 人脸侦测对场景有一定的适应性要求，请根据实际情况使用
+ (NSString *)JADeviceSetting_devicesetting_face_detection_prompt;

/// 唤醒
+ (NSString *)JADeviceSetting_preview_wake_up_camera;

/// 使用场景
+ (NSString *)JADeviceSetting_devicesetting_usage_scenarios;

/// 室内
+ (NSString *)JADeviceSetting_devicesetting_indoor;

/// 室外
+ (NSString *)JADeviceSetting_devicesetting_outdoor;

/// 设置定时录像与移动侦测录像
+ (NSString *)JADeviceSetting_devicesetting_set_video_type_switch;

/// 定时录像
+ (NSString *)JADeviceSetting_devicesetting_timed_recording;

/// 报警与提示音设置
+ (NSString *)JADeviceSetting_devicesetting_alarm_and_prompt_set;

/// 侦测到人形时，生成报警信息
+ (NSString *)JADeviceSetting_devicesetting_humanoid_set_prompt;

/// 侦测到人脸时，生成报警信息
+ (NSString *)JADeviceSetting_devicesetting_face_set_prompt;

/// 设置单次报警白光灯闪烁时长
+ (NSString *)JADeviceSetting_devicesetting_set_flash_time;

/// 可设置侦测报警区域或警戒线
+ (NSString *)JADeviceSetting_devicesetting_can_set_area_or_cordon;

/// 录像与侦测设置
+ (NSString *)JADeviceSetting_devicesetting_record_and_detection_set;

/// 人形设置
+ (NSString *)JADeviceSetting_devicesetting_humanoid_set;

/// 人脸设置
+ (NSString *)JADeviceSetting_devicesetting_face_set;
/// 侦测到移动物体时触发报警
+ (NSString *)JADeviceSetting_devicesetting_alarm_prompt;
///多套餐生效
+ (NSString *)JADevicesetting_4G_card_multi_use_package;


@end
