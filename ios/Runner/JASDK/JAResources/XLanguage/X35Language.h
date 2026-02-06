//
//  X35Language.h
//  LanguageMatching
//
//  Created by developer on 2021/7/17.
//  Copyright © 2021 lixianliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JALanguageManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface X35Language : NSObject

/*! 窗口 */
/*! Window */
 +(NSString *)preview_window;

/*! 未购买 */
/*! No purchased */
 +(NSString *)cloud_no_purchase;

/*! 开启云存录像 */
/*! Start cloud storage recording */
 +(NSString *)cloud_video_open;

/*! 正在录像，请停止录像再退出 */
/*! Recording,please stop recording and exit */
 +(NSString *)preview_video_stop;

/*! 离线时间： */
/*! Offline time: */
 +(NSString *)devicelist_Offline_help_time;

/*! 已更新 */
/*! Updated */
 +(NSString *)devicesetting_gw_updated;

/*! 中断下载会导致下载视频不全。 */
/*! Interrupting the download will result in incomplete downloads. */
 +(NSString *)palyback_interrupt_download;

/*! 为什么连接失败？ */
/*! Why the connection failed */
 +(NSString *)adddevice_connect_fail_reason;

/*! 通过设置唤醒间隔和录制时长减少耗电量 */
/*! Reduce power consumption by setting wake-up interval and recording duration */
 +(NSString *)deviceSetting_Optimal_power_saving_settings_describe;

/*! 设置开始时间 */
/*! Set start time */
 +(NSString *)devicesetting_Videobackup_Set_starttime;

/*! 您可以按住话筒开始对讲 */
/*! You can press and hold the microphone to start the intercom */
 +(NSString *)preview_speak_prompt;

/*! 设置信道 */
/*! Set Wi-Fi channel */
 +(NSString *)gwdeviceSetting_set_signal_path;

/*! 通道%1$s正在录像中，请关闭后再退出 */
/*! Channel %1$s is recording, please close and then exit */
 +(NSString *)preview_channel_recording_peompt;

/*! 云台转速 */
/*! PTZ speed */
 +(NSString *)deviceSetting_PTZ_speed;

/*! 请打开设置->易视云->打开相机开关 */
/*! Please check setup--EseeCloud--enbale camera */
 +(NSString *)setting_phone_open_camera;

/*! 请输入账号 */
/*! Please enter account */
 +(NSString *)devicelist_share_enter_account;

/*! 暂不 */
/*! Not yet */
 +(NSString *)not_yet;

/*! 设备已被绑定 */
/*! The device has been bound */
 +(NSString *)adddevice_be_bound;

/*! 设备信号检测中... */
/*! Device signal detection... */
 +(NSString *)deviceSetting_Device_signal_detection;

/*! 工作日 */
/*! Working day */
 +(NSString *)deviceSetting_Working_day;

/*! 确认支付 */
/*! Confirm payment */
 +(NSString *)payment_determine;

/*! WiFi */
/*! WiFi */
 +(NSString *)addDevice_WIFI;

/*! 3、警戒线数量限制 */
/*! 3、the number of cordon restrictions */
 +(NSString *)devicesetting_warn_line_number;

/*! 设备侦测到移动物体时，触发唤醒录像（可自定义录像时长：10S、20S、30S）完成后，设备进入休眠状态。 */
/*! When the device detects a moving object, it triggers the wake-up recording (customizable recording duration: 10S, 20S, 30S),and the device enters the sleep state */
 +(NSString *)devicesetting_working_mode_Description_3;

/*! 提交问题反馈 */
/*! Submit problem feedback */
 +(NSString *)Stand_alone_station_Submit_problem_feedback;

/*! *视各地运营商情况，预计一小时内生效。 */
/*! *According to the situation of local operators, it is expected to take effect within one hour. */
 +(NSString *)devicesetting_4G_card_management_recharge_time;

/*! 请输入或扫描您的兑换码 */
/*! Please enter or scan your redemption code */
 +(NSString *)cloud_enter_scan_code;

/*! 微信 */
/*! Wechat */
 +(NSString *)wechat;

/*! 带无线上网的NVR设备连上WiFi后，点击“手动添加”前往使用ID添加设备 */
/*! After connecting the NVR device with wireless Internet access to WiFi, click \"Add manually\" to add the device by ID. */
 +(NSString *)adddevice_wireless_nvr_device;

/*! 设备名称不能为空 */
/*! Device name cannot be empty */
 +(NSString *)devicelist_name_cannot_be_empty;

/*! 门铃呼叫 */
/*! Doorbell call */
 +(NSString *)bell_call;

/*! 请输入城市名称 */
/*! Please enter the city name */
 +(NSString *)service_map_enter_city_name;

/*! 是否清除当前所有移动侦测区域？ */
/*! Whether to clear all the current motion detection area? */
 +(NSString *)devicesetting_clear_all_detection_area;

/*! 拍照 */
/*! Take a picture */
 +(NSString *)person_feedback_take_picture;

/*! 演示中心 */
/*! Demo center */
 +(NSString *)me_Demo_center;

/*! 高级设置 */
/*! Advanced settings */
 +(NSString *)devicesetting_advanced_settings;

/*! 唤醒 */
/*! Wake up */
 +(NSString *)preview_wake_up_camera;

/*! 第四步：返回APP进行下一步操作 */
/*! Step 4: Return to the APP for the next step */
 +(NSString *)adddevice_return_APP;

/*! 请选择设备 */
/*! Please select a device */
 +(NSString *)adddevice_select_device;

/*! WiFi名称 */
/*! WiFi name */
 +(NSString *)addDevice_WiFi_name;

/*! 暂停后不再上传录像，但云存服务时间仍然减少，是否继续？ */
/*! After pause no longer upload video, but cloud storage service time is still reduced, continue ? */
 +(NSString *)cloud_tips_text_2;

/*! 很有可能是您给摄像机联网的WiF账号 、密码错误， 导致摄像机无法联网。特别要注意是否有空格的输入，且要尽量避免复杂生僻的符号。 */
/*! It is likely that the Wi-Fi account and password you connected to the camera are incorrect, resulting in the camera not being able to connect to the network. In particular, pay attention to whether there is a space input, and try to avoid complex and uncommon symbols. */
 +(NSString *)person_feedback_question_check_info_detail;

/*! 显示 */
/*! Display */
 +(NSString *)preview_display;

/*! 了解更多 */
/*! Learn more */
 +(NSString *)cloud_learn_more;

/*! 获取报警信息失败 */
/*! Failed to get alarm message */
 +(NSString *)failed_to_get_alarm_message;

/*! 抱歉，一次只能迁移同一个离线设备下的云服务套餐。 */
/*! Sorry, you can only migrate cloud service packages on the same offline device at one time */
 +(NSString *)cloud_migarate_one_at_a_time;

/*! 电池摄像机内置PIR红外传感器，只有感应到带有热源的移动物体（人体、动物、车辆等）会启动录像，PIR传感器有效区为画面红色区域，请根据感应需要设置摄像机角度。 */
/*! The battery camera has a built-in PIR sensor. Only moving objects with heat sources (human, animals, vehicles etc.) will trigger recording and alerts. The red area is the PIR sensing area. Please adjust your camera\'s angle accordingly to sense the areas you want to. */
 +(NSString *)deviceSetting_PIR_infrared_sensor_describe;

/*! 请输入邮箱地址 */
/*! Please input the email address */
 +(NSString *)person_input_email_address;

/*! 设备SIM卡已无流量，无法解锁成功，请立即为SIM卡充值流量。 */
/*! The SIM card of the device has no data and cannot be unlocked successfully. Please recharge the SIM card immediately. */
 +(NSString *)devicesetting_4G_card_sim_card_no_flow_unlock;

/*! 下载列表(%@) */
/*! Download list(%@) */
 +(NSString *)preview_download_progress_number_ios;

/*! 请进到手机设置->易视云->打开麦克风 */
/*! Please check setup--EseeCloud--enable microphone */
 +(NSString *)setting_phone_turnOnMicrophone;

/*! 安防经验年限未选择 */
/*! Security experience years not selected */
 +(NSString *)service_not_select_Security_experience;

/*! 完整录像 */
/*! Full video */
 +(NSString *)person_full_video;

/*! 区域坐标： */
/*! Area coordinates： */
 +(NSString *)devicesetting_area_coordinates;

/*! 已经全部加载完毕 */
/*! No more data */
 +(NSString *)MJRefreshAutoFooterNoMoreDataText;

/*! 清除 */
/*! Clear */
 +(NSString *)devicesetting_clear;

/*! 开启后可通过Alexa Echo Show 监看视频 */
/*! Once turned on, you can watch videos via Alexa Echo Show */
 +(NSString *)devicesetting_turn_on_aleax;

/*! 柏林 */
/*! Berlin */
 +(NSString *)Europe_Berlin;

/*! 将于%1$s到期 */
/*! Will expire at %1$s */
 +(NSString *)cloud_will_expire;

/*! SIM卡已失效 */
/*! SIM card is invalid */
 +(NSString *)devicesetting_4G_device_sim_car_invalid;

/*! 流量 */
/*! Flow */
 +(NSString *)devicesetting_4G_card_sim_card_flow;

/*! Q4：录像回放的内容为什么是断断续续的? */
/*! Q4: Why is the content of the video playing intermittently? */
 +(NSString *)person_feedback_question_playback;

/*! 报警消息总数（%1$s） */
/*! Total number of alarm messages (%1$s) */
 +(NSString *)playback_alarm_message_total;

/*! 端口号 */
/*! Port */
 +(NSString *)addDevice_port_number;

/*! 门店名称 */
/*! Store name */
 +(NSString *)Service_map_Store_name;

/*! 再次输入新密码 */
/*! New password again */
 +(NSString *)deviceSetting_Enter_new_password_again;

/*! 灯控：设置带灯控设备开关、亮度、色温等 */
/*! Light control:setup on/off,brightness,color temperature for light control device */
 +(NSString *)help_preview_ttextTips_2;

/*! 重新获取 */
/*! Get again */
 +(NSString *)regain;

/*! 高清 */
/*! High Definition */
 +(NSString *)devicesetting_hd;

/*! 门店名称未填写 */
/*! The store name isn\’t filled in */
 +(NSString *)service_not_store_name;

/*! 容量： */
/*! Capacity: */
 +(NSString *)deviceSetting_capacity;

/*! line推送绑定 */
/*! line push binding */
 +(NSString *)alarm_bind_line_push;

/*! 5.异常动态发生前，因人为使用不当损坏摄像机， 导致机器无法正常工作； */
/*! 5. Before the abnormal dynamic occurs, the camera is damaged because of improper use, resulting in the machine not working properly; */
 +(NSString *)person_feedback_question_video_incomplete_5;

/*! App需要打开GPS */
/*! App need to turn on GPS */
 +(NSString *)access_GPS;

/*! 解锁方法： */
/*! How to unlock: */
 +(NSString *)devicesetting_4G_card_sim_card_how_to_unlock;

/*! 欧洲 */
/*! Europe */
 +(NSString *)devSetting_Europe;

/*! 晚上20:00 - 次日早上08:00 */
/*! 20:00 p.m.-08:00 the next morning */
 +(NSString *)deviceSetting_Push_night_time;

/*! 订单已支付 */
/*! Order paid */
 +(NSString *)cloud_Order_paid;

/*! 2、听到“启动配置模式”提示音，点击“重置成功”按钮 */
/*! 2、Hear prompt voice \"start configuration mode\",click \"reset successfully\" button */
 +(NSString *)addDevice_help_text10;

/*! 加载更多消息 */
/*! Load more info. */
 +(NSString *)getting_more_alert_message;

/*! Q9：从摄像机内取出存储卡非常烫， 会损坏存储卡吗？ */
/*! Q9: The temperature of the memory card removed from the camera is very high. Will it damage the memory card? */
 +(NSString *)person_feedback_question_card_hot;

/*! 历史搜索 */
/*! History search */
 +(NSString *)Stand_alone_station_History_search;

/*! 审核记录 */
/*! Auditing record */
 +(NSString *)Service_map_Auditing_record;

/*! 尚未安装高德地图 */
/*! Gaode map has not been installed */
 +(NSString *)service_map_gaode_not_install;

/*! 实时监测 */
/*! Real-time monitoring */
 +(NSString *)cloud_Real_time_monitoring;

/*! 自定义时间段 */
/*! Customize */
 +(NSString *)devicesetting_Custom_time_period;

/*! 连接设备 */
/*! Connecting device */
 +(NSString *)adddevice_connect_device;

/*! 2.通道打开视频失败 */
/*! 2. Channel failed to open video */
 +(NSString *)preview_no_video_channel_open_fail;

/*! 未知 */
/*! Unknown */
 +(NSString *)devicesetting_4G_device_unknown;

/*! 人形触发 */
/*! Humanoid trigger */
 +(NSString *)devicesetting_outdoor;

/*! 剩余可用容量 */
/*! Remaining available capacity */
 +(NSString *)devicesetting_remain_available_capacity;

/*! 最佳省电 */
/*! Optimal Battery Life */
 +(NSString *)devicesetting_Longest_battery_life;

/*! 一个分组至少要有一个摄像头 */
/*! A group must have at least one camera */
 +(NSString *)device_group_least_one_camera;

/*! Alexa服务授权 */
/*! Alexa service authorization */
 +(NSString *)devicesetting_Alexa_service_authorization;

/*! 请打开APP(保持在前台），看能否收到报警推送。 如果打开摄像机APP时能收到则证明不是硬件问题， 一般是安卓手机软件权限问题。具体排查方式如下
 */
/*! Please open the APP (keep it in the foreground) to see if you can receive the alarm push. If you can receive it when you open the camera APP, it proves that it is not a hardware problem, but generally it is an Android mobile phone software permission problem. The specific troubleshooting methods are as follows
 */
 +(NSString *)person_feedback_question_alarm_push_detail;

/*! 暂不支持使用第三方4G卡 */
/*! Not support the third-party 4G cards */
 +(NSString *)devicelist_not_support_third_party_4G_cards;

/*! 全部 */
/*! All */
 +(NSString *)devicesetting_4G_card_all;

/*! 成功加入 */
/*! Successfully joined */
 +(NSString *)cloud_package_promotion_join_success;

/*! 模式选择 */
/*! Mode selection */
 +(NSString *)deviceSetting_mode_select;

/*! 报警设置 */
/*! Alarm Settings */
 +(NSString *)deviceSetting_Alarm_Settings;

/*! 反馈标题 */
/*! Feedback title */
 +(NSString *)appealDetailsTitle;

/*! 建议： */
/*! Suggest: */
 +(NSString *)devicesetting_Device_signal_Suggest;

/*! 人形 */
/*! Humanoid */
 +(NSString *)AlarmMessage_humanoid;

/*! 按住说话 */
/*! Press to talk */
 +(NSString *)preview_hold_intercom;

/*! 第一步：请确保设备未连接网线 */
/*! Step 1: Please make sure the device is not connected to the network cable */
 +(NSString *)adddevice_make_sure_connect_network;

/*! 月 */
/*! month */
 +(NSString *)deviceSetting_videoBackup_startTimeMM;

/*! 添加分享 */
/*! Add share */
 +(NSString *)share_add;

/*! 在这里添加新设备 */
/*! Here to add new device */
 +(NSString *)devicelist_add_guide;

/*! %ld个月 */
/*! %ld Month */
 +(NSString *)months_plural_ios;

/*! %@年安防经验 */
/*! %@ years security experience */
 +(NSString *)service_map_security_experience_number_IOS;

/*! ① 进入手机设置，选择“ */
/*! ① Enter the phone settings and select \" */
 +(NSString *)addevice_input_phone_set;

/*! 人脸标记 */
/*! Human face marker */
 +(NSString *)devicesetting_face_frame;

/*! 电量低 */
/*! Low battery */
 +(NSString *)AlarmMessage_low_battery;

/*! 声音 */
/*! Sound */
 +(NSString *)preview_sound;

/*! 1.将设备通电，查看指示灯是否闪烁； */
/*! 1. Power on the device and check if the indicator light flashes; */
 +(NSString *)adddevice_power_device_indicator_flashes;

/*! 双指缩放圆形及移动圆心调整显示范围和区域 */
/*! Two-finger zoom circle and move the center of the circle to adjust the display range and area */
 +(NSString *)devicesetting_Video_area_Tips;

/*! 未搜索到摄像机 */
/*! Camera not found */
 +(NSString *)Addevice_Camera_not_found;

/*! 重新连接 */
/*! Reconnect */
 +(NSString *)preview_Reconnect;

/*! 红外常开 */
/*! Infrared always on */
 +(NSString *)preview_infrared_always_on;

/*! 抱歉，设备“%@”只能逐个删除 */
/*! Sorry, devices \"%@\" can only be deleted one by one */
 +(NSString *)person_share_device_delete_ios;

/*! 前往推送消息设置 */
/*! Go to push message settings */
 +(NSString *)Devicesetting_Go_to_push_message_settings;

/*! 请输入订单号 */
/*! Please enter the order number */
 +(NSString *)help_Order_enter_number;

/*! 隐私区 */
/*! Privacy area */
 +(NSString *)deviceSetting_Privacy_area_1;

/*! app库存不足 */
/*! Insufficient app inventory */
 +(NSString *)cloud_insufficient;

/*! 局域网添加 */
/*! Add by LAN */
 +(NSString *)addDevice_LAN;

/*! 选择反馈类型 */
/*! Select feedback type */
 +(NSString *)cloud_select_feedback_type;

/*! TF卡状态异常，是否进行修复 */
/*! TF card status is abnormal,whether to repair */
 +(NSString *)devicesetting_tf_abnormal_prompt;

/*! 设备类型 */
/*! Device\'s type */
 +(NSString *)device_type;

/*! 画面设置 */
/*! Image setting */
 +(NSString *)deviceSetting_Picture_settings;

/*! 检测到基站已设置密码，请输入正确的密码后再添加 */
/*! It is detected that the base station has set a password. Please enter the correct password before adding */
 +(NSString *)Addevice_check_basestation_have_password;

/*! 周日 */
/*! Sunday */
 +(NSString *)person_alarm_selct_time_sun;

/*! ① 请将设备与网线断开后进行后续操作 */
/*! ① Please disconnect the device from the network cable and follow up. */
 +(NSString *)adddevice_make_sure_connect_network_detail;

/*! 速度等级 */
/*! Speed grade */
 +(NSString *)preview_ptz_speed_grade;

/*! 添加分组 */
/*! Add group */
 +(NSString *)device_add_group;

/*! 蓝牙权限 */
/*! Bluetooth permissions */
 +(NSString *)person_Bluetooth_permissions;

/*! 灯控 */
/*! Light control */
 +(NSString *)play_lamp_control;

/*! 已取消 */
/*! Cancelled */
 +(NSString *)cloud_cancelled_order;

/*! 安装模式 */
/*! Installation mode */
 +(NSString *)devicesetting_Installation_mode;

/*! 该邮箱已被注册 */
/*! Already registered email address */
 +(NSString *)register_emailExist;

/*! %1$d天 */
/*! %1$d Day */
 +(NSString *)day_plural;

/*! 个人资料 */
/*! Profile */
 +(NSString *)userInfo;

/*! 当前手机连接的网络为5G WiFi，此设备不支持5G网络，请切换为2.4G WiFi。 */
/*! The current mobile phone is connected to 5G WiFi. This device does not support 5G networks. Please switch to 2.4G WiFi. */
 +(NSString *)addDevice_WiFi_not_use;

/*! 已切换成在家模式 */
/*! Switched to at home mode */
 +(NSString *)devicelist_switch_inhome_success;

/*! 区域模式：侦测区内有物体移动，则触发智能侦测警报 */
/*! Area mode: If an object moves in the detection area, a motion detection alarm will be triggered */
 +(NSString *)deviceSetting_Regional_mode_describe;

/*! 请点击按钮检测设备信号 */
/*! Tap button to detect the device \'s singal */
 +(NSString *)devicesetting_Device_signal_click;

/*! 选择时区 */
/*! Choose time zone */
 +(NSString *)setting_select_time;

/*! 是否删除所选内容？ */
/*! Confirm to delete selected content */
 +(NSString *)confirm_to_delete_selected_files;

/*! 请检查您所连接的无线局域网热点是否已接入互联网，或该热点是否已允许您的设备访问互联网。 */
/*! Please check whether the wireless LAN hotspot you are connected have access to the Internet, or if the hotspot allow your device to access the Internet. */
 +(NSString *)preview_no_video_wireless_LAN_detail;

/*! 网络设置 */
/*! Network settings */
 +(NSString *)devicesetting_network_set;

/*! 存储卡异常 */
/*! Memory card exception */
 +(NSString *)Devicesetting_Memory_card_exception;

/*! 1.设备连接电源，启动完成。 */
/*! 1. The device is connected to the power and startup . */
 +(NSString *)help_addDevice_textTips_2;

/*! 套餐已过期 */
/*! Package expired */
 +(NSString *)devicesetting_4G_card_package_expired;

/*! 电量充足时，设备会一直录像；电量低时，切换到最佳录像模式 */
/*! When the power is sufficient, the device will keep recording; when the power is insufficient, switch to the best recording mode */
 +(NSString *)devicesetting_Adaptive_mode_Description_simple;

/*! 已暂停云存自动上传录像 */
/*! Already stop cloud storage automactically upload recording */
 +(NSString *)cloud_suspended_auto_upload_video;

/*! 侦测时间段 */
/*! Detection period */
 +(NSString *)devicesetting_Detection_period;

/*! TF卡录像下载 */
/*! TF card video download */
 +(NSString *)playback_tf_card_download;

/*! 2.NVR指示灯常亮 */
/*! 2.Indicator light of NVR is long on */
 +(NSString *)addDevice_help_text7;

/*! 0h表示0:00-1:00之间的时间段 */
/*! 0h means the time period between 0:00-1:00 */
 +(NSString *)devicesetting_alarm_time_translate;

/*! 第二步：请为设备连接上网络 */
/*! Step 2: Please connect the device to the network */
 +(NSString *)adddevice_suit_connect_the_device_to_network;

/*! 云录像下载 */
/*! Cloud video download */
 +(NSString *)playback_cloud_video_download;

/*! 用户 */
/*! User */
 +(NSString *)devicelist_share_user;

/*! 以色列 */
/*! Israel */
 +(NSString *)devSetting_Israel;

/*! 未发现可连接设备 */
/*! No device found */
 +(NSString *)addDevice_undiscovered;

/*! 麦克风权限 */
/*! Microphone permission */
 +(NSString *)person_microphone_permssions;

/*! 人形触发-人体红外感应触发后在图像中检测到人形、人脸。 */
/*! Humanoid trigger-the human face is detected in the image after the human body infrared sensor is triggered. */
 +(NSString *)devicesetting_working_mode_Description_4;

/*! 最多可添加%1$d条警戒线，超过%1$d条后，删除已存在的方可添加新的警戒线 */
/*! Up to %1$d cordon lines can be added. After more than %1$d, delete existing ones to add a new cordon. */
 +(NSString *)devicesetting_warn_line_number_detail;

/*! 夜晚光线不足时，自动开启红外夜视功能。 */
/*! When dimly lit at night, the infrared night vision is automatically turned on. */
 +(NSString *)deviceSetting_automatic_night_vision_describe;

/*! 等待下载... */
/*! Waiting for download ... */
 +(NSString *)preview_wait_download;

/*! 容量：4G、8G、16G、32G等 */
/*! Capacity: 4G, 8G, 16G, 32G, etc. */
 +(NSString *)person_feedback_question_type_memory_card_detail_Capacity;

/*! 第三步：请确保设备与手机连接同一个路由器，这样才能保证在一个局域网 */
/*! Step 3: Please ensure that the device is connected to the same router as the mobile phone, so as to ensure that it is in a local area network. */
 +(NSString *)adddevice_suit_step_3;

/*! 账号注销是不可恢复的操作，且一旦注销会给您的售后维权及信息查询带来诸多不便，请谨慎操作。 */
/*! Deleting an account is an unrecoverable operation, and once it is deleted, it will cause a lot of inconvenience to your after-sales rights protection and information inquiry, please operate with caution. */
 +(NSString *)person_Account_cannot_restored_1;

/*! 无线摄像机 */
/*! WiFi camera */
 +(NSString *)addDevice_choose_device_1;

/*! 快捷模式：快捷模式下，用户可直接输入常看位置数值对常看位置就行操作，方便快捷； */
/*! Shortcut mode: In the shortcut mode, the user can directly input the preset position value to operate the preset position, which is convenient and quick; */
 +(NSString *)preview_preset_help_7;

/*! 测试版 */
/*! Beta version */
 +(NSString *)beta;

/*! 密码 */
/*! Password */
 +(NSString *)password;

/*! 密码不能包含“&amp;”特殊字符 */
/*! Password cannot contain \"&amp;\"  and other special characters */
 +(NSString *)login_password_without_special_charcters;

/*! 若您仍要注销,请您确保已经备份相关数据，并已充分阅读,理解并同意以下事项: */
/*! If you still want to delete, please make sure that you have backed up the relevant data, and have fully read, understood and agreed to the following: */
 +(NSString *)person_Account_cannot_restored_2;

/*! 注销账户将会删除和此账号关联的所有内容 */
/*! Deleting the account will delete all the content associated with this account */
 +(NSString *)person_Account_cannot_restored_3;

/*! 1.当前账号被收回，您将无法使用绑定的手机号以及第三方账户继续登录此账号 */
/*! 1. The current account is taken back, you will not be able to use the bound mobile phone number and third-party account to continue to log in to this account */
 +(NSString *)person_Account_cannot_restored_4;

/*! 易视云 */
/*! EseeCloud */
 +(NSString *)CFBundleDisplayName;

/*! 2.您个人资料、历史信息，包括下载、报警消息、购买记录都将被清空，且无法恢复 */
/*! 2. Your personal data, historical information, including downloads, alarm messages, and purchase records will be cleared and cannot be restored */
 +(NSString *)person_Account_cannot_restored_5;

/*! 3.若您存在未使用完毕的云存储服务，则视为主动放弃该增值服务，不予退款 */
/*! 3. If you have unused cloud storage services, you will be deemed to have voluntarily given up the value-added services and no refund will be given */
 +(NSString *)person_Account_cannot_restored_6;

/*! 套餐： */
/*! Package: */
 +(NSString *)cloud_package_order;

/*! 院子 */
/*! Courtyard */
 +(NSString *)addDevice_Courtyard;

/*! 是否开启设备云录像功能？ */
/*! Is the device cloud recording function enabled? */
 +(NSString *)cloud_tips_text_10;

/*! 2.设备扫码成功后会发出提示音或指示灯停止闪烁。 */
/*! After the device has successfully scanned the code, it will sound a prompt voice or the indicator light will stop flashing. */
 +(NSString *)addDevice_scan_success_sound;

/*! 手机空间已达到上限，请清理手机空间。 */
/*! The phone space has reached the limit. Please clear the phone space. */
 +(NSString *)preview_phone_space_limit;

/*! 未找到设备？ */
/*! Didn\'t find the device? */
 +(NSString *)adddevice_unable_find_device;

/*! 开启云录像后，会将摄像机录像自动上传至云空间保存 */
/*! After the cloud recording is enabled, the camera recording will be automatically uploaded to the cloud space for saving. */
 +(NSString *)Cloud_storage_service_video_switch_prompt;

/*! 添加说明 */
/*! Add description */
 +(NSString *)adddevice_suit_description;

/*! 设备提示音 */
/*! Device\'s prompt */
 +(NSString *)devicesetting_device_alert_tone;

/*! 分享权限 */
/*! Share Permissions */
 +(NSString *)devicelist_share_equipment_rights;

/*! 云录像问题 */
/*! Cloud recording problem */
 +(NSString *)person_feedback_cloud_video_problem;

/*! 显示模式：在倒挂的安装模式下有鱼眼模式、圆筒模式、走廊模式、四分屏模式 */
/*! Display mode：at ceiling installation mode,there have  fisheye mode,cylinder mode,corridor mode and full screen mode */
 +(NSString *)help_preview_ttextTips_10;

/*! 对讲中 */
/*! Intercoming */
 +(NSString *)preview_doorbell_intercoming;

/*! 反馈信息 */
/*! Feedback */
 +(NSString *)feedback_info;

/*! 该用户已注册 */
/*! This user name is already registered */
 +(NSString *)login_user_registered;

/*! 请输入邮箱，进行账号绑定，绑定后可通过邮箱重置密码 */
/*! Please input email address to bind the account, after that users can change password by email */
 +(NSString *)userInfo_tips_text_1;

/*! 设备一直持续录像，当电量降至%1$s以下时自动切换为最佳录像，当电量提升至%2$s以上时恢复一直录像 */
/*! Record videos continuously. When battery level below %1$s, automatically switches to event record mode. When battery level above %2$s, resumes to continuous record mode */
 +(NSString *)devicesetting_Adaptive_mode_Description_new_firmware;

/*! 听到配置失败提示音？ */
/*! Hear the configuration failure tone? */
 +(NSString *)addDevice_settingFail_prompt;

/*! 时间 */
/*! Time */
 +(NSString *)appealDetailsTime;

/*! 重置设备 */
/*! Reset device */
 +(NSString *)adddevice_initial_device;

/*! 电子门铃 */
/*! Electronic doorbell */
 +(NSString *)bell_electronic;

/*! 硬解码 */
/*! Hard decoding */
 +(NSString *)userSettings_hard_decoded;

/*! MB */
/*! MB */
 +(NSString *)traffic_statistics_MB;

/*! 照片 */
/*! Photo */
 +(NSString *)person_photo;

/*! 选择录像 */
/*! Choose recording */
 +(NSString *)select_video;

/*! 扫描下方二维码即可获取设备 */
/*! Scan the QR code below to connect the device */
 +(NSString *)devicelist_share_Scan_QR_code_below;

/*! TF卡异常 */
/*! TF card abnormal */
 +(NSString *)alarm_tf_exception;

/*! 高 */
/*! High */
 +(NSString *)high;

/*! 区域宽度： */
/*! Area width： */
 +(NSString *)devicesetting_area_width;

/*! 请检查以下几项 */
/*! Please check the following */
 +(NSString *)devicelist_check_following;

/*! 定时巡航 */
/*! Timing Cruise */
 +(NSString *)devicesetting_timing_cruise;

/*! MIUI7神隐模式：允许应用进行自定义配置模式，应用在后台保持联网可用，否则应用进入后台时，应用无法正常接收消息。 [设置］下电量和性能中［神隐模式］； */
/*! MIUI7 Hidden Mode: Allows the application to customize the configuration mode, the application remains connected to the network in the background, otherwise the application cannot receive messages normally when the application enters the background. [Setting]-Power and performance-[Hidden mode]; */
 +(NSString *)person_feedback_question_ROM_software_1_miui7;

/*! 1.路由器、手机、摄像机尽量靠近； */
/*! 1. Router, mobile phone, camera are as close as possible; */
 +(NSString *)addDevice_connecting_help_1;

/*! 姓名 */
/*! Name */
 +(NSString *)service_name;

/*! 注销账号 */
/*! Delete Account */
 +(NSString *)person_Cancellation_Account;

/*! 选择地区 */
/*! Select region */
 +(NSString *)devicesetting_Select_region;

/*! 无流量 */
/*! No flow */
 +(NSString *)Devicesetting_No_flow;

/*! 已连接的设备 */
/*! Connected device */
 +(NSString *)deviceSetting_Connected_device;

/*! 再按一次退出app */
/*! Press again to exit the app */
 +(NSString *)devicelist_press_again;

/*! 抱歉，APP暂不支持PayPal信用卡支付，请使用账号密码登录支付 */
/*! Sorry, APP does not support PayPal credit card payment, please log in and pay with your account password */
 +(NSString *)cloud_paypal_does_not_support_credit;

/*! 2.选择蓝牙摄像机 */
/*! 2.Choose bluetooth camera */
 +(NSString *)help_addDevice_textTips_15;

/*! 尚未购买 */
/*! Not yet purchased */
 +(NSString *)playback_not_yet_purchase;

/*! 设备信息 */
/*! Device\'s information */
 +(NSString *)device_information;

/*! 云存区域 */
/*! Cloud saveing area */
 +(NSString *)cloud_storage_area;

/*! AP密码 */
/*! AP password */
 +(NSString *)deviceSetting_AP_password;

/*! 设置WiFi密码 */
/*! Set WiFi password */
 +(NSString *)adddevice_set_wifi_password;

/*! 微信账号 */
/*! WeChat account */
 +(NSString *)person_wechat_account;

/*! 摄像机安装引导 */
/*! Camera installation guide */
 +(NSString *)addDevice_Camera_installation_guide;

/*! 是否删除该日程 */
/*! Whether to delete this schedule */
 +(NSString *)Devicesetting_delete_schedule;

/*! 设备WiFi */
/*! Device\'s  WiFi */
 +(NSString *)deviceSetting_Equipment_WIFI;

/*! 正在为您开启云存录像 */
/*! Opening cloud storage video for you */
 +(NSString *)cloud_open_cloud_video;

/*! 查看更多 */
/*! View More */
 +(NSString *)person_view_more;

/*! 长按重置键，保持5秒以上 */
/*! Press and hold the reset button for more than 5 seconds */
 +(NSString *)adddevice_press_reset_5_sec;

/*! 网络带宽检测 */
/*! Network bandwidth detection */
 +(NSString *)deviceSetting_Signal_strength_detection;

/*! 暂无查看消息权限 */
/*! No permission to view messages */
 +(NSString *)devicelist_no_permissions_view_message;

/*! 存储 */
/*! Storage */
 +(NSString *)devSettings_storage;

/*! 未检测到云录像，请前往录像机系统设置中检查时间同步开关是否已开启？ */
/*! Cloud recording is not detected, please go to the recorder system settings to check whether the time synchronization switch is enabled? */
 +(NSString *)playback_NVR_Time_synchronization;

/*! 最多可添加%ld条警戒线，超过%ld条后，删除已存在的方可添加新的警戒线 */
/*! Up to %ld cordon lines can be added. After more than %ld, delete existing ones to add a new cordon. */
 +(NSString *)devicesetting_warn_line_number_detail_ios;

/*! 信号： */
/*! Signal： */
 +(NSString *)Signal_1;

/*! 正在扫描附近设备，扫描大约需要3分钟，请耐心等候 */
/*! Scanning nearby devices, scanning takes about 3 minutes, please be patient */
 +(NSString *)adddevice_scan_time_prompt;

/*! 帮助 */
/*! Help */
 +(NSString *)help;

/*! 去开启 */
/*! Go to open */
 +(NSString *)playback_go_to_open;

/*! 已为你定位上次播放位置 */
/*! The last played position has been located for you */
 +(NSString *)palyback_playback_position;

/*! 订单金额 */
/*! Order amount */
 +(NSString *)cloud_order_amount;

/*! 是否删除该警戒线? */
/*! Delete the cordon or not? */
 +(NSString *)devicesetting_delete_warn_line_prompt;

/*! 请检查摄像机是否已处于对码状态，状态灯是否快速闪烁（长按摄像机复位键进入对码状态） */
/*! Please check whether the camera is in the state of code matching and whether the status light flashes quickly (long press the camera reset button to enter the state of code matching) */
 +(NSString *)devicelist_check_following_describe_1;

/*! 您可以拨打下方联系方式来解决遇到的问题 */
/*! You can call the contact information below to solve the problems encountered */
 +(NSString *)Service_map_solve_question;

/*! 错误码 */
/*! Error code */
 +(NSString *)error_code;

/*! WiFi Camera */
/*! WiFi Camera */
 +(NSString *)help_WiFi_Camera;

/*! 请将套餐兑换码放入扫描框内 */
/*! Please put the exchange code code in the scan box. */
 +(NSString *)cloud_put_in_scan_box;

/*! 开启失败，请检查网络是否良好 */
/*! Failed to open, please check whether the network is good */
 +(NSString *)devicesetting_base_station_open_fail;

/*! 设备升级失败 */
/*! Device upgrade failed */
 +(NSString *)devicesetting_firmware_upgrade_device_fail;

/*! 已选%1$d个 */
/*! %1$d selected */
 +(NSString *)chosen_number;

/*! 自动续费服务说明 */
/*! Automatic renewal service description */
 +(NSString *)cloud_automatic_renewal_description;

/*! b.若设备指示灯闪烁，您可以点击“配置模式”按钮进入无线配网添加流程(长按设备机身上的“Reset键”可重置设备至指示灯闪烁状态) */
/*! b. If the device indicator is flashing, you can click the \"Configure Mode\" button to enter the wireless distribution network adding process ( press and hold the \"Reset button\" on the device body to reset the device to the indicator blinking state) */
 +(NSString *)adddevice_Wireless_flash_flicker;

/*! SIM卡可测试 */
/*! SIM card can be test */
 +(NSString *)devicesetting_4G_device_sim_card_testable;

/*! 储存卡 */
/*! Storage card */
 +(NSString *)deviceSetting_Storage_card;

/*! 请将摄像机与WiFi摄像机基站尽量靠近 */
/*! Please keep the camera and Base Station as close as possible */
 +(NSString *)devicelist_check_following_describe_2;

/*! 云存功能，是基于移动物体检测等技术开发的录像存储功能。云存分为报警录制与全天录制两种类型。报警录制是指摄像机前有人经过或物体移动时，触发摄像机报警，摄像机会自动录像，并加密上传至云空间安全中心，您可以放心使用。 */
/*! The cloud storage function is a video storage function developed based on technologies such as moving object detection. Cloud storage is divided into two types: alarm recording and full-day recording. Alarm recording refers to triggering the camera alarm when human passes by or moves in front of the camera. The camera will automatically record and upload it to the Cloud Space Security Center for encryption. You can use it with confidence. */
 +(NSString *)cloud_storage_details_introduce;

/*! 金额 */
/*! Amount */
 +(NSString *)devicesetting_4G_card_Amount;

/*! 1.确保TF格式为FAT32或exFAT */
/*! 1. Make sure the TF format is FAT32 or exFAT */
 +(NSString *)person_feedback_question_Unable_to_detect_TF_card_detail_format;

/*! 周期 */
/*! Period */
 +(NSString *)devicesetting_4G_card_Period;

/*! 基站配对成功 */
/*! Base station paired successfully */
 +(NSString *)addDevice_Base_station_paired_successfully;

/*! a.添加设备成功后，若设备符合服务迁移条件，弹出迁移提示框，确定后选择需要迁移至新添加设备的服务，点击“迁移”； */
/*! After the device is added successfully, if the device meets the service migration conditions, the migration prompt box is displayed. After confirming, select the service that needs to be migrated to the newly added device, and click \"Migration\". */
 +(NSString *)cloud_help_migration_service_a;

/*! 全天 */
/*! All day */
 +(NSString *)Devicesetting_All_day;

/*! 预览回放支持三种视频尺寸选择哦 */
/*! Preview playback supports three  size options. */
 +(NSString *)person_preview_Size_selection;

/*! SIM卡信息 */
/*! SIM card information */
 +(NSString *)devicesetting_4G_card_sim_card_info;

/*! 验证码已发送至%1$s，请注意查收。 */
/*! Verification code has been sent to %1$s,please check. */
 +(NSString *)verify_code_sentAndChect;

/*! 最佳省电-有效触发唤醒后的录像时长； */
/*! The best power saving mode-the recording time after the wake-up is triggered effectively; */
 +(NSString *)devicesetting_Longest_battery_life_Description_;

/*! Q4：确保WiIFi的账号、密码填写正确 */
/*! Q4: Make sure that the WiIFi account and password are filled in correctly */
 +(NSString *)person_feedback_question_check_info;

/*! 用户不存在 */
/*! User name doesn\'t exist */
 +(NSString *)login_user_does_not_exist;

/*! 超清 */
/*! HD */
 +(NSString *)Preview_UHD;

/*! 作用1:设置“常看位置”后，您可以随时随地定位到您关心的位置上，快速查看家中的变化。 */
/*! Function 1: After setting the \"preset location\", you can locate the location you care about anytime and anywhere, and quickly check the changes in your home. */
 +(NSString *)person_feedback_question_preset_1;

/*! 1.设备列表界面点击①“分享”，生成二维码。 */
/*! 1. Click ①\"Share\"on the device\'s list interface to generate a QR code. */
 +(NSString *)help_addDevice_textTips_23;

/*! %ld秒 */
/*! %ld sec */
 +(NSString *)plural_ios;

/*! 继续播放 */
/*! Keep playing */
 +(NSString *)palyback_keep_playing;

/*! 作用2:在设备设置中选择“定点巡航”，摄像机将根据您设置的常看位置进行巡航监控。 */
/*! Function 2: Select \"fixed-point cruise\" in the device settings, and the camera will conduct cruise monitoring according to the preset position you set. */
 +(NSString *)person_feedback_question_preset_2;

/*! 设备设置失败，连接超时 */
/*! Device setup failed,connection timeout */
 +(NSString *)addDevice_settingFail_timeOut;

/*! 视频遮盖 */
/*! Video masking */
 +(NSString *)play_video_cover;

/*! 录像倍速播放，提升效率 */
/*! Video high-speed playback */
 +(NSString *)person_cloud_speed_playback;

/*! 密码错误 */
/*! Wrong password */
 +(NSString *)device_password_error;

/*! 设置提示音 */
/*! Set the prompt aduio */
 +(NSString *)deviceSetting_tone_Settings;

/*! 还没有设备 */
/*! No device yet */
 +(NSString *)devicelist_no_device_yet;

/*! 无访问信息 */
/*! No access information */
 +(NSString *)me_no_access_information;

/*! 4.返回APP，等待状态栏显示“ */
/*! 4.Return to the app and wait for the status bar to display \" */
 +(NSString *)addevice_return_APP_4;

/*! 点击或上拉加载更多 */
/*! Tap or pull up to load more */
 +(NSString *)MJRefreshAutoFooterIdleText;

/*! 取消 */
/*! Cancel */
 +(NSString *)cancel;

/*! 全景巡航：10秒转一个角度，大概40度，9次转完一圈，开启4小时之后会自动关闭，不会垂直转到，只会水平转动； */
/*! Panoramic cruise: turn an angle in 10 seconds, about 40 degrees, complete a lap in 9 times, it will automatically turn off after 4 hours of opening, and will not turn vertically, but only horizontally;  */
 +(NSString *)person_feedback_question_gimbal_cruise_detail;

/*! 手机号 */
/*! Cellphone number */
 +(NSString *)phone_number;

/*! 人形或移动触发-人体红外感应触发后在图像中检测到人形、人脸或物体移动。 */
/*! Humanoid or mobile trigger-human body infrared sensor is triggered to detect human face or object movement in the image. */
 +(NSString *)devicesetting_working_mode_Description_5;

/*! 设置时间 */
/*! Time setting */
 +(NSString *)deviceSetting_videoBackup_setTime;

/*! 设置设备名称 */
/*! Set device name */
 +(NSString *)adddevice_set_name;

/*! 重新检测 */
/*! Test again */
 +(NSString *)devicesetting_Device_signal_test_again;

/*! 删除 */
/*! Delete */
 +(NSString *)delete;

/*! 1.选择无线摄像机 */
/*! 1.Choose WiFi camera */
 +(NSString *)help_addDevice_textTips_7;

/*! 暂时无法获取支付结果，请重试 */
/*! Can\'t get payment result at present,please try again */
 +(NSString *)cloud_payment_results_unable_obtain;

/*! 速度：Class4及以上都支持 */
/*! Speed: Class 4 and all above are supported */
 +(NSString *)person_feedback_question_type_memory_card_detail;

/*! %@需要更新固件，是否现在更新？ */
/*! %@ needs to update the firmware, do you need to update it now? */
 +(NSString *)devicelist_firmware_update_IPC_ios;

/*! 删除摄像机后，摄像机会自动复位，需要重新配网添加，是否确定删除？ */
/*! After the camera is deleted, the camera will automatically reset and need to be re-configured and added. Are you sure to delete it? */
 +(NSString *)devicesetting_delete_reset_camera_prompt;

/*! 摄像机无法添加 */
/*! Camera cannot be added */
 +(NSString *)person_feedback_cannot_add_camera;

/*! %ld个录像 */
/*! %ld videos */
 +(NSString *)devicesetting_Videobackup_videos_ios;

/*! 注销失败 */
/*! Deletion failed */
 +(NSString *)person_Cancellation_failed;

/*! 2.查看设备指示灯是否闪烁，若指示灯未闪烁，长按Reset键重置设备，直到设备处于配置模式 */
/*! 2. Check whether the device indicator is blinking. If the indicator is not blinking, press and hold the Reset button to reset the device until the device is in configuration mode. */
 +(NSString *)adddevice_check_device_reset;

/*! 阿姆斯特丹/中欧 */
/*! Europe/Amsterdam */
 +(NSString *)Europe_Amsterdam;

/*! 删除分享 */
/*! Delete sharing */
 +(NSString *)me_device_share_delete;

/*! 关闭时，查看实时和回放录像都没有声音 */
/*! When closed, there is no sound when viewing live and playback recordings */
 +(NSString *)Devicesetting_closed_sound_viewing_live_record;

/*! 迁移数量 */
/*! Number of migrations */
 +(NSString *)cloud_migration_number;

/*! 天猫精灵授权 */
/*! Tmall Sprite authorization */
 +(NSString *)person_Tmall_Sprite;

/*! 4.设备密码错误 */
/*! 4. Device password is wrong */
 +(NSString *)preview_help_4;

/*! 输入的验证码错误，请重新输入 */
/*! Verification code is wrong,please input again */
 +(NSString *)verify_wrong;

/*! 用最低的价格购买设备 */
/*! Buy equipment at the lowest possible price */
 +(NSString *)service_map_lowest_price;

/*! ① 录像机首页点击“鼠标右键”，选择“系统设置”； */
/*! ① Click the \"right mouse button\" on the homepage of the video recorder and select \"System Setting\"; */
 +(NSString *)Cloud_detail_guide_step1;

/*! 第二步：查看设备指示灯是否闪烁，若指示灯未闪烁，长按Reset键重置设备，直到设备处于配置模式 */
/*! Step 2: Check whether the device indicator is blinking. If the indicator is not blinking, press and hold the Reset button to reset the device until the device is in configuration mode. */
 +(NSString *)adddevice_check_device_reset_fail;

/*! 图像旋转180° */
/*! Image rotation 180° */
 +(NSString *)deviceSetting_Image_rotation;

/*! 添加位置 */
/*! Add position */
 +(NSString *)preview_Add_position;

/*! 无可分组设备 */
/*! No groupable device */
 +(NSString *)devicelist_group_without_device;

/*! 切换为倒挂模式 */
/*! Switch to upside down mode */
 +(NSString *)preview_switch_to_upside;

/*! 有效期 */
/*! Valid time */
 +(NSString *)addDevice_share_vailidTime;

/*! 通道云录像功能未开启，是否开启？ */
/*! Channel cloud recording is not enabled. Is it turned on? */
 +(NSString *)cloud_channel_record_off;

/*! 时间录像 */
/*! Time video */
 +(NSString *)devSetting_timeVideo;

/*! 摄像机配对失败 */
/*! Camera pairing failed */
 +(NSString *)Addevice_Camera_pairing_failed;

/*! 埃里温 */
/*! Asia/Yerevan */
 +(NSString *)Asia_Yerevan;

/*! 普通NVR与mini NVR请将设备连上网线后，点击“手动添加”前往使用ID添加设备 */
/*! For the normal NVR and mini NVR, please connect the device to the Internet cable , click \"Add manually\" to add the device by ID. */
 +(NSString *)adddevice_internet_cable_device;

/*! 获取更多收益 */
/*! Get more revenue */
 +(NSString *)Service_map_Get_more_revenue;

/*! 匿名用户 */
/*! Anonymous user */
 +(NSString *)me_anonymous_users;

/*! 您的设备%1$s密码输入错误 */
/*! Your device %1$spassword is entered incorrectly */
 +(NSString *)adddevice_device_password_incorrect;

/*! 分享管理 */
/*! Sharing management */
 +(NSString *)share_management;

/*! 隐私区%1$d */
/*! Privacy area %1$d */
 +(NSString *)devicesetting_privacy_area_number;

/*! 图像风格 */
/*! Image style */
 +(NSString *)image_style;

/*! App需要访问相机 */
/*! App need to access camera */
 +(NSString *)addDevice_access_camera;

/*! 切换网络(暂不支持5G网络配置) */
/*! Switch network (not supporting 5G network configuration) */
 +(NSString *)addDevice_update_network;

/*! 请联系机主分享设备或复位后再添加 */
/*! Please contact the owner to share the device or add it after reset */
 +(NSString *)adddevice_share_reset_add;

/*! 云台控制：控制球机设备移动 */
/*! PTZ control: control the movement of high speed dome */
 +(NSString *)help_preview_ttextTips_15;

/*! 1.为了节省SD卡的空间和延长使用寿命，设备仅在检查到图像活动的时候录像，因此就会有断断续续的现象。 */
/*! 1.For saving the room of SD card and extend the lifetime,device will only make recording when detect the actived image ,that\'s why the recording content is uncontinuous. */
 +(NSString *)help_normal_problem_text_11;

/*! 无信号 */
/*! No signal */
 +(NSString *)devicesetting_4G_no_signal;

/*! 2、删除警戒线 */
/*! 2、 delete the cordon */
 +(NSString *)devicesetting_delete_warn_line;

/*! 如需要连接到互联网，请参考： */
/*! To connect to the internet, please refer to: */
 +(NSString *)preview_no_video_refer_to_internet;

/*! 1.允许App消息通知，才能接收到报警推送； */
/*! 1. Allow App message notification to receive alarm push; */
 +(NSString *)help_normal_problem_text_5;

/*! 2.拔插摄像机电源线，重启摄像机 */
/*! 2. Unplug the camera power cord and restart the camera */
 +(NSString *)person_feedback_question_Unable_to_detect_TF_card_detail_power;

/*! 添加设备 */
/*! Add Device */
 +(NSString *)addDevice;

/*! 云录像有效期 */
/*! Cloud recording validity */
 +(NSString *)cloud_recording_validity;

/*! 侦测到移动物体时的录像时长，如无移动物体，则提前结束 */
/*! The recording time when a moving object is detected. If there is no moving object, it will end early */
 +(NSString *)deviceSetting_Video_time_limit_describe;

/*! 该设备暂不支持本地直连 */
/*! The device does not support direct connection */
 +(NSString *)adddevice_device_not_support_direct_connect;

/*! 儿童房 */
/*! Children\'s room */
 +(NSString *)addDevice_Children_room;

/*! 请检查确认基站是否已连接电源且正常通电。 */
/*! Please check whether the base station is connected to the power supply and powered on normally. */
 +(NSString *)Addevice_check_basestation_power;

/*! 云存帮助 */
/*! Cloud storage help */
 +(NSString *)help_cloud_storage_textTips_1;

/*! 始终开启红外夜视，画面为黑白。 */
/*! Always turn on infrared night vision, the picture is black and white. */
 +(NSString *)deviceSetting_Night_vision_always_on_describe;

/*! 检测失败，请重试 */
/*! Detection failed,please try again */
 +(NSString *)devicesetting_Device_signal_Test_results_failed;

/*! 等级 */
/*! Level  */
 +(NSString *)play_level;

/*! 如果您的手机在WiFi配置里开启了WLAN+、智能WiFi、WiFi+、WiFi助手，配置时请关闭。 */
/*! If your phone has WLAN+, Smart WiFi, WiFi+, WiFi Assistant enabled in the WiFi configuration, please turn it off when configuring. */
 +(NSString *)adddevice_open_wifi_assistant_detail;

/*! 再购买 */
/*! Buy again */
 +(NSString *)devicesetting_4G_card_buy_again;

/*! Español */
/*! Español */
 +(NSString *)Spanish;

/*! 第二步：长按Reset键，保持5秒以上，直到设备指示灯变为闪烁。听到设备发出“恢复出厂设置”提示音。 */
/*! Step 2: Press and hold the Reset button for more than 5 seconds until the device indicator flashes. Hear the device to issue a “factory reset” tone. */
 +(NSString *)adddevice_step_press_reset;

/*! 推送消息设置 */
/*! Push message settings */
 +(NSString *)deviceSetting_Push_message_settings;

/*! 配对成功 */
/*! Paired successfully */
 +(NSString *)addDevice_Paired_successfully;

/*! 分 */
/*! Min */
 +(NSString *)deviceSetting_videoBackup_startTimemn;

/*! 开启后App才可以访问你的照片进行照片和录像的存储 */
/*! After opening,the app can access your photos for photo and video storage. */
 +(NSString *)NSPhotoLibraryUsageDescription;

/*! 正在连接设备，是否确定退出？ */
/*! Connecting device, are you sure to quit? */
 +(NSString *)adddevice_connect_quit_prompt;

/*! 视频遮挡 */
/*! Video shielding */
 +(NSString *)play_video_keepOut;

/*! 去连接 */
/*! To connect */
 +(NSString *)addDevice_to_connect;

/*! （当前正在使用中的套餐数据） */
/*! (Package data currently in use) */
 +(NSString *)cloud_package_data_in_use;

/*! 选择路由器名称与输入密码 */
/*! Select router name and input password */
 +(NSString *)adddevice_select_router_name;

/*! 通知权限 */
/*! Notification permission */
 +(NSString *)person_Notification_permission;

/*! Q2：如何添加常看位置？ */
/*! Q2: How to add preset positions? */
 +(NSString *)person_feedback_question_add_preset;

/*! 2.密码和WiFi名称不能用特殊字符 */
/*! 2.Passwords and Wi-Fi names cannot use special characters */
 +(NSString *)adddevice_password_WiFi_limit;

/*! 前往授权 */
/*! To authorize */
 +(NSString *)person_To_authorize;

/*! 设备WiFi修改成功 */
/*! Device WiFi modified successfully */
 +(NSString *)deviceSetting_Change_WIFI_modified_success;

/*! %1$d小时 */
/*! %1$dhour */
 +(NSString *)cloud_Renewal_fee_hour;

/*! 本地存储空间 */
/*! Local storage space */
 +(NSString *)deviceSetting_Local_storage_space;

/*! 若你是用WiFi连接，请确认是否修改过设备所在环境的WiFi——包括WiFi密码和名称，如修改过，请重新配置WiFi； */
/*! If you are using WiFi connection,please confirm whether you have modified the WiFi of the environment where the device is located-including the WiFi password and name. If you have modified it,please reconfigure WiFi; */
 +(NSString *)devicelist_offline_help_content_tow;

/*! 请输入7-255之间的数字 */
/*! Please enter a number between 7-255 */
 +(NSString *)person_setting_preview_enter_number_between;

/*! 再次确定密码 */
/*! Confirm password again */
 +(NSString *)password_again;

/*! 人形侦测 */
/*! Humanoid detection */
 +(NSString *)devicesetting_Humanoid_detection;

/*! 设备密码格式错误 */
/*! Format of device password is wrong */
 +(NSString *)addDevice_passwordFormat_error;

/*! 提示1：设备指示灯是否闪烁？ */
/*! Tips 1: does indicator light of the device blink? */
 +(NSString *)addDevice_guide_lightFlash_tips;

/*! 开启麦克风权限，允许应用使用麦克风录制音频，您可以在实时预览时向设备发起对讲 */
/*! Turn on microphone permissions to allow apps to record audio using a microphone, and you can initiate a talkback to the device during live preview */
 +(NSString *)person_microphone_permssions_instructions;

/*! 已重置好了 */
/*! Has been reset */
 +(NSString *)adddevice_reseted_success;

/*! 本文是否对您有帮助？ */
/*! Did this article help you? */
 +(NSString *)person_article_helpful;

/*! 立即安装 */
/*! Install now */
 +(NSString *)cloud_install_now;

/*! APP在您使用部分服务功能时需要获取您的位置信息，请前往设置开启 */
/*! APP needs to get your location information when you use some of the service features, please go to Settings to open */
 +(NSString *)devicelist_permission_detail;

/*! 剩余容量：%1$s/ 总容量：%1$s */
/*! Remaining capacity: %1$s/ Total capacity: %1$s */
 +(NSString *)deviceSetting_Remaining_capacity_Total_capacity;

/*! 播放次数 */
/*! Play times */
 +(NSString *)video_plays;

/*! 科威特 */
/*! Asia/Kuwait */
 +(NSString *)Asia_Kuwait;

/*! 为设备%@连接WiFi */
/*! Connect WiFi for device %@ */
 +(NSString *)addDevice_connection_WIFI_ios;

/*! 随时回看防丢失 */
/*! Playback at any time, prevent loss */
 +(NSString *)cloud_prevent_loss;

/*! 开启成功 */
/*! Open success */
 +(NSString *)cloud_Open_success;

/*! 请让设备在线后再购买 */
/*! Please keep the device online before purchase */
 +(NSString *)cloud_keep_device_online;

/*! 手动添加 */
/*! Add manually */
 +(NSString *)adddevice_add_manully;

/*! 录像时间不能太短 */
/*! The recording time should not be too short */
 +(NSString *)preview_record_time_be_not_short;

/*! 渠道批发 */
/*! Channel wholesale */
 +(NSString *)service_Channel_wholesale;

/*! 打开手机“设置” */
/*! Click setting in your smartphone */
 +(NSString *)addDevice_openThePhone_setting;

/*! 1.未绑定云服务迁移 */
/*! 1. Unbound cloud service migration */
 +(NSString *)cloud_help_migration_service;

/*! 超清模式切换成功 */
/*! HD mode switch succeeded */
 +(NSString *)play_changeUHD_alert;

/*! 该设备名称已存在 */
/*! This device name is existed. */
 +(NSString *)devSetting_name_existing;

/*! *视各地运营商情况，预计一小时内正常 */
/*! * Depending on the local operators, it is expected to be normal within one hour */
 +(NSString *)devicesetting_unlock_time;

/*! 您的账号登录已过期，或者密码已被修改，请重新登录 */
/*! Your login expires,or password is changed,please log in again */
 +(NSString *)myDevice_error_alert_userTonkenInvalid;

/*! 该云录像已过期 */
/*! The cloud recording has expired */
 +(NSString *)cloud_recording_expired;

/*! 对焦 */
/*! Focus */
 +(NSString *)preview_focus;

/*! 凤凰城美国⼭区 */
/*! America/Phoenix */
 +(NSString *)America_Phoenix;

/*! 已确认手机与设备处于同一局域网 */
/*! Confirmed that the phone and the device are in the same LAN */
 +(NSString *)addevice_no_device_found_tip_2;

/*! 视频区域 */
/*! Video area */
 +(NSString *)devicesetting_Video_area;

/*! 注意：修改设备密码后，需要在编辑中同步修改访问密码；否则容易出现密码错误的情况。 */
/*! Note:after change device password,users have to change access password in \"edit\" setting too,otherwise it will show\"wrong password\". */
 +(NSString *)setting_modify_device_password;

/*! 请输入设备用户名 */
/*! Please input user name */
 +(NSString *)addDecice_user_input;

/*! 播放失败，请检查网络状态 */
/*! Failed to play, please check the network status */
 +(NSString *)preview_no_video_playback_fail;

/*! 输入IP/DDNS */
/*! Input IP address/DDNS */
 +(NSString *)addDevice_IP_or_DDNS;

/*! 请根据您的工作习惯选择工作时间 */
/*! Please choose working hours according to your work habits */
 +(NSString *)Service_map_select_work_time;

/*! 当前网络： */
/*! Current network: */
 +(NSString *)addevice_current_network;

/*! 变倍与对焦 */
/*! Zoom and focus */
 +(NSString *)deviceSetting_Zoom_and_focus;

/*! 录像更安全：录像云端存储，砸不坏，偷不走，安全可靠。 */
/*! The video is safer: the video cloud storage can not steal, safe and reliable. */
 +(NSString *)cloud_storage_details_advantages_1;

/*! 夜视补光灯模式 */
/*! Night vision mode */
 +(NSString *)devicesetting_Night_vision_fill_light;

/*! 查看更高效：实时生成报警小视频，快速掌握报警情况，录像清晰流畅不卡顿。 */
/*! More efficient viewing: generate  alarm video in real time, quickly grasp the alarm situation, the video is clear and smooth without jamming */
 +(NSString *)cloud_storage_details_advantages_2;

/*! 信号强度 */
/*! Signal strength */
 +(NSString *)devicesetting_signal_strength;

/*! 2、指示灯变为闪烁 */
/*! 2、 Indicatie light flashes */
 +(NSString *)addDevice_help_text4;

/*! 日本語 */
/*! 日本語 */
 +(NSString *)Japanese;

/*! 云端存储：摄像机录像存储在云空间，无空间大小限制，拥有无限云端存储空间。 */
/*! Cloud storage: Camera video is stored in cloud space, no space limit, and unlimited cloud storage space. */
 +(NSString *)cloud_storage_details_advantages_3;

/*! 信号强度： */
/*! Signal strength: */
 +(NSString *)deviceSetting_Signal_strength_1;

/*! 畸变矫正 */
/*! Distortion correction */
 +(NSString *)deviceSetting_Distortion_correction;

/*! 灯控信息获取失败 */
/*! Light control information acquisition failed */
 +(NSString *)preview_light_control_fail;

/*! 固件更新 */
/*! Firmware update */
 +(NSString *)devSettings_deviceUpdate;

/*! 第二步：长按重置键，保持5秒以上，直到指示灯变为闪烁 */
/*! Step 2: Press and hold the reset button for more than 5 seconds until the indicator light flashes */
 +(NSString *)adddevice_press_reset_until_light_flash;

/*! 云ID不能为空 */
/*! Cloud ID can\'t be empty */
 +(NSString *)cloud_ID_be_empty;

/*! ID */
/*! ID */
 +(NSString *)text_ID;

/*! 同意该软件用户服务协议和隐私协议 */
/*! Agree to the software user service agreement and privacy protocol. */
 +(NSString *)login_user_agreement;

/*! 获得行业最新资讯 */
/*! Get the latest industry news */
 +(NSString *)Service_map_latest_industry_news;

/*! 首尔 */
/*! Asia/Seoul */
 +(NSString *)Asia_Seoul;

/*! 没有崩溃文件可上传 */
/*! No crash file can be uploaded */
 +(NSString *)person_set_Upload_crash_filing_no;

/*! 伦敦/格林尼治 */
/*! Europe/London */
 +(NSString *)Europe_London;

/*! “智能侦测录像时长”在各模式对应触发项 */
/*! \"Motion detection of recording duration\" corresponds to the trigger item in each mode */
 +(NSString *)devicesetting_working_mode_Description_6;

/*! 摄像机离线 */
/*! Camera offline */
 +(NSString *)person_feedback_camera_offline;

/*! 云存功能帮助 */
/*! Cloud storage function help */
 +(NSString *)help_cloud_storage_function;

/*! 去提交 */
/*! To submit */
 +(NSString *)Help_to_submit;

/*! 连接设备热点失败/连接蓝牙失败 */
/*! Fail to connect device hotspot/fail to connect bluetooth */
 +(NSString *)prompt_connectHotspot_failed;

/*! 去支付 */
/*! To pay */
 +(NSString *)devicesetting_4G_card_to_pay;

/*! 明斯克 */
/*! Europe/Minsk */
 +(NSString *)Europe_Minsk;

/*! 始终开启夜视模式 */
/*! Always turn on night vision mode */
 +(NSString *)deviceSetting_Always_turn_night_vision;

/*! 信息已提交，请耐心等候... */
/*! The information has been submitted, please be patient ... */
 +(NSString *)Service_map_wait_Auditing;

/*! 收不到报警消息怎么办？ */
/*! What should do if I don\'t receive the alarm message? */
 +(NSString *)person_feedback_question_3;

/*! 图片不存在 */
/*! Image does not exist */
 +(NSString *)person_alarm_image_unsxist;

/*! 连网失败 */
/*! Network failure */
 +(NSString *)smartlin_distribution_network_fail;

/*! 隐私政策 */
/*! Privacy Policy */
 +(NSString *)person_privacyPolicy;

/*! 关于 */
/*! About */
 +(NSString *)person_about;

/*! 支付失败，是否重新支付 */
/*! Payment failed,whether to pay again */
 +(NSString *)cloud_Payment_failed;

/*! 早上08:00 - 晚上20:00关闭摄像头 */
/*! Turn off the camera from 08:00 in the morning to 20:00 in the evening */
 +(NSString *)deviceSetting_deviceSetting_evening_turn_off_next_morning;

/*! %1$d个分享 */
/*! Personal share %1$d */
 +(NSString *)me_share_number;

/*! 该设备已被其他账号绑定，请复位后再添加 */
/*! The device has been bound by other accounts, please reset and add */
 +(NSString *)adddevice_Has_been_bound;

/*! 支持购买云存储的设备 */
/*! The device which supports purchase of cloud storage */
 +(NSString *)cloud_device_support_buy_cloud;

/*! 维修工作简介 */
/*! Introduction to maintenance work */
 +(NSString *)service_maintenance_work_introduce;

/*! 视频下载 */
/*! Video download */
 +(NSString *)devicelist_share_equipment_Video_download;

/*! 检查录像机时间同步开关状态 */
/*! Check the time synchronization switch status of the recorder */
 +(NSString *)Cloud_detail_guide_title;

/*! 关闭布防 */
/*! Disable Alarm */
 +(NSString *)devicelist_close_arming;

/*! 播放失败 */
/*! Failed to play */
 +(NSString *)cloud_Playback_failed;

/*! 发现新版本 */
/*! Find new version */
 +(NSString *)me_version_discover_new;

/*! 自定义侦测区生效中，云台相关功能已被锁定，您可以到智能侦测警报-画面侦测区关闭该功能。 */
/*! When the custom detection area is in effect, the related functions of the gimbal have been locked. You can go to the motion detection alarm-screen detection area to turn off this function. */
 +(NSString *)preview_custom_detection_Smart_Detection_Alarm_Screen_Detection;

/*! 授权成功 */
/*! Succeed to authorize */
 +(NSString *)authorization_success;

/*! 相机权限 */
/*! Camera permissions */
 +(NSString *)person_Camera_permissions;

/*! 若目前无法提供门店门脸照，系统默认九安门店图 */
/*! If the store\’s face photos can\’t be provided at present, the system defaults to the store picture of JUANCLOUD */
 +(NSString *)service_select_system_photo;

/*! 抱歉，设备“%1$s”只能逐个删除 */
/*! Sorry, devices \"%1$s\" can only be deleted one by one */
 +(NSString *)person_share_device_delete;

/*! 添加成功 */
/*! Added successfully */
 +(NSString *)adddevice_added;

/*! 伊尔库茨克 */
/*! Asia/Irkutsk */
 +(NSString *)Asia_Irkutsk;

/*! 全天录制，是指摄像机在线以及网络状况良好的状态下会自动录像，24小时全天检测，加密上传到云空间。 */
/*! Recording all day means that the camera will automatically record when it is online and in good condition. It will be detected 24 hours a day and encrypted and uploaded to the cloud space. */
 +(NSString *)cloud_storage_details_types_3;

/*! 云卡 */
/*! Cloud card */
 +(NSString *)cloud_card;

/*! WiFi设置 */
/*! WiFi settings */
 +(NSString *)deviceSetting_WIFI_settings;

/*! 云端存储，随时回看防丢失 */
/*! Cloud storage, playback at any time prevent loss */
 +(NSString *)me_Cloud_storage_package_describe;

/*! 分享设备不支持观看云录像 */
/*! The sharing device does not support watching cloud video */
 +(NSString *)playback_share_device_video;

/*! 1、重置需要对码添加的摄像机 */
/*! 1、 Reset the camera that needs to be added . */
 +(NSString *)devicelist_defense_add_to_code_help_1;

/*! 周三 */
/*! Wednesday */
 +(NSString *)person_alarm_selct_time_wed;

/*! 上传固件到IPC失败 */
/*! Uploading firmware to IPC failed */
 +(NSString *)devicesetting_firmware_upgrade_upload_fail;

/*! 请扫描设备机身上的二维码进行添加 */
/*! Please scan the QR code on the device body to add it. */
 +(NSString *)adddevice_scan_code_prompt;

/*! 可激活 */
/*! Activability */
 +(NSString *)devicesetting_4G_device_Activability;

/*! 清空警戒线 */
/*! Clear the cordon */
 +(NSString *)devicesetting_Clear_cordon;

/*! 请查看设备是否有网线接口 */
/*! Please check if the device has a network cable interface. */
 +(NSString *)adddevice_Wireless_add_mode;

/*! 筛选 */
/*! Filter */
 +(NSString *)person_alarm_filter;

/*! 移动侦测 */
/*! Motion detection */
 +(NSString *)alarmMessage_msgType_md;

/*! 2.选择“IPCXXX”设备热点，默认密码：11111111 */
/*! 2.Select \"IPCXXX\" device hotspot, default password: 11111111 */
 +(NSString *)addevice_select_hotspot_and_password;

/*! 输入密码 */
/*! Password */
 +(NSString *)enter_your_password;

/*! %1$s年安防经验 */
/*! %1$s years security experience */
 +(NSString *)service_map_security_experience_number;

/*! 准备配置 */
/*! Ready to configure */
 +(NSString *)adddevice_ready_configure;

/*! 暂无该类型的报警信息 */
/*! No such type of alarm information */
 +(NSString *)alarm_no_such_type;

/*! 套餐即将过期 */
/*! Package is about to expire */
 +(NSString *)setting_4G_package_expire;

/*! 2、按住WiFi摄像机基站上的对码按钮进行添加 */
/*! 2、 Press and hold the button on the Base Station to add. */
 +(NSString *)devicelist_defense_add_to_code_help_2;

/*! 新增在线客服，更快捷的解决您遇到的问题！ */
/*! Added online customer service to solve your problems more quickly! */
 +(NSString *)me_Boot_prompt_online_service;

/*! 是否保存所选内容 */
/*! Save the chosen content or not?  */
 +(NSString *)me_photo_album_save_content;

/*! 设备连接失败，请重新连接 */
/*! Device connection failed,please reconnect */
 +(NSString *)adddevice_Wireless_add_connect_failed;

/*! 请点击上方解锁按钮对SIM卡进行解锁； */
/*! Please click the unlock button above to unlock the SIM card; */
 +(NSString *)devicesetting_4G_card_sim_card_unlock_way;

/*! 取消订单失败，请重试 */
/*! Fail to cancel order,please try again */
 +(NSString *)order_cancel_failedAndRetry;

/*! 原始 */
/*! Original */
 +(NSString *)person_preview_original;

/*! 设备已开通云存自动续费套餐，删除后仍会扣费，请及时前往微信取消续费服务，是否确定删除？ */
/*! The device has opened cloud storage auto-renewal package, it will still be deducted after deleting, please go to WeChat to cancel the renewal service in time, is it sure to delete? */
 +(NSString *)devicesetting_device_opened_auto_renewal_package_delete;

/*! 视频画面翻转 */
/*! Video screen flip */
 +(NSString *)devicesetting_screen_inversion;

/*! 警戒线模式：当有移动物体触碰警戒线，则触发智能侦测警报 */
/*! Cordon mode: When a moving object touches the warning line, a motion detection alarm will be triggered */
 +(NSString *)deviceSetting_Cordon_mode_describe;

/*! 请选择您在安防行业的维修工作经验年限 */
/*! Please select your years of maintenance work experience in the security industry */
 +(NSString *)Service_map_select_security_industry;

/*! 已更新 */
/*! Already updated */
 +(NSString *)updated;

/*! 该设备不支持流量购买 */
/*! The device does not support traffic purchase */
 +(NSString *)devicesetting_4G_device_cannot_buy_data;

/*! 未知错误 */
/*! Unknown error */
 +(NSString *)an_unknown_error;

/*! 联系电话未填写 */
/*! The phone number isn\’t filled in */
 +(NSString *)service_not_phone_number;

/*! 第三步：选择设备WiFi */
/*! Step 3: Select device WiFi */
 +(NSString *)adddevice_select_device_wifi;

/*! 升级中... */
/*! Upgrading... */
 +(NSString *)devicelist_firmware_updating;

/*! 配网过程可能需要1-2分钟，请耐心等待。 */
/*! The network configuration process may take 1-2 minutes, please be patient. */
 +(NSString *)smartlink_device_distribution_networking_time;

/*! 去重置 */
/*! To reset */
 +(NSString *)addevice_to_reset;

/*! 无法搜索到设备 */
/*! Can\'t search device */
 +(NSString *)addDevice_unsearchable;

/*! 月前 */
/*! months ago */
 +(NSString *)person_moth_ago;

/*! 提交失败 */
/*! Submission Failed */
 +(NSString *)cloud_help_submit_fail;

/*! 前往观看 */
/*! Go to watch */
 +(NSString *)playback_go_to_watch;

/*! 原密码 */
/*! Original password */
 +(NSString *)userInfo_password_original;

/*! 为设备设置一个WiFi名称与密码，添加成功后连接此WiFi即可正常使用设备。 */
/*! Set a WiFi name and password for your device, and connect to this WiFi to use your device normally after it has been successfully added. */
 +(NSString *)adddevice_set_WiFi_name_password;

/*! 选择%ld个新设备通道 */
/*! Select%ld new device channels */
 +(NSString *)cloud_migration_select_device_channel_ios;

/*! 全部套餐 */
/*! All packages */
 +(NSString *)devicesetting_4G_card_sim_card_all_package;

/*! 增加门店曝光率 */
/*! Increase store\'s exposure rate */
 +(NSString *)Service_map_Increase_exposure_rate;

/*! 1.检查您的设备是否已处于通电状态,状态灯已点亮； */
/*! 1. Check whether your device is power-on and the status light is on; */
 +(NSString *)person_feedback_question_Check_1;

/*! 2.若你是用WIFI连接， 请确认是否修改过设备所在环境的WIFI—包括WIFI密码和名称，如修改过，请重新配置WIFl; */
/*! 2. If you are using WIFI connection, please confirm whether you have modified the WIFI in the environment where the device is located-including the WIFI password and name, if modified, please reconfigure WIFl; */
 +(NSString *)person_feedback_question_Check_2;

/*! 请选择 */
/*! Please select */
 +(NSString *)cloud_purchase_select_several_channel;

/*! ② 进入手机系统设置，选择无线和网络，选择WLAN，开启WLAN */
/*! ② Enter phone settings, select wireless and network, select WLAN, turn on WLAN */
 +(NSString *)adddevice_turn_on_mobile_WiFi;

/*! 选择云存通道 */
/*! Select cloud storage channel */
 +(NSString *)Cloud_storage_service_select_channel;

/*! 请将兑换码放入扫描框内！ */
/*! Please put the redemption code in the scan box! */
 +(NSString *)cloud_put_code_in_box;

/*! 3.如未能分辨原因，请恢复出厂设置后重新添加网络。 */
/*! 3. If the reason cannot be resolved, please restore the factory settings and add the network again. */
 +(NSString *)person_feedback_question_Check_3;

/*! 新增录像备份 */
/*! Add video backup */
 +(NSString *)devicesetting_Videobackup_add;

/*! 更改设备连接的WiFi */
/*! Change the WiFi of the device connection */
 +(NSString *)deviceSetting_Change_WIFI;

/*! 其他方式登录 */
/*! Other way of login */
 +(NSString *)login_other_ways;

/*! 服务内容 */
/*! Service Content */
 +(NSString *)Service_map_Service_Content;

/*! 设备已设置密码，请输入密码 */
/*! The device has set a password, please enter the password */
 +(NSString *)adddevice_has_set_password;

/*! 设备昵称格式错误 */
/*! Format of device name is wrong */
 +(NSString *)addDevice_nickname_error;

/*! 选择%1$d个新设备通道 */
/*! Select%1$d new device channels */
 +(NSString *)cloud_migration_select_device_channel;

/*! 网络超时 */
/*! Timeout */
 +(NSString *)prompt_network_timeout;

/*! 获取频率太高啦，稍等一会 */
/*! Too frequent to get,please wait a moment. */
 +(NSString *)acquisition_frequency;

/*! WiFi在线 */
/*! WiFi online */
 +(NSString *)deviceSetting_WiFi_online;

/*! 每次巡航4小时后将自动关闭 */
/*! Turn it Off automatically after every cruise for 4 hours */
 +(NSString *)devicesetting_turn_off_cruise_4;

/*! %1$d人中有%2$d人认为有帮助 */
/*! %2$d out of %1$d think it helps */
 +(NSString *)person_many_people_helpful;

/*! 复制公众号 */
/*! Copy official account */
 +(NSString *)person_set_copy_account;

/*! 将同步设备与手机时间 */
/*! Sync the time of cellphone and device */
 +(NSString *)synchronous_device_phone;

/*! 安装模式：点击切换壁挂、倒挂安装模式 */
/*! Installation mode:swith to wall installation and ceiling installation mode */
 +(NSString *)help_preview_ttextTips_9;

/*! 请输入有效时间： */
/*! Please input a valid time: */
 +(NSString *)devicelist_share_equipment_valid_time;

/*! 侦测到人形时，生成报警信息 */
/*! When a humanoid is detected, an alarm message is generated */
 +(NSString *)devicesetting_humanoid_set_prompt;

/*! ② 如果设备未连接网络，查看指示灯是否闪烁： */
/*! ② If the device is not connected to the network, check if the indicator light is flashing: */
 +(NSString *)adddevice_device_light_flahing;

/*! 云存服务套餐使用规则： */
/*! Usage rules of cloud storage service package: */
 +(NSString *)cloud_package_in_use_rules;

/*! 总时长：%@分钟 */
/*! Total duration:%@ minutes */
 +(NSString *)SRC_device_playback_Total_video_ios;

/*! 请选择购买平台 */
/*! Please select the purchase platform */
 +(NSString *)help_select_product_platform;

/*! 白天推送 */
/*! Push during the day */
 +(NSString *)deviceSetting_Push_during_day;

/*! 设备维修 */
/*! Equipment Repair */
 +(NSString *)Service_map_Equipment_Repair;

/*! 设备超时… */
/*! Device timeout… */
 +(NSString *)play_error_tips_4;

/*! 仅夜间 */
/*! Night only */
 +(NSString *)Devicesetting_Night_only;

/*! 周五 */
/*! Friday */
 +(NSString *)person_alarm_selct_time_fri;

/*! 建议内容 */
/*! Suggestion */
 +(NSString *)person_feedback_suggestion;

/*! 删除成功 */
/*! Delete succeefully */
 +(NSString *)delete_success;

/*! 根据您的录像设置，摄像机将于%1$s再次关机，您可以到录像设置-定时关机时段中做变更 */
/*! According to your recording settings, the camera will be shut down again at %1$s, you can go to Recording Settings - Scheduled Shutdown Period to make changes */
 +(NSString *)deviceSetting_Shutdown_prompt_Pop_up_copy;

/*! 9.确认设备是否已连接网线，若已连接网线，点击②已连接进入设备ID选择界面 */
/*! 9. Confirm that whether if device is connected to the network cable. If the network cable is connected,click ② to connect to the device ID selection interface. */
 +(NSString *)help_addDevice_textTips_28;

/*! 信号 */
/*! Signal */
 +(NSString *)signal;

/*! 设备： */
/*! Device: */
 +(NSString *)cloud_device_order;

/*! 反馈记录 */
/*! Feedback record */
 +(NSString *)person_feedback_feedback_record;

/*! 消息时段 */
/*! Message window */
 +(NSString *)deviceSetting_Message_window;

/*! 否 */
/*! No */
 +(NSString *)no;

/*! 发起成功，您可以开始讲话 */
/*! Successfully initiated, you can start talking  */
 +(NSString *)preview_call_success;

/*! 本段录像已损坏 */
/*! This video has been damaged. */
 +(NSString *)cloud_Video_corrupt;

/*! 延时触发录像 */
/*! Delay trigger to record */
 +(NSString *)devicesetting_alarm_set_video_delay;

/*! Deutsch */
/*! Deutsch */
 +(NSString *)German;

/*! 密码设置 */
/*! Setup password */
 +(NSString *)setting_password_module;

/*! SIM卡离线 */
/*! SIM card offline */
 +(NSString *)devicesetting_4G_card_sim_card_offline;

/*! 更改分组名称 */
/*! Change group name */
 +(NSString *)device_change_group_name;

/*! 1、开启了WiFi助手 */
/*! 1、 Opened the WiFi assistant */
 +(NSString *)adddevice_open_wifi_assistant;

/*! 账号 */
/*! Account */
 +(NSString *)account;

/*! 您想跟我们说些什么呢？ */
/*! What do you want to tell us? */
 +(NSString *)cloud_help_what_want_to_say;

/*! （%1$d相片，%2$d视频） */
/*! （%1$d pictures，%2$d videos） */
 +(NSString *)person_picture_video;

/*! 常看位置说明 */
/*! Preset Location Description */
 +(NSString *)preview_preset_description;

/*! 人脸侦测对场景有一定的适应性要求，请根据实际情况使用 */
/*! Face detection has certain adaptability requirements to the scene, and it is used according to the actual situation. */
 +(NSString *)devicesetting_face_detection_prompt;

/*! 新德里 */
/*! New Delhi */
 +(NSString *)Asia_Kolkata;

/*! %1$d个录像 */
/*! %1$d videos */
 +(NSString *)deviceSetting_videoBackup_loadNum;

/*! 人形侦测报警 */
/*! Humanoid detection alarm */
 +(NSString *)devicesetting_human_alarm;

/*! 基站配对超时 */
/*! Base station pairing timed out */
 +(NSString *)Addevice_pair_time_out;

/*! 部分崩溃文件上传失败 */
/*! Partial crash file upload failed */
 +(NSString *)person_set_Upload_crash_filing_failed;

/*! %@ - 次日%@关闭摄像机 */
/*! %@ - %@ turn off the camera the next day */
 +(NSString *)deviceSetting_evening_turn_off_next_morning_ios;

/*! 设备未保存，确定要退出吗？ */
/*! Device is not saved,exit? */
 +(NSString *)addSetting_tips;

/*! 更新中... */
/*! Updating */
 +(NSString *)Update_Updating;

/*! 准确的营业时间能为您增加更多的客户 */
/*! Accurate business hours can add more customers to you */
 +(NSString *)Service_map_time_demand;

/*! 当前存在已绑定云服务的离线设备，是否将该设备云服务迁移至新设备？ */
/*! Is there an offline device with a cloud service currently attached, and is the device cloud service migrated to the new device? */
 +(NSString *)cloud_migration_offline_device_prompt;

/*! 有人出现 */
/*! Human appears */
 +(NSString *)alarm_someone_show;

/*! 选择WiFi */
/*! Select WiFi */
 +(NSString *)adddevice_wifi_click_arrow;

/*! 已切换成离家模式 */
/*! Switched to away mode */
 +(NSString *)devicelist_switch_outhome_success;

/*! 隐私政策与版本信息移到这里了！ */
/*! The privacy policy and version information are moved here! */
 +(NSString *)me_Boot_prompt_1;

/*! 手机号已被绑定 */
/*! This cellphone number is bound */
 +(NSString *)password_bindingFailed_phone;

/*! 建议使用设备自带的电源适配器,使用外接电源如果电源不稳定可能会对设备造成损坏。 */
/*! It is recommended to use the power adapter that comes with the device. If you use an external power supply, the device may be damaged if the power supply is unstable. */
 +(NSString *)person_feedback_question_USB_detail;

/*! 请先开启推送警报消息 */
/*! Please enable push alert messages first */
 +(NSString *)devicesetting_enable_push_alert_first;

/*! 截图成功 */
/*! Screenshot succeeds */
 +(NSString *)play_screenshot_success;

/*! 隐私区设置 */
/*! Privacy area setting */
 +(NSString *)devicesetting_privacy_set;

/*! 方法2：进入个人中心“云商城”界面，选择“云存服务”①，点击云存信息跳转至云存详情页，点击“录像”②即可查看录像。 */
/*! Method 2:enter personal center \"cloud mall\" interface,choose \"cloud storage service\",click cloud storage info and redirect to details page,click \"recording\" and check recording. */
 +(NSString *)help_cloud_storage_textTips_8;

/*! 第一步：接通电源 */
/*! Step 1: turn on the power */
 +(NSString *)adddevice_turn_on_power;

/*! 输入门店名称 */
/*! Enter store name */
 +(NSString *)Service_map_Enter_store_name;

/*! 该时间段无报警信息 */
/*! No alarm message during this time period */
 +(NSString *)alarm_no_message_period;

/*! 建议关闭手机WLAN/WLAN+助理功能，否则会影响设备热点连接稳定性 */
/*! It is recommended to turn off the WLAN/WLAN+ assistant function of the mobile phone, otherwise it will affect the stability of the device hotspot connection. */
 +(NSString *)meDevice_shake_wlanaid_hint;

/*! 账号注销后，将清空所有信息和数据 */
/*! After the account is deleted, all information and data will be cleared */
 +(NSString *)person_information_data_cleared;

/*! 电话模式：实时双向对讲，双方能够同时进行说话和接收语音 */
/*! Telephone mode: real-time two-way intercom, both parties can talk and receive voice at the same time */
 +(NSString *)devicesetting_Telephone_mode_describe;

/*! 设置 */
/*! Settings */
 +(NSString *)setting;

/*! 更多 */
/*! More */
 +(NSString *)more;

/*! 选择录像模式 */
/*! Select recording mode */
 +(NSString *)Devicesetting_Select_recording_mode;

/*! (2)迁移过程： */
/*! (2) Migration process: */
 +(NSString *)cloud_help_migration_device_2;

/*! 感谢您的反馈，请对我们的服务做出评价 */
/*! Thanks for your feedback, please comment on our service */
 +(NSString *)person_feedback_comment_service;

/*! 通话结束 */
/*! call ended */
 +(NSString *)preview_call_ended;

/*! 通知栏推送：关闭应用通知则收到消息不会有任何展示； */
/*! Notification bar push: close the application notification, there will be no display of the received message; */
 +(NSString *)person_feedback_question_ROM_software_3_Notification;

/*! 正在录像中，请关闭后再操作 */
/*! Recording, please close before operating */
 +(NSString *)preview_close_recording_operate;

/*! %1$s只能在32位版本的APP上才能正常连接使用。您现在使用的是64位版本，请下载更新兼容版，否则设备无法连接成功 */
/*! %1$s can only be connected and used normally on the 32-bit version of the APP. You are using the 64-bit version now, please download the updated compatible version, otherwise the device cannot be connected successfully */
 +(NSString *)devicelist_download_compatible_version_detail;

/*! 基本资料 */
/*! Basic info */
 +(NSString *)userInfo_generalInfo;

/*! 为确保安全分享，请您为设备设置密码 */
/*! To ensure safe sharing, please set a password for the device */
 +(NSString *)share_device_set_password;

/*! 解锁成功 */
/*! Unlocked successfully */
 +(NSString *)devicesetting_unlock_success;

/*! 通过无线网络连接设备 */
/*! Connect the device via a wireless network */
 +(NSString *)adddevice_wireless_network_connection;

/*! 删除录像 */
/*! Delete the video */
 +(NSString *)devicesetting_Videobackup_Eliminar_video;

/*! 设置视频清晰度 */
/*! Select device\'s video quality */
 +(NSString *)clarity_content;

/*! 输入手机号 */
/*! Enter phone number */
 +(NSString *)login_enter_phone_number;

/*! 该设备已添加 */
/*! The device has been added */
 +(NSString *)addDevice_already_exists;

/*! 该功能需要登录后使用 */
/*! Log in and use this function */
 +(NSString *)local_mode_tips;

/*! 连接用户WiFi失败/搜索不到设备(独占) */
/*! Fail to connect WiFi/can\'t search device */
 +(NSString *)prompt_connectToWIFI_failed;

/*! 检查到最新版本，是否更新？ */
/*! Check latest version,update? */
 +(NSString *)me_version_updateAsk;

/*! 邮件接收警报消息 */
/*! Email alert message */
 +(NSString *)person_mail_receive_alert_messages;

/*! 冷色调 */
/*! Cool colors */
 +(NSString *)deviceSetting_Cool_colors;

/*! 在手机设置中连接IPC开头的WiFi后，返回APP观看视频 */
/*! After connecting the WiFi  of the beginning of IPC in the mobile phone Settings, return to the APP to watch the video */
 +(NSString *)addevice_set_connect_wifi;

/*! 检测到设备智能侦测已关闭，请前往设备设置开启智能侦测 */
/*! If it is detected that the motion detection function of the device has been turned off, please go to the device settings to enable motion detection */
 +(NSString *)devicelist_cloud_device_detecte_prompt;

/*! 关闭报警推送，手机将不再接收报警信息。 */
/*! Turn off the alarm push, the phone will no longer receive alarm messages. */
 +(NSString *)devicelist_Turn_off_alarm_push_phone_notreceive;

/*! 云存没有录像文件 */
/*! No recording file in cloud storage */
 +(NSString *)cloud_no_videoFiles;

/*! 原密码错误，请重新输入 */
/*! Original password is wrong,please input again. */
 +(NSString *)password_old_error;

/*! 密码不能为空 */
/*! Password cannot be empty */
 +(NSString *)Addevice_password_not_empty;

/*! 选择信道 */
/*! Choose Wi-Fi channel */
 +(NSString *)gwdeviceSetting_choose_signal_path;

/*! 2、手机和WiFi摄像机基站设备处于同一路由器？ */
/*! 2、 Is the mobile phone and the Base Station device on the same router? */
 +(NSString *)addDevice_help_text1;

/*! 切换为壁挂模式 */
/*! Switch to wall mode */
 +(NSString *)preview_switch_to_wall_mode;

/*! 设备存储 */
/*! Device storage */
 +(NSString *)devSettings_deviceStorage;

/*! 设备名 */
/*! Device name */
 +(NSString *)addDevice_name;

/*! 隐私区%ld */
/*! Privacy area %1d */
 +(NSString *)devicesetting_privacy_area_number_ios;

/*! 该位置未搜索到服务网点 */
/*! No service outlets were found at this location */
 +(NSString *)Service_map_no_service_point_here;

/*! 抱歉，促销套餐不能迁移至新设备 */
/*! Sorry, the promotional package cannot be migrated to a new device */
 +(NSString *)cloud_migration_cannot_promotion_package;

/*! 开启视频服务 */
/*! Open video service */
 +(NSString *)devicelist_open_video_button;

/*! 修改信道可能会提升信号表现 */
/*! Select a least interfered Wi-Fi channel to improve Wi-Fi performance */
 +(NSString *)deviceSetting_Modifying_channel_signal_performance;

/*! 云存库存不足 */
/*! Insufficient cloud inventory */
 +(NSString *)cloud_in_stock_prompt;

/*! 录像保存空间 */
/*! Video storage space */
 +(NSString *)cloud_video_save_space;

/*! 最多人配置的 */
/*! Most configured */
 +(NSString *)adddevice_most_configure;

/*! b.检查手机是否开启移动网络，手机卡是否停机； */
/*! b. Check if the mobile phone is turned on or if the mobile phone card is down. */
 +(NSString *)preview_no_video_check_mobile_data;

/*! 手电筒 */
/*! Flashlight */
 +(NSString *)adddevice_flashlight;

/*! 请确保摄像机、手机、路由器距离保持在1.5米以内。 */
/*! Please ensure that the distance between the camera, mobile phone and router is within 1.5 meters. */
 +(NSString *)adddevice_distance_requir_prompt;

/*! 您可以为用户提供上门安装、维修服务,服务价格由双方按当地市场价收费。 */
/*! You can provide users with door-to-door installation and maintenance services. The service price is charged by both parties at the local market price. */
 +(NSString *)Service_map_provide_installation;

/*! 调用常看位置：当摄像机处于其他位置时，点击调用摄像机会自动转向目标位置； */
/*! Call preset position: when the camera is in another position, click to call the camera will automatically turn to the target position; */
 +(NSString *)preview_preset_help_4;

/*! 您点击“同意”的行为即表示您已阅读完毕并同意以上协议的全部内容。 */
/*! The act of clicking \"Agree\" means that you have read and agreed to all the contents of the above agreement. */
 +(NSString *)login_explain_agree;

/*! 新增 */
/*! Newly add */
 +(NSString *)cloud_newly_add;

/*! 请选择您需要查看的订单类型 */
/*! Please select the type of order you want to view */
 +(NSString *)person_select_type_order_want_view;

/*! 是否取消该订单？ */
/*! Cancel order or not? */
 +(NSString *)cloud_tips_text_1;

/*! 第三步：听到设备发出“启动配置模式”提示音 */
/*! Step 3: Hear the device to issue the \"Startup Configuration Mode\" tone. */
 +(NSString *)adddevice_hear_tone_prompt;

/*! 连接的WiFi */
/*! Connected WiFi */
 +(NSString *)deviceSetting_Connected_WiFi;

/*! 已完成 */
/*! Completed */
 +(NSString *)completed;

/*! 云录像有效期为当前通道所有服务套餐时间之和，服务到期后将不再自动录像，且已上传的云录像将逐天删除。 */
/*! The cloud recording validity period is the sum of all the service packages of the current channel. After the service expires, it will no longer automatically record, and the uploaded cloud recording will be deleted day by day. */
 +(NSString *)cloud_validity_descriptinon;

/*! 在手机设置中连接“%1$s”的WiFi后，返回APP观看视频 */
/*! After connecting to the WiFi of \"%1$s\" in the phone settings, return to the APP to watch the video */
 +(NSString *)adddevice_connec_device_wifi_return_watch;

/*! 2.异常动态发生期间出现断网或者网络差导致云录像无法上传； */
/*! 2. During the abnormal dynamic occurrence, there is a network disconnection or a poor network, and the cloud video cannot be uploaded; */
 +(NSString *)person_feedback_question_video_incomplete_2;

/*! 无TF卡 */
/*! No TF card */
 +(NSString *)tfCard_nothing;

/*! 蒙得维的亚/乌拉圭 */
/*! America/Montevideo */
 +(NSString *)America_Montevideo;

/*! 天 */
/*! days */
 +(NSString *)cloud_days;

/*! 添加电池摄像机 */
/*! Add battery camera */
 +(NSString *)adddevice_device_scan_code_add;

/*! 设备通道云存已续费 */
/*! Device channel cloud has been renewed */
 +(NSString *)devicelist_alarm_push_channel_Renewal_fee;

/*! 录制时间太长 */
/*! Recording time is too long */
 +(NSString *)deviceSetting_time_too_long_prompt;

/*! APP将截取音频文件前10s作为自定义报警提示音，请确定是否选择该音频文件？ */
/*! The APP will intercept the audio file for the first 10s as a custom alarm tone. Please decide whether to select the audio file? */
 +(NSString *)deviceSetting_custom_tone_record_select_phone_decide;

/*! 请检查网络状态和WiFi密码是否正确 */
/*! Please check if the network status and WiFi password are correct */
 +(NSString *)devicesetting_network_status_WiFi_password;

/*! 删除后对方将无法预览设备 */
/*! Users can\'t view the device after deleting */
 +(NSString *)me_device_share_delete_tips;

/*! 设置视频色彩 */
/*! Select device\'s night vision color */
 +(NSString *)set_video_color;

/*! 安装模式不同影响镜头方向角度不同 */
/*! Different installation mode affects the lens direction angle is different */
 +(NSString *)devicesetting_Installation_mode_describe;

/*! 1.设备有电； */
/*! 1. The device is powered on; */
 +(NSString *)devicesetting_4G_card_sim_card_device_has_electricity;

/*! 霍巴特 */
/*! Australia/Hobart */
 +(NSString *)Australia_Hobart;

/*! 崩溃文件上传中 */
/*! Crash file is uploading */
 +(NSString *)person_set_Upload_crash_filing;

/*! 侦测到移动物体时唤醒录像 */
/*! Wake up the camera and start recording when a moving object is detected */
 +(NSString *)devicesetting_Longest_battery_life_Description;

/*! 基站型号 */
/*! Base station model */
 +(NSString *)devicesetting_basestation_model;

/*! 2.查看设备是否已连接网络 */
/*! 2. Check if the device is connected to the network. */
 +(NSString *)adddevice_check_device_network;

/*! Q1：4G卡摄像机有哪些优点 */
/*! Q1: What are the advantages of 4G card camera */
 +(NSString *)person_feedback_question_4G_card_camera_advantages;

/*! 云服务 */
/*! Cloud service */
 +(NSString *)cloud_service;

/*! 运营商尚未对接 */
/*! The operator has not yet docked */
 +(NSString *)devicesetting_4G_card_operator_not_dock;

/*! 此公众号用于接收消息推送 */
/*! This official account is used to receive push notifications */
 +(NSString *)person_receive_push;

/*! 正在添加… */
/*! Adding... */
 +(NSString *)add_being;

/*! 未配对 */
/*! Unpaired */
 +(NSString *)devicelist_Unpaired;

/*! 不使用LED白光灯，夜晚只使用红外黑白夜视。 */
/*! Use Infrared LEDs at night. The camera sees B/W IR night image at night. */
 +(NSString *)deviceSetting_infrared_night_vision_describe;

/*! 请输入手机号，进行帐号绑定，绑定后可通过手机号重置密码。 */
/*! Please input cellphone number and bind the account,and then can use cellphone number to change password. */
 +(NSString *)password_bindingAndReset;

/*! 1、请检查摄像机通电状态是否良好 */
/*! 1、 Please check if the camera is powered on. */
 +(NSString *)devicelist_defense_offline_help_1;

/*! 请检查以下问题 */
/*! Please check the following questions */
 +(NSString *)playback_check_following_questions;

/*! *请确保手机GPS与WiFi权限已开启。 */
/*! * Please make sure your phone\'s GPS and WiFi permissions are turned on. */
 +(NSString *)help_addDevice_textTips_11;

/*! 对讲 */
/*! Microphone */
 +(NSString *)preview_intercom;

/*! 2、尝试将摄像机重置后重新对码添加 */
/*! 2、Try to match code again after reset the camera  */
 +(NSString *)devicelist_defense_offline_help_2;

/*! 等待连接... */
/*! Waiting for connection... */
 +(NSString *)addDevice_Waiting_for_connection;

/*! 时间选择 */
/*! Time selecttion */
 +(NSString *)devicesetting_time_select;

/*! 贝鲁特/东欧 */
/*! Asia/Beirut */
 +(NSString *)Asia_Beirut;

/*! %1$d个任务 */
/*! %1$d tasks */
 +(NSString *)add_smart_scenes_task;

/*! 不会停止录像。AP存储卡录像功能支持循环录制，当存储卡录满以后，摄像机会自动删除老的视频文件，写入新的视频文件。 */
/*! Will not stop recording. The recording function of the AP memory card supports loop recording. When the memory card is full, the camera will automatically delete the old video files and write new ones. */
 +(NSString *)person_feedback_question_card_full_detail;

/*! 用户名或密码错误 */
/*! Wrong user name or password */
 +(NSString *)devicelist_wrong_user_name_password;

/*! 个月 */
/*! month */
 +(NSString *)cloud_service_time_length;

/*! 国产安卓手机可能会禁止本应用使用数据、WLAN、GPS的权限，导致摄像机无法连上WiFi。解决方案（安卓手机）：打开手机设置中心—点击“应用管理”—开启上述权限 */
/*! Domestic Android phones may prohibit the use of data, WLAN, GPS permissions for this application, resulting in the camera being unable to connect to WiFi. Solution (Android phone): Open the phone settings center-click \"application management\"-open the above permissions */
 +(NSString *)person_feedback_question_check_data_detail;

/*! ”无线和网络，并开启。 */
/*! \"Wireless and networks, and turned on. */
 +(NSString *)addevice_wireless_network;

/*! 允许APP获取文件读写权限，才能正常下载录像 */
/*! Allow the APP to obtain file read and write permissions to download the video normally */
 +(NSString *)permissions_file_read_write_download;

/*! 登录日志 */
/*! Login log */
 +(NSString *)person_login_log;

/*! 格式化TF卡会清空所有录像是否需要执行 */
/*! Formatting the TF card will clear all the recordings. Does it need to be executed? */
 +(NSString *)deviceSetting_Formatting_TFcard_clear_recording;

/*! 打开GPS */
/*! Turn on GPS */
 +(NSString *)adddevice_turn_on_gps;

/*! 密码长度不能大于20位 */
/*! Password is more than 20 characters */
 +(NSString *)password_tips_length;

/*! 通过网线连接设备 */
/*! Connect the device via a network cable */
 +(NSString *)adddevice_connect_via_cable;

/*! 检测到您长时间未扫码成功，建议使用其它添加方式 */
/*! It is detected that you have not scanned the QR code successfully for a long time, it is recommended to use other ways to add */
 +(NSString *)adddevice_long_time_prompt;

/*! 请将App上的二维码对准摄像机镜头，距离镜头大约15~25cm。若摄像机没有发出提示音，请调整角度（摄像机与手机夹角小于60度时成功率更高）、距离，多试几次； */
/*! Please align the QR code on the App with the camera lens, about 15~25cm away from the lens. If the camera does not emit a prompt, please adjust the angle (the success rate is higher when the angle between the camera and the phone is less than 60 degrees), distance, and try several times; */
 +(NSString *)addDevice_no_sound_help_2;

/*! 选择夏时令 */
/*! Select daylight Saving Time */
 +(NSString *)devSetting_choose_daylightTime;

/*! 请在视频区域绘制警戒线 */
/*! Please draw a warning line in the video area */
 +(NSString *)devicesetting_draw_warn_line;

/*! OPPO[ColorOS] */
/*! OPPO [ColorOS] */
 +(NSString *)person_feedback_question_ROM_software_oppo;

/*! 需要获取定位服务权限，方便用户在分享视频时选取位置。 */
/*! Location service permissions are required so that users can choose a location when sharing a video. */
 +(NSString *)NSLocationWhenInUseUsageDescription;

/*! 报警消息推送 */
/*! Push notification */
 +(NSString *)alarmMessage_messagePush;

/*! 添加分享设备失败 */
/*! Fail to add and share device */
 +(NSString *)add_share_device_failed;

/*! %ld天 */
/*! %ld Day */
 +(NSString *)day_ios;

/*! 松开立即刷新 */
/*! Release to refresh */
 +(NSString *)MJRefreshHeaderPullingText;

/*! 回放通道 */
/*! Playback channel */
 +(NSString *)preview_playback_channel;

/*! Q3:观看录像回放需要拔出存储卡在电脑上看吗？ */
/*! Q3: Do I need to remove the memory card and watch the video playback on the computer? */
 +(NSString *)person_feedback_question_type_memory_card_playback;

/*! 东加塔布 */
/*! Pacific/Tongatapu */
 +(NSString *)Pacific_Tongatapu;

/*! 一键执行 */
/*! One-click execution */
 +(NSString *)add_smart_scenes_task_One_click_execution;

/*! 确定 */
/*! Confirm */
 +(NSString *)confirm;

/*! 您可以通过以下方式联系工作人员解决您遇到的问题 */
/*! You can contact the staff to solve your problem through the following ways */
 +(NSString *)Service_map_solve_your_problem;

/*! 订单 */
/*! Order */
 +(NSString *)cloud_myOrder;

/*! 开始时间必须小于结束时间 */
/*! Start time must to be less than end time */
 +(NSString *)devSettings_schedule_error_timeComparing;

/*! 当前存在隐私区域未保存，是否确定退出？ */
/*! Currently there is a private area that has not been saved. Are you sure to quit? */
 +(NSString *)devicesetting_privacy_Save_inquiry;

/*! 视频丢失 */
/*! Video loss */
 +(NSString *)play_video_loss;

/*! 网线连接 */
/*! Network cable connection */
 +(NSString *)adddevice_Network_cable_connection;

/*! 摄像机命名 */
/*! Camera naming */
 +(NSString *)addDevice_Camera_naming;

/*! 尊敬的用户，您好！感谢您使用我司智能监控产品，4G卡已激活，赠送您1G流量，有效期为15天，为保障您的正常使用，请及时充值。 */
/*! Dear users, Hello! Thank you for using our intelligent monitoring products. The 4G card has been activated and you are given 1G data for a period of 15 days. To ensure your normal use, please recharge in time. */
 +(NSString *)devicelist_pop_4G_traffic;

/*! 不是所有的设备都支持光学变倍和光学对焦功能，请先确认设备支持再开启，否则按钮功能无法生效 */
/*! Not all devices support the optical zoom and optical focus function, please confirm the device support before opening, otherwise the button function can not take effect */
 +(NSString *)deviceSetting_Zoom_and_focus_button_describe;

/*! 重新输入 */
/*! re-enter */
 +(NSString *)login_wrong_password_enter_again;

/*! 解绑失败，请检查网络是否良好 */
/*! unbundle failed, please check if the network is good. */
 +(NSString *)person_unbundle_fail;

/*! 正在通话中，请挂断后再使用警报器 */
/*! You are on a call, please hang up before using the siren */
 +(NSString *)Preview_call_hangup_using_siren;

/*! 请先安装支付宝 */
/*! Please install Alipay first. */
 +(NSString *)Cloud_storage_service_install_alipay;

/*! 固件升级 */
/*! Firmware upgrade */
 +(NSString *)devicelist_firmware_upgrade;

/*! 将设备通过网线连接至路由器 */
/*! Connect the device to the router through a network cable */
 +(NSString *)adddevice_connect_router;

/*! 电话 */
/*! Telephone */
 +(NSString *)Service_map_Telephone;

/*! 某些手机型号需要关闭4G、移动网络，才能配置成功 */
/*! Some mobile phone models need to be turned off 4G and mobile network to be configured successfully. */
 +(NSString *)adddevice_open_4G_detail;

/*! WiFi列表选择“IPC_XXXX”网络并连接，设备WiFi初始密码为11111111 */
/*! WiFi list selects \"IPC_XXXX\" network and connects, the device WiFi initial password is 11111111 */
 +(NSString *)adddevice_wifi_list_select;

/*! 对讲音频问题 */
/*! Intercom audio issues */
 +(NSString *)person_feedback_intercom_audio_issues;

/*! 墨哥城/美国中部 */
/*! America/Mexico City */
 +(NSString *)America_Mexico_City;

/*! 请按住话筒录制提示音 */
/*! Please press and hold the microphone to record the prompt tone */
 +(NSString *)devicesetting_press_microphone_record_tone;

/*! 全天推送 */
/*! Push all day */
 +(NSString *)deviceSetting_Push_all_day;

/*! 设备开关 */
/*! Device Switch */
 +(NSString *)Lead_page_4;

/*! 云录像开关 */
/*! Cloud video switch */
 +(NSString *)Cloud_storage_service_video_switch;

/*! 更换设备 */
/*! Replace Device */
 +(NSString *)orderDetailChangeDevice;

/*! 设备名称或者ID */
/*! Device name or ID */
 +(NSString *)person_feedback_device_name_id;

/*! 邮箱地址格式错误 */
/*! Email address format error */
 +(NSString *)person_email_address_format_error;

/*! 今天 */
/*! Today */
 +(NSString *)MJRefreshHeaderDateTodayText;

/*! 设备已离线 */
/*! Device is offline */
 +(NSString *)devicelist_Device_offline;

/*! 正在下载 */
/*! Downloading */
 +(NSString *)deviceSetting_videoBackup_loading;

/*! 关注“%@”公众号 */
/*! Follow the\"%@\" public account */
 +(NSString *)person_follow_public_account_IOS;

/*! 用户友好型支付 */
/*! User-friendly payment */
 +(NSString *)cloud_pay_stripe_prompt;

/*! Français */
/*! Français */
 +(NSString *)French;

/*! 周末 */
/*! Weekend */
 +(NSString *)deviceSetting_weekend;

/*! 云存设备 */
/*! Cloud storage device */
 +(NSString *)cloud_Cloud_storage_device;

/*! 设置尚未保存，是否确定保存？ */
/*! The settings have not been saved. Are you sure to save? */
 +(NSString *)setting_tips_save;

/*! 通过ID/IP添加 */
/*! Add by ID/IP */
 +(NSString *)addDevice_networked;

/*! 激活成功 */
/*! Activated successfully */
 +(NSString *)devicesetting_4G_card_sim_card_activated_success;

/*! 设备“%1$s”正在升级，大约需要1-2分钟，请不要离开 */
/*! The device \"%1$s\" is being upgraded, it will take about 1-2 minutes, please do not leave */
 +(NSString *)devicelist_upgraded_linkvisual;

/*! 总容量%@ */
/*! Total capacity %@ */
 +(NSString *)deviceSetting_Total_capacity_ios;

/*! 消息较多可设置较大间隔减少干扰 */
/*! If there are more messages, you can set a larger interval to reduce interference */
 +(NSString *)deviceSetting_Message_interval_describe;

/*! 请输入联系电话 */
/*! Please type your phone number */
 +(NSString *)Service_map_type_your_phone_number;

/*! 正在重新获取云存状态... */
/*! Regaining cloud status... */
 +(NSString *)cloud_regain;

/*! 黑白 */
/*! Black and white */
 +(NSString *)black_and_white;

/*! 保存二维码至手机 */
/*! Save the QR code to the phone */
 +(NSString *)person_save_qr_code_to_phone;

/*! 对讲中 */
/*! In the intercom */
 +(NSString *)preview_In_the_intercom;

/*! 关机 */
/*! Shutdown */
 +(NSString *)devicelist_Shutdown;

/*! 消息 */
/*! News */
 +(NSString *)massage;

/*! 报警提示音 */
/*! Alarm prompt tone */
 +(NSString *)devSetting_motion_tips;

/*! 将切换为离家模式，智能侦测会自动录像 */
/*! Will switch to away from home mode, motion detection will automatically record */
 +(NSString *)devicelist_outhome_prompt;

/*! 复制成功 */
/*! Copy success */
 +(NSString *)copy_success;

/*! 密码格式错误 */
/*! Password format is wrong */
 +(NSString *)devicelist_Password_format_wrong;

/*! 布拉扎维/西部⾮非洲 */
/*! Africa/Brazzaville */
 +(NSString *)Africa_Brazzaville;

/*! 审核中 */
/*! Under review */
 +(NSString *)Service_map_Under_review;

/*! 是否已完成支付？ */
/*! Has the payment been completed? */
 +(NSString *)cloud_payment_be_completed;

/*! 使用中 */
/*! Using */
 +(NSString *)devicesetting_4G_card_package_using;

/*! 密码修改成功，下次登录生效。 */
/*! Change password successfully. it takes effect in next login */
 +(NSString *)userInfo_password_tips_text_2;

/*! 迁移 */
/*! Migrate */
 +(NSString *)cloud_migration_button;

/*! 正在连接中... */
/*! Connecting ... */
 +(NSString *)addDevice_connecting_wifi;

/*! 选择视频宽高比 */
/*! Select video aspect ratio */
 +(NSString *)person_preview_video_size;

/*! %1$s - 次日%2$s推送消息 */
/*! %1$s - %2$s push message the next day */
 +(NSString *)deviceSetting_Push_night_time_android;

/*! 设备警报声 */
/*! Equipment siren */
 +(NSString *)devicesetting_Equipment_alarm;

/*! 自动夜视 */
/*! Auto night vision */
 +(NSString *)preview_automatic_night_vision;

/*! ￥%1$.2f */
/*! ￥%1$.2f */
 +(NSString *)total;

/*! 已绑定微信账号 */
/*! WeChat account has been bound */
 +(NSString *)person_bind_wechat_account;

/*! Walmart */
/*! Walmart */
 +(NSString *)help_Walmart;

/*! 修改网点信息 */
/*! Modify outlet information */
 +(NSString *)service_map_modify_outlet_info;

/*! 圆心2： */
/*! Center 2: */
 +(NSString *)devicesetting_Video_center_correction_center_tow;

/*! 允许APP获取位置权限才能正常添加设备 */
/*! Allow the app to obtain location permissions to add devices normally */
 +(NSString *)permissions_location_add_devices;

/*! VIDEO */
/*! VIDEO */
 +(NSString *)text_VIDEO;

/*! 通道1 */
/*! Channel 1 */
 +(NSString *)channel_one;

/*! 前往设置 */
/*! Go to settings */
 +(NSString *)adddevice_go_to_set;

/*! 绑定设备 */
/*! Bind device */
 +(NSString *)equipment_binding;

/*! Solar Camera */
/*! Solar Camera */
 +(NSString *)help_Solar_Camera;

/*! 请点击右下角“+”添加时间段 */
/*! Please click the \"+\" in the lower right corner to add a time period */
 +(NSString *)deviceSetting_time_click_add_time;

/*! 只需三步，轻松绑定 */
/*! Only three steps, easy binding */
 +(NSString *)person_bind_wechat_steps;

/*! 远程回放 */
/*! Playback */
 +(NSString *)playback;

/*! 1.请使用2.4GHZ WiFi进行连接 */
/*! 1.Please use 2.4GHZ WiFi to connect */
 +(NSString *)adddevice_network_4G_prompt;

/*! 常看位置巡航功能需存在两个以上常看位置才能正常使用，请前往预览-常看位置中添加。 */
/*! The preset position cruise function requires more than two preset positions to be used normally, please go to the preview-preset positions to add. */
 +(NSString *)devicesetting_preset_position_cruise_two_used_normally;

/*! 在没有灯光的夜晚或光线较差的白天，自动切换红外夜视模式 */
/*! In the night when there is no light or during the day when the light is poor, the infrared night vision mode is automatically switched */
 +(NSString *)deviceSetting_night_light_poor_infrared_automatically_switched;

/*! 剩余容量：%@/ 总容量：%@ */
/*! Remaining capacity: %@/ Total capacity: %@ */
 +(NSString *)deviceSetting_Remaining_capacity_Total_capacity_ios;

/*! 固定巡航轨迹，水平360°全方位看护 */
/*! Fixed cruising trajectory, horizontal 360° all-round care */
 +(NSString *)deviceSetting_Fixed_cruising_trajectory_horizontal_care;

/*! 立即续费 */
/*! Immediate renewal */
 +(NSString *)cloud_immediately_renewal;

/*! 人形或移动触发 */
/*! Humanoid or mobile trigger */
 +(NSString *)devicesetting_indoor;

/*! 局域网或者ID添加时，提示“设备不在线”或“设备未注册”？ */
/*! When added by LAN or cloud ID,indicate \"device is not online\" or \"device is not registered\" */
 +(NSString *)help_normal_problem_text_1;

/*! 配置开关 */
/*! Configuration switch */
 +(NSString *)devicesetting_Configuration_switch;

/*! 对讲模式：通过发送语音进行对讲，一方说话过程中无法接收对方语音 */
/*! Intercom mode: intercom by sending voice, one party cannot receive the other party\'s voice while speaking */
 +(NSString *)devicesetting_Intercom_mode_describe;

/*! IMG */
/*! IMG */
 +(NSString *)text_IMG;

/*! 未格式化 */
/*! Not formatted */
 +(NSString *)tfCard_noFormat;

/*! 连接成功 */
/*! Connection succeeds */
 +(NSString *)device_connectSuccess;

/*! 快速命名 */
/*! Quick naming */
 +(NSString *)adddevice_set_device_name_speed;

/*! 未找到附近设备，建议使用手动添加设备 */
/*! No nearby devices found, it is recommended to add devices manually */
 +(NSString *)adddevice_fail_prompt;

/*! 允许音频权限，才能正常对讲 */
/*! Allow audio permissions for normal intercom */
 +(NSString *)preview_allow_audio_permission;

/*! 正常 */
/*! Normal */
 +(NSString *)tfCard_normal;

/*! 人形标记 */
/*! Humanoid marker */
 +(NSString *)devicesetting_humanoid_picture;

/*! Lightinthebox */
/*! Lightinthebox */
 +(NSString *)help_Lightinthebox;

/*! 注册 */
/*! Register */
 +(NSString *)register;

/*! 车库 */
/*! Garage */
 +(NSString *)addDevice_Garage;

/*! 分享 */
/*! Share */
 +(NSString *)share;

/*! 请输入您的姓名 */
/*! Please enter your name */
 +(NSString *)person_feedback_enter_your_name;

/*! 没有权限 */
/*! No permission */
 +(NSString *)competence_lack;

/*! 添加智能设备 */
/*! Add smart device */
 +(NSString *)devicelist_add_smart_device;

/*! 洛杉矶/美国太平洋 */
/*! America/Los Angeles */
 +(NSString *)America_Los_Angeles;

/*! 修复失败 */
/*! Repair failed */
 +(NSString *)devicesetting_repair_fail;

/*! 日历：选择需要回放的时间，点击确定后显示当天所有录像段 */
/*! Calendar:choose playback time to show all recording files wanted */
 +(NSString *)help_preview_ttextTips_6;

/*! 云存储 */
/*! Cloud storage */
 +(NSString *)cloud_storage;

/*! 号码 */
/*! Number */
 +(NSString *)devicesetting_number;

/*! 试用流量即将过期 */
/*! Trial traffic is about to expire */
 +(NSString *)alarmmessage_trial_traffic_expire;

/*! 正在加载 */
/*! Loading */
 +(NSString *)loading_1;

/*! 下载回放视频 */
/*! Download playback video */
 +(NSString *)playback_View_all_playbacks;

/*! 清理缓存 */
/*! Clear cache */
 +(NSString *)person_set_clean_cache;

/*! 通电后对准设备机身 */
/*! Align the device body after power on */
 +(NSString *)adddevice_align_device_body;

/*! 设备热点连接成功 */
/*! Device hotspot connection succeeded */
 +(NSString *)addevice_device_hotspot_connect_success;

/*! %1$s - 次日%2$s关闭摄像机 */
/*! %1$s - next day %2$s off camera */
 +(NSString *)deviceSetting_evening_turn_off_next_morning_android;

/*! 已绑定 */
/*! Already bind */
 +(NSString *)me_binding;

/*! 时 */
/*! Time */
 +(NSString *)deviceSetting_videoBackup_startTimeHH;

/*! 查询流量套餐失败 */
/*! Querying the data plan failed */
 +(NSString *)adddevice_query_data_fail;

/*! 使用帮助 */
/*! Use help */
 +(NSString *)Stand_alone_station_use_help;

/*! 二维码加载失败，请点击刷新 */
/*! The QR code failed to load, please click refresh */
 +(NSString *)adddevice_QR_code_load_fail;

/*! 白光灯警报 */
/*! Warning light */
 +(NSString *)Devicesetting_white_light_alert;

/*! 基站类型 */
/*! Base station type */
 +(NSString *)devicesetting_basestation_type;

/*! 设备初始化 */
/*! Device initialization */
 +(NSString *)adddevice_device_initial;

/*! 图像采集率 */
/*! Image acquisition rate */
 +(NSString *)devSetting_acquisition;

/*! IP格式错误 */
/*! IP format is wrong */
 +(NSString *)addDevice_IP_formatFail;

/*! 去购买 */
/*! Buy */
 +(NSString *)playback_go_buy_cloud;

/*! 查看录像 */
/*! View video */
 +(NSString *)person_View_video;

/*! 结束时间必须晚于开始时间 */
/*! The end time must be later than the start time */
 +(NSString *)devicesetting_end_time_later_start_time;

/*! 订单支付失败 */
/*! Fail to pay */
 +(NSString *)payment_failed;

/*! 提示 */
/*! Hint */
 +(NSString *)hint;

/*! 设备密码错误 */
/*! Device password error */
 +(NSString *)devicelist_device_password_error;

/*! App需要访问蓝牙 */
/*! App need to access bluetooth */
 +(NSString *)access_bluetooth;

/*! 购买时间： */
/*! Purchase time: */
 +(NSString *)devicesetting_4G_card_management_purchase_time;

/*! 已下载成功 */
/*! Successfully downloaded */
 +(NSString *)playback_download_successfully;

/*! 打开布防后，将开启设备报警录像功能 */
/*! After the alarm is enabled, the alarm recording function of the device will be turned on. */
 +(NSString *)devicelist_open_arming_prompt;

/*! 常看位置名称不能相同 */
/*! Preset location names cannot be the same */
 +(NSString *)preview_preset_name_unsame;

/*! 重新获取验证码 */
/*! Get verification code again */
 +(NSString *)verify_obtain_again;

/*! ③ 连接设备热点：WiFi列表选择“IPCXXX”网络连接，初始密码为11111111 */
/*! ③ Connect to the device hotspot :WiFi list selects \"IPCXXX\" network connection, the initial password is 11111111 */
 +(NSString *)adddevice_select_network;

/*! 已下载%@个 */
/*! %@ downloaded */
 +(NSString *)playback_downloaded_ios;

/*! 设备 */
/*! Device */
 +(NSString *)devicelist_device;

/*! 意见反馈 */
/*! Feedback */
 +(NSString *)person_feedback;

/*! 下载中(%@) */
/*! Downloading(%@) */
 +(NSString *)Playback_downloading_backup_ios;

/*! 选择注册类型 */
/*! Select registration type */
 +(NSString *)Service_map_Select_registration_type;

/*! 国家 */
/*! Country */
 +(NSString *)devSetting_country;

/*! 需要获取定位服务权限，方便用户在分享视频时选取位置。 */
/*! Location service permissions are required so that users can choose a location when sharing a video. */
 +(NSString *)NSLocationUsageDescription;

/*! 输入WiFi密码 */
/*! Enter WiFi password */
 +(NSString *)adddevice_input_wifi_password;

/*! 抱歉，由于您的“%1$s”正在使用非云存专属流量套餐，将不再上传云录像，如需继续上传，请前往4G商城购买云存流量专属套餐。 */
/*! Sorry, as your \"%1$s\" is using a non-Cloud Storage exclusive traffic package, it will no longer upload cloud video, if you want to continue uploading, please go to 4G Mall to purchase a Cloud Storage exclusive traffic package. */
 +(NSString *)devicesetting_Sorry_Cloud_Storage_exclusive_traffic_package;

/*! 注册即同意 */
/*! Registration agree */
 +(NSString *)register_agreement;

/*! 好的 */
/*! Ok */
 +(NSString *)add_smart_scenes_task_ok;

/*! 门铃推送 */
/*! Doorbell push */
 +(NSString *)person_alarm_Doorbell_push;

/*! 全彩 */
/*! Full color */
 +(NSString *)color_full;

/*! 填写反馈 */
/*! Fill in feedback */
 +(NSString *)cloud_feedback_fillIn;

/*! 设置常看位置 */
/*! Set preset positions */
 +(NSString *)preview_set_preset;

/*! 网速 */
/*! Speed */
 +(NSString *)deviceSetting_videoBackup_networkRate;

/*! 再次购买 */
/*! Purchase again */
 +(NSString *)cloud_purchase_again;

/*! %@云存录像开启成功 */
/*! %@Cloud storage video is successfully opened */
 +(NSString *)devicelist_cloud_success_prompt_ios;

/*! a.添加设备成功后，若设备符合服务迁移条件，弹出迁移提示框，确定后跳转至迁移界面； */
/*! After the device is successfully added, if the device meets the service migration criteria, the migration prompt box is displayed. After the determination, the device jumps to the migration interface. */
 +(NSString *)cloud_help_migration_device_a;

/*! 反馈 */
/*! Feedback */
 +(NSString *)feedback;

/*! 输入账号 */
/*! Enter the account number */
 +(NSString *)cloud_enter_account;

/*! 关闭定时录像将会清空您的录像日程，请确定是否关闭 */
/*! Turning off timed recording will clear your recording schedule, please confirm whether to turn it off */
 +(NSString *)Devicesetting_Turn_off_timed_record_clear_schedule;

/*! 单独设置推送时间段 */
/*! Set the push time period separately */
 +(NSString *)Devicesetting_set_push_time_period_separately;

/*! 摄像机校准成功 */
/*! Camera calibration successful */
 +(NSString *)devicesetting_camera_calibration;

/*! 新的反馈 */
/*! New feedback */
 +(NSString *)Help_new_feedback;

/*! 其他添加方式 */
/*! Other ways to add */
 +(NSString *)adddevice_other_way;

/*! 工作时间未选择 */
/*! Working hours not selected */
 +(NSString *)service_work_hours_not_select;

/*! 预览失败，请检查网络状态 */
/*! Preview failed, please check the network status */
 +(NSString *)Preview_fail_check_network;

/*! 您还未成功设置侦测区，确定是否关闭自定义侦测区 */
/*! You have not successfully set the detection area, please confirm whether to close the custom detection area */
 +(NSString *)devicesetting_not_successfully_set_detection;

/*! ID添加 */
/*! ADD by ID */
 +(NSString *)addDevice_ID_addition;

/*! 请检查基站连接的网络是否可正常上网。 */
/*! Please check whether the network connected to the base station can access the Internet normally. */
 +(NSString *)Addevice_check_basestation_network;

/*! 云存迁移 */
/*! Cloud storage migration */
 +(NSString *)cloud_migration;

/*! 是否清除当前所有隐私区域？ */
/*! Whether to clear all current privacy zone? */
 +(NSString *)devicesetting_clear_all_privacy_zone;

/*! 暂不支持此功能 */
/*! This feature is not currently supported */
 +(NSString *)Devicesetting_feature_not_currently_supported;

/*! 客服 */
/*! Live Chat */
 +(NSString *)person_online_service;

/*! 云台转动速度 */
/*! PTZ rotation speed */
 +(NSString *)deviceSetting_PTZ_rotation_speed;

/*! %1$s天存储/移动侦测录像 */
/*! %1$s days storage/motion detection recording */
 +(NSString *)deviceSetting_days_storage_motion_detection;

/*! 需要访问你的相册 */
/*! Need access to your photo album */
 +(NSString *)NSPhotoLibraryAddUsageDescription;

/*! 说明： */
/*! Description: */
 +(NSString *)adddevice_deecription;

/*! 休眠转向 */
/*! Hibernation shift */
 +(NSString *)deviceSetting_Hibernation_shift;

/*! 方法2：打开APP，在设备列表中点击“+”添加按钮。 */
/*! Method 2: start APP,click \"+\" on device list interface */
 +(NSString *)help_addDevice_textTips_4;

/*! 局域网扫描 */
/*! LAN scan */
 +(NSString *)scan_LAN;

/*! 一次只使用一个套餐，若您对某个设备通道购买了多个套餐，云录像有效期为所有套餐时间之和，页面顶部显示的套餐数据为当前正在使用中的套餐剩余天数。 */
/*! Only one package is used at a time. If you purchase multiple packages for a certain device channel, the cloud recording period is the sum of all package times. The package data displayed at the top of the page is the remaining days of the package currently in use. */
 +(NSString *)cloud_package_use_one_by_one;

/*! 预览模式 */
/*! Preview mode */
 +(NSString *)person_setting_previreMode;

/*! 下拉刷新 */
/*! Pull down to refresh */
 +(NSString *)cloud_pull_down_refresh;

/*! 隐私区域支持大小改变和位置移动 */
/*! Privacy area supports size changes and location movement */
 +(NSString *)devicesetting_privacy_Description;

/*! 选择报警消息时间 */
/*! Select alarm message time */
 +(NSString *)person_alarm_selct_time_news;

/*! 关注成功后，必须在公众号中使用当前账号登录 */
/*! After the follow-up is successful, you must log in with the current account in the official account */
 +(NSString *)person_follow_prompt;

/*! 提交反馈 */
/*! Submit feedback */
 +(NSString *)cloud_submitFeedback;

/*! 您的新设备支持使用天猫精灵控制摄像机以及查看画面，绑定授权后即可使用 */
/*! Your new device supports the use of Tmall Genie to control the camera and view the screen, and you can use it after binding the authorization */
 +(NSString *)devicelist_Tmall_Elf_describe;

/*! 小时前 */
/*! hours ago */
 +(NSString *)person_hour_ago;

/*! 暂无查看回放权限 */
/*! No viewing and playback permissions yet */
 +(NSString *)devicelist_no_permissions_view_playback;

/*! 查看店铺信息 */
/*! View store information */
 +(NSString *)Service_map_View_store_info;

/*! 云录像开启失败，请前往APP手动开启。 */
/*! Cloud recording failed to open, please go to APP to open it manually. */
 +(NSString *)cloud_record_open_fail;

/*! 订单记录 */
/*! Order record */
 +(NSString *)Cloud_storage_service_order_record;

/*! 请开启“智能侦测警报”开关再进行相关操作 */
/*! Please turn on the \"Motion Detection Alarm\" switch before performing related operations */
 +(NSString *)devicesetting_turn_Smart_Detection_Alarm_operations;

/*! 有人敲响了你的门铃 */
/*! Human ringed your doorbell */
 +(NSString *)devicelist_Doorbell_device_Push;

/*! ICCID */
/*! ICCID */
 +(NSString *)devicesetting_4G_card_ICCID;

/*! 奇瓦瓦 */
/*! America/Chihuahua */
 +(NSString *)America_Chihuahua;

/*! 云台 */
/*! PTZ */
 +(NSString *)preview_ptz;

/*! 选择提示音内容 */
/*! Select the sound content */
 +(NSString *)devicesetting_select_sound_concontent;

/*! 休眠时唤醒设备出图较慢，请耐心等待 */
/*! It is slow to wake up the device during sleep, so please be patient */
 +(NSString *)preview_wake_camera_prompt;

/*! 设备密码错误，请修改成正确密码后再重试！ */
/*! Wrong device password,please revise and try again. */
 +(NSString *)password_errorAndRetry_again;

/*! 技术与售后支持： */
/*! Technical and after-sales support: */
 +(NSString *)Official_Technical_support;

/*! 时区设置 */
/*! Time zone setting */
 +(NSString *)deviceSetting_Time_zone_setting;

/*! 设备音量 */
/*! Device volume */
 +(NSString *)devicesetting_device_volume;

/*! 2、云存有哪些优点？ */
/*! 2、 What are the advantages of cloud storage? */
 +(NSString *)cloud_storage_details_advantages;

/*! 本月流量 */
/*! Traffic this month */
 +(NSString *)userSettings_molileData_trafficStat_thisMonth;

/*! “设置-画面设置-夜视模式” */
/*! \"Settings - Picture Settings - Night Vision Mode\" */
 +(NSString *)devicesetting_Settings_Picture_Night;

/*! 复制链接 */
/*! Copy Link */
 +(NSString *)devicelist_firmware_fail_copy;

/*! 输入名称 */
/*! Enter a name */
 +(NSString *)preview_preset_name;

/*! 声音开关：设置设备播放声音开关 */
/*! Sound:setup the sound on/off */
 +(NSString *)help_preview_ttextTips_12;

/*! 录像保存时间 */
/*! Video saving duration */
 +(NSString *)cloud_video_duration;

/*! 销售协议 */
/*! Sales agreement */
 +(NSString *)devicesetting_4G_card_sales_agreement;

/*! 选择日期 */
/*! Choose date */
 +(NSString *)alarmMessage_selecteDate;

/*! 流量统计 */
/*! Mobile data statistics  */
 +(NSString *)userSettings_mobileData_trafficStat;

/*! 我的提示音 */
/*! My prompt tone */
 +(NSString *)devicesetting_my_tone;

/*! 登录账号 */
/*! Login account */
 +(NSString *)person_login_log_account;

/*! Q3：查看手机是否禁止易视云使用数据、WLAN、GPS 的权限 */
/*! Q3: Check whether the mobile phone prohibit the permission of EseeCloud to use data, WLAN, GPS */
 +(NSString *)person_feedback_question_check_data;

/*! 1、什么是云存？ */
/*! 1、 What is cloud storage? */
 +(NSString *)cloud_storage_details_what_is_cloud;

/*! 共%1$s，已用%2$s */
/*! %1$s total,%2$s used */
 +(NSString *)devicesetting_4G_card_sim_card_data;

/*! 名称 */
/*! Name */
 +(NSString *)Service_map_name;

/*! 付款 */
/*! Pay */
 +(NSString *)payment;

/*! 抱歉，您尚未添加分组，请点击按钮添加分组 */
/*! Sorry,you have not added a group yet,please tap button to add a group. */
 +(NSString *)device_group_add;

/*! 方法2：打开APP，在个人中心界面中点击“云商城”按钮，进入购买页面。 */
/*! Method 2: Open APP,click \"cloud mall\" on personal center interface and go to the purchase interface  */
 +(NSString *)help_cloud_storage_textTips_4;

/*! 其它设备故障 */
/*! Other device failure */
 +(NSString *)Help_Other_device_failure;

/*! 您正在使用的设备有多个供应商，请按照设备归属选择供应商服务： */
/*! The equipment you are using has multiple suppliers, please select the supplier service according to the equipment attribution: */
 +(NSString *)person_vendors_introduce;

/*! 达尔文 */
/*! Australia/Darwin */
 +(NSString *)Australia_Darwin;

/*! 购买云录像功能后，云录像功能将同时被开启。您可以进入“云录像回放页面”，在“服务管理”里，给云录像功能设置开关、续费延长服务等操作。 */
/*! After purchasing the cloud recording function, the cloud recording function will be enabled at the same time. You can enter the \"cloud video playback page\", in the \"service management\", set the cloud video function switch, renew the extension service and other operations. */
 +(NSString *)person_feedback_question_set_up_cloud_video_detail;

/*! 自定义时间 */
/*! Custom time */
 +(NSString *)devicelist_share_equipment_Custom_time;

/*! 购买即同意自动续费协议 */
/*! Purchase and agree to automatic renewal agreement */
 +(NSString *)cloud_purchase_automatic_renewal_agreement;

/*! 请输入端口号 */
/*! Please input port number */
 +(NSString *)addDevice_port_input;

/*! 已下载最新版本，是否安装 */
/*! Already upload newest version,install? */
 +(NSString *)me_version_downloadedAndInstall;

/*! 存储管理 */
/*! Storage management */
 +(NSString *)service_map_storage_management;

/*! 基站设备 */
/*! Base station equipment */
 +(NSString *)deviceSetting_Base_station_equipment;

/*! *请确保手机蓝牙、GPS与WiFi权限已开启。 */
/*! *Please make sure your phone\'s bluetooth, GPS and WiFi permissions are turned on */
 +(NSString *)help_addDevice_textTips_16;

/*! 绑定成功 */
/*! Succeed to bind */
 +(NSString *)binding_success;

/*! 更换信道或将设备靠近WiFi摄像机基站 */
/*! Change the Wi-Fi channel or bring the device closer to the Base Station */
 +(NSString *)devicesetting_Device_signal_Change;

/*! 设备连接失败，无法设置上传录像状态 */
/*! Device connection fails,can\'t upload video */
 +(NSString *)cloud_connection_failed_upload_video;

/*! %ld分钟 */
/*! %ld minutes */
 +(NSString *)min_ios;

/*! (连接网线，配置更快) */
/*! (Connect the network cable, the configuration is faster) */
 +(NSString *)adddevice_connect_network_prompt;

/*! 付款时间 */
/*! Payment time */
 +(NSString *)payment_time;

/*! 刷新 */
/*! Refresh */
 +(NSString *)devicesetting_refresh;

/*! 该设备已被其他账号绑定，请联系机主分享添加 */
/*! The device has been bound by another account. Please contact the owner to share and add */
 +(NSString *)adddevice_Has_been_bound_nvr;

/*! ID格式错误 */
/*! Format of ID is wrong */
 +(NSString *)addDevice_ID_formatFail;

/*! 请检查以下几项： */
/*! Please check the following: */
 +(NSString *)Addevice_Please_check_following;

/*! 已锁卡 */
/*! Locked card */
 +(NSString *)devicesetting_lock_card;

/*! 打开手机设置，选择“无线局域网”； */
/*! Open cell phone Settings and select \"Wireless LAN\"; */
 +(NSString *)addevice_open_phone_set_ios;

/*! 试用版下载 */
/*! Trial version download */
 +(NSString *)person_trial_version_download;

/*! App需要录音权限 */
/*! App needs recording permission */
 +(NSString *)preview_APP_record_permiddion;

/*! 无法选中的时间为其他提示音已选时间，不能重复选择 */
/*! The time that can\’t be selected is the time that other prompts have been selected and can\’t be selected repeatedly  */
 +(NSString *)devicesetting_time_prompt;

/*! 搜索不到设备？试试打开GPS */
/*! Can\'t find device? Try to open GPS */
 +(NSString *)addDevcie_unsearchable;

/*! 单机模式 */
/*! Stand-alone mode */
 +(NSString *)addevice_Stand_alone_mode;

/*! 系统权限设置 */
/*! System authority settings */
 +(NSString *)person_privacy_set;

/*! 选择通道(%1$d) */
/*! Select channel(%1$d) */
 +(NSString *)device_Select_video_channel;

/*! 未设置 */
/*! Not set */
 +(NSString *)deviceSetting_Not_set;

/*! 好友给你分享了“%@”，赶紧打开%@扫一扫吧！ */
/*! Friends have shared \"%@\" with you, and quickly open %@ scan it! */
 +(NSString *)share_device_friend_device_ios;

/*! 密码设置失败 */
/*! Password setting failed */
 +(NSString *)devicelist_Password_setting_failed;

/*! 正在刷新数据中... */
/*! Loading... */
 +(NSString *)MJRefreshHeaderRefreshingText;

/*! 在线 */
/*! Online */
 +(NSString *)myDevice_online;

/*! 抱歉，暂无云存服务可迁移 */
/*! Sorry, there is no cloud storage service to migrate */
 +(NSString *)playback_no_services_can_migrate;

/*! Česky */
/*! Česky */
 +(NSString *)Czech;

/*! 如何取消自动续费？ */
/*! How to cancel automatic renewal? */
 +(NSString *)cloud_how_to_cancel_renewal;

/*! 解绑后，报警消息将不再推送至Line APP，是否确定解绑？ */
/*! After unbinding, the alarm message will no longer be pushed to Line APP. Are you sure to unbind? */
 +(NSString *)alarm_unbind_prompt;

/*! 警戒线帮助 */
/*! Cordon help */
 +(NSString *)devicesetting_warn_line_help;

/*! 部分摄像机设置失败，请检查摄像机在线状态 */
/*! Some cameras failed to set up, please check the online status of the camera */
 +(NSString *)devicesetting_Some_cameras_failed_check_online;

/*! 马朱罗 */
/*! Pacific/Majuro */
 +(NSString *)Pacific_Majuro;

/*! 提示音语言 */
/*! Language of prompt */
 +(NSString *)prompt_sounds_text;

/*! 平台招商，火热进行中- */
/*! Investment promotion on the platform, */
 +(NSString *)Service_map_Investment_promotion;

/*! ③ 在可用WLAN列表里选择如：“IPCXXX”连接，XXX即为设备ID，初始密码为11111111 */
/*! ③ Select the Wi-Fi of the corresponding device in the WLAN list. Such as: \"IPCXXX\", XXX is the device ID, the initial password is 11111111 */
 +(NSString *)adddevice_WiFi_select_IPC;

/*! 用户未绑定手机或者邮箱 */
/*! Users haven\'t bound cellphone number or email address */
 +(NSString *)userInfo_no_binding_emailAndPhone;

/*! 解绑成功 */
/*! unbundle successfully */
 +(NSString *)person_unbundle_success;

/*! 更多帮助 */
/*! more help */
 +(NSString *)devicelist_offline_help_content_more_help;

/*! 服务数量 */
/*! Number of services */
 +(NSString *)cloud_migration_services_number;

/*! 无任何设备 */
/*! No Device */
 +(NSString *)adddevice_no_equipment;

/*! 设置提示音名称 */
/*! Set the prompt tone name */
 +(NSString *)devicesetting_set_tone_name;

/*! 您可在设备设置中里开启视频服务 */
/*! You can open the video service in the device settings. */
 +(NSString *)preview_no_video_open_service_detail;

/*! 设备连接中，请稍后… */
/*! Connecting...please wait */
 +(NSString *)addDevice_connection_holdOn;

/*! 卡拉奇 */
/*! Asia/Karachi */
 +(NSString *)Asia_Karachi;

/*! 该录像已下载，确定是否继续下载？ */
/*! The video has been downloaded, are you sure continue  downloading? */
 +(NSString *)playback_download_again;

/*! 提示音列表 */
/*! Prompt tone list */
 +(NSString *)devicesetting_prompt_list;

/*! 单机模式添加的设备，需要手机连接热点WiFi才能正常使用设备功能 */
/*! For devices added in stand-alone mode, the mobile phone needs to be connected to the hotspot WiFi to use the device functions normally */
 +(NSString *)addevice_add_success_prompt;

/*! 已下载%1$s个 */
/*! %1$s downloaded */
 +(NSString *)playback_downloaded;

/*! 基站设备/通道 */
/*! Base station equipment/channel */
 +(NSString *)deviceSetting_Base_station_channel;

/*! 中文 */
/*! 中文 */
 +(NSString *)Chinese;

/*! Q6：存储卡内存录满时，是否会停止录像？ */
/*! Q6: When the memory of the memory card is full, will it stop recording? */
 +(NSString *)person_feedback_question_card_full;

/*! 2、云存有效期可以暂停吗？ */
/*! 2、 Can the cloud validity period be suspended? */
 +(NSString *)cloud_storage_details_cloud_period_suspended;

/*! 2.点击设备列表右上角“+”①，选择“扫一扫”②。 */
/*! 2.Click \"+\"① at upper right corner of the device\'s list and choose \"scan\"② */
 +(NSString *)help_addDevice_textTips_24;

/*! 多通道设备可通过左右滑动切换分屏 */
/*! Device with multiple channels can switch screen by slide left and right */
 +(NSString *)newbie_guide_text_6;

/*! 请输入原密码 */
/*! Please input original password */
 +(NSString *)userInfo_password_original_enter;

/*! 录像错误 */
/*! Recording error */
 +(NSString *)devPlay_video_error;

/*! 前往绑定 */
/*! Go to bind */
 +(NSString *)alarm_go_to_bind;

/*! 设备“%1$s”暂不支持第三方4G卡，无法正常使用设备功能，请尽快切换回设备自带4G卡 */
/*! The device \"%1$s\" does not support third-party 4G cards temporarily, and the device functions cannot be used normally. Please switch back to the device\'s own 4G card as soon as possible */
 +(NSString *)devicelist_third_party_4G_cards_prompt;

/*! 默认 */
/*! Default */
 +(NSString *)deviceSetting_tone_Settings_default;

/*! 连网 */
/*! Network connection */
 +(NSString *)addDevice_smartlink_Distribution_network;

/*! 关灯 */
/*! Turn off */
 +(NSString *)play_lamp_close;

/*! 选择供应商 */
/*! Select suppliers */
 +(NSString *)person_Select_suppliers;

/*! 当前APP版本过低，无法识别此二维码，请前往应用市场更新本APP后重新扫描 */
/*! The current APP version is too low to recognize this QR code, please go to the app market to update the app and scan again */
 +(NSString *)adddevice_version_update;

/*! 夜间 */
/*! Night time */
 +(NSString *)night;

/*! 无网络情况下，近距离连接摄像机观看，请选择本地直连。(少人选择) */
/*! View video without network ,select Direct Connection.(few people choose) */
 +(NSString *)adddevice_deecription_local_use;

/*! 1.检测网络状态 */
/*! 1. Detect network status */
 +(NSString *)preview_no_video_detect_network_status;

/*! 请输入兑换码 */
/*! Please enter the exchange code */
 +(NSString *)cloud_enter_code;

/*! 请联系机主修改密码或删除后重新分享添加 */
/*! Please contact the owner to change the password or delete and re-share and add */
 +(NSString *)adddevice_change_device_password_add;

/*! 设备连网 */
/*! Device networking */
 +(NSString *)addDevice_smartlink_Distribution_network_device;

/*! 符拉迪沃斯托克/海参崴 */
/*! Asia/Vladivostok */
 +(NSString *)Asia_Vladivostok;

/*! %@更新固件大约需要几分钟，请确保设备电源与网络正常 */
/*! %@Update firmware takes about a few minutes, please make sure  the device power and network are normal. */
 +(NSString *)devicelist_firmware_update_wait_ios;

/*! 4.若设备指示灯闪烁，点击②“是”按钮，在列表中选择需要添加的设备ID。 */
/*! 4.If the indicator light of device blinks,click ② \"yes\",choose the device ID on the list */
 +(NSString *)help_addDevice_textTips_9;

/*! 选择报警后录像时长 */
/*! Select the length of the video after the alarm */
 +(NSString *)devicesetting_select_alarm_time_length;

/*! 修改内容尚未保存，是否保存后再退出？ */
/*! The modified content has not been saved. Do you want to save and then exit? */
 +(NSString *)devicesetting_modified_content_prompt;

/*! 当前手机未连接WiFi */
/*! The current phone is not connected to WiFi */
 +(NSString *)addDevice_phone_no_WIFI;

/*! 设备连接失败，连接超时 */
/*! Device connection failed,connection timeout */
 +(NSString *)addDevice_connectionFail_timeOut;

/*! 等待充值 */
/*! Waiting for Top-up */
 +(NSString *)devicesetting_4G_card_wait_recharge;

/*! 当前APP版本过低，无法识别此二维码，请将APP更新至最新版本后重新扫描 */
/*! The current APP version is too low to recognize this QR code, please update the APP to the latest version and scan again */
 +(NSString *)adddevice_version_update_IOS;

/*! 视频已播放超过10分钟，无人观看会影响信息安全，是否继续播放？ */
/*! The video has been played for more than 10 minutes and no one has watched it, which will affect information security. Do you want to continue playing? */
 +(NSString *)preview_video_played_onwatched_affect_informa_security;

/*! 6.异常动态发生期间，肇事者将摄像机损坏或断电，导致机器无法正常工作； */
/*! 6. During the abnormal dynamic occurrence, the perpetrator damaged or cut off the power of the camera, resulting in the machine not working properly; */
 +(NSString *)person_feedback_question_video_incomplete_6;

/*! 预计到账过程需要1-5分钟，请稍等！ */
/*! It is expected that the transfer process will take 1-5 minutes, please wait! */
 +(NSString *)devicesetting_4G_card_wait_transfer_process;

/*! 未登录或登录状态过期 */
/*! Not logged in or logged in status expired */
 +(NSString *)adddevice_Special_state;

/*! 小时 */
/*! hour */
 +(NSString *)deviceSetting_hour;

/*! 发送蓝牙数据失败(蓝牙断开，设备未回复，超时) */
/*! Fail to send bluetooth data (bluetooth disconnection,device not respond,timeout) */
 +(NSString *)prompt_sendData_bluetooth_failed;

/*! 刷新完成 */
/*! Refresh complete */
 +(NSString *)Stand_alone_station_Refresh_complete;

/*! 关闭后，查看实时和回放录像时都没有声音 */
/*! When this is switched off, you will not hear voices in live view and playback */
 +(NSString *)devicesetting_After_closing_no_sound_viewing_playback;

/*! 设备24小时连续录像，占用存储空间较大，录像天数会减少 */
/*! The equipment keeps recording 24 hours a day, which takes up a lot of storage space, and the number of recording days will be reduced */
 +(NSString *)devicesetting_24_hours_keeps_recording_storage_space;

/*! %1$s需要更新固件，是否现在更新？ */
/*! %1$s needs to update the firmware, do you need to update it now? */
 +(NSString *)devicelist_firmware_update_IPC;

/*! 闪烁变为常亮 */
/*! Flashing becomes constant */
 +(NSString *)Addevice_Flashing_becomes_constant;

/*! 续费 */
/*! Renewal */
 +(NSString *)cloud_order_renewal;

/*! 不再提示 */
/*! No tips any more */
 +(NSString *)do_not_tip_always;

/*! 全景巡航 */
/*! Panoramic cruise */
 +(NSString *)devicesetting_Panoramic_cruise;

/*! 中国/上海 */
/*! China/Shanghai */
 +(NSString *)Asia_Shanghai;

/*! 云录像服务说明 */
/*! Cloud recording Service Description */
 +(NSString *)cloud_recording_service_description;

/*! 未支付 */
/*! Unpaid */
 +(NSString *)cloud_payment_unpaid;

/*! 有线 */
/*! Wired */
 +(NSString *)adddevice_Wireless_add_mode_wired;

/*! 您已关闭视频服务，请前往设备设置开启 */
/*! You have turned off the video service, please go to device settings */
 +(NSString *)devicelist_video_off_prompt;

/*! 屏幕亮度开关 */
/*! Screen brightness switch */
 +(NSString *)person_screen_brightness_switch;

/*! 自启动管理：将应用加入［自启动管理］列表的同时，还需要到设置—应用程序—正在运行里锁定应用进程， 否则杀进程或者开机后进程不会开启，只能手动开启应用； */
/*! Self-booting management: while adding the application to the [self-booting management] list, you need to lock the application process in the settings-application-running, otherwise the process will not start after shutting down the process or booting, you can only start the application manually; */
 +(NSString *)person_feedback_question_ROM_software_5_Selfbooting;

/*! 中国/台北 */
/*! China/Taipei */
 +(NSString *)Asia_Taipei;

/*! 圣保罗 */
/*! America/Sao Paulo */
 +(NSString *)America_Sao_Paulo;

/*! 常电模式支持自动预录像功能，设备插电即可生效 */
/*! The constant power mode supports automatic pre-recording function, which can take effect when the device is plugged in */
 +(NSString *)devicesetting_operate_mode_prompt;

/*! 网络不给力 */
/*! Bad network */
 +(NSString *)addDevice_network_failure;

/*! 您真的要注销吗？ */
/*! Are you sure you want to delete it? */
 +(NSString *)person_really_write_off;

/*! 屏幕宽高比：可设置屏幕宽高比例 */
/*! Screen aspect ratio: can set the screen aspect ratio */
 +(NSString *)help_preview_ttextTips_17;

/*! 详细地址未选择 */
/*! Detailed address not selected */
 +(NSString *)service_detail_not_select;

/*! 已无流量 */
/*! No mobile data */
 +(NSString *)devicesetting_no_traffic;

/*! 在密码错误提示界面的任意位置，使用鼠标连续左右键切换点击（左键-右键-左键循环，各点击6次） */
/*! At any position of the password error prompt interface, use the left and right keys of the mouse to switch and click continuously (left-right-left-click cycle, each click 6 times) */
 +(NSString *)help_recorder_reset_password_2;

/*! 云ID不存在 */
/*! Cloud ID doesn\'t exist */
 +(NSString *)cloud_id_inexistence;

/*! 服务期限 */
/*! Service Term */
 +(NSString *)cloud_service_period;

/*! 2.开启消息通知：在手机设置>应用管理，找到“易视云”并开启/允许通知即可收到报警推送。 */
/*! 2.After enable push message,check cellphone setup--application management,find out the \"Eseecloud \" and enable to get push message. */
 +(NSString *)help_normal_problem_text_6;

/*! 获取视频失败，请重试 */
/*! Fail to get video,please try again */
 +(NSString *)get_video_failed;

/*! 根据您收藏的常看位置定点巡航 */
/*! Fixed-point cruise according to your favorite preset positions */
 +(NSString *)devicesetting_preset_position;

/*! 立即前往 */
/*! Go to now */
 +(NSString *)playbcak_go_to_now;

/*! 基站 */
/*! Base station */
 +(NSString *)deviceSetting_Base_station;

/*! 添加反馈成功! */
/*! Add feedback successfully! */
 +(NSString *)appealsAddSuccess;

/*! 上午 */
/*! Morning */
 +(NSString *)morning;

/*! 聚焦加/减 */
/*! Focus plus/minus */
 +(NSString *)preview_ptz_manual_focus;

/*! 充值中 */
/*! Topping-up */
 +(NSString *)devicesetting_4G_card_recharge;

/*! 开启失败 */
/*! Open failed */
 +(NSString *)cloud_Open_failed;

/*! 返回后需要重新配置设备 */
/*! Need to reset configuration after return */
 +(NSString *)addDevice_getting_tips_return;

/*! 请输入WiFi名称 */
/*! Please input WiFi name */
 +(NSString *)addDevice_WIFI_name_input;

/*! 营业时间 */
/*! Business hours */
 +(NSString *)Service_map_Business_hours;

/*! %1$s已被其他提示音选择 */
/*! %1$s Selected by another prompt tone */
 +(NSString *)devicesetting_selected_by_another_tone;

/*! 没有您搜索的地区 */
/*! There are no regions you searched for */
 +(NSString *)devicesetting_searche_no_regions;

/*! 搜索中，请稍后... */
/*! Searching, please wait... */
 +(NSString *)adddevice_searching;

/*! 连接失败，请点击帮助查看原因 */
/*! Connection failed, please click help to view the reason */
 +(NSString *)preview_Connection_failed_help_reason;

/*! 新旧密码不能相同 */
/*! Old and new passwords cannot be the same */
 +(NSString *)person_password_not_same;

/*! 基站配对中，请耐心等待... */
/*! Base station is being paired, please wait patiently... */
 +(NSString *)addDevice_Base_station_paired_wait;

/*! 密码设置成功 */
/*! Password set successfully */
 +(NSString *)devicelist_Password_set_successfully;

/*! 订单号 */
/*! Order number */
 +(NSString *)help_Order_number;

/*! 定时录像：摄像机在设定的时间段内录像 */
/*! Timing video recording: the camera records in a set period of time */
 +(NSString *)playback_timed_record;

/*! 非移动侦测区域 */
/*! Non-motion detection area */
 +(NSString *)devicesetting_no_motion_detection_area;

/*! 次日 */
/*! Next day */
 +(NSString *)devicesetting_Next_day;

/*! 需要设备连接成功 */
/*! Requires successful device connection */
 +(NSString *)myDevice_needDeviceConnected;

/*! 解绑后，你将不能使用此手机号来重置该账号的密码，是否继续解绑？ */
/*! After the unbundling, you will not be able to use the phone number to reset the password of the account. Do you want to continue unbundling? */
 +(NSString *)person_unbundle_phone_number_description;

/*! 远程使用 */
/*! Remote View */
 +(NSString *)adddevice_remote_use_alone;

/*! 半径1： */
/*! Radius 1: */
 +(NSString *)devicesetting_Video_center_correction_radius_one;

/*! 暂无分享，请先添加 */
/*! No share yet, please add first */
 +(NSString *)share_no_device;

/*! 门铃 */
/*! Doorbell */
 +(NSString *)bell;

/*! 控制云台转动摄像机，设置常看位置后，您就能随时随地一键到达您关心的位置，快速查看家中的变化。 */
/*! After controlling the PTZ to rotate the camera and setting the preset position, you can reach the position you care about with one key anytime, anywhere, and quickly check the changes in your home. */
 +(NSString *)preview_preset_help_1;

/*! 连接设备自带无线热点配网 */
/*! Connect the wireless hotspot network of the device */
 +(NSString *)adddevice_connect_own_hotspot;

/*! 商品描述 */
/*! Commodity description */
 +(NSString *)goodsDetailgoodsDescribe;

/*! 当前没有客服在线，请提交留言 */
/*! There is currently no customer service online, please submit a message */
 +(NSString *)Stand_alone_station_no_customer_service;

/*! 状态 */
/*! Status */
 +(NSString *)cloud_feedback_status;

/*! 给手机连接WiFi */
/*! Connect your phone to WiFi */
 +(NSString *)adddeevice_smartlink_prompt_WIFI;

/*! 选择时间 */
/*! Select time */
 +(NSString *)AlarmMessage_select_time;

/*! 请手动前往系统设置，连接设备热点后，返回APP */
/*! Please go to the system settings manually. After connecting the device hotspot, return to the app. */
 +(NSString *)adddevice_go_to_connect_device;

/*! 设备已断开… */
/*! Device is disconnected... */
 +(NSString *)play_error_tips_3;

/*! 邮箱已被绑定 */
/*! This email address is bound */
 +(NSString *)password_bindingFailed_email;

/*! 获取最新的试用版本失败 */
/*! Failed to get the latest trial version */
 +(NSString *)person_trial_latest_trial_version_fail;

/*! 暂停云存自动上传录像失败，请重试 */
/*! Fail to stop cloud storage automactically upload recording,please try again */
 +(NSString *)cloud_suspended_auto_upload_video_try_again;

/*! 智能侦测时段 */
/*! Motion detection period */
 +(NSString *)devicesetting_Intelligent_detection_period;

/*! 摄像机 */
/*! Camera */
 +(NSString *)Camera;

/*! ② 进入手机系统设置，选择无线局域网 */
/*! ② Enter the mobile phone Settings, select WLAN */
 +(NSString *)adddevice_select_set;

/*! %@可免费体验%@云存套餐(开启云存会消耗较多流量，4G插卡枪机用户谨慎使用)，确定体验？ */
/*! %@ can experience the %@ Cloud Storage package for free (Enabling cloud storage will consume a lot of traffic,  using 4G camera should be cautious),are you sure to experience? */
 +(NSString *)cloud_package_promotion_condition_ios;

/*! 请保持时间同步开关始终为开启状态，否则将无法正常上传云录像。 */
/*! Please keep the time synchronization switch always on, otherwise the cloud recording will not be uploaded normally. */
 +(NSString *)Cloud_detail_guide_propt;

/*! 申请注销 */
/*! Apply for delete */
 +(NSString *)person_Apply_cancellation;

/*! 微信授权成功 */
/*! WeChat authorization successful */
 +(NSString *)person_wechat_authorization_success;

/*! 下午 */
/*! Afternoon */
 +(NSString *)afternoon;

/*! SIM卡状态未知 */
/*! SIM card status is unknown */
 +(NSString *)devicesetting_4G_device_sim_card_unknown;

/*! 截图：截取当前预览画面 */
/*! Screenshot:snapshot current preview image */
 +(NSString *)help_preview_ttextTips_3;

/*! 微信登录失败 */
/*! wechat login fails */
 +(NSString *)login_error_wechat_fail;

/*! 开启“摇一摇”功能需前往：“个人中心-设置”进行开启 */
/*! To enable the \"shake\" function, go to: \"Personal Center - Settings\" to open */
 +(NSString *)newbie_guide_text_3;

/*! 手环电量过低 */
/*! Bracelet battery is too low */
 +(NSString *)alarm_bracelet_power_low;

/*! 已联网添加 */
/*! Networked devices */
 +(NSString *)adddevice_Added_online;

/*! 设置设备名称 */
/*! Set device name */
 +(NSString *)adddevice_change_device_name;

/*! 更换微信账号 */
/*! Change WeChat account */
 +(NSString *)person_change_wechat_account;

/*! 设备已存在于设备列表中，是否覆盖添加？ */
/*! The device already exists in the device list. overlap and add again? */
 +(NSString *)addDevice_existing_list;

/*! 自动切换 */
/*! Automatic switching */
 +(NSString *)deviceSetting_Automatic_switching;

/*! 删除成功 */
/*! Successfully deleted */
 +(NSString *)devicesetting_Videobackup_Eliminar_success;

/*! 正在发起通话 */
/*! Initiating call  */
 +(NSString *)preview_Initiating_call;

/*! 进入商城 */
/*! GO */
 +(NSString *)me_GO;

/*! 设备密码输入错误，继续添加请重置设备，退出则返回首页。 */
/*! The device password is entered incorrectly . Please reset the device when you continue to add it, and return to the homepage when you exit. */
 +(NSString *)adddevice_password_reset;

/*! 将二维码放入框内，即可自动扫描 */
/*! Put QR code into the frame,can scan automatically */
 +(NSString *)addDevice_scan_putInFrame;

/*! 本地存储 */
/*! Local storage */
 +(NSString *)deviceSetting_Local_storage;

/*! TF卡存储 */
/*! TF card storage */
 +(NSString *)devicesetting_TF_card_storage;

/*! 详情 */
/*! Details */
 +(NSString *)goodsDetail;

/*! 机械门铃 */
/*! Mechanical doorbell */
 +(NSString *)bell_mechanical;

/*! 请选择2.4G频段WiFi后，输入正确的密码，再进行连接；另外WiFi账号和密码不接受特殊符号。 */
/*! Please select the 2.4G band Wi-Fi, input the correct password, and then connect; in addition, the  WiFi account and password can not include any special symbols. */
 +(NSString *)adddevice_select_WiFi_connect;

/*! 请连接设备热点 */
/*! Please connect device hotspot */
 +(NSString *)addDevice_connecting_hotspot;

/*! 内罗毕/东部非洲 */
/*! Africa/Nairobi */
 +(NSString *)Africa_Nairobi;

/*! 成功引导 */
/*! Success guide */
 +(NSString *)devicelist_setting_help;

/*! 获取验证码 */
/*! Get verification code */
 +(NSString *)obtain_code;

/*! 调整视频显示区域及视频中心 */
/*! Adjust the video display area and video center */
 +(NSString *)devicesetting_Video_center_correction_describe;

/*! 选择定时关机时段 */
/*! Select the time period for shutdown */
 +(NSString *)deviceSetting_Select_time_period_;

/*! 云服务管理 */
/*! Cloud service management */
 +(NSString *)cloud_cloud_service_management;

/*! 设备录像的音量 */
/*! Volume of device recording */
 +(NSString *)devicesetting_device_receive_volume;

/*! 不支持对码 */
/*! Does not support code matching */
 +(NSString *)devicelist_not_support_code_matching;

/*! 当前已是最新版本 */
/*! It\'s newest version */
 +(NSString *)me_version_latest;

/*! 登录 */
/*! Log in */
 +(NSString *)login;

/*! 暂不授权 */
/*! Not authorized temporarily */
 +(NSString *)devicelist_Not_authorized_temporarily;

/*! 功能分类更明晰 */
/*! Function classification is clearer */
 +(NSString *)Lead_page_describe_3;

/*! 最多可绘制%ld条警戒线 */
/*! Up to %ld cordon lines can be drawn */
 +(NSString *)devicesetting_up_to_4_warn_line_ios;

/*! Alexa */
/*! Alexa */
 +(NSString *)devicesetting_aleax;

/*! 正在配对中，是否确定退出？ */
/*! Pairing in progress, are you sure to exit? */
 +(NSString *)Addevice_pairing_exit;

/*! 报警与提示音设置 */
/*! Alarm and prompt tone settings */
 +(NSString *)devicesetting_alarm_and_prompt_set;

/*! 加尔各答 */
/*! Asia/Calcutta */
 +(NSString *)Asia_Calcutta;

/*! 不可用套餐 */
/*! Unavailable packages */
 +(NSString *)Devicesetting_Unavailable_packages;

/*! 服务点地图 */
/*! Site map */
 +(NSString *)Service_map_Site_map;

/*! 说明：由于宽带运营商的不定期调整，我们获取IP所对应的地址可能与您当前所在地址不符，请通过登录时间与产品判断是否为您本人操作。如确定非您本人登录，建议您立即修改密码。 */
/*! Note: Due to irregular adjustments by broadband operators, the address corresponding to the IP obtained by us may not match your current address. Please judge whether it is your own operation based on the login time and the product. If it is determined that you are not logging in, it is recommended that you change your password immediately. */
 +(NSString *)person_login_log_prompt;

/*! 中国 */
/*! China */
 +(NSString *)China;

/*! 云存续费 */
/*! Cloud storage renewal */
 +(NSString *)cloud_renewal;

/*! 佩思 */
/*! Australia/Perth */
 +(NSString *)Australia_Perth;

/*! 关岛 */
/*! Pacific/Guam */
 +(NSString *)Pacific_Guam;

/*! 设备类型 */
/*! Device type */
 +(NSString *)addDevice_setting_type;

/*! 是否确定删除该日程 */
/*! Are you sure to delete the schedule */
 +(NSString *)devicesetting_Are_sure_delete_schedule;

/*! 更换微信账号后，旧帐号就不再接收报警消息，是否继续更换？ */
/*! After changing the WeChat account, the old account will no longer receive alarm messages. Should you continue to change it? */
 +(NSString *)person_replace_wechat_ask;

/*! 婴儿血氧异常 */
/*! Abnormal blood oxygen in the baby */
 +(NSString *)alarm_baby_ox_blood;

/*! 画面与声音设置 */
/*! Picture and sound settings */
 +(NSString *)deviceSetting_Picture_sound_settings;

/*! 拿不走的安全才是真安全 */
/*! Security that can\'t be taken away is really safe */
 +(NSString *)cloud_storage_introduce;

/*! 云存储为您保家护店 */
/*! Cloud storage protects your home and shops */
 +(NSString *)cloud_protect_home_shops;

/*! 密码： */
/*! Password: */
 +(NSString *)adddevice_wifi_password;

/*! 摄像机存储卡以及云录像的使用方法和常见问题 */
/*! How to use camera memory card and cloud video &amp; Common questions */
 +(NSString *)person_feedback_question_4;

/*! 您成功配对%1$s台摄像机 */
/*! You successfully paired %1$s cameras */
 +(NSString *)addDevice_successfully_paired_cameras;

/*! 2.约定我们的限制责任、免责条款。 */
/*! 2. Agreement on our limitation of liability and exemption terms. */
 +(NSString *)login_explain_2;

/*! 连接热点 */
/*! Connect hotspot */
 +(NSString *)addevice_connect_hotspot;

/*! 购买云存储 */
/*! Buy cloud storage */
 +(NSString *)cloud_buy_storage;

/*! 1.请检查您的WiFi密码是否正确 */
/*! 1. Please check if your WiFi password is correct. */
 +(NSString *)smartlin_distribution_network_fail_prompt_one;

/*! 获取云存服务列表失败 */
/*! Fail to get cloud storage service list,please try again */
 +(NSString *)get_serviceList_failed;

/*! 周一到周五 */
/*! Monday to Friday */
 +(NSString *)Devicesetting_mon_to_fri;

/*! 移动侦测区域 */
/*! Motion detection area */
 +(NSString *)devicesetting_motion_area_set;

/*! 3.摄像机暂不支持WPA/WPA2的“企业”加密方式给摄像机联网。支持WEP,WPA--PSK/WPA2--PSK 、或者及无密码的企业WiFi,如果是在企业网络环境下给摄像机联网， 请提前确认WiFi加密方式是否符合摄像机联网要求。 */
/*! 3. The camera does not support WPA / WPA2\'s \"enterprise\" encryption method to connect the camera to the network. Support WEP, WPA--PSK / WPA2--PSK, or corporate WiFi without password. If the camera is networked in the corporate network environment, please confirm in advance whether the WiFi encryption method meets the camera networking requirements. */
 +(NSString *)person_feedback_question_check_other_question_3;

/*! 智能音箱 */
/*! Smart speaker */
 +(NSString *)person_Intelligent_speakers;

/*! 公司总机: */
/*! Company switchboard: */
 +(NSString *)Official_Company_switchboard;

/*! 更多存储空间 */
/*! More storage space */
 +(NSString *)cloud_more_storage_space;

/*! 移动侦测管理 */
/*! Motion detection recording */
 +(NSString *)devicesetting_Motion_detection_management;

/*! 抱歉，您尚未添加设备，请点击按钮添加设备 */
/*! Sorry,you have not added a device yet,please tap button to add a device. */
 +(NSString *)devicelist_add_device;

/*! 热点连接成功 */
/*! Hotspot connection succeeded */
 +(NSString *)addevice_hotspot_connect_success;

/*! 波兰 */
/*! Poland */
 +(NSString *)devSetting_Poland;

/*! 设置失败，请检查网络 */
/*! Setup failed, please check the network */
 +(NSString *)devicesetting_setup_fail;

/*! 远程配置成功 */
/*! Remote configuration succeeded */
 +(NSString *)adddevice_remote_configuration_success;

/*! 重置成功 */
/*! Reset successfully */
 +(NSString *)addDevice_reset_success;

/*! 设备信号强度较弱，请检查设备网络情况 */
/*! The signal strength of the device is weak. Please check the network status of the device. */
 +(NSString *)preview_device_signal_weak_prompt;

/*! 发生报警时，摄像机会向微信推送报警消息 */
/*! When an alarm occurs, the camera will push an alarm message to WeChat */
 +(NSString *)person_wechat_push_description;

/*! 云服务不能迁移至正在使用云录像的通道 */
/*! Cloud services cannot be migrated to channels that are using cloud recording */
 +(NSString *)play_service_cannot_migrate_to_using_chanel;

/*! 复制网址 */
/*! Copy URL */
 +(NSString *)cloud_copy_url_ios;

/*! 设备名称 */
/*! Device name */
 +(NSString *)device_nick_designation;

/*! 搜索设备 */
/*! Search device */
 +(NSString *)adddevice_search_device;

/*! 该邮箱不存在，请重新输入 */
/*! This email address doesn\'t exsist,please input again */
 +(NSString *)reset_emailExist;

/*! 设备已超过添加时间，请重启设备后在10分钟内添加 */
/*! The device has exceeded the adding time, please restart the device and add it within 10 minutes */
 +(NSString *)adddevice_linkvisual_device;

/*! 常看位置未保存，是否确定退出？ */
/*! The preset position is not saved, are you sure you want to exit? */
 +(NSString *)preset_not_save;

/*! 是否清空所有的数据 */
/*! Empty all data? */
 +(NSString *)userSettings_molileData_trafficSata_clearAlern;

/*! 添加至设备列表 */
/*! Add device to list */
 +(NSString *)adddevice_add_to_device_list;

/*! SIM卡激活成功，解锁时间视各地运营商情况，预计一小时内正常。 */
/*! The SIM card is successfully activated. The unlocking time is expected to be normal within one hour, depending on the situation of the operators in various places. */
 +(NSString *)devicesetting_4G_card_sim_card_unlock_time;

/*! 无效手机号码 */
/*! Invalid phone number */
 +(NSString *)login_invailid_phone_number;

/*! 取消成功 */
/*! Cancel success */
 +(NSString *)cloud_cancel_success;

/*! 查看摄像机绿灯闪烁是否正常。如果摄像机状态灯不是绿灯闪烁，请用顶针轻插配置孔或长按重置按钮，直到摄像机指示灯闪烁。 */
/*! Check whether the green light of the camera flashes normally. If the camera status light is not flashing green, use a thimble to lightly insert the configuration hole or long press the reset button until the camera indicator flashes. */
 +(NSString *)person_feedback_question_add_fail_detail;

/*! %ld个分享 */
/*! Personal share %ld */
 +(NSString *)me_share_number_ios;

/*! 设备连接失败，密码错误 */
/*! Device connection fails,wrong password */
 +(NSString *)addDevice_connectionFail_passwordError;

/*! %1$s - %2$s关闭摄像机 */
/*! %1$s - %2$s off camera */
 +(NSString *)deviceSetting_deviceSetting_evening_turn_off_next;

/*! 报警持续时间越久，越可能引起注意，从而吓退不法分子。 */
/*! The longer the alarm lasts, the more likely it is to attract attention and scare offenders. */
 +(NSString *)devicesetting_flash_alarm_purpose;

/*! 保存失败 */
/*! Fail to save */
 +(NSString *)setting_save_failed;

/*! 请选择要反馈的问题类型 */
/*! Please select the type of question to feedback */
 +(NSString *)person_feedback_select_problem_type;

/*! 当前没有录像 */
/*! No recording */
 +(NSString *)preview_playback_no_video_now;

/*! 侦测时段 */
/*! Detection period */
 +(NSString *)devicesetting_Detection_period_2;

/*! 阿拉木图 */
/*! Asia/Almaty */
 +(NSString *)Asia_Almaty;

/*! 是否清除当前所有警戒线？ */
/*! Clear all current cordon? */
 +(NSString *)devicesetting_clear_all_cordon;

/*! 设备注册云服务 */
/*! Register cloud service for the device */
 +(NSString *)addDevice_regist_cloud_service;

/*! 端口号错误 */
/*! Wrong port number */
 +(NSString *)port_number_error;

/*! 白光灯闪烁报警 */
/*! White light flashing alarm */
 +(NSString *)devicesetting_white_light_alarm;

/*! 服务起止： */
/*! Start and end of service: */
 +(NSString *)Cloud_storage_service_service_time;

/*! 分组 */
/*! Group */
 +(NSString *)device_grouping;

/*! 设置结束时间 */
/*! Set end time */
 +(NSString *)devicesetting_Videobackup_Set_endtime;

/*! 更换 */
/*! Replace */
 +(NSString *)person_replace;

/*! 保存二维码至本地相册 */
/*! Save QR code to local album */
 +(NSString *)person_save_qr_code_to_local;

/*! 重试 */
/*! Try again */
 +(NSString *)retry;

/*! 早上08:00 - 晚上20:00 */
/*! 08:00 in the morning-20:00 in the evening */
 +(NSString *)deviceSetting_Push_during_day_time;

/*! 白光 */
/*! White light */
 +(NSString *)play_lamp_whiteLight;

/*! 设备删除 */
/*! Delete device */
 +(NSString *)device_delete;

/*! *若不覆盖则需要返回设备列表中删除设备后重新添加。 */
/*! * If do not overlap,please return to the device list,delete the device and add it again. */
 +(NSString *)addDevice_cover_tips;

/*! 查看回放 */
/*! Playback */
 +(NSString *)preview_Check_Playback;

/*! 早上08:00 - 晚上20:00启动智能侦测 */
/*! Start smart detection from 08:00 in the morning to 20:00 in the evening */
 +(NSString *)devicesetting_Detect_only_during_day_time;

/*! 管理分组 */
/*! Management group */
 +(NSString *)device_manage_group;

/*! 选择摄像机电量管理模式 */
/*! Select camera power management mode */
 +(NSString *)devicesetting_select_mode;

/*! 结果提示 */
/*! Result prompt */
 +(NSString *)adddevice_connect_result;

/*! 广角 */
/*! Wide-angle */
 +(NSString *)PTZ_Wide_angle;

/*! 打开视频失败 */
/*! Failed to open video */
 +(NSString *)device_view_tip;

/*! 暂无设备可购买流量套餐 */
/*! No device can buy the traffic plan */
 +(NSString *)devicesetting_4G_no_device_can_buy_data_plan;

/*! 购买完成云存套餐后，云录像功能会自动开启，您可以点击设备列表相对应的“云录像”按钮进入云录像界面-点击云存服务图标进入“云存服务”-关闭云录像功能。 */
/*! After purchasing the cloud storage package, the cloud recording function will be automatically enabled. You can click the \"Cloud Recording\" button corresponding to the device list to enter the cloud recording interface. Click the cloud storage service icon to enter the \"Cloud Storage Service\" - disable the cloud recording function. */
 +(NSString *)cloud_storage_details_how_to_off_record_guide;

/*! 为了账号安全，请先验证登录密码： */
/*! For account security, please verify the login password first: */
 +(NSString *)person_account_security_verify;

/*! 流量试用套餐仅剩%d天，请立即续费！ */
/*! There are only %d days left for the data trial package, please renew now! */
 +(NSString *)preview_4G_Free_tier_ios;

/*! 当前为最新固件 */
/*! Newest firmware */
 +(NSString *)devSetting_latest_firmware;

/*! 云台方向翻转 */
/*! PTZ direction flip */
 +(NSString *)devicesetting_PTZ_direction_flip;

/*! 人形侦测对场景有一定的适应性要求，请根据实际情况使用 */
/*! Humanoid detection has certain adaptability requirements to the scene, and it is used according to the actual situation. */
 +(NSString *)devicesetting_humanoid_detection_prompt;

/*! 操作示意 */
/*! Operation guide */
 +(NSString *)addDevice_Operation_instructions;

/*! 升级 */
/*! Upgrade */
 +(NSString *)devicelist_upgrade;

/*! 温馨提示 */
/*! Tips */
 +(NSString *)cloud_tips_cozy;

/*! 关闭自动巡航 */
/*! Turn off auto cruise */
 +(NSString *)preview_turn_off_auto_cruise;

/*! 手机已连接设备WiFi： */
/*! The phone is connected device WiFi: */
 +(NSString *)adddevice_phone_connect_device_wifi;

/*! 设备预览帮助 */
/*! Device preview help */
 +(NSString *)help_generalDevice_preview;

/*! 格式化 */
/*! Format */
 +(NSString *)format;

/*! 画面侦测区设置 */
/*! Motion detection area setting */
 +(NSString *)devicesetting_Screen_detection_area_setting;

/*! 重置密码 */
/*! Reset password */
 +(NSString *)reset_password;

/*! 获取布防数据 */
/*! Obtain Alarm Data */
 +(NSString *)devicelist_get_arming_data;

/*! 退出后将不能接收报警消息，确定退出？ */
/*! Can\'t receive alarm message after exiting, sure to exit? */
 +(NSString *)userInfo_alern;

/*! 密码不能包含特殊字符 */
/*! Password can\'t contain special characters */
 +(NSString *)password_cannot_special_characters;

/*! 为了节省SD卡的空间和延长使用寿命,设备仅在检查到图像活动的时候录像,因此就会有断断续续的现象。 */
/*! In order to save the space of the SD card and prolong the service life, the device only records when it detects activity, so there will be intermittent siuation. */
 +(NSString *)person_feedback_question_playback_detail;

/*! 金额： */
/*! Amount: */
 +(NSString *)cloud_amount_order;

/*! 选择夏令时 */
/*! Choose daylight saving time */
 +(NSString *)devicesetting_Choose_daylight_saving_time;

/*! 设置密码（不小于8位） */
/*! Set password (not less than 8 bits) */
 +(NSString *)addevice_set_password_less_than_8;

/*! 温馨提示：通道云存有效期为该通道所有云存套餐加起来的时间和。例如：通道1在2019年4月1日0时0分购买了两个7天/月的云存套餐，那么云存有效期为：2019年4月1日0时0分至2019年6月1日0时0分。 */
/*! Tips: The validity period of the channel cloud is the sum of the time of all the cloud storage packages in the channel. For example, channel 1 purchased two 7-day/month cloud storage packages at 0:00 on April 1, 2019, then the cloud storage validity period is: 0:00 on April 1, 2019, and June 1, 2019. 0:00 on the day. */
 +(NSString *)cloud_storage_details_cloud_period_tips_1;

/*! 系统定位您在%@，是否切换？ */
/*! The system locates you at %@. Do you want to switch? */
 +(NSString *)service_map_city_locate_IOS;

/*! 无可切换设备 */
/*! No switchable device */
 +(NSString *)devicelist_switch_Family_mode;

/*! TF卡无录像 */
/*! TF card without video */
 +(NSString *)playback_tfcard_no_video;

/*! 关 */
/*! Off */
 +(NSString *)play_close;

/*! 结束时间 */
/*! End Time */
 +(NSString *)deviceSetting_videoBackup_endTime;

/*! IP/DDNS */
/*! IP/DDNS */
 +(NSString *)addDevice_process_IP_DDNS;

/*! 一直录像-无作用； */
/*! Constant power mode -no effect; */
 +(NSString *)devicesetting_Plug_in_no_effect;

/*! %ld个月 */
/*! %ld Month */
 +(NSString *)months_ios;

/*! 正在通知设备 */
/*! Notifying device */
 +(NSString *)devicelist_firmware_update_send_agreement;

/*! 选择需要重复该时间段的日期 */
/*! Select the date to repeat the time period. */
 +(NSString *)devicesetting_alarm_Select_copy_date;

/*! 成为维修员可以获得什么？ */
/*! What can I get as a repairman? */
 +(NSString *)Service_map_get_what_repairman;

/*! 请设置提示音播报时间 */
/*! Please set the notification time */
 +(NSString *)devicesetting_set_notification_time;

/*! 获取失败 */
/*! Fail to get */
 +(NSString *)cloud_fail_to_get;

/*! 通过“夜视模式”+“LED补光灯”的组合模式，可以使得摄像机获得更加多样且精准的工作模式，以下是对应旧版的灯控模式组合方式： */
/*! Through the combination mode of \"night vision mode\" + \"LED fill light\", the camera can obtain more diverse and accurate working modes. The following is the combination method of the light control mode corresponding to the old version: */
 +(NSString *)devicesetting_old_Light_Control_revised_describe;

/*! 未识别到存储卡 */
/*! Memory card not found */
 +(NSString *)Addevice_Memory_card_not_found;

/*! 输入邮箱 */
/*! Enter email */
 +(NSString *)register_hint_text;

/*! 已使用 */
/*! Used */
 +(NSString *)adddevice_used;

/*! 正在对码，请稍等 */
/*! Matching code, please wait */
 +(NSString *)devicelist_code_please_wait;

/*! 正在使用流量播放，请注意流量消耗 */
/*! Playing with data, please pay attention to data consumption */
 +(NSString *)preview_data_consumption;

/*! 仍要退出 */
/*! Still want to quit */
 +(NSString *)devicesetting_still_to_quit;

/*! 高清模式切换成功 */
/*! HD mode switch succeeded */
 +(NSString *)play_changeHD_alert;

/*! 云存自购买之日起计时，中途不会停止，即用户购买了云存后，中途把设备删除或停止上传录像等动作，都不能影响云存过期时间。 */
/*! Cloud storage is timed from the date of purchase, and will not stop during the time.  after the user purchases the cloud storage, the action of deleting or stopping the uploading of the video can not affect the cloud expiration time. */
 +(NSString *)cloud_storage_details_cloud_period_suspended_guide;

/*! 固件更新中会退出当前页面，请注意听设备提示音。 */
/*! It will exit current interface during updating. Please listen to voice prompt. */
 +(NSString *)devSetting_deviceUpdate_tips_2;

/*! TF卡未找到，您已购买云存储服务，可前往观看云录像。 */
/*! The TF card was not found. You have purchased a cloud storage service. You can go to watch the cloud video. */
 +(NSString *)preview_no_TF_view_cloud_video;

/*! 请选择报警时间段 */
/*! Please select the alarm time period */
 +(NSString *)deviceSetting_Alarm_Settings_select_time_period;

/*! 选择巡航模式 */
/*! Select cruise mode */
 +(NSString *)devicesetting_select_cruise_mode;

/*! 当画面中有靠近摄像机的人、车辆或大型移动物体时触发警报 */
/*! Trigger an alarm when there are people, vehicles or large moving objects close to the camera in the screen */
 +(NSString *)devicesetting_Motion_sensitivity_low;

/*! 图像色彩 */
/*! Image color */
 +(NSString *)devicesetting_Image_color;

/*! 充电指南 */
/*! Charging guide */
 +(NSString *)addDevice_Charging_guide;

/*! %1$d天 */
/*! %1$d Day */
 +(NSString *)day;

/*! 在添加蓝牙摄像机时，需要手机开启蓝牙才能搜索到蓝牙设备 */
/*! When adding a Bluetooth camera, you need to turn on the Bluetooth to search for Bluetooth devices. */
 +(NSString *)person_Bluetooth_permissions_instructions;

/*! 10.后续步骤同无线WiFi添加流程 */
/*! 10. The next steps are the same as the wireless WiFi adding process. */
 +(NSString *)help_addDevice_textTips_29;

/*! 技术培训 */
/*! Technical training */
 +(NSString *)service_map_train;

/*! 是否确定退出添加？ */
/*! Do you want to quit adding? */
 +(NSString *)Addevice_quit_add;

/*! 为你的分组取个名字吧~ */
/*! Make a name for your group */
 +(NSString *)device_group_give_name;

/*! 丹佛/美国山区 */
/*! America/Denver */
 +(NSString *)America_Denver;

/*! 验证账号 */
/*! Verify account */
 +(NSString *)person_Verify_account;

/*! 查看 */
/*! View */
 +(NSString *)playback_view_download;

/*! 全球通用paypal收付款平台 */
/*! Global paypal payment platform */
 +(NSString *)paypal_platform;

/*! 中途岛 */
/*! Pacific/Midway */
 +(NSString *)Pacific_Midway;

/*! 仰光/缅甸 */
/*! Asia/Rangoon */
 +(NSString *)Asia_Rangoon;

/*! 维修员 */
/*! Repairman */
 +(NSString *)Service_map_Repairman;

/*! ”图标 */
/*! \"icon */
 +(NSString *)adddevice_return_APP_icon;

/*! 门铃类型 */
/*! Doorbell\'s type */
 +(NSString *)bell_type;

/*! APP需要获取相机权限来扫描设备二维码，完成添加流程 */
/*! APP needs to obtain camera permission to scan the QR code of the device and complete the adding process */
 +(NSString *)permissions_camera_QR_code;

/*! 重新支付 */
/*! pay again */
 +(NSString *)devicesetting_4G_card_pay_again;

/*! 焕新登场 */
/*! New Upgrade */
 +(NSString *)Lead_page_1;

/*! 设备密码错误，您可以点击下方按钮重新添加设备 */
/*! The device password is incorrect. You can add it again by clicking the button below. */
 +(NSString *)adddevice_connect_fail_password_fail;

/*! 维修员注册 */
/*! Repairman registration */
 +(NSString *)Service_map_Repairman_registration;

/*! 尚未安装百度地图 */
/*! Baidu Map has not been installed */
 +(NSString *)service_map_baidu_not_install;

/*! 姓名未填写 */
/*! Name is not filled */
 +(NSString *)service_name_not_filed;

/*! 离线 */
/*! Offline */
 +(NSString *)myDevice_offline;

/*! 清除成功 */
/*! Cleared successfully */
 +(NSString *)person_setting_preview_Clear_success;

/*! 无线单品摄像机 */
/*! Standalone camera */
 +(NSString *)adddevice_wireless_single_product;

/*! 服务商注册 */
/*! Service provider registration */
 +(NSString *)Service_map_Service_provider_registration;

/*! 正在更新%ld */
/*! Updating %ld */
 +(NSString *)Devicesetting_Updating_ios;

/*! B.检测是否有开启报警推送？（在我的设置中查看） */
/*! B. Check whether the alarm push is enabled? (View in my settings) */
 +(NSString *)person_feedback_question_alarm_push_detail_b;

/*! 正在加载更多的数据... */
/*! Loading more info.... */
 +(NSString *)MJRefreshAutoFooterRefreshingText;

/*! 选择智能侦测时段 */
/*! Select motion detection period */
 +(NSString *)deviceSetting_Choose_smart_detection_period;

/*! 录像缓冲失败，请重试 */
/*! Video buffering failed, please try again */
 +(NSString *)playback_cloud_video_buffering_failed;

/*! 通知栏设置：应用默认都是显示通知栏通知，如果关闭，则收到通知也不会提示； */
/*! Notification column settings: By default, the application displays notices on notification column. If it is closed, you will not be notified when you receive notices; */
 +(NSString *)person_feedback_question_ROM_software_1_Notification;

/*! 注销后该账号将会被销毁，不再有效 */
/*! After delete, the account will be destroyed and no longer valid */
 +(NSString *)person_delete_account_prompt;

/*! 夜晚默认开启红外黑白夜视，有人出现时摄像机自动开启LED白光灯，画面变为彩色。 */
/*! At night, the camera turns on Infrared LEDs and see B/W image by default. Turns on spotlights and see color night vision automatically when motion detected. */
 +(NSString *)deviceSetting_smart_night_vision_describe;

/*! 查看订单 */
/*! Check order */
 +(NSString *)devicesetting_4G_card_check_order;

/*! 关机提示 */
/*! Shutdown prompt */
 +(NSString *)deviceSetting_Shutdown_prompt;

/*! 关闭布防后，将关闭设备报警录像功能 */
/*! After the alarm is disabled, the alarm recording function of the device will be turned off. */
 +(NSString *)devicelist_close_arming_prompt;

/*! 网络波动导致下载失败，是否需要重新下载 */
/*! Network fluctuations cause download failure,whether re-download? */
 +(NSString *)devicesetting_Videobackup_download_fluctuations;

/*! 开启位置权限，方便在添加设备时获取手机当前位置信息，搜索手机附近的设备热点以及判断手机是否连接上设备热点 */
/*! Turn on location permissions to get the current location information of the phone when adding a device, search for device hotspots near the phone, and determine whether the phone is connected to the device hotspot. */
 +(NSString *)person_location_permission_instructions;

/*! 云存通道 */
/*! Cloud storage channel */
 +(NSString *)Cloud_storage_service_channel;

/*! 确保手机、设备、路由器(如无请忽略)的距离都保证在信号较强范围以内 */
/*! Ensure that the distance between the mobile phone, device, and router (if there is no such  devices,please ignore) is guaranteed to be within the strong range of the signal. */
 +(NSString *)adddevice_ensure_distance;

/*! 不能含有空格 */
/*! Can\'t contain space character */
 +(NSString *)contain_space;

/*! 为保护您的隐私安全,请为设备设置密码 */
/*! To protect your privacy, please set a password for the device */
 +(NSString *)devicelist_protect_privacy_device_password;

/*! 发现新设备 */
/*! Find new device */
 +(NSString *)device_discoverNew;

/*! 录像与侦测设置 */
/*! Recording and detection settings */
 +(NSString *)devicesetting_record_and_detection_set;

/*! 周六 */
/*! Saturday */
 +(NSString *)person_alarm_selct_time_sat;

/*! 上次播放到 */
/*! Last played to  */
 +(NSString *)devicesetting_last_play_IOS;

/*! 添加需要花费一些时间，过程中会自动断开与切换WiFi，请您耐心等候 */
/*! It Takes a Few Minutes for Device Setup,the WiFi Connection Would Swith during this Processing,Please Wait */
 +(NSString *)addDevice_guideReset_configuration;

/*! 地图 */
/*! Map */
 +(NSString *)preview_map;

/*! 触摸屏NVR */
/*! Touch screen NVR */
 +(NSString *)adddevice_Touch_screen_NVR;

/*! 可测试 */
/*! Testable */
 +(NSString *)devicesetting_4G_device_testable;

/*! 连接帮助 */
/*! Connection help */
 +(NSString *)preview_Connection_help;

/*! 当前已配网%1$d台设备 */
/*! Currently equipped with %1$d devices */
 +(NSString *)smartlink_device_number_prompt;

/*! 戈特霍布 */
/*! America/Godthab */
 +(NSString *)America_Godthab;

/*! 扫码添加设备 */
/*! Scan code to add device */
 +(NSString *)addDevice_scan_code;

/*! 常看位置与看守位 */
/*! Preset position and home position */
 +(NSString *)preview_Preset_guard_position;

/*! 请输入正确邮箱地址 */
/*! Please input the correct email address */
 +(NSString *)email_error_tips;

/*! 找不到设备二维码? */
/*! Can\'t find the device QR code? */
 +(NSString *)adddevice_not_find_QR_code;

/*! 自动 */
/*! Auto */
 +(NSString *)auto;

/*! 输入设备名称或ID */
/*! Enter the device name or ID */
 +(NSString *)devicelist_Enter_device_name_ID;

/*! %1$d个月 */
/*! %1$d Month */
 +(NSString *)months;

/*! 请输入支付信息 */
/*! Please enter payment information */
 +(NSString *)cloud_pay_stripe_enter_pay_information;

/*! 抱歉，离线设备不能迁移云存 */
/*! Sorry,offline devices cannot migrate cloud storage */
 +(NSString *)Playback_migrate_device_offline;

/*! 版本更新提示 */
/*! Version update tips */
 +(NSString *)Update_Version_update_tips;

/*! 变焦 */
/*! Zoom */
 +(NSString *)preview_Zoom;

/*! 设置视频色彩、风格、清晰度 */
/*! Set video color,style,clarity */
 +(NSString *)devicesetting_set_csc;

/*! 懂技术的用户 */
/*! Technical users */
 +(NSString *)Service_map_Technical_users;

/*! 摄像机始终处于夜视模式，适合光线一直比较昏暗的室内 */
/*! The camera is always in night vision mode, suitable for indoors where the light is always dim */
 +(NSString *)deviceSetting_camera_always_turns_suitable_indoors_dim;

/*! 实时监测，24h安全守护 */
/*! 24h safe guard */
 +(NSString *)me_Real_time_monitoring;

/*! 加拉加斯/委内瑞拉 */
/*! America/Caracas */
 +(NSString *)America_Caracas;

/*! 布里斯班 */
/*! Australia/Brisbane */
 +(NSString *)Australia_Brisbane;

/*! ② 选择“时间设置”，保持时间同步栏始终为开启状态； */
/*! ② Select \"Time Settings\" to keep the time synchronization bar always on */
 +(NSString *)Cloud_detail_guide_step2;

/*! 有效时间 */
/*! Effective time */
 +(NSString *)cloud_effective_time;

/*! 配置未完成，确定要退出吗？ */
/*! Configuration not complete,exit? */
 +(NSString *)addDevice_unfinished;

/*! 检测到%@未使用设备自带4G流量卡，该行为会导致您无法在APP内充值流量，请及时切换回设备自带卡 */
/*! It was detected that %@ did not use the device\'s built-in 4G traffic card, which will cause you to be unable to recharge the traffic in the APP. Please switch back to the device\'s built-in card in time */
 +(NSString *)devicelisit_not_built_in_4G_prompt_IOS;

/*! 录像日程最多可添加8条 */
/*! 8 records can be added to the recording schedule at top */
 +(NSString *)devicesetting_record_schedule_up_8;

/*! 提示：暂不支持5GHZ无线网络 */
/*! Tip: 5GHZ wireless network is not supported at this time */
 +(NSString *)addevice_tip_5G;

/*! 密码设置中... */
/*! Password setting... */
 +(NSString *)devicelist_Password_setting;

/*! 夜视模式设置 */
/*! Night Vision Mode Settings */
 +(NSString *)deviceSetting_night_vision_settings;

/*! 录像声音 */
/*! Enable audio recording */
 +(NSString *)deviceSettings_voice;

/*! 请检查您的手机与基站网络是否良好 */
/*! Please check whether your mobile phone and base station network are in good condition */
 +(NSString *)Addevice_check_phone_network;

/*! 常看位置名称不能为空 */
/*! Preset location name cannot be empty */
 +(NSString *)preset_name_cnanot_empty;

/*! 内容不能为空 */
/*! The content can not be blank */
 +(NSString *)Stand_alone_station_content_can_not_be_blank;

/*! 镜头控制 */
/*! Lens control */
 +(NSString *)preview_ptz_data_control;

/*! 继续添加 */
/*! Keep adding */
 +(NSString *)devicelist_Keep_adding;

/*! 根据用户设定的常看位置，依次巡航 */
/*! Cruise in sequence according to the preset position set by the user */
 +(NSString *)deviceSetting_Cruise_frequently_locations_user;

/*! 搜索设备(名称或ID) */
/*! search for device (name or ID) */
 +(NSString *)search_device_name_ID;

/*! 云存套餐 */
/*! Cloud storage package */
 +(NSString *)cloud_Cloud_storage_package;

/*! 发送蓝牙数据失败，设备无响应 */
/*! Failed to send bluetooth data,no respond from device */
 +(NSString *)addDevice_send_bluetooth_fail_noResponse;

/*! 录像循环周期 */
/*! Video cycle */
 +(NSString *)cloud_video_cycle;

/*! 门铃对讲正在被占用 */
/*! Doorbell two way talk is taken */
 +(NSString *)bell_occupied;

/*! 允许读写存储权限，才能正常观看视频 */
/*! Allow read and write storage permission and then can watch video */
 +(NSString *)access_readAndWrite_toWatch;

/*! 云存录像 */
/*! Cloud storage recording */
 +(NSString *)cloud_video;

/*! 云存商城 */
/*! Cloud storage mall */
 +(NSString *)cloud_store;

/*! 选择局域网WiFi */
/*! Select LAN WiFi */
 +(NSString *)deviceSetting_Change_WIFI_select;

/*! 分区格式：FAT32 */
/*! Partition format: FAT32 */
 +(NSString *)person_feedback_question_type_memory_card_detail_Partition;

/*! 请确保设备和手机连接是一个路由器，这样才能保证在一个局域网 */
/*! Please make sure that device and phone are connected the same router, so as to ensure that it is in a local area network */
 +(NSString *)adddevice_help_prompt;

/*! 正在配网 */
/*! Configure network in progress */
 +(NSString *)devicesetting_Configure_network_progress;

/*! 服务器连接失败（%1$s） */
/*! Server connection failed (%1$s) */
 +(NSString *)Addevice_Server_connection_failed;

/*! 正在播放 */
/*! Now Playing */
 +(NSString *)deviceSetting_now_playing;

/*! 选择通道 */
/*! Choose channel */
 +(NSString *)channel_choose;

/*! 套餐选择 */
/*! Package selection */
 +(NSString *)cloud_package_selection;

/*! 请选择WiFi */
/*! Please choose WiFi */
 +(NSString *)devicesetting_Please_choose_WiFi;

/*! 支付 */
/*! Pay */
 +(NSString *)cloud_storage_pay;

/*! 远程使用： */
/*! Remote View： */
 +(NSString *)adddevice_remote_use;

/*! 巡航模式 */
/*! Cruise mode */
 +(NSString *)deviceSetting_Cruise_mode;

/*! 设备不支持兑换该套餐 */
/*! The device does not support redemption of the package */
 +(NSString *)cloud_device_does_not_redeem_package;

/*! 后台应用保护：需要手动把应用加到此列表，否则设备进入睡眠后会自动杀掉应用进程， 只有手动开启应用才能恢复运行； */
/*! Background application protection: you need to manually add the application to this list, otherwise the device will automatically shut down the application process after the device enters sleep, and only restart the application manually to resume operation; */
 +(NSString *)person_feedback_question_ROM_software_2_Background;

/*! 截图 */
/*! Screenshot */
 +(NSString *)photos;

/*! 设备录像 */
/*! LocalStorage */
 +(NSString *)playback_Device_storage;

/*! 下单时间 */
/*! Order time */
 +(NSString *)cloud_order_time;

/*! %1$s - %2$s启动智能侦测 */
/*! %1$s - %2$s activate motion detection */
 +(NSString *)devicesetting_Detect_only_during_day_time_android;

/*! 登录中 */
/*! Logging */
 +(NSString *)logging_in;

/*! 是否添加该设备？ */
/*! Add this device or not? */
 +(NSString *)devSetting_add_ask;

/*! 最高 */
/*! Highest */
 +(NSString *)deviceSetting_highest;

/*! 报警录制，只有在摄像机前检测有人走过、物品被移动等触发摄像机报警侦测时才会上传录像。 */
/*! Alarm recording, the video will only be uploaded when the camera detects that human has passed, the item has been moved, and the camera alarm is triggered. */
 +(NSString *)cloud_storage_details_types_2;

/*! Q2：将存储卡从摄像机中取出，插入电脑，提示修复磁盘 */
/*! Q2: Remove the memory card from the camera, insert it into the computer, and prompt to repair the disk */
 +(NSString *)person_feedback_question_type_memory_card_repair;

/*! 1.设备连通电源，接上路由器 */
/*! 1.Power the device and connect to router */
 +(NSString *)addDevice_help_text6;

/*! 再次确认新密码 */
/*! Confirm new password again */
 +(NSString *)devicesetting_Confirm_new_password_again;

/*! 中国/香港 */
/*! China/Hong Kong */
 +(NSString *)Asia_Hong_Kong;

/*! 巴格达 */
/*! Asia/Baghdad */
 +(NSString *)Asia_Baghdad;

/*! 选择设备通道 */
/*! Select device channel */
 +(NSString *)cloud_buy_select_device_ch;

/*! 让基站发出警报声 */
/*! Let this NVR/ base station sounds siren */
 +(NSString *)devicesetting_Base_station_alarm_describe;

/*! 仅夜间侦测 */
/*! Night */
 +(NSString *)devicesetting_Night_detection_only;

/*! 自定义提示音 */
/*! Custom prompt tone */
 +(NSString *)devicesetting_Custom_tone;

/*! 松开立即加载更多 */
/*! Release to load more. */
 +(NSString *)MJRefreshBackFooterPullingText;

/*! 复制本页设置到其他摄像机 */
/*! Copy the settings of this page to other cameras */
 +(NSString *)devicesetting_Copy_settings_other_cameras;

/*! 不配置，直接添加 */
/*! Not configured, add directly */
 +(NSString *)adddevice_Add_directly;

/*! 请选择您要反馈的问题类型 */
/*! Please select the type of question you want to feedback */
 +(NSString *)person_feedback_select_question_type;

/*! 查看帮助 */
/*! View help */
 +(NSString *)devicelist_Offline_help_view;

/*! 录像设置 */
/*! Recording setting */
 +(NSString *)devicesetting_record_setting;

/*! 添加失败 */
/*! Failed to add */
 +(NSString *)addDevice_add_failure;

/*! 还有其他问题吗？ */
/*! Do you have any other questions? */
 +(NSString *)Stand_alone_station_other_questions;

/*! 轻触屏幕重新加载 */
/*! Touch screen to re-load */
 +(NSString *)cloud_reload_page;

/*! 连接失败 */
/*! Configuration failed */
 +(NSString *)addDevice_fail;

/*! 下载中，请勿进行其他操作。 */
/*! Do not perform other operations while downloading. */
 +(NSString *)playback_downloading;

/*! 下拉可以刷新 */
/*! Pull down to refresh */
 +(NSString *)MJRefreshHeaderIdleText;

/*! 将设备时间与手机同步 */
/*! Sync device time with phone */
 +(NSString *)devicesetting_Sync_device_time_phone;

/*! 您还未提交过反馈 */
/*! You have not submitted feedback */
 +(NSString *)person_feedback_no_record;

/*! 补光灯 */
/*! Fill light */
 +(NSString *)preview_Fill_light;

/*! 智能夜视 */
/*! Smart night vision */
 +(NSString *)preview_smart_night_vision;

/*! 检查网络 */
/*! Check the network */
 +(NSString *)adddevice_check_network;

/*! 标清 */
/*! SD */
 +(NSString *)SD;

/*! 添加配置帮助 */
/*! Add configuration help */
 +(NSString *)adddevice_add_configuration_help;

/*! 仅白天 */
/*! Day only */
 +(NSString *)Devicesetting_Day_only;

/*! 输入邮箱/手机号 */
/*! Email/phone number */
 +(NSString *)enter_your_email_number;

/*! 二 */
/*! T */
 +(NSString *)Tuesday;

/*! 设置设备名 */
/*! Set device name */
 +(NSString *)adddevice_set_device_name;

/*! Aliexpress */
/*! Aliexpress */
 +(NSString *)help_Aliexpress;

/*! 体验模式不支持分享添加 */
/*! Local experience mode doesn\'t support sharing */
 +(NSString *)local_does_not_support_share;

/*! 6.等待设备配置 */
/*! 6.Wait for configuration */
 +(NSString *)help_addDevice_textTips_12;

/*! 立即注册 */
/*! Sign up now */
 +(NSString *)Service_map_Sign_up_now;

/*! 当前手机已关闭APP消息推送功能，请前往开启 */
/*! The current mobile phone has closed the APP message push function, please go to open */
 +(NSString *)devicelist_push_prompt;

/*! 通话发起失败 */
/*! Call failed */
 +(NSString *)preview_call_fail;

/*! 暖色调 */
/*! Warm tones */
 +(NSString *)deviceSetting_Warm_tones;

/*! 下载易视云 */
/*! Download EseeCloud */
 +(NSString *)download_Eseecloud;

/*! 现已添加到回放当中 */
/*! Now added to the playback */
 +(NSString *)devicelist_cloud_guide_1;

/*! (服务通道数：) */
/*! (Number of service channels:) */
 +(NSString *)cloud_purchase_number_serve_channel;

/*! 二维码生成失败，请检查网络是否良好 */
/*! Qr code generation failed, please check whether the network is good */
 +(NSString *)adddevice_qr_code_generate_fail;

/*! AP连接 */
/*! AP connection */
 +(NSString *)adddevice_AP_connection;

/*! SIM卡在线 */
/*! SIM card online */
 +(NSString *)devicesetting_4G_card_sim_card_online;

/*! 添加联系方式 */
/*! Add contact information */
 +(NSString *)cloud_feedback_contactInformation;

/*! 自适应模式 */
/*! Adaptive mode */
 +(NSString *)devicesetting_Adaptive_mode;

/*! 设备语音提示 */
/*! Device voice prompt */
 +(NSString *)deviceSetting_Device_voice_prompt;

/*! 请仔细阅读操作步骤 */
/*! Please read the steps carefully */
 +(NSString *)addevice_read_steps;

/*! 下载列表(%1$s) */
/*! Download list(%1$s) */
 +(NSString *)preview_download_progress_number;

/*! 获取云存状态失败 */
/*! Failed to get the cloud status */
 +(NSString *)cloud_get_status_fail;

/*! *若不能正确找到网线接口，请参考说明书 */
/*! *If the network cable interface cannot be found correctly,please refer to the instruction manual. */
 +(NSString *)adddevice_Wireless_add_mode_prompt;

/*! 立即开机 */
/*! Boot immediately */
 +(NSString *)devicelist_Boot_immediately;

/*! 订单价格 */
/*! Price */
 +(NSString *)order_price;

/*! 抱歉，暂未搜索到相关城市 */
/*! Sorry, no relevant cities have been searched */
 +(NSString *)service_map_not_search_city;

/*! 录像保存成功 */
/*! Video saved successfully */
 +(NSString *)play_screenRecord_success;

/*! 检测到%1$s未使用设备自带4G流量卡，该行为会导致您无法在APP内充值流量，请及时切换回设备自带卡 */
/*! It was detected that %1$s did not use the device\'s built-in 4G traffic card, which will cause you to be unable to recharge the traffic in the APP. Please switch back to the device\'s built-in card in time */
 +(NSString *)devicelisit_not_built_in_4G_prompt;

/*! %1$s - %2$s推送消息 */
/*! %1$s - %2$s push message */
 +(NSString *)deviceSetting_Push_during_day_time_android;

/*! 4.多次扫码仍听不到提示音，请复位设备，点击下方按钮改用其他方式连接。 */
/*! 4. If you still can\'t hear the prompt tone after scanning the code for many times, please reset the device and click the button below to connect in other ways. */
 +(NSString *)addDevice_no_sound_help_4;

/*! 无匹配套餐 */
/*! No matching package */
 +(NSString *)cloud_no_match_package;

/*! 抱歉，该设备已分享给%1$s个用户，请逐个删除分享用户 */
/*! Sorry, this device has been shared to %1$s users, please delete shared users one by one */
 +(NSString *)person_linkvisual_share_prompt;

/*! Q1：局域网或者ID添加时，提示“设备不在线”或“设备未注册”？ */
/*! Q1: When adding a LAN or ID, it prompts \"The device is not online\" or\"The device is not registered\"? */
 +(NSString *)person_feedback_question_prompt_error;

/*! 切换其他WiFi */
/*! Switch to other WiFi */
 +(NSString *)addDevice_switch_wifi_other;

/*! 婴儿发烧警告 */
/*! Baby fever warning */
 +(NSString *)alarm_baby_fever_warning;

/*! 警报声开关 */
/*! Siren switch */
 +(NSString *)devicesetting_Alarm_sound_switch;

/*! 保存成功 */
/*! Succeed to save */
 +(NSString *)save_success;

/*! 2.请检查附近是否存在支持智能连接的设备 */
/*! 2. Please check if there is a device nearby that supports smart connection. */
 +(NSString *)smartlin_distribution_network_fail_prompt_two;

/*! 新密码格式错误，请重新输入 */
/*! Format of new password is wrong,please input again. */
 +(NSString *)password_new_format_error;

/*! 九安将不定期的为您更新安防设备维修技术视频教学，您可以快速的提高维修技术。 */
/*! Juan will update the security equipment maintenance technology video teaching for you from time to time, you can quickly improve the maintenance technology. */
 +(NSString *)service_map_improve;

/*! 为设备%1$s连接WiFi */
/*! Connect WiFi for device %1$s */
 +(NSString *)addDevice_connection_WIFI;

/*! 选择时间段 */
/*! Choose period of time */
 +(NSString *)selection_time;

/*! 报警推送 */
/*! Alarm push */
 +(NSString *)devicelist_alarm_push;

/*! 1.如果路由器设置了桥连模式，会因为WiFi信号不稳定，导致连接失败。 不建议摄像机联网时使用桥连模式的WiFi。 */
/*! 1. If the router is set to bridge mode, the WiFi signal will be unstable, causing the connection to fail. It is not recommended to use WiFi in bridge mode when the camera is networked. */
 +(NSString *)person_feedback_question_check_other_question_1;

/*! 修复过程中会对TF卡进行格式处理清空所有录像 */
/*! During the repair process, the TF card will be formatted and all videos will be cleared. */
 +(NSString *)deviceSetting_During_repair_process_TFcard_cleared;

/*! 版本更新失败，请重新下载 */
/*! Fail to update new version,please download again */
 +(NSString *)version_updateFailed;

/*! 回放失败，请检查网络状态 */
/*! Playback failed, please check network status */
 +(NSString *)playback_Playback_failed_check_network;

/*! 开启推送权限，通知栏、状态栏、锁屏上将显示本应用推送给您的报警消息 */
/*! Turn on push permission, the alarm bar will be displayed on the notification bar, status bar, and lock screen. */
 +(NSString *)person_Notification_permission_instructions;

/*! ① 如果设备已连接网络，指示灯常亮，且设备和手机处于同一个局域网，点击“手动添加”进入添加。 */
/*! ① If the device is connected to the network, the indicator light is always on, and the device  and the mobile phone are on the same LAN. Click \"Add manually\" to enter the addition. */
 +(NSString *)adddevice_device_indicator_light_on;

/*! 加盟成为代理商 */
/*! Join as an agent */
 +(NSString *)Service_map_Join_as_an_agent;

/*! 休眠 */
/*! Dormancy */
 +(NSString *)devicelist_dormancy;

/*! 报警声音 */
/*! Alarm sound */
 +(NSString *)devicesetting_Device_Alarm_tone;

/*! 上次播放到%1$s */
/*! Last played to %1$s */
 +(NSString *)devicesetting_last_play;

/*! 云存名称 */
/*! Name of cloud storage */
 +(NSString *)cloud_name;

/*! 哈拉雷/中部非洲 */
/*! Africa/Harare */
 +(NSString *)Africa_Harare;

/*! 信息加密上传，隐私多重保护 */
/*! Information encryption upload */
 +(NSString *)person_Information_encryption;

/*! 下载 */
/*! Download */
 +(NSString *)deviceSetting_videoBackup_download;

/*! %ld天 */
/*! %ld Day */
 +(NSString *)day_plural_ios;

/*! 抱歉，没有符合的云卡套餐 */
/*! Sorry, there is no matching cloud card package */
 +(NSString *)cloud_no_match_card_package;

/*! WiFi列表获取失败 */
/*! Failed to get WiFi list */
 +(NSString *)addevice_get_wifi_list_fail;

/*! 通话中 */
/*! calling */
 +(NSString *)devicesetting_calling;

/*! 录像模式 */
/*! Record mode */
 +(NSString *)deviceSetting_Video_mode;

/*! 云台校准 */
/*! PTZ calibration */
 +(NSString *)preview_ptz_adjustment;

/*! 上次访问 */
/*! Recent */
 +(NSString *)me_lastAccwssTime;

/*! 视频加载不能出图 */
/*! Video loading can not draw */
 +(NSString *)person_feedback_video_cannot_loading_video;

/*! 下载失败(%@)个，已下载(%@)个。 */
/*! Downloads failed (%@), downloaded (%@). */
 +(NSString *)preview_download_fail_ios;

/*! 时间同步成功 */
/*! Time sync succeeds */
 +(NSString *)synchronous_time_success;

/*! 通道2 */
/*! Channel 2 */
 +(NSString *)channel_two;

/*! 常看位置 */
/*! Position */
 +(NSString *)preview_position;

/*! 3.可点击底部“其他添加方式”按钮，切换IP添加方式。 */
/*! 3.Click \"other adding ways\" on the button to change the IP adding ways */
 +(NSString *)help_addDevice_textTips_20;

/*! 请填写您的邮箱地址 */
/*! Please enter your email address */
 +(NSString *)Help_enter_email_address;

/*! 1.打开设置->选择WLAN，将手机无线网络连接到设备热点 */
/*! 1. Open Settings-> Select Wi-Fi，connect the mobile phone wireless network to the device hotspot */
 +(NSString *)addevice_open_Wlan;

/*! 您输入的密码为空，请再次确认。 */
/*! The password you entered is empty, please confirm it again. */
 +(NSString *)addDevice_WiFi_password_empty;

/*! 1.设备没插电源； */
/*! 1.The device is not powered on; */
 +(NSString *)devicesetting_4G_card_sim_card_device_no_electricity;

/*! 没有找到“%1$s”相关内容 */
/*! No related content found for \"%1$s\" */
 +(NSString *)search_no_relate_content;

/*! VIVO[Funtouch OS] */
/*! VIVO [Funtouch OS] */
 +(NSString *)person_feedback_question_ROM_software_vivo;

/*! 普通模式 */
/*! General mode */
 +(NSString *)preview_preset_normal_mode;

/*! 晚上20:00 - 次日早上08:00关闭摄像机 */
/*! 20:00 in the evening-turn off the camera at 08:00 the next morning */
 +(NSString *)deviceSetting_evening_turn_off_next_morning;

/*! 2、如何关闭云录像自动上传功能？ */
/*! 2、 How to turn off the automatic upload function of cloud recording? */
 +(NSString *)cloud_storage_details_how_to_off_record;

/*! 可能是网络原因导致连接失败 */
/*! Fail connection might be caused by network */
 +(NSString *)adddevice_fail_network_cause;

/*! 云台自检 */
/*! PTZ self-check */
 +(NSString *)devicesetting_ptz_self_check;

/*! 请选择您所在的详细地址 */
/*! Please select your detailed address */
 +(NSString *)Service_map_select_address;

/*! Others */
/*! Others */
 +(NSString *)help_Others;

/*! 高德地图 */
/*! Gaode Map */
 +(NSString *)service_map_gaode;

/*! Q5：物理掰动摄像头后，如何进行矫正？ */
/*! Q5: How to correct it after physically shaking the camera? */
 +(NSString *)person_feedback_question_correct_address;

/*! 正在格式化... */
/*! Formatting */
 +(NSString *)Devicesetting_Formatting;

/*! 3.暂不支持5GHZ无线网络 */
/*! 3.Temporarily do not support 5GHZ wireless network */
 +(NSString *)adddecvice_not_support_5G;

/*! 预警 */
/*! Forewarning */
 +(NSString *)devicesetting_early_warning;

/*! 安全设置 */
/*! Security Settings */
 +(NSString *)deviceSetting_Security_Settings;

/*! 设备热点已连接完成！点击开始自动联网 */
/*! The device hotspot has been connected! Click to start automatic networking */
 +(NSString *)adddevice_Successfully_connected_automatic_networking;

/*! 到这里 */
/*! Go to here */
 +(NSString *)Service_map_Go_to_here;

/*! 通道名称不能为空 */
/*! Channel name can\'t be empty */
 +(NSString *)channel_name_be_empty;

/*! 编辑设备名称 */
/*! Edit device name */
 +(NSString *)devicelist_Edit_device_name;

/*! 添加摄像机 */
/*! Add camera */
 +(NSString *)help_addDevice_textTips_1;

/*! 每次录像完成后，该时间段内不再拍摄新录像 */
/*! After each recording is completed, no new recordings will be taken within this period of time */
 +(NSString *)deviceSetting_Video_sleep_duration_describe;

/*! 操作太频繁 */
/*! Operation is very frequent */
 +(NSString *)often;

/*! 摄像机暂时无法使用5G频段WiFi，请选择2.4G频段WiFi后，输入正确密码，再进行连接。 */
/*! The camera is temporarily unable to use the 5G band WiFi. Please select the 2.4G band WiFi, enter the correct password, and then connect. */
 +(NSString *)adddevice_network_error_detail;

/*! 查看购买的云存订单信息 */
/*! View purchased cloud storage order information */
 +(NSString *)person_view_purchased_cloud_order_information;

/*! 购买结果 */
/*! Purchase result */
 +(NSString *)devicesetting_4G_card_Purchase_result;

/*! 超清 */
/*! Ultra-clear */
 +(NSString *)BD;

/*! 验证失败 */
/*! Verification failed */
 +(NSString *)Register_verification_failed;

/*! 检查您的设备是否已处于通电状态，状态灯是否已点亮； */
/*! Check if your device is powered and the status light is on; */
 +(NSString *)devicelist_offline_help_content_one;

/*! 重新配置 */
/*! Reconfigure */
 +(NSString *)password_Reconfigure;

/*! 云录像已过期，请及时续费 */
/*! Cloud recording has expired, please renew in time */
 +(NSString *)cloud_recording_expired_renew_in_time;

/*! 反馈和建议 */
/*! Make a suggestion */
 +(NSString *)Help_make_a_suggestion;

/*! 确认注销 */
/*! Confirm deletion */
 +(NSString *)person_Confirm_Cancellation;

/*! 不可用 */
/*! unavailable */
 +(NSString *)devicesetting_4G_card_package_unavailable;

/*! （长按Reset键3秒） */
/*! (Press and hold the reset key for 3 seconds) */
 +(NSString *)Addevice_reset_3s;

/*! 失败帮助 */
/*! Failure help */
 +(NSString *)devicelist_fail_help;

/*! 设备通话音量 */
/*! Device call volume */
 +(NSString *)deviceSetting_Device_call_volume;

/*! 支付宝 */
/*! Alipay */
 +(NSString *)cloud_payment_Alipay;

/*! 变倍 */
/*! Zoom */
 +(NSString *)play_ptz_zoom;

/*! 请重新输入 */
/*! Please input again */
 +(NSString *)enter_again;

/*! 区域高度： */
/*! Area height： */
 +(NSString *)devicesetting_area_height;

/*! 剩余%1$s */
/*! %1$s remaining */
 +(NSString *)devicesetting_remaining;

/*! 可查看当前通道订单记录 */
/*! View current channel order record */
 +(NSString *)Cloud_storage_service_order_record_prompt;

/*! 设备端警报设置 */
/*! Device side alarm settings */
 +(NSString *)devicesetting_Device_side_alarm_settings;

/*! 画面色调 */
/*! Picture tone */
 +(NSString *)deviceSetting_Picture_tone;

/*! 人脸侦测报警 */
/*! Face detection alarm */
 +(NSString *)devicesetting_face_detection;

/*! 已有账号，现在登录 */
/*! Already have account,log in */
 +(NSString *)existing_account_now_login;

/*! 时间轴上的颜色表示什么？ */
/*! What do the colors on the timeline represent? */
 +(NSString *)playback_timeline_color_meaning;

/*! 请选择路由器WiFi */
/*! Please select router WiFi */
 +(NSString *)addevice_select_router_WiFi;

/*! 设备型号 */
/*! Device model */
 +(NSString *)devicesetting_device_model;

/*! 删除并复位摄像机 */
/*! Delete and reset the camera */
 +(NSString *)devicesetting_delete_reset_camera;

/*! 逆光环境 */
/*! Backlight environment */
 +(NSString *)addevice_Backlight_environment;

/*! 没有搜索到任何设备 */
/*! No device found */
 +(NSString *)addevice_no_device_found;

/*! 获取中... */
/*! Obtainning... */
 +(NSString *)obtaining;

/*! 打开摄像机设备设置，点击“云台校准”即可校正摄像机镜头位置。 */
/*! Open the camera device settings, and click \"PTZ adjustment\" to correct the camera lens position. */
 +(NSString *)person_feedback_question_correct_address_detail;

/*! 添加常看位置 */
/*! Add preset positions */
 +(NSString *)preset_add_new;

/*! 正在解锁中 */
/*! Unlocking */
 +(NSString *)devicesetting_unlocking;

/*! 方法1：若已开通云存录像，即可在设备列表界面中点击“云存”按钮，则跳转至录像界面。 */
/*! Method 1:if enable cloud storage recording,only need to click \"cloud storage\" button and check recording in delive list interface */
 +(NSString *)help_cloud_storage_textTips_7;

/*! 固件升级中，请不要操作设备，保持电源与网络正常 */
/*! During the firmware upgrade, please do not operate the device and keep the power and network normal. */
 +(NSString *)devicesetting_firmware_upgrade_prompt;

/*! 1.请确认设备所在的网络能正常访问互联网，并且路由器已开启DHCP功能； */
/*! 1.Please make sure the network is normal and already enable DHCP on router. */
 +(NSString *)help_normal_problem_text_2;

/*! 取消体验模式提醒 */
/*! Cancel the experience mode reminder */
 +(NSString *)login_Cancel_experience_reminder;

/*! SIM卡可激活 */
/*! SIM card can be activated */
 +(NSString *)devicesetting_4G_device_can_be_activated;

/*! 不能重复添加设备 */
/*! Can\'t add device twice */
 +(NSString *)addDevice_cannot_repeatedly;

/*! 连接设备失败(失败，密码错误，超时) */
/*! Fail to connect device (failure,wrong passowrd,timeout) */
 +(NSString *)prompt_connection_failed;

/*! (1)离线设备云服务迁移条件：当前账号存在离线且已绑定云服务的设备； */
/*! (1) Offline device cloud service migration conditions: the current account has offline devices that have been bound to the cloud service; */
 +(NSString *)cloud_help_migration_device_1;

/*! 红外 */
/*! Infrared */
 +(NSString *)infrared;

/*! 检测结果 */
/*! Test results */
 +(NSString *)devicesetting_Device_signal_Test_results;

/*! 充值时间： */
/*! Top-up time: */
 +(NSString *)devicesetting_4G_card_recharge_time;

/*! 报警开启失败 */
/*! Alarm opening failed */
 +(NSString *)preview_alarm_open_fail;

/*! 暂时不用 */
/*! No at present */
 +(NSString *)me_temporary;

/*! 常看位置必须在0-255之间 */
/*! The preset position must be between 0-255 */
 +(NSString *)person_setting_preview_position_between_section;

/*! SIM卡状态 */
/*! SIM card status */
 +(NSString *)devicesetting_4G_card_sim_card_status;

/*! 设备指示灯 */
/*! Device indicator */
 +(NSString *)devicesetting_device_indicator;

/*! 有线设备 */
/*! Wired device */
 +(NSString *)device_wireline;

/*! 总流量%@ */
/*! Total mobile data %@ */
 +(NSString *)devicesetting_total_traffic_ios;

/*! 未检测到TF卡 */
/*! TF card not detected */
 +(NSString *)devicesetting_TF_card_not_detected;

/*! 用手指在视频区域画一条直线，就可以生成一条警戒线，警戒线经过的区域将进行移动侦测 */
/*! Use your finger to draw a line in the video area to generate a warning line. The area where the warning line passes will be motion detected. */
 +(NSString *)devicesetting_add_warn_line_detail;

/*! 姓名不能含数字、符号、大写字母或小写字母 */
/*! Your name can\’t contain numbers,symbols,uppercase or lowercase letters */
 +(NSString *)service_name_not_numer;

/*! 可缩放视频区域大小 */
/*! Scalable video area size */
 +(NSString *)devicesetting_area_Zoom;

/*! 备份通道 */
/*! Backup channel */
 +(NSString *)devicesetting_preview_Backup_channel;

/*! 将切换为在家模式，智能侦测不会自动录像 */
/*! Will switch to home mode, motion detection will not automatically record */
 +(NSString *)devicelist_inhome_prompt;

/*! 正在录像中... */
/*! Recording... */
 +(NSString *)play_screenRecording;

/*! 有问题需要帮助？ */
/*! Need help with a problem? */
 +(NSString *)adddevice_question_help;

/*! 注意：WLAN+、智能WiFi、WiFi+、WiFi助手如已打开，配置时请关闭 */
/*! Note: WLAN+, Smart Wi-Fi, Wi-Fi+, Wi-Fi Assistant are turned on, please close when configuring. */
 +(NSString *)adddevice_note_network;

/*! 上传崩溃文件 */
/*! Upload crash file */
 +(NSString *)person_set_Upload_crash_file;

/*! 智能侦测录像时长 */
/*! Motion detection recording duration */
 +(NSString *)devicesetting_motion_video_duration;

/*! 连接设备WiFi后，等待手机电量条出现WiFi图标 */
/*! After connecting the device WiFi, wait for the WiFi icon on the phone\'s battery bar */
 +(NSString *)adddevice_wait_for_wifi_icon;

/*! 开启 */
/*! Enable */
 +(NSString *)open;

/*! 有实体门店的用户 */
/*! Users with physical stores */
 +(NSString *)Service_map_Users_with_physical_stores;

/*! 1、设备NVR指示灯是否常亮？ */
/*! 1、Is indicator light of NVR is long on? */
 +(NSString *)addDevice_guide_lightFlash_NVR;

/*! 选择录制方式 */
/*! Choose recording method */
 +(NSString *)deviceSetting_Choose_recording_method;

/*! 服务天数小于30天时才能续费 */
/*! Only can renewal if the service days are less than 30 days */
 +(NSString *)cloud_ch_renewal_prompt;

/*! Lingua italiana */
/*! Lingua italiana */
 +(NSString *)Italian;

/*! 无法观看云录像 */
/*! Unable to watch cloud video */
 +(NSString *)playback_unable_to_watch;

/*! 网络不给力，请点击重试 */
/*! The network is not strong,  please click to try again */
 +(NSString *)Help_network_is_not_strong;

/*! 绑定/授权 */
/*! Binding/Authorization */
 +(NSString *)person_Binding_Authorization;

/*! 密码格式有误，请重新输入 */
/*! Format of password is wrong,please input again */
 +(NSString *)password_format_wrong;

/*! 定点巡航 */
/*! Fixed-point cruise */
 +(NSString *)devicesetting_fixed_point;

/*! 添加成功，请点击“完成” */
/*! Added successfully, please click \"Finish\" */
 +(NSString *)adddevice_add_device_ID;

/*! ID： */
/*! ID： */
 +(NSString *)text_ID_1;

/*! (此时指示灯变为闪烁) */
/*! (The indicator light flashes at this time) */
 +(NSString *)adddevice_light_flash;

/*! 1.确认TF卡是否已经插入 */
/*! 1. Confirm whether the TF card has been inserted */
 +(NSString *)playback_check_following_questions_1;

/*! 扫描兑换码 */
/*! Scan exchange code */
 +(NSString *)cloud_scan_code;

/*! 自定义关机时间段 */
/*! Custom shutdown time period */
 +(NSString *)deviceSetting_Custom_shutdown_time_period_camera_;

/*! 第三步：找到设备机身或显示屏上的二维码(如找不到二维码，请选择“其它添加方式”) */
/*! Step 3： Find the QR code on the device or display screen (if you can\'t find the QR code, please  select \"Additional Adding Method\") */
 +(NSString *)adddevice_step_3;

/*! 3.客观原因供电不稳导致摄像机断电，机器无法正常工作； */
/*! 3. Unstable power supply causes the camera to power off, and the machine cannot work normally; */
 +(NSString *)person_feedback_question_video_incomplete_3;

/*! 正对设备镜头 */
/*! Facing the lens of the device */
 +(NSString *)adddevice_face_device_lens;

/*! 2.检查TF卡是否有效和没有损坏 */
/*! 2. Check if the TF card is valid and not damaged */
 +(NSString *)playback_check_following_questions_2;

/*! 服务商简介 */
/*! Facilitator profile */
 +(NSString *)service_Facilitator_profile;

/*! 账号安全 */
/*! Account security */
 +(NSString *)person_Account_security;

/*! 摄像机视角 */
/*! Camera */
 +(NSString *)addDevice_Camera_angle_view;

/*! 开始检测 */
/*! Start test */
 +(NSString *)devicesetting_Device_signal_Start_test;

/*! 抱歉，无可备份录像 */
/*! Sorry,there is no backup video */
 +(NSString *)preview_backup_without_video;

/*! 该设备不可购买 */
/*! The device is not available for purchase */
 +(NSString *)cloud_not_pay;

/*! 请保持手机与设备处于同一WiFi网络下 */
/*! Please keep your phone and device under the same WiFi network. */
 +(NSString *)device_connect_LAN;

/*! 夏令时 */
/*! Daylight Saving Time */
 +(NSString *)devSetting_daylightTime;

/*! 设备已分享给这些用户 */
/*! The device has been shared with these users */
 +(NSString *)share_device_already_share_this_device;

/*! 服务管理 */
/*! Service manager */
 +(NSString *)devicesetting_service_management;

/*! 1、添加警戒线 */
/*! 1、 add a warning line */
 +(NSString *)devicesetting_add_warn_line;

/*! 设置设备信息失败(密码错误，超时) */
/*! Fail to setup device info (wrong password,timeout) */
 +(NSString *)prompt_setInformation_failed;

/*! 调用 */
/*! Go to */
 +(NSString *)person_setting_preview_transfer;

/*! 未连接 */
/*! Not connected */
 +(NSString *)adddevice_not_connect;

/*! 比例 */
/*! proportion */
 +(NSString *)preview_proportion;

/*! 成功连接热点 */
/*! Successfully connected to the hotspot */
 +(NSString *)adddevice_Successfully_connected_hotspot;

/*! 3.重新插入TF卡，并确保其插入方向正确 */
/*! 3. Re-insert the TF card and make sure it is inserted in the correct direction */
 +(NSString *)playback_check_following_questions_3;

/*! 1、设备通电后，长按重置键，保持5秒以上 */
/*! 1、 Power the device, press and hold the reset button for 5s.  */
 +(NSString *)addDevice_help_text3;

/*! 报警时段设置 */
/*! Alarm time setting */
 +(NSString *)devicesetting_alarm_time_set;

/*! 通过设备热点连接网络 */
/*! Connect to the network through device hotspot */
 +(NSString *)addevice_connect_via_hotspot;

/*! 网络不给力，获取数据失败~ */
/*! The network is not strong, the data acquisition failed~ */
 +(NSString *)cloud_network_weakness_prompt;

/*! 无录像：摄像机未录像或TF卡被格式化 */
/*! No video recording: the camera is not recording or the TF card is formatted */
 +(NSString *)playback_no_record;

/*! 开启后滑动视频画面时摄像机将不再转动 */
/*! The camera will no longer rotate when sliding the video screen after opening */
 +(NSString *)preview_camera_sliding_screen_opening;

/*! 对码失败 */
/*! Matching code failed */
 +(NSString *)devicelist_Matching_code_failed;

/*! 验证码已发送至%@，请注意查收。 */
/*! Verification code has been sent to %@,please check. */
 +(NSString *)verify_code_sentAndChect_ios;

/*! (1)迁移云服务的条件：当前账号存在未绑定设备的云存服务； */
/*! (1) Conditions for migrating cloud services: The current account has a cloud storage service of unbound devices; */
 +(NSString *)cloud_help_migration_service_1;

/*! 关闭布防后，将关闭设备智能侦测功能 */
/*! The motion detection function of the device will be turned off after turning off the alarm function */
 +(NSString *)alarm_disable_alarm;

/*! 密码重置成功 */
/*! Reset password successfully */
 +(NSString *)password_reset_success;

/*! 正在绑定... */
/*! Binding... */
 +(NSString *)binding_wait;

/*! 对讲开启成功 */
/*! Intercom started successfully */
 +(NSString *)preview_doorbell_intercom_success;

/*! App想要打开“微信” */
/*! App wants to start wechat */
 +(NSString *)login_open_wechat;

/*! 设备SIM卡已无流量，请立即为SIM卡充值流量。 */
/*! The SIM card of the device is running out of data. Please recharge the SIM card immediately. */
 +(NSString *)devicesetting_4G_card_sim_card_no_flow;

/*! 产品演示 */
/*! Product demonstration */
 +(NSString *)demo_video_presentation_point;

/*! 自启动管理：需要把应用加到［自启动管理］列表，否则杀进程或重新开机后进程无法开启； */
/*! Self-booting management: the application needs to be added to the [self-booting management] list, otherwise the process cannot be started after shutting down the process or restarting it; */
 +(NSString *)person_feedback_question_ROM_software_1;

/*! 确认是否删除该常看位置 */
/*! Confirm whether to delete the preset position */
 +(NSString *)preview_preset_help_5;

/*! 当前已经是最新的试用版本 */
/*! Currently the latest trial version */
 +(NSString *)person_trial_latest_trial_version;

/*! 侦测到移动物体时录制%@录像 */
/*! Record %@ video when a moving object is detected */
 +(NSString *)devicesetting_best_detected_Description_ios;

/*! 编辑设备 */
/*! Edit device */
 +(NSString *)edit_device;

/*! 是否重启设备？ */
/*! Do you want to restart the device? */
 +(NSString *)devicesetting_restart_device_prompt;

/*! 正在修复... */
/*! Repairing... */
 +(NSString *)devicesetting_repairing;

/*! 允许访问相机，才能正常使用扫描二维码功能 */
/*! Allow to access camera and then can scan QR code */
 +(NSString *)addDevice_allow_access_camera;

/*! 是否确定取消该订单？ */
/*! Are you sure you want to cancel the order? */
 +(NSString *)cloud_cancel_order_question;

/*! 门口 */
/*! Doorway */
 +(NSString *)addDevice_Doorway;

/*! 晚上推送 */
/*! Push at night */
 +(NSString *)deviceSetting_Push_night;

/*! 配置WiFi后，如果网线被拔出，基站将自动切换到WiFi连接 */
/*! After configuring WiFi, if the network cable is unplugged, the base station will automatically switch to WiFi connection */
 +(NSString *)devicesetting_base_station_switch_wifi;

/*! 添加无线摄像机 */
/*! Add WiFi camera */
 +(NSString *)help_addDevice_textTips_6;

/*! 查看卡套餐 */
/*! View card package */
 +(NSString *)devicesetting_4G_card_view_package;

/*! 正在校准... */
/*! Calibrate... */
 +(NSString *)devicesetting_calibrate;

/*! 请选择%@个需要迁移云存的设备通道 */
/*! Please select %@ devices that need to migrate the cloud */
 +(NSString *)cloud_select_device_channel_ios;

/*! 备注（选填） */
/*! Remarks (optional) */
 +(NSString *)person_feedback_remarks;

/*! 立即充值 */
/*! Top up now */
 +(NSString *)devicesetting_4G_card_sim_card_recharge_now;

/*! 门铃 */
/*! Doorbell */
 +(NSString *)AlarmMessage_doorbell;

/*! 充值成功 */
/*! Top-up successful */
 +(NSString *)devicesetting_4G_card_recharge_success;

/*! 设备关机休眠后自动转向数据线位置 */
/*! After the device is shut down and sleeps, it will automatically turn to the data line position */
 +(NSString *)deviceSetting_shut_down_sleeps_automatically_turn_data_line;

/*! 套餐名称 */
/*! Package name */
 +(NSString *)cloud_package_name;

/*! 修改失败 */
/*! Failed to change */
 +(NSString *)modify_failure;

/*! Q2：判断是否为路由器设置导致的绑定失败 */
/*! Q2: Determine whether the binding failure caused by the router settings */
 +(NSString *)person_feedback_question_check_router;

/*! 请按住话筒录制报警声音 */
/*! Please press and hold the microphone to record the alarm sound */
 +(NSString *)devicesetting_press_and_hold_to_record;

/*! 请录制3-10s内报警提示音 */
/*! Please record the alarm tone within 3-10s */
 +(NSString *)deviceSetting_time_length;

/*! 该设备已购买自动续费套餐，请购买其他云存储套餐 */
/*! The device has purchased an auto-renewal package, please purchase another cloud storage package */
 +(NSString *)Cloud_not_buy_autoRenewal;

/*! WIFI摄像机基站 */
/*! WIFI camera base station */
 +(NSString *)devicelist_WIFI_camera_base_station;

/*! 内容 */
/*! Content */
 +(NSString *)cloud_feedback_content;

/*! 原“全彩模式” */
/*! Original \"Full Color Mode\" */
 +(NSString *)devicesetting_Original_Full_Color_Mode;

/*! 扫描设备 */
/*! Scan the device */
 +(NSString *)scanning_device;

/*! 未知 */
/*! Unknown */
 +(NSString *)cloud_unknow;

/*! 新版本 */
/*! New version */
 +(NSString *)version_new;

/*! 正在连接路由器，请稍后... */
/*! Connecting router, please wait... */
 +(NSString *)adddevice_connecting_device;

/*! 视频预览 */
/*! Video preview */
 +(NSString *)devicelist_share_equipment_Video_preview;

/*! 通道选择 */
/*! Channel selection */
 +(NSString *)devicesetting_Channel_selection;

/*! 网络配置 */
/*! Network Configuration */
 +(NSString *)adddevice_network_configuration;

/*! (1)兑换设备的通道数由兑换码生成的套餐服务通道数决定(若兑换码套餐的服务通道为4，那么设备只可选择4个通道购买)； */
/*! (1) The number of channels for redemption Device is determined by the number of package service channels generated by the redemption code (if the service channel of the redemption code package is 4, then the device can only select 4 channels to purchase); */
 +(NSString *)cloud_storage_details_how_to_redeem_tips_1;

/*! 夏令时开关 */
/*! Daylight saving time switch */
 +(NSString *)devicesetting_Daylight_saving_time_switch;

/*! 设备模式 */
/*! Device mode */
 +(NSString *)devSetting_equipment_model;

/*! Q5：设备支持USB、充电宝供电吗？ */
/*! Q5: Does the device support USB and power bank? */
 +(NSString *)person_feedback_question_USB;

/*! %@ - 次日%@启动智能侦测 */
/*! %@ - %@ activate motion detection the next day */
 +(NSString *)devicesetting_Night_detection_only_time_ios;

/*! 用手机APP就能直接看回放，不需要拔出存储卡在电脑上查看。设备列表点击录像回放按钮，在“TF卡录像”tab下，就能查看回放录像。 */
/*! You can directly watch the playback on the mobile APP, without removing the memory card to view on the computer. Click the video playback button in the device list, under the \"TF card video\" tab, you can view the playback video. */
 +(NSString *)person_feedback_question_type_memory_card_playback_detail;

/*! 继续充值 */
/*! Continue to top-up */
 +(NSString *)devicesetting_4G_card_continue_recharge;

/*! 切换备份通道 */
/*! Switch backup channel */
 +(NSString *)device_setting_preview_switch_channel;

/*! 删除通道 */
/*! Delete channel */
 +(NSString *)devicesetting_delete_channel;

/*! $%1$.2f */
/*! $%1$.2f */
 +(NSString *)digital;

/*! 音量设置 */
/*! Volume setting */
 +(NSString *)deviceSetting_Volume_setting;

/*! 切换分屏显示：可选择预览界面分屏显示通道数 */
/*! Split screen dispaly: choose screen channel number */
 +(NSString *)help_preview_ttextTips_14;

/*! 商城 */
/*! Mall */
 +(NSString *)my_store;

/*! 1.路由器设置过防蹭 */
/*! 1. The router has been set up to prevent Wi-fi squatter */
 +(NSString *)person_feedback_question_check_router_1;

/*! ③ 返回APP，等待状态栏显示“ */
/*! ③ Return to the app and wait for the status bar to display \" */
 +(NSString *)addevice_return_app;

/*! 设置设备WiFi */
/*! Set up device WiFi */
 +(NSString *)adddevice_setup_device_wifi;

/*! 松开可收听对方声音 */
/*! Release to listen to each other\'s voice */
 +(NSString *)preview_release_listen_other_voice;

/*! 该通道未购买云存，是否前往购买？ */
/*! The channel has not purchased cloud storage, is it going to buy? */
 +(NSString *)Cloud_storage_service_channel_purchase_prompt;

/*! 高清 */
/*! HD */
 +(NSString *)HD;

/*! 摄像机云台校准大概需要30秒，云台校准期间将无法执行任何操作，确认是否继续？ */
/*! Camera gimbal calibration takes about 30 seconds. During gimbal calibration, no operations can be performed. Do you want to continue? */
 +(NSString *)deviceSetting_Cameragimbal_calibration_seconds_nooperation_continue;

/*! 总计： */
/*! Total： */
 +(NSString *)combined;

/*! 云存购买与兑换 */
/*! Cloud deposit purchase and exchange */
 +(NSString *)cloud_help_purchase_exchange;

/*! 该手机号已被注册 */
/*! Already registered cellphone number */
 +(NSString *)register_numberExist;

/*! 2.连接过程大约需要1-2分钟，请勿断开网络。 */
/*! 2. The connection process takes about 1-2 minutes. Do not disconnect it from the network. */
 +(NSString *)addDevice_connecting_help_2;

/*! 听到提示音/指示灯不闪 */
/*! Hear the prompt voice/indicator does not flash */
 +(NSString *)adddevice_hear_tone;

/*! 自启动管理：需要把应用加到［自启动管理］列表，否则杀进程或重新开机后进程不会开启，只能手动开启应用； */
/*! Self-booting management: need to add the application to the [self-booting management] list, otherwise the process cannot be started after shutting down the process or restarting, and the application can only be started manually; */
 +(NSString *)person_feedback_question_ROM_software_2;

/*! 开通云存，专享免广告特权 */
/*! No ads privilege */
 +(NSString *)person_open_cloud_adfree;

/*! 添加录像机 */
/*! Add DVR/NVR */
 +(NSString *)help_addDevice_textTips_17;

/*! 客服 */
/*! Help */
 +(NSString *)devicelist_online_service;

/*! 配对摄像机 */
/*! Paired camera */
 +(NSString *)addDevice_Paired_camera;

/*! 请选择您在安防行业的经验年限 */
/*! Please select your years of experience in the security industry */
 +(NSString *)Service_map_select_years;

/*! 密码错误… */
/*! Wrong password */
 +(NSString *)play_error_tips_2;

/*! 人形报警 */
/*! Humanoid alarm */
 +(NSString *)playback_Humanoid_alarm;

/*! 可用 */
/*! Available */
 +(NSString *)tfCard_available_space;

/*! 扫一扫添加设备 */
/*! Scan add device */
 +(NSString *)adddevice_Scan_add_device;

/*! 消息时间间隔 */
/*! Message interval */
 +(NSString *)deviceSetting_Message_interval;

/*! 启动配置提示 */
/*! Start configuration prompt */
 +(NSString *)adddevice_start_configuration_prompt;

/*! 已支付 */
/*! Paid */
 +(NSString *)cloud_payment_paid;

/*! 云录像 */
/*! Cloud recording */
 +(NSString *)devicelist_cloud_video;

/*! 该设备已被其他账号独占，请联系机主删除解绑或分享添加 */
/*! The device has been exclusively occupied by other accounts, please contact the owner to delete and unbind or share and add */
 +(NSString *)adddevice_linkvisual_device_exclusively_occupied;

/*! 周六、周日 */
/*! Saturday, Sunday */
 +(NSString *)deviceSetting_Saturday_Sunday;

/*! 只可购买 */
/*! Can only be purchased */
 +(NSString *)cloud_only_buy;

/*! 设备密码可以为空 */
/*! Device password can be empty */
 +(NSString *)adddevice_device_password_can_be_empty;

/*! IP/DDNS位置 */
/*! IP/DDNS location */
 +(NSString *)addevice_IP_location;

/*! 下载中 */
/*! Downloading */
 +(NSString *)Playback_downloading_prompt;

/*! 连接设备WiFi */
/*! Connect device WiFi */
 +(NSString *)addevice_connect_device_wifi;

/*! 订单详情 */
/*! Order details */
 +(NSString *)details_order;

/*! 功能已移至 */
/*! function has been moved to */
 +(NSString *)devicesetting_function_has_been_moved;

/*! TF卡未找到，请检查设备是否已插入TF卡 */
/*! The TF card is not found, please check if the TF card is inserted in the device */
 +(NSString *)playback_no_tf_card_prompt;

/*! 正在下载 */
/*! Downloading */
 +(NSString *)preview_downloading;

/*! 云服务详情 */
/*! Cloud service details */
 +(NSString *)cloud_service_details;

/*! 为设备%1$s取个名字吧~ */
/*! Give the device %1$s a name~ */
 +(NSString *)adddevice_give_device_name;

/*! 取消下载将为您保留已下载视频片段，是否取消下载？ */
/*! Will save video clip if cancel downloading now, whether or not? */
 +(NSString *)preview_backup_cancel_down_prompt;

/*! 无线设备 */
/*! Wireless device */
 +(NSString *)device_wireless;

/*! 无需配网，当摄像机附近没有可上网的路由器时，可插入4GSIM卡直接添加使用。 */
/*! No network configuration is required. When there is no Internet-access router near the camera, you can insert a 4G SIM card and add it directly. */
 +(NSString *)person_feedback_question_4G_card_camera_advantages_detail;

/*! 智能侦测 */
/*! Motion detection */
 +(NSString *)preview_Detect_alarm;

/*! App需要访问麦克风 */
/*! App needs access to the microphone */
 +(NSString *)access_microphone_to_need;

/*! 开灯 */
/*! Turn on */
 +(NSString *)play_lamp_open;

/*! 原“红外模式” */
/*! Original \"Infrared Mode\" */
 +(NSString *)devicesetting_Original_Infrared_Mode;

/*! 检测到设备通道%@布防已关闭，请前往设备设置开启布防 */
/*! Detected that device channel%@ alarm is disabled, please go to device settings to enable it */
 +(NSString *)devicelist_cloud_channel_detecte_prompt_ios;

/*! 正在配网，请稍等 */
/*! Configure network in progress, please wait */
 +(NSString *)devicesetting_Configure_please_wait;

/*! 该设备为分享设备 */
/*! The device is a sharing device */
 +(NSString *)adddevice_share_device;

/*! 该设备不支持警报消息功能 */
/*! The device does not support the alarm message function */
 +(NSString *)Preview_device_not_support_alarm;

/*! 点击设备列表设备“云录像”按钮或个人中心“云商城”-进入“云商城”界面-点击“使用云存兑换码”-进入“扫描兑换码”界面，扫描有效兑换码-进入“兑换码支付界面”-选择需要兑换的设备与通道-点击“立即兑换”完成兑换 */
/*! Click the device list device \"Cloud Record\" button or the personal center \"Cloud Mall\" - enter the \"Cloud Mall\" interface - click \"Use Cloud Saver Code\" - enter the \"Scan Redemption Code\" interface, scan the valid redemption code - enter the \" redemption code\" Payment interface\" - select the device and channel to be redeemed - click \" redeem now\" to complete the redemption */
 +(NSString *)cloud_storage_details_how_to_redeem_guide;

/*! 壁挂镜头水平方向 */
/*! Wall-mounted lens horizontal direction */
 +(NSString *)devicesetting_video_center_correction_Wall_mounted_lens_horizontal;

/*! 4G订单 */
/*! 4G Order */
 +(NSString *)person_4G_order;

/*! 您的设备%@密码输入错误 */
/*! Your device %@password is entered incorrectly */
 +(NSString *)adddevice_device_password_incorrect_ios;

/*! 2.路由器设置了5GHz频段的无线WiFi */
/*! 2. The router is set up with 5GHz band wireless WiFi */
 +(NSString *)person_feedback_question_check_router_2;

/*! 解绑邮箱 */
/*! Unbind email */
 +(NSString *)Unbind_mailbox;

/*! 二维码已失效 */
/*! Invalid QR code */
 +(NSString *)addDevice_fails_qrcodeInvalid;

/*! 选择备份录像 */
/*! Select backup video */
 +(NSString *)deviceSetting_videoBackup_selectVideo;

/*! 2.确认设备连接的网络资源是否被大量占用；可以先暂停同网络内其他终端的大流量下载或上传动作，几分钟后观察设备是否上线。 */
/*! 2. Check whether the network resources connected to the device are occupied in a large amount. You can pause the large-band download or upload operation of other terminals in the network first,and observe whether the device is online after a few minutes. */
 +(NSString *)devicelist_offline_help_content_more_help_tow;

/*! 帮助与客服 */
/*! Help and Live Chat */
 +(NSString *)me_help;

/*! 剩余%@ */
/*! %@ remaining */
 +(NSString *)devicesetting_remaining_ios;

/*! 短焦 */
/*! Short-focus */
 +(NSString *)PTZ_Short_focus;

/*! 查询失败 */
/*! Query failed */
 +(NSString *)person_query_fails;

/*! 手机号码、邮箱、QQ、MSN */
/*! Mobile phone number, email, QQ, MSN */
 +(NSString *)cloud_help_Contact_type;

/*! 保存至本地失败 */
/*! Save to local failed */
 +(NSString *)person_save_fail;

/*! （2）云存续费的过程：在云录像回放界面-点击“服务管理”图标进入云服务管理界面-点击下方“立即续费”按钮-进入套餐选择界面-选择套餐后-点击立即续费-支付后完成续费。 */
/*! (2) the process of cloud continuation fee: in the cloud video playback interface - click the \"service management\" icon to enter the cloud service management interface - click the \"renew now\" button below - enter the package selection interface - select the package - click immediately renew - pay to complete the renewal. */
 +(NSString *)cloud_renew_process_description;

/*! 解绑微信 */
/*! Unbind WeChat */
 +(NSString *)Unbind_WeChat;

/*! 当前还未设置时间段， */
/*! The time period has not been set yet, */
 +(NSString *)deviceSetting_time_not_set_click_add;

/*! 百度地图 */
/*! Baidu map */
 +(NSString *)service_map_baidu;

/*! 自启动管理：需要把应用加到［自启动管理］列表，否则杀进程或重新开机后进程无法开启； */
/*! Self-booting management: the application needs to be added to the [self-booting management] list, otherwise the process cannot be started after shutting down the process or restarting it; */
 +(NSString *)person_feedback_question_ROM_software_3;

/*! Q3：摄像机可以设置多少个常看位置？ */
/*! Q3: How many preset positions can the camera set? */
 +(NSString *)person_feedback_question_add_preset_number;

/*! 流量报警推送 */
/*! Mobile data alarm push */
 +(NSString *)devicesetting_flow_alarm_push;

/*! 3.扫描步骤1中的二维码，添加分享设备。 */
/*! 3.Scan QC code in step 1 and share the device. */
 +(NSString *)help_addDevice_textTips_25;

/*! 退出 */
/*! Drop out */
 +(NSString *)cloud_error_tips_drop;

/*! 删除设备后不再上传录像，但云存服务时间仍然减少，是否删除？ */
/*! After  removing the device and no longer upload videos,but but cloud storage service time is still reduced,,whether to delete? */
 +(NSString *)cloud_tips_text_5;

/*! 订单支付失败，请重新支付 */
/*! Order payment failed, please repay */
 +(NSString *)cloud_repay_order;

/*! %@ - 次日%@推送消息 */
/*! %@ - %@ push message the next day */
 +(NSString *)deviceSetting_Push_night_time_ios;

/*! 正在更新%1$s */
/*! Updating %1$s */
 +(NSString *)Devicesetting_Updating;

/*! 该设备已经被其他账号独占 */
/*! This device is occupied by other account exclusively. */
 +(NSString *)device_monopolized_other;

/*! 异常 */
/*! Abnormal */
 +(NSString *)tfCard_exception;

/*! 白天关机 */
/*! Shut down during the day */
 +(NSString *)deviceSetting_Shut_down_during_day;

/*! 若您没有实体门店请撤销申请，转申请为维修员。 */
/*! If you do not have a physical store, please cancel your application and switch to a maintenance worker. */
 +(NSString *)service_not_have_physical_store;

/*! 新增简介信息功能，完善信息能增进客户对您店铺的了解，获取更多客户流量。 */
/*! Added profile information function. Improving information can enhance customers\’ understanding of your store and gain more customer traffic. */
 +(NSString *)service_information_update_detail;

/*! 配置所有套装 */
/*! Configure all packages */
 +(NSString *)adddevice_partner_entrance;

/*! 回放 */
/*! Playback */
 +(NSString *)devicelis_playback;

/*! 你已手动断开设备热点，请连接设备热点。 */
/*! You have manually disconnected the device hotspot. Please connect the device hotspot. */
 +(NSString *)addevice_disconnect_hotspot;

/*! 提华纳/美国太平洋 */
/*! America/Tijuana */
 +(NSString *)America_Tijuana;

/*! 当画面中有微小的移动即会触发警报 */
/*! An alarm will be triggered when there is a slight movement in the screen */
 +(NSString *)devicesetting_Motion_sensitivity_high;

/*! 去查看 */
/*! Go to View */
 +(NSString *)preview_go_to_view;

/*! 修复 */
/*! Repair */
 +(NSString *)playback_repair;

/*! 指示灯没有转为常亮？ */
/*! The indicator light does not turn to steady on? */
 +(NSString *)addDevice_indicator_light_not_steady;

/*! 设备昵称长度不能大于15个字符 */
/*! Name of device can\'t be more than 15 characters. */
 +(NSString *)devSetting_name_length_not_more_than_15;

/*! 警戒线为空将会导致设备不产生移动侦测录像与云录像 */
/*! If the cordon is empty, the device will not produce motion detection video and cloud video */
 +(NSString *)devicesetting_cordon_empty_prompt;

/*! 联系客服 */
/*! Contact Customer Service */
 +(NSString *)devicelist_Contact_Customer_Service;

/*! 设备一直持续录像，当电量降至%1$s以下时自动切换为最佳录像，当电量提升至%2$s以上时恢复一直录像，该模式耗电较快，适合外接电源使用。 */
/*! Record videos continuously. When battery level below %1$s, automatically switches to optimal surveillance mode. When battery level above %2$s, resumes to uninterrupted recording mode. This mode consumes power fast and is suggested only when your camera works with plug-in power */
 +(NSString *)devicesetting_Adaptive_mode_more_Description_new_firmware;

/*! 网点信息修改后需重新提交审核，审核通过前，用户将看不到您的网点地址，是否确定修改？ */
/*! After the modification of the outlet information, it shall be submitted for review again. Before the approval of the review, users will not see your network address. Are you sure to modify it? */
 +(NSString *)Service_map_edit_info;

/*! 周四 */
/*! Thursday */
 +(NSString *)person_alarm_selct_time_thur;

/*! 暂未创建智能场景，点击“+”添加 */
/*! No smart scene has been created yet, click \"+\" to add */
 +(NSString *)devicelist_tuya_smart_scene_null;

/*! 前往修改 */
/*! Go to edit */
 +(NSString *)Service_map_go_to_edit;

/*! 4、开启了4G、移动网络 */
/*! 4、 Opened 4G, mobile network */
 +(NSString *)adddevice_open_4G;

/*! 云台控制 */
/*! PTZ control */
 +(NSString *)preview_ptz_regulation;

/*! 上传失败 */
/*! Upload unsuccessfully */
 +(NSString *)person_set_Upload_crash_fail;

/*! 分享设备 */
/*! Share device */
 +(NSString *)deviceSetting_Sharing_equipment;

/*! 云存自动上传录像开启失败，请前往云存服务手动开启 */
/*! Failed to enable cloud storage automatically upload video ,please go to the cloud storage service to  openit manually */
 +(NSString *)cloud_manually_open;

/*! 人脸报警 */
/*! Face alarm */
 +(NSString *)playback_Face_alarm;

/*! 请在电脑NVR系统配置里面查看设备的IP/DDNS */
/*! Please check the device\'s IP/DDNS in the computer NVR system configuration. */
 +(NSString *)addevice_IP_location_computer_system;

/*! 3.添加过程中保持连接设备的热点 */
/*! 3.Keep the hotspot of the connected device during the adding process */
 +(NSString *)addevice_keep_connect_device_hotspot;

/*! 摄像机网络配置演示 */
/*! Camera network configuration demo */
 +(NSString *)devicelist_Camera_network_configuration_demo;

/*! b.若为单通道设备，则直接迁移，提示迁移成功跳转至设备列表界面；若为多通道设备，则需要选择与服务数量相等的通道数才能迁移； */
/*! If the device is a single-channel device, the device migrates directly to the device list interface. If the device is a multi-channel device, you need to select the number of channels equal to the number of services to migrate. */
 +(NSString *)cloud_help_migration_service_b;

/*! 选择“%@”，输入设置的密码； */
/*! Select \"%@\" and enter the set password; */
 +(NSString *)addevice_select_wifi_ios;

/*! 硬盘错误 */
/*! HDD error */
 +(NSString *)devSetting_hardDisk_error;

/*! 选择预览模式 */
/*! Select preview mode */
 +(NSString *)person_setting_selectPreviewMode;

/*! 店铺 */
/*! The store */
 +(NSString *)adddevice_the_store;

/*! 配置网络成功 */
/*! Configuring the network successfully */
 +(NSString *)adddevice_configure_network_succed;

/*! 3.查看手机连接设备WiFi是否正确 */
/*! 3. Check if the Wi-Fi which connected to the mobile phone is correct. */
 +(NSString *)adddevice_check_WiFi_correct;

/*! 天前 */
/*! days ago */
 +(NSString *)person_day_ago;

/*! 2、近距离操作 */
/*! 2、 Close-range operation */
 +(NSString *)adddevice_close_range;

/*! 我已阅读并同意 */
/*! I have read and agreed */
 +(NSString *)devicesetting_4G_card_have_read;

/*! 为提高安全性，请设置密码 */
/*! For added security, please set a password */
 +(NSString *)adddevice_for_security_password;

/*! (1)云存购买后不支持退换货，不支持退款； */
/*! (1) Cloud deposit does not support return and exchange after purchase, and does not support refund; */
 +(NSString *)cloud_storage_details_how_to_buy_tips_1;

/*! 网络带宽：%1$sKB/s */
/*! Network bandwidth: %1$sKB/s */
 +(NSString *)deviceSetting_Network_bandwidth;

/*! 允许APP获取位置权限，才能正常使用此功能 */
/*! Allow the app to obtain location permissions to use this function normally */
 +(NSString *)permissions_location_function_normally;

/*! 设备支持USB、充电宝供电吗？ */
/*! Can the device support be powered by USB or power bank? */
 +(NSString *)help_normal_problem_text_12;

/*! 试用版不稳定，更新后如需返回之前的版本，请卸载后重装正式版APP */
/*! The trial version is unstable. If you need to return to the previous version after the update, please uninstall and reinstall the official version of the app. */
 +(NSString *)person_trial_prompt;

/*! 内存一键清理：需要将应用加入［白名单］列表， 否则系统自带的“一键加速”， 会杀掉进程； */
/*! One-click memory cleaning: you need to add the application to the [white list] list, otherwise the system\'s \"one-click acceleration\" will shut down the process; */
 +(NSString *)person_feedback_question_ROM_software_4;

/*! TF卡异常，请到设置进行修复 */
/*! TF card is abnormal, please go to settings to repair */
 +(NSString *)playback_TFcard_abnormal_settings_repair;

/*! PIR */
/*! PIR */
 +(NSString *)devicelist_pir;

/*! 是否取消授权？ */
/*! Whether to cancel the authorization? */
 +(NSString *)person_revoke_authorization;

/*! 搜索服务网点 */
/*! Search service outlets */
 +(NSString *)Service_map_Search_outlets;

/*! 插入SD卡后提示“储存卡错误”。 */
/*! Indicate \"SD card error\" after insert SD card. */
 +(NSString *)help_normal_problem_text_7;

/*! 删除失败 */
/*! Failed to delete */
 +(NSString *)devSetting_delete_toFail;

/*! 圆心： */
/*! Center */
 +(NSString *)devicesetting_video_center_correction_Center;

/*! 总容量%1$s */
/*! Total capacity %1$s */
 +(NSString *)deviceSetting_Total_capacity;

/*! 主卧 */
/*! Bedroom */
 +(NSString *)addDevice_nameExample_masterBedRoom;

/*! 是否删除该分组？ */
/*! Delete this group or not? */
 +(NSString *)device_grouping_delete;

/*! 自定义 */
/*! customize */
 +(NSString *)deviceSetting_tone_Settings_Custom;

/*! 书房 */
/*! Study room */
 +(NSString *)addDevice_nameExample_study;

/*! 选择消息推送时段 */
/*! Select the message push period */
 +(NSString *)deviceSetting_Select_message_push_period;

/*! 二维码内含账号信息，请勿泄露 */
/*! The QR code contains account information, please do not disclose */
 +(NSString *)person_qr_code_contains_account_info;

/*! Line推送 */
/*! Line push */
 +(NSString *)alarm_line_push;

/*! 警报器设置 */
/*! Siren settings */
 +(NSString *)devicesetting_Siren_settings;

/*! 服务条款 */
/*! Terms of service */
 +(NSString *)person_Service_terms;

/*! 搜索设备前，需要打开GPS才能找到设备，是否确定打开？ */
/*! Before searching the device, you need to turn on GPS to find the device. Are you sure to turn it on? */
 +(NSString *)adddevice_turn_on_gps_prompt;

/*! 密码长度不能小于8位 */
/*! Password can\'t be less than 8 characters */
 +(NSString *)password_length_less_than_8_bits;

/*! 进入“WiFi” */
/*! Choose WiFi settings  */
 +(NSString *)addDevice_into_WIFI;

/*! 在使用APP时，可能会获取您的部分必要的个人信息，以提供相关的基本服务 */
/*! When using the app, you may get some of the necessary personal information to provide relevant basic services. */
 +(NSString *)person_privacy_set_instructions;

/*! 商品名称 */
/*! product name */
 +(NSString *)product_name;

/*! 切换WiFi */
/*! Switch WiFi */
 +(NSString *)addDevice_switch_WiFi;

/*! 最多可设置4个隐私区域 */
/*! Up to 4 privacy areas can be setted */
 +(NSString *)devicesetting_privacy_area_Upper_limit;

/*! Português */
/*! Português */
 +(NSString *)Portuguese;

/*! 报警信息 */
/*! Alarm message */
 +(NSString *)alarmMessage;

/*! 镜头类型： */
/*! Lens type: */
 +(NSString *)devicesetting_Video_center_correction_Lens_type;

/*! 录制提示音 */
/*! Record prompt tone */
 +(NSString *)devicesetting_record_tone;

/*! 摄像机暂时无法使用5G频段WiFi，请切换至2.4G频段WiFi后进行连接。 */
/*! The camera is temporarily unable to use the 5G band WiFi. Please switch to the 2.4G band WiFi and connect. */
 +(NSString *)adddevice_distance_requidistance_network_require_prompt;

/*! 设备连接失败，无法设置云录像状态 */
/*! The device connection failed and the cloud recording status could not be set */
 +(NSString *)cloud_device_connect_fail;

/*! 检测到云存设备%@的通道%@的布防已关闭，请前往设备设置开启布防 */
/*! Detected that the alarm of the channel%@ of the cloud storage device%@ has been disabled. Please go to the device settings to enable alarm */
 +(NSString *)devicelist_cloud_detecte_prompt_ios;

/*! 功能特点 */
/*! Features */
 +(NSString *)cloud_purchase_introduce;

/*! 请输入路由器WiFi名称 */
/*! Please input the router WiFi name */
 +(NSString *)addevice_input_router_WiFi;

/*! 切换 */
/*! Switch */
 +(NSString *)cloud_purchase_switch;

/*! 日本 */
/*! Japan */
 +(NSString *)Japan;

/*! 缩放 */
/*! Scalling */
 +(NSString *)play_ptz_focus;

/*! 保存 */
/*! Save */
 +(NSString *)me_photo_album_save;

/*! 和 */
/*! And */
 +(NSString *)register_agreementAnd;

/*! 设备密码输入错误，如需继续添加，请先重置设备 */
/*! Device password input error, if you want to continue to add, please reset the device first */
 +(NSString *)adddevice_reset_password_due_to_error;

/*! 区域模式 */
/*! Area mode */
 +(NSString *)deviceSetting_Area_mode;

/*! 此处逆光环境是指手机或设备恰好处于光源背景下，这种情况极易造成二维码曝光不充分导致扫码失败 */
/*! Here, the backlight environment refers to that the mobile phone or device happens to be in the background of the light source, which easily leads to the failure of qr code scanning due to the insufficient exposure of two-dimensional code */
 +(NSString *)addevice_Backlight_environment_description;

/*! 如需取消续订，请在当前服务周期到期前24小时内，进入微信，点击右下角>【我】>【支付】>右上角【…】>【扣费服务】在已签约项目中，点击取消。 */
/*! If you need to cancel the renewal, please enter WeChat within 24 hours before the expiration of the current service period, click on the lower right corner> [I]> [Pay]> upper right corner […]> [deduction service] in the signed project, Click Cancel. */
 +(NSString *)cloud_cancel_automatic_pop;

/*! 覆盖 */
/*! Overlap */
 +(NSString *)addDevice_cover;

/*! 如果忘记原密码，请退出登录，点击“忘记密码”，使用验证码重新设置密码 */
/*! If you forget the original password, please log out, click \"Forgot Password\", use the verification code to reset the password */
 +(NSString *)person_forget_original_password;

/*! 上次更新 */
/*! Last update */
 +(NSString *)Stand_alone_station_Last_update;

/*! 版本 */
/*! Version  */
 +(NSString *)version;

/*! 没有找到“%@”相关内容 */
/*! No related content found for \"%@\" */
 +(NSString *)search_no_relate_content_ios;

/*! 绑定后报警消息将同步推送至Line APP */
/*! After binding, the alarm message will be synchronously pushed to the Line APP */
 +(NSString *)alarm_line_push_prompt;

/*! 已经全部加载完毕 */
/*! No more data */
 +(NSString *)MJRefreshBackFooterNoMoreDataText;

/*! 摄像机型号： */
/*! Camera model: */
 +(NSString *)devicesetting_camera_model_1;

/*! 暂无 */
/*! None */
 +(NSString *)person_none;

/*! 3.指示灯不亮： */
/*! 3. The indicator light is not on: */
 +(NSString *)Addevice_light_not_on;

/*! 迁移失败，请检查网络是否良好？ */
/*! Migration failed, please check if the network is good? */
 +(NSString *)cloud_migration_fail_prompt;

/*! 请简短介绍您的维修工作，吸引更多客户。 */
/*! Please briefly introduce your repair work to attract more customers. */
 +(NSString *)service_please_briefly_introduce;

/*! 华为[Emotion] */
/*! Huawei [Emotion] */
 +(NSString *)person_feedback_question_ROM_softwar_huawei;

/*! 通道3 */
/*! Channel 3 */
 +(NSString *)channel_three;

/*! 美国 */
/*! United States */
 +(NSString *)United_States;

/*! 输入验证码 */
/*! Verification code */
 +(NSString *)enter_verify_code;

/*! 请选择需要固件更新的设备或通道 */
/*! Please select a device or channel that requires a firmware update */
 +(NSString *)cloud_gw_upgrade;

/*! 远程回放：设备需要安装TF卡 */
/*! Remote playback: device must to be  inserted  TF card. */
 +(NSString *)help_preview_ttextTips_7;

/*! 套餐已生效 */
/*! Package has taken effect */
 +(NSString *)devicesetting_4G_card_package_effect;

/*! (2)设备的购买通道由系统的套餐服务通道数决定，若系统只有服务通道数为1和3的两种套餐，那么设备只能选择1个或3个购买通道； */
/*! (2) The purchase channel of the device is determined by the number of package service channels of the system. If the system has only two packages with service channels 1 and 3, then the device can only select 1 or 3 purchase channels; */
 +(NSString *)cloud_storage_details_how_to_buy_tips_2;

/*! 选择“%1$s”，输入设置的密码； */
/*! Select \"%1$s\" and enter the set password; */
 +(NSString *)addevice_select_wifi;

/*! 冻结应用管理：需要将应用加入纯净后台，否则锁屏状态下无法及时收到消息； */
/*! Frozen application management: the application needs to be added to the pure background, otherwise the message cannot be received in time when the screen is locked */
 +(NSString *)person_feedback_question_ROM_software_5;

/*! OSD */
/*! OSD */
 +(NSString *)deviceSetting_OSD;

/*! 密码错误，您还可以输入%1$s次 */
/*! The password is wrong, you can also enter %1$s times */
 +(NSString *)login_wrong_password_enter;

/*! 喀布尔/阿富汗 */
/*! Asia/Kabul */
 +(NSString *)Asia_Kabul;

/*! Hello */
/*! Hello */
 +(NSString *)text_Hello;

/*! 获取设备设置超时 */
/*! Get device settings timed out */
 +(NSString *)deviceSetting_setupTimeout;

/*! 环境要求 */
/*! Environmental requirements */
 +(NSString *)adddevice_environmental_requir;

/*! 注意：分享的二维码有效期只有30分钟 */
/*! Note: The shared QR code is only valid for 30 minutes */
 +(NSString *)devicelist_share_linkvisual;

/*! 品牌招商： */
/*! Brand recruiting merchants： */
 +(NSString *)Official_brand_recruit;

/*! 待更新 */
/*! Wait for update */
 +(NSString *)to_be_updated;

/*! 摄像机设置 */
/*! Camera settings */
 +(NSString *)deviceSetting_Camera_settings;

/*! 马瑙斯/亚马逊 */
/*! America/Manaus */
 +(NSString *)America_Manaus;

/*! 隐私多重保障 */
/*! Multiple privacy guarantees */
 +(NSString *)cloud_privacy_guarantee;

/*! 检查设备 */
/*! Inspection Device */
 +(NSString *)adddevice_check_device;

/*! 个性化 */
/*! Personalization */
 +(NSString *)personalization;

/*! 热卖 */
/*! Hot sale */
 +(NSString *)cloud_hot_sale;

/*! 方法1：打开APP，在设备列表界面中点击“云存”按钮，并确定前往购买页面。 */
/*! Method 1: Open the APP,click \"cloud storage\" on device list interface,then go on and purchase */
 +(NSString *)help_cloud_storage_textTips_3;

/*! 支付即同意云存储服务协议 */
/*! Payment means agreeing to cloud storage service agreement */
 +(NSString *)cloud_agree_agreement;

/*! 跳过 */
/*! Skip */
 +(NSString *)splash_skip;

/*! 抱歉，一个分组最多只能选择16个摄像头 */
/*! Sorry,a group can only choose at most 16 cameras */
 +(NSString *)device_group_Upper_limit;

/*! 当画面中有中等距离的人，或者动物时触发警报 */
/*! Trigger an alarm when there is a middle-distance person or animal in the screen */
 +(NSString *)devicesetting_Motion_sensitivity_Medium;

/*! 输入云ID */
/*! Input cloud ID */
 +(NSString *)addDevice_ID_cloud_input;

/*! 检测到手机没有安装微信APP，请下载微信APP进行安装并授权登录 */
/*! Detect  the cellphone hasn\'t installed wechat APP,please download it and log in. */
 +(NSString *)test_noInstallation_Wechat;

/*! 1、如何对云存套餐进行续费？ */
/*! 1、 How to renew the cloud deposit package? */
 +(NSString *)cloud_storage_details_how_to_renew;

/*! App需要文件读写权限 */
/*! App need permission to read and write files */
 +(NSString *)access_readAndWrite;

/*! 云存储未开通 */
/*! Cloud storage is not activated */
 +(NSString *)playback_Cloud_not_activated;

/*! 录像保存失败 */
/*! Fail to save recording */
 +(NSString *)play_screenRecord_fail;

/*! 迪拜 */
/*! Asia/Dubai */
 +(NSString *)Asia_Dubai;

/*! 允许APP获取文件读写权限，才能正常播放云录像 */
/*! Allow the APP to obtain file read and write permissions to play cloud video normally */
 +(NSString *)permissions_file_read_write_play;

/*! 第二步：查看指示灯，确认设备指示灯处于常亮或变为闪烁 */
/*! Step 2: Check the device indicator light to confirm that the device indicator is steady on or  flashes. */
 +(NSString *)adddevice_step_2;

/*! APP使用申明 */
/*! APP use declaration */
 +(NSString *)register_useApply;

/*! 设置定时录像与智能侦测录像开关 */
/*! Switch of setting time recording and motion detection recording */
 +(NSString *)devicesetting_set_video_type_switch;

/*! 推荐 */
/*! Recommend */
 +(NSString *)deviceSetting_recommend;

/*! 设置录像时间段 */
/*! Setup recording time */
 +(NSString *)video_schedule_setTimePeriod;

/*! 4G卡摄像有哪些优点？ */
/*! What are the advantages of 4G card camera? */
 +(NSString *)person_feedback_question_5;

/*! 当前信号强度较弱，请检查手机网络状况 */
/*! The current signal strength is weak, please check the phone network condition */
 +(NSString *)preview_ptz_control_network_prompt;

/*! 获取云存信息失败 */
/*! Fail to get cloud storage info */
 +(NSString *)cloud_obtain_failed;

/*! 返回直播 */
/*! Live view */
 +(NSString *)playback_Live_view;

/*! 删除分享失败 */
/*! Fail to delete sharing */
 +(NSString *)device_share_delete_failure;

/*! 当前存在云存服务可迁移至新设备，是否前往选择迁移？ */
/*! Currently there are cloud storage services that can be migrated to new devices. Are you going to choose migration? */
 +(NSString *)cloud_migration_detail_prompt;

/*! 设置设备输入输出音量 */
/*! Set device input and output volume */
 +(NSString *)devicesetting_device_volume_prompt;

/*! 设备分享管理 */
/*! Share list */
 +(NSString *)me_device_share;

/*! 添加分组成功 */
/*! Add group successfully */
 +(NSString *)device_grouping_add_success;

/*! 清空数据 */
/*! Empty data */
 +(NSString *)userSettings_molileData_trafficSata_clearData;

/*! 邮箱/手机号格式错误 */
/*! Email/phone number format error */
 +(NSString *)invalid_format_emailAndNumber;

/*! 长焦 */
/*! long-focus */
 +(NSString *)PTZ_long_focus;

/*! 设置摄像机的通话模式 */
/*! Set the call mode of the camera */
 +(NSString *)devicesetting_Call_mode_camera;

/*! %1$s年维修经验 */
/*! %1$s years maintenance experience */
 +(NSString *)service_map_year_experience;

/*! 时间同步失败 */
/*! Time sync fails */
 +(NSString *)synchronous_time_fail;

/*! 云ID位置 */
/*! Cloud ID location */
 +(NSString *)addevice_ID_location;

/*! 名称不为空 */
/*! Name can\'t be empty */
 +(NSString *)setting_name_cannot_empty;

/*! 选择需要迁移的设备通道： */
/*! Select the device channel you want to migrate: */
 +(NSString *)cloud_migration_select_device_channel_migrate;

/*! 只能输入纯数字 */
/*! Only pure numbers can be entered */
 +(NSString *)service_only_pure_number;

/*! 开启后会框出画面中移动的人形 */
/*! After opening, the human figure moving in the screen will be framed */
 +(NSString *)deviceSetting_opening_human_figure_moving_framed;

/*! 类型 */
/*! Type */
 +(NSString *)appealDetailsType;

/*! 卧室 */
/*! Bedroom */
 +(NSString *)addDevice_Bedroom;

/*! Q1：摄像机初次添加失败 */
/*! Q1: Failed to add the camera for the first time */
 +(NSString *)person_feedback_question_add_fail;

/*! Alexa Echo Show操作指引 */
/*! Alexa Echo Show operation guide */
 +(NSString *)devicesetting_Alexa_operation_guide;

/*! 同意 */
/*! Agree */
 +(NSString *)register_useApplyAgree;

/*! 暂时没有查看报警消息的权限 */
/*! No permission to view alarm message temporarily. */
 +(NSString *)Preview_No_permission_view_alarm;

/*! 我的摄像机 */
/*! My camera */
 +(NSString *)devicelist_my_camera;

/*! 解绑后，将需要重新绑定才能用微信登录 */
/*! After unbinding, you will need to re-bind to log in with WeChat */
 +(NSString *)Unbind_WeChat_describe;

/*! 转人工 */
/*! Transfer to labor */
 +(NSString *)Stand_alone_station_Transfer_to_labor;

/*! 分享成功 */
/*! Share successful */
 +(NSString *)person_alarm_share_success;

/*! 通知管理：应用状态有三种：提示、允许，禁止。 禁止应用则通知栏不会有任何提醒； */
/*! Notification management: There are three application states: prompt, allow, and prohibit. If the application is disabled, there will be no reminder in the notification column; */
 +(NSString *)person_feedback_question_ROM_software_2_Notification;

/*! 您还没有开启位置权限，开启后才能定位显示附近的服务网点。 */
/*! You have not turned on the location permission, after which you can locate and display the nearby service nodes. */
 +(NSString *)service_map_location_permission;

/*! 扫码成功，请点击“添加” */
/*! Scanning code is successful, please click \"Add\" */
 +(NSString *)adddevice_scan_success;

/*! 有效期至 */
/*! Valid date to */
 +(NSString *)valid_until;

/*! 有效触发条件 */
/*! Effective trigger condition */
 +(NSString *)devicesetting_Effective_trigger_condition;

/*! 云存 */
/*! Cloud deposit */
 +(NSString *)cloud_deposit_days;

/*! 录像结束 */
/*! Recording finish */
 +(NSString *)play_screenRecord_end;

/*! (3)云存只和购买用户绑定，拥有云存的设备删除后添加至新账号，新账号下该设备将无法继续享受云存； */
/*! (3) Cloud storage is only bound to the purchase user. The device with the cloud storage is deleted and added to the new account. Under the new account, the device will not be able to continue to enjoy the cloud storage; */
 +(NSString *)cloud_storage_details_how_to_buy_tips_3;

/*! 备份视频 */
/*! Backup video */
 +(NSString *)person_Backup_video;

/*! 点击此处按钮，视频画面会铺满整个屏幕 */
/*! Click the button here, and the video will cover the entire screen */
 +(NSString *)preview_clcik_button_cover_screen;

/*! 取消全选 */
/*! Uncheck All */
 +(NSString *)selectAll_cancel;

/*! 联系方式类型 */
/*! Contact type */
 +(NSString *)person_feedback_contact_type;

/*! 半径： */
/*! Radius */
 +(NSString *)devicesetting_video_center_correction_radius;

/*! 释放立即刷新 */
/*! Refresh immediately after release */
 +(NSString *)Stand_alone_station_Refresh_immediately;

/*! 请确认是否已完成微信支付？ */
/*! Please confirm the wechat payment has been completed or not? */
 +(NSString *)cloud_confirm_wechat_pay_question;

/*! TF卡状态 */
/*! TF card status */
 +(NSString *)tfCard_status;

/*! 分钟前 */
/*! minutes ago */
 +(NSString *)person_min_ago;

/*! 查看购买的4G订单信息 */
/*! View purchased 4G order information */
 +(NSString *)person_view_purchased_4G_order_information;

/*! 格式化失败 */
/*! Fail to format */
 +(NSString *)tfCard_format_fail;

/*! %1$s云存录像开启失败，请手动开启 */
/*! %1$sCloud storage video failed to open,please manually open */
 +(NSString *)devicelist_cloud_failed_channel_prompt;

/*! 芝加哥/美国中部 */
/*! America/Chicago */
 +(NSString *)America_Chicago;

/*! 选择翻转类型 */
/*! Select flip type */
 +(NSString *)devicesetting_selcet_type;

/*! 恢复出厂设置 */
/*! Factory reset */
 +(NSString *)adddevice_Factor_reset;

/*! 允许打开WiFi，才能使用设备添加功能 */
/*! Allow to turn on WiFi and can add device */
 +(NSString *)access_WIFI_allow;

/*! 开启后，将根据选择的权限，允许本应用使用手机WLAN或移动数据 */
/*! When enabled, the app will be allowed to use mobile WiFi or mobile data based on the selected permissions. */
 +(NSString *)person_Wireless_data_permission_instructions;

/*! 仅录制有人出现的画面 */
/*! Record only when human appears */
 +(NSString *)deviceSetting_Non_human_filter;

/*! 输入 */
/*! Input */
 +(NSString *)addevice_input;

/*! 红外夜视 */
/*! Infrared night vision */
 +(NSString *)deviceSetting_infrared_night_vision;

/*! 报警录像 */
/*! Alarm recording */
 +(NSString *)cloud_purchase_alarm_record;

/*! 人脸 */
/*! Human face */
 +(NSString *)AlarmMessage_human_face;

/*! 允许访问蓝牙，才能正常使用蓝牙添加功能 */
/*! Allow to access bluetooth and then can use the function of adding by bluetooth */
 +(NSString *)addDevice_allow_bluetooth;

/*! 公司简介 */
/*! Company Profile */
 +(NSString *)person_companyInfo;

/*! Q5：插入存储卡时App提示“无法检测到TF卡” */
/*! Q5: When inserting the memory card, the App prompts \"Unable to detect TF card\" */
 +(NSString *)person_feedback_question_Unable_to_detect_TF_card;

/*! 若您忘记设备WiFi密码，请重置设备后重新添加 */
/*! If you forget the device WiFi password, please reset the device and add again */
 +(NSString *)addevice_forget_password_method;

/*! TF卡异常，请前往设置格式化 */
/*! TF card is abnormal, please go to settings to format */
 +(NSString *)playback_TF_card_repair;

/*! 开始与结束时间日期只能为同一天 */
/*! Start and end time dates can only be the same day */
 +(NSString *)devicesetting_Videobackup_time_prompt;

/*! 设备对码 */
/*! Device match code */
 +(NSString *)devicelist_match_code;

/*! 我的订单 */
/*! My Order */
 +(NSString *)person_my_order;

/*! Line授权绑定 */
/*! Line authorization binding */
 +(NSString *)person_line_bind;

/*! 有重要的安全性更新，我们建议您将NVR升级到最新版本。 是否现在升级？ */
/*! Important updates to improve security. We suggest to upgrade your NVR to latest version. Upgrade now? */
 +(NSString *)devicelist_nvr_firmware_update;

/*! 请将手机无线网络连接到IPC开头的设备热点“IPC-XXXXXXXX”，默认密码为“11111111” */
/*! Please connect the wireless network of the mobile phone to the device hotspot \"IPC-XXXXXXXX\" at the beginning of IPC. The default password is \"11111111\". */
 +(NSString *)addevice_connect_hotspot_prompt;

/*! ④ 返回APP，等待状态栏出现“ */
/*! ④ return to APP, waiting status bar appears \" */
 +(NSString *)adddevice_return_APP_battery_appear;

/*! 提交 */
/*! Submit */
 +(NSString *)person_feedback_submit_button;

/*! 可移动视频区域中心 */
/*! Removable video area center */
 +(NSString *)devicesetting_area_motion;

/*! （*图片仅为示意，请以实物为准） */
/*! (*The picture is only for reference, please refer to the actual product) */
 +(NSString *)adddevice_photo_prompt;

/*! 解锁视各地运营商情况，预计一小时内正常 */
/*! Unlocking depending on local operators, is expected to be normal within an hour */
 +(NSString *)devicesetting_unlock_time_prompt;

/*! 服务商 */
/*! Service provider */
 +(NSString *)Service_map_Service_provider;

/*! 视频传输网络拥堵，请稍后再试 */
/*! The video transmission network is congested, please try again later */
 +(NSString *)preview_fail_to_play_channel_full;

/*! 添加帮助 */
/*! Adding help */
 +(NSString *)addDevice_add_help;

/*! 吊顶 */
/*! Ceiling */
 +(NSString *)devicesetting_Ceiling;

/*! 更换连接方式 */
/*! Replace the connection mode */
 +(NSString *)adddevice_replace_connect_mode;

/*! 结果详情 */
/*! Result details */
 +(NSString *)devicesetting_4G_card_Result_details;

/*! 绑定失败 */
/*! Fail to bind */
 +(NSString *)binding_failure;

/*! 购买平台 */
/*! Purchase platform */
 +(NSString *)help_Purchase_platform;

/*! 电量 */
/*! Electricity */
 +(NSString *)electricity;

/*! (4)云存按单个设备与设备通道购买，多个设备以及多个通道需要对应多个云存套餐； */
/*! (4) Cloud storage is purchased by a single device and device channel, and multiple devices and multiple channels need to correspond to multiple cloud storage packages; */
 +(NSString *)cloud_storage_details_how_to_buy_tips_4;

/*! 摄像机暂不支持连接5G频段的WiFi。 请您打开路由器管理页面（一般在路由器底部标签上标有管理页面的地址），选择无线设置2.4GHz,设置为开启。 */
/*! The camera does not currently support the connection of 5G band WiFi. Please open the router management page (generally marked with the address of the management page on the bottom label of the router), select the wireless setting 2.4GHz, and set it to on. */
 +(NSString *)person_feedback_question_check_router_2_detail;

/*! 云台控制方向翻转 */
/*! PTZ control direction flip */
 +(NSString *)deviceSetting_PTZ_control_direction_flip;

/*! 获取视频列表失败，请重试 */
/*! Fail to get video list,please try again */
 +(NSString *)get_videoList_failed;

/*! 获取设备分享列表失败 */
/*! Fail to get device sharing list */
 +(NSString *)device_share_for_failure;

/*! 网络要求 */
/*! Network requirements */
 +(NSString *)adddevice_distance_requidistance_network_require;

/*! 暂无设置权限 */
/*! No setting permission */
 +(NSString *)Preview_no_set_permission;

/*! *SIM卡ICCID号 */
/*! * SIM ICCID number */
 +(NSString *)devicesetting_4G_SIM_card_ICCID;

/*! 请用浏览器访问易视云4G流量充值网站前往管理充值计划 */
/*! Please use the browser to visit the 4G traffic recharge website of e-vision cloud to manage the recharge plan */
 +(NSString *)devicesetting_manage_recharge_plan;

/*! %ld人中有%ld人认为有帮助 */
/*! %ld out of %ld found it helpful */
 +(NSString *)person_many_people_helpful_ios;

/*! 拒绝 */
/*! Refuse */
 +(NSString *)login_explain_refuse;

/*! 加入失败 */
/*! Join failed */
 +(NSString *)cloud_package_promotion_join_fail;

/*! 7.异常动态发生期间，肇事者没有出现在摄像机拍摄范围内，没有拍摄到肇事者出现的内容。 */
/*! 7. During the occurrence of abnormal dynamics, the perpetrator did not appear within the shooting range of the camera, and no content of the perpetrator was captured. */
 +(NSString *)person_feedback_question_video_incomplete_7;

/*! 未搜索到设备，建议使用设备热点添加 */
/*! Device not found, it is recommended to add device hotspot */
 +(NSString *)addDevcie_hot_add;

/*! 云录像开启成功，检测到设备通道%1$s布防已关闭，请前往设备设置开启布防 */
/*! Cloud recording is turned on successfully, it is detected that the device channel%1$s alarm is disabled, please go to the device settings to enable alarm. */
 +(NSString *)cloud_deployment_off_prompt;

/*! 该设备视频服务已关闭 */
/*! The device video service is turned off */
 +(NSString *)preview_device_video_turn_off;

/*! 从 */
/*! From */
 +(NSString *)devSettings_schedule_from;

/*! 设置设备时区时间 */
/*! Setup device time zone */
 +(NSString *)setting_time_zone;

/*! 忘记密码 */
/*! Forget password */
 +(NSString *)Addevice_forget_password;

/*! 叶卡捷林堡 */
/*! Asia/Yekaterinburg */
 +(NSString *)Asia_Yekaterinburg;

/*! 可能是连接设备失败，点击“查看帮助” */
/*! Device connection might fail, click \"View Help\" */
 +(NSString *)adddevice_fail_view_help;

/*! 当天录像已播放完毕 */
/*! Today video has finished playing */
 +(NSString *)video_played_selectDateAgain;

/*! 转申请为维修员 */
/*! Transfer application as a maintenance worker */
 +(NSString *)service_Transfer_application_as_maintenance;

/*! IP/DDNS添加 */
/*! IP/DDNS add */
 +(NSString *)addDevice_process_IP_DDNS_add;

/*! 录像时间点 */
/*! Video time point */
 +(NSString *)playback_video_time_point;

/*! 声控 */
/*! Voice control */
 +(NSString *)voice_control;

/*! 连接超时 */
/*! Timeout */
 +(NSString *)connection_timeout;

/*! 请将设备接通电源，并用网线将设备连接到路由器的Lan口 */
/*! Connect the device to the router\'s LAN port with a network cable */
 +(NSString *)adddevice_connect_Lan;

/*! 时间同步中... */
/*! Time synchronization... */
 +(NSString *)devicesetting_time_synchronization;

/*! App需要GPS地理位置权限 */
/*! App need GPS permission */
 +(NSString *)access_GPS_need;

/*! 标准 */
/*! Standard */
 +(NSString *)standard;

/*! 开启后App才可以正常使用蓝牙添加设备 */
/*! App can use Bluetooth to add devices normally after it is turned on */
 +(NSString *)NSBluetoothAlwaysUsageDescription;

/*! 云存试用套餐仅剩%d天，请立即续费！ */
/*! There are only %d days left in the cloud storage trial package, please renew now! */
 +(NSString *)preview_cloud_Free_tier_ios;

/*! 抱歉，什么都没有 */
/*! Sorry,nothing */
 +(NSString *)me_nothing;

/*! English */
/*! English */
 +(NSString *)English;

/*! 无线数据权限 */
/*! Wireless data permissions */
 +(NSString *)person_Wireless_data_permission;

/*! 仅白天侦测 */
/*! Daytime */
 +(NSString *)devicesetting_Detect_only_during_day;

/*! 邮件发送失败 */
/*! Fail to send emails */
 +(NSString *)send_email_failure;

/*! 输入邮箱地址 */
/*! Enter email address */
 +(NSString *)person_ente_email_address;

/*! 连接新的WIFI */
/*! Connect new WIFI */
 +(NSString *)deviceSetting_Connect_new_WIFI;

/*! 邮箱地址错误 */
/*! Wrong email address */
 +(NSString *)email_error;

/*! 人形侦测框 */
/*! Humanoid detection frame */
 +(NSString *)deviceSetting_Humanoid_detection_frame;

/*! 基站同步警报 */
/*! Base station sync alarm */
 +(NSString *)devicesetting_Base_station_alarm;

/*! 更多日期 */
/*! More dates */
 +(NSString *)devicesetting_more_data;

/*! 云存 */
/*! Cloud storage */
 +(NSString *)cloud_days_number;

/*! 半径2： */
/*! Radius 2: */
 +(NSString *)devicesetting_Video_center_correction_radius_tow;

/*! 待付款 */
/*! Pending payment */
 +(NSString *)cloud_pending_payment;

/*! 请设置时间段 */
/*! Please set the time period */
 +(NSString *)devicesetting_set_time_period;

/*! ③ 指示灯未闪烁，长按Reset键重置设备，直到设备处于配置模式； */
/*! ③ The indicator light is not flashing. Press and hold the Reset button to reset the device and  until the device is in the configuration mode. */
 +(NSString *)adddevice_reset_device;

/*! 如果侦测警报过于频繁，可尝试降低灵敏度 */
/*! If the detection alarm is too frequent, try to reduce the sensitivity */
 +(NSString *)deviceSetting_detection_alarm_frequent_sensitivity;

/*! 流量试用套餐仅剩%1$d天，请立即续费！ */
/*! There are only %1$d days left for the data trial package, please renew now! */
 +(NSString *)preview_4G_Free_tier;

/*! 绑定 */
/*! Bind */
 +(NSString *)binding;

/*! 2.设备电量过低； */
/*! 2. The device battery is too low; */
 +(NSString *)devicesetting_4G_card_sim_card_battery_low;

/*! 记住密码 */
/*! Remember password */
 +(NSString *)cloud_storage_remeber_password;

/*! 下载本地视频文件 */
/*! Download local video files */
 +(NSString *)deviceSetting_Download_local_video_files;

/*! 选择设备 */
/*! Choose device */
 +(NSString *)addDevice_choose;

/*! 显示模式 */
/*! Display mode */
 +(NSString *)play_display_mode;

/*! TF卡录像 */
/*! TF card recording */
 +(NSString *)playback_tf_card_record;

/*! 即将把摄像机时间调整至与手机时间一致，请确认是否执行该操作？ */
/*! The camera time is about to be adjusted to match the phone time. Please confirm whether to perform this operation? */
 +(NSString *)deviceSetting_camera_time_adjusted_match_phone;

/*! 客厅 */
/*! living room */
 +(NSString *)addDevice_nameExample_parlor;

/*! 录制声音开关 */
/*! Record sound */
 +(NSString *)deviceSetting_Record_sound_switch;

/*! 安全认证 */
/*! Safety certification */
 +(NSString *)register_Safety_certification;

/*! 报警消息总数（%@） */
/*! Total number of alarm messages (%@) */
 +(NSString *)playback_alarm_message_total_ios;

/*! 请确保摄像机的镜头无异物遮挡。如果镜头上有保护膜，请先撕掉保护膜再使用二维码配网； */
/*! Make sure that the camera lens is not blocked by any objects. If there is a protective film on the lens, please remove the protective film before using the QR code to configure the network; */
 +(NSString *)addDevice_no_sound_help_1;

/*! Q8：存储卡录像时，能否录制声音？ */
/*! Q8: Can I record sound when recording on a memory card? */
 +(NSString *)person_feedback_question_record_video;

/*! 拉近/拉远 */
/*! Pull close/away */
 +(NSString *)preview_ptz_optical_zoom;

/*! 热点连接中 */
/*! Connecting hotspot */
 +(NSString *)addDevice_connecting;

/*! 距离要求 */
/*! Distance requirements */
 +(NSString *)adddevice_distance_requir;

/*! 周一至周五 */
/*! Monday to Friday */
 +(NSString *)deviceSetting_Monday_Friday;

/*! 时间： */
/*! Time: */
 +(NSString *)cloud_migration_service_time;

/*! 联系电话 */
/*! Contact phone number */
 +(NSString *)service_map_contact_phone_number;

/*! 加德满都/尼泊尔 */
/*! Asia/Katmandu */
 +(NSString *)Asia_Katmandu;

/*! 请点击“获取验证码”向系统发送获取信息 */
/*! Please click \"Get Verification Code\" to send the information to the system */
 +(NSString *)person_click_get_code;

/*! 最佳录像-最后有效触发后再续录的时长； */
/*! Best recording-the duration of resuming recording after the last valid trigger */
 +(NSString *)devicesetting_Best_recording_Description;

/*! 我的设备1 */
/*! My device 1 */
 +(NSString *)addDevice_nameExample_device;

/*! a.检查设备中的无线局域网设置，查看是否有可接入的无线局域网信号； */
/*! a. Check the wireless LAN settings in the device to see if there is an accessible wireless LAN signal; */
 +(NSString *)preview_no_video_check_wireless_network;

/*! *若不能正确找到指示灯，请参考说明书。 */
/*! *If can\'t find indicator light,please refer to the manual. */
 +(NSString *)addDevice_help_text12;

/*! %1$d秒 */
/*! %1$d sec */
 +(NSString *)plural;

/*! 退出登录 */
/*! Log out */
 +(NSString *)userInfo_logout;

/*! 视频圆心矫正 */
/*! Video center correction */
 +(NSString *)devicesetting_Video_center_correction;

/*! 正在对码中，是否确定退出？ */
/*! Matching code, are you sure to exit? */
 +(NSString *)devicelist_code_are_sure_exit;

/*! 分享不存在 */
/*! Share does not exist */
 +(NSString *)device_share_noExist;

/*! 电量： */
/*! Battery： */
 +(NSString *)Battery;

/*! 允许APP获取文件读写权限，才能正常使用此功能 */
/*! Allow the APP to obtain file read and write permissions to use this function normally */
 +(NSString *)permissions_file_read_write;

/*! 支付失败 */
/*! Payment failed */
 +(NSString *)devicesetting_4G_card_pay_failed;

/*! 持续开启定时录像会加速TF卡的损耗 */
/*! Continuously turning on the timer video will accelerate the TF card loss */
 +(NSString *)devicesetting_turn_on_timer_video_prompt;

/*! 立即体验 */
/*! Experience Now */
 +(NSString *)Lead_page_Experience_Now;

/*! 消息推送 */
/*! Message push */
 +(NSString *)alarm_message_push;

/*! 智能添加不支持4G、5G网络，只可在WiFi环境下使用 */
/*! Smart Add does not support 4G, 5G networks, can only be used in WiFi environment */
 +(NSString *)adddeevice_smartlink_prompt;

/*! “摇一摇”功能必须打开WiFi和GPS权限 */
/*! Shake and shake function mu t open WiFi and GPS permissions */
 +(NSString *)me_setting_shake_tips;

/*! 升级失败 */
/*! Upgrade failed */
 +(NSString *)devicelist_firmware_update_failure;

/*! 2、续费：我们会在服务到期前24小时内扣费，扣费成功后云存储服务顺利延长一个周期。 */
/*! 2. Renewal: We will deduct the fee within 24 hours before the service expires. After successful deduction, the cloud storage service will be smoothly extended for a period. */
 +(NSString *)cloud_renewal_description;

/*! 已为您的设备%1$s添加成功 */
/*! Added success for your device %1$s */
 +(NSString *)adddevice_add_success_prompt;

/*! 正在更新固件中 */
/*! Updating firmware */
 +(NSString *)devicelist_update_firmware;

/*! 开启相册权限，允许应用写入存储设备，您可以将截图、录像保存至手机本地相册 */
/*! Turn on album permissions, allow apps to write to the storage device, you can save screenshots and videos to your phone\'s local album */
 +(NSString *)person_Album_permissions_instructions;

/*! 设备时间： */
/*! Device\'s time: */
 +(NSString *)devicelist_person_Equipment_time;

/*! 摄像机未插电时使用一直录像模式会导致电量消耗过快 */
/*! If insist the keep-recording mode when the camera is not plugged in will result in excessive power consumption */
 +(NSString *)devicesetting_always_recording_mode_influences;

/*! 反馈详情 */
/*! Feedback details */
 +(NSString *)person_feedback_feedback_details;

/*! （%@相片，%@视频） */
/*! （%@pictures，%@videos） */
 +(NSString *)person_picture_video_IOS;

/*! 关闭夜视模式 */
/*! Turn off night vision mode */
 +(NSString *)deviceSetting_Turn_off_night_vision;

/*! 指示灯闪烁，设备正处于配网模式，点击“配置模式”进入添加 */
/*! The indicator light is flashing, the device is in the configuration mode, click \"Configure Mode\" to enter the add */
 +(NSString *)adddevice_click_configure_mode;

/*! 我要反馈 */
/*! I want feedback */
 +(NSString *)person_feedback_i_want_feesback;

/*! 切换设备，没有连接WiFi */
/*! Switch device, no connection to WiFi */
 +(NSString *)adddevice_unconnect_wifi;

/*! 支付失败，请检查网络是否良好？ */
/*! Payment failed, please check if the network is good? */
 +(NSString *)cloud_purchase_payment_fail_network;

/*! 日 */
/*! day */
 +(NSString *)deviceSetting_videoBackup_startTimeDD;

/*! 删除并复位摄像机失败，请检查网络是否正常 */
/*! The camera reset is successful, but the deletion fails. Please manually delete it before adding it */
 +(NSString *)devicesetting_delete_fail_checck_camera;

/*! 请输入WiFi密码 */
/*! Please input WiFi password */
 +(NSString *)addDevice_WIFI_password_input;

/*! 提交成功 */
/*! Submitted successfully */
 +(NSString *)cloud_help_submit_success;

/*! 功能说明 */
/*! Function Description */
 +(NSString *)preview_preset_help_2;

/*! 选择智能侦测录像时长 */
/*! Choose motion detection recording duration */
 +(NSString *)devicesetting_select_motion_detecte_record;

/*! 摄像机画面干扰多，或室外光线环境复杂时可启用，减少耗电量 */
/*! This helps to reduce recording &amp; alerts triggered by outdoor interferences such as trees and light changes */
 +(NSString *)deviceSetting_Non_human_filter_describe;

/*! 本地直连摄像机 */
/*! Local direct connection camera */
 +(NSString *)deviceSetting_Local_direct_camera;

/*! 自定义侦测区 */
/*! Custom detection area */
 +(NSString *)deviceSetting_Custom_detection_area;

/*! Q4：如何设置云录像（开／关等） */
/*! Q4: How to set up cloud recording (on / off, etc.) */
 +(NSString *)person_feedback_question_set_up_cloud_video;

/*! 画面侦测区 */
/*! Screen detection area */
 +(NSString *)deviceSetting_Screen_detection_area;

/*! 云存使用中 */
/*! Cloud Storage in use */
 +(NSString *)cloud_in_use;

/*! 1.请检查摄像机是否已处于配对状态，状态灯是否快速闪烁（长按摄像机复位键进入配对状态）。 */
/*! 1. Please check whether the camera is already in the pairing state, and whether the status light flashes quickly (long press the camera reset button to enter the pairing state). */
 +(NSString *)Addevice_Please_check_following_1;

/*! 2.请将摄像机与基站尽量靠近。 */
/*! 2. Please keep the camera and the base station as close as possible. */
 +(NSString *)Addevice_Please_check_following_2;

/*! 3.如果还未解决，请联系客服。 */
/*! 3. If it has not been resolved, please contact customer service. */
 +(NSString *)Addevice_Please_check_following_3;

/*! 时间录像管理 */
/*! Time recording management */
 +(NSString *)devicesetting_Time_recording_management;

/*! 重新扫描 */
/*! Rescan */
 +(NSString *)adddevice_rescan;

/*! 移动跟踪后停留时间 */
/*! Stay time after moving tracking */
 +(NSString *)devicesetting_Guard_position_Stay_time;

/*! 请点击右下角“+”添加隐私区 */
/*! Please click \"+\" in the lower right corner to add a private area */
 +(NSString *)Devicesetting_click_add;

/*! 为保证您的设备信息安全，以及更好的使用体验，APP取消体验模式，请按以下步骤注册账号后重新添加设备。 */
/*! To ensure the security of your device information and a better experience, APP cancels the experience mode. Please follow the steps below to register an account and add the device again. */
 +(NSString *)login_Cancel_experience_description_1;

/*! 抱歉，您手机所定位地区暂不支持网点地图功能 */
/*! Sorry, the location of your mobile phone does not support network map function */
 +(NSString *)Service_map_not_support_map_function;

/*! 工作时间 */
/*! Operating hours */
 +(NSString *)Service_map_Operating_hours;

/*! 继续设置 */
/*! Continue to set up */
 +(NSString *)devicesetting_Continue_to_set_up;

/*! 无 */
/*! No */
 +(NSString *)devicesetting_no;

/*! 即将跳转流量服务商充值界面 */
/*! About to jump to the recharge interface of the traffic service provider */
 +(NSString *)devicelist_4Gcamera_traffic_service_sales_merchant;

/*! 日期格式 */
/*! Date format */
 +(NSString *)deviceSetting_dateFormatter;

/*! APP需要获取相机权限来拍摄照片 */
/*! APP needs to obtain camera permission to take photos */
 +(NSString *)permissions_camera_photos;

/*! (1)云存续费的条件：当前设备已经购买过云存的通道可购买或续费云存套餐； */
/*! (1) Conditions for cloud surviving fee: The current device has purchased the cloud storage channel to purchase or renew the cloud storage package; */
 +(NSString *)cloud_storage_details_how_to_renew_tips_1;

/*! 更新方式 */
/*! Update method */
 +(NSString *)deviceSetting_Update_method;

/*! 步骤一：注册账号 */
/*! Step 1: Register an account */
 +(NSString *)login_Cancel_experience_description_2;

/*! 位置权限 */
/*! Location permission */
 +(NSString *)person_location_permission;

/*! 未通过 */
/*! Did not pass */
 +(NSString *)Service_map_not_pass;

/*! 移动侦测区 */
/*! PIR */
 +(NSString *)addDevice_Motion_detection_area;

/*! 可设置侦测报警区域或警戒线 */
/*! Detection alarm area or cordon can be set */
 +(NSString *)devicesetting_can_set_area_or_cordon;

/*! WiFi列表 */
/*! WiFi list */
 +(NSString *)deviceSetting_WiFi_list;

/*! 吊顶镜头向下 */
/*! Ceiling lens down */
 +(NSString *)devicesetting_Video_center_correction_Ceiling_lens_down;

/*! 输入原密码 */
/*! Original password */
 +(NSString *)deviceSetting_Enter_original_password;

/*! 扫一扫 */
/*! Scan */
 +(NSString *)addDevice_scan_once;

/*! 正在分配客服 */
/*! Assigning agent */
 +(NSString *)Stand_alone_station_Assigning_agent;

/*! 变为闪烁 */
/*! becomes flicker */
 +(NSString *)adddevice_configure_lamp_blink;

/*! 麦克风权限开启后App才可以正常使用语音对讲功能 */
/*! The app can use the voice intercom function only after the microphone permission is turned on. */
 +(NSString *)NSMicrophoneUsageDescription;

/*! (2)使用兑换码兑换码云存套餐无需支付费用，每一个兑换码只可以使用一次； */
/*! (2) There is no charge for redeeming the code cloud storage package using the redemption code, and each redemption code can only be used once; */
 +(NSString *)cloud_storage_details_how_to_redeem_tips_2;

/*! 是否确定重启摄像机？ */
/*! Are you sure to restart the camera? */
 +(NSString *)devicesetting_restart_camera_prompt;

/*! 开启后App才可以正常使用扫一扫功能添加分享的设备 */
/*! After opening,the app can use the scan function to add shared devices. */
 +(NSString *)NSCameraUsageDescription;

/*! 请选择或者输入设备名称/ID */
/*! Please select or enter a device name /ID */
 +(NSString *)person_feedback_select_device_name_ID;

/*! 使用手机号注册或其他方式登录进入APP */
/*! Use mobile phone number registration or other methods to log in to enter the APP */
 +(NSString *)login_Cancel_experience_description_3;

/*! 允许读写存储权限，才能正常使用此功能 */
/*! Allow read and write storage permissions to use this feature properly */
 +(NSString *)person_to_use_function_properly;

/*! 2.若指示灯未闪烁，请长按Reset键重置设备。 */
/*! 2. If the indicator light does not flash, please press and hold the Reset button to reset the device. */
 +(NSString *)adddevice_indicator_not_flashes_button;

/*! MAC地址 */
/*! MAC address */
 +(NSString *)deviceSetting_MAC_address;

/*! 正在录像中，请关闭后再退出 */
/*! In the video, please close and then exit */
 +(NSString *)play_screenRecord_closeAndExit;

/*! 请输入手机号，获取验证码 */
/*! Please input cellphone number and get verification code */
 +(NSString *)input_number_get_code;

/*! 设备分享 */
/*! Device share */
 +(NSString *)device_share;

/*! 共优惠 */
/*! Total discount */
 +(NSString *)cloud_total_discount;

/*! 无录像 */
/*! No video */
 +(NSString *)playback_no_video;

/*! 拍摄 */
/*! Shoot */
 +(NSString *)person_shoot;

/*! 联系方式格式错误 */
/*! Contact format is wrong */
 +(NSString *)appealsError;

/*! 易视云云服务 */
/*! EseeCloud Service */
 +(NSString *)cloud_eseecloud_service;

/*! 录制时间太短 */
/*! Recording time is too short */
 +(NSString *)deviceSetting_time_too_short_prompt;

/*! 1.请将二维码正对设备镜头，保持约15-25cm的距离，请勿在逆光环境下进行扫码操作； */
/*! 1. Please keep the QR code Facing the lens of the device at a distance of about 15-25cm, please do not scan the code in backlight environment; */
 +(NSString *)addDevice_qr_code_distance;

/*! 开始使用 */
/*! Start using */
 +(NSString *)cloud_start_use;

/*! 设备关机中 */
/*! Device shutdown */
 +(NSString *)devicelist_Device_shutdown;

/*! 发送蓝牙数据失败，蓝牙已断开 */
/*! Fails to send bluetooth data,bluetooth disconnect */
 +(NSString *)addDevice_send_bluetooth_fail_disconneted;

/*! 步骤二：添加设备 */
/*! Step 2: Add device */
 +(NSString *)login_Cancel_experience_description_4;

/*! 摄像机无法正常连接？ */
/*! The camera cannot be connected normally? */
 +(NSString *)addDevice_camera_cannot_connected_normally;

/*! 验证码 */
/*! verification code */
 +(NSString *)code;

/*! 东京/日本 */
/*! Asia/Tokyo */
 +(NSString *)Asia_Tokyo;

/*! 7.设备配置成功，可点击①或②修改设备名称，点击按钮③完成设备添加；若设备配置失败，按照提示进行操作。 */
/*! 7.Configuration has succeeded,tap ①or② to change device\'s name,tap ③ to complete the setting.if configuration fails,please follow the instrution to operate. */
 +(NSString *)help_addDevice_textTips_13;

/*! 继续下载 */
/*! Continue download */
 +(NSString *)deviceSetting_videoBackup_continueLoading;

/*! 订单提交失败，请重试 */
/*! Fails to place orders,please try again */
 +(NSString *)cloud_order_submit_failed;

/*! 1、如何购买云存套餐？ */
/*! 1、 How to buy a cloud storage package? */
 +(NSString *)cloud_storage_details_how_to_buy;

/*! 请选择录像时间 */
/*! Please choose recording time */
 +(NSString *)setting_select_timeOfVideo;

/*! 录像：录取当前预览画面视频 */
/*! Recording: record current preview video */
 +(NSString *)help_preview_ttextTips_4;

/*! 布防 */
/*! Alarm */
 +(NSString *)devicesetting_manual_arming;

/*! 周一 */
/*! Monday */
 +(NSString *)person_alarm_selct_time_monday;

/*! 确定中断 */
/*! Determine break */
 +(NSString *)playback_break_download;

/*! 通话 */
/*! Call */
 +(NSString *)preview_call;

/*! 每天 */
/*! Every day */
 +(NSString *)deviceSetting_every_day;

/*! 录像类型 */
/*! Recording type */
 +(NSString *)device_record;

/*! 智能侦测警报与通知 */
/*! Motion Detection Alerts and Notifications */
 +(NSString *)deviceSetting_Smart_detection_alarms_notifications;

/*! 点击首页右上角“+”按钮，扫描设备上的二维码添加设备或选择其它添加方式中“通过ID/IP添加”，输入您设备的ID号添加设备。 */
/*! Click the \"+\" button in the upper right corner of the homepage, scan the QR code on the device to add the device or select \"Add by ID/IP\" in other adding methods, and enter the ID number of your device to add the device. */
 +(NSString *)login_Cancel_experience_description_5;

/*! 抱歉，离线设备不能购买云存 */
/*! Sorry，offline devices cannot purchase cloud storage */
 +(NSString *)cloud_offline_device_not_buy;

/*! 切换设备 */
/*! Switch device */
 +(NSString *)cloud_switching;

/*! 常见问题 */
/*! Common question */
 +(NSString *)person_feedback_common_question;

/*! 检查 */
/*! Check */
 +(NSString *)IOS_phone_bluetooth_status_check;

/*! 账号下存在云存服务可迁移至该设备，是否迁移？ */
/*! The cloud storage service under the account can be migrated to the device. Do you want to migrate? */
 +(NSString *)devicelist_migrate_cloud_ask;

/*! 通电后对准设备机身或显示屏上的二维码进行扫描 */
/*! After power on,scan the QR code on the device or displayed on the monitor. */
 +(NSString *)addDevice_point;

/*! 摄像机购买云存储的记录 */
/*! Camera purchases records of cloud storage */
 +(NSString *)cloud_camera_purchase_record;

/*! 报警类型 */
/*! Alarm type */
 +(NSString *)AlarmMessage_alarm_type;

/*! 第一步：接通电源，确认设备处于工作状态 */
/*! Step 1: Power on the device and confirm that the device is working. */
 +(NSString *)adddevice_step_1;

/*! 摇一摇搜索附近设备 */
/*! Shake and shake to search device nearby */
 +(NSString *)meDevice_shake_tips;

/*! 快进 */
/*! Fast forward */
 +(NSString *)playback_fast_forward;

/*! 请将设备、手机与路由器尽量靠近 */
/*! Keep your device, phone and router as close as possible */
 +(NSString *)adddevice_distance_close_prompt;

/*! 前往 */
/*! Proceeding */
 +(NSString *)cloud_purchase_go_to;

/*! 人形人脸侦测 */
/*! Humanoid and human face setting detection */
 +(NSString *)devicesetting_humanoid_face_set;

/*! 报警 */
/*! Alarm */
 +(NSString *)Preview_Alarm;

/*! 去设置 */
/*! Go to set */
 +(NSString *)devicelist_to_set;

/*! 不保存 */
/*! Do not save */
 +(NSString *)backup_unsave;

/*! TF卡需要格式化 */
/*! TF card needs to be formatted */
 +(NSString *)devicelist_TF_card_need_formatte;

/*! 当前存在移动侦测区域未保存，是否确定退出？ */
/*! Currently there is no motion detection area saved. Is it ok to exit? */
 +(NSString *)devicesetting_Save_inquiry;

/*! 其他推送 */
/*! Other push */
 +(NSString *)alarm_other_push;

/*! 是否删除该区域？ */
/*! Do you want to delete this area? */
 +(NSString *)devicesetting_delete_area;

/*! 年前 */
/*! years ago */
 +(NSString *)person_year_ago;

/*! 立即兑换 */
/*! Redeem now */
 +(NSString *)cloud_redeem_now;

/*! 套餐过期 */
/*! Package expired */
 +(NSString *)Devicesetting_Package_expired;

/*! 请选择注册类型 */
/*! Please select a registration type */
 +(NSString *)Service_map_select_a_registration_type;

/*! 里贾纳/美国中部 */
/*! America/Regina */
 +(NSString *)America_Regina;

/*! %1$s云存录像开启成功 */
/*! %1$sCloud storage video is successfully opened */
 +(NSString *)devicelist_cloud_success_prompt;

/*! 编辑分组成功 */
/*! Edit group successfully */
 +(NSString *)device_grouping_edit_success;

/*! 请将基站复位后再重新配对 */
/*! Please reset the base station before re pairing */
 +(NSString *)Addevice_reset_basestation;

/*! 购买通道 */
/*! Purchase channel */
 +(NSString *)Purchasechannel;

/*! 网络 */
/*! Network */
 +(NSString *)adddeevice_network_prompt;

/*! 总时长：%1$d分钟 */
/*! Total length: %1$d minutes */
 +(NSString *)SRC_device_playback_Total_video;

/*! 侦测区设置 */
/*! Detection area settings */
 +(NSString *)devicesetting_Detection_area_settings;

/*! 前往入驻 */
/*! Going to settle in */
 +(NSString *)service_map_go_to_settle;

/*! 搜索 */
/*! Searching */
 +(NSString *)search;

/*! LED补光灯 */
/*! LED fill light */
 +(NSString *)deviceSetting_LED_fill_light;

/*! 设备设置失败，密码错误 */
/*! Device setup failed,wrong password */
 +(NSString *)addDevice_settingFail_passwordError;

/*! 门铃录像 */
/*! Doorbell recording */
 +(NSString *)bell_video;

/*! 启动摄像机时间点未设置 */
/*! The camera start time is not set */
 +(NSString *)devicesetting_camera_start_time_notset;

/*! 格式化储存卡 */
/*! Format the memory card */
 +(NSString *)deviceSetting_Format_memory_card;

/*! 状态 */
/*! State */
 +(NSString *)deviceSetting_state;

/*! 设备连接人数已满 */
/*! The number of connected devices is full */
 +(NSString *)Preview_connect_number_full;

/*! 下载视频到 - 截图与录像 */
/*! Download video to-screenshots and videos */
 +(NSString *)preview_download_video_to_content;

/*! 4.输入DDNS/IP等内容，完成添加。 */
/*! 4.Input DDNS/IP to complete adding  */
 +(NSString *)help_addDevice_textTips_21;

/*! 总容量 */
/*! Total volume */
 +(NSString *)tfCard_total_capacity;

/*! 请输入 */
/*! Please enter */
 +(NSString *)devicesetting_please_enter;

/*! 通道%ld云存有效期 */
/*! Channel %ld cloud validity period */
 +(NSString *)Cloud_storage_service_valid_period;

/*! 对讲模式 */
/*! Intercom mode */
 +(NSString *)devicesetting_Intercom_mode;

/*! 无可用网络 */
/*! No available network */
 +(NSString *)addDevice_unavailable_netword;

/*! 解锁失败，请检查网络是否良好 */
/*! Unlock failed, please check if the network is good */
 +(NSString *)devicesetting_unloack_fail;

/*! 全景设备 */
/*! VR device  */
 +(NSString *)addDevice_choose_panorama;

/*! 更新提示 */
/*! Update reminder */
 +(NSString *)deviceSetting_Update_reminder;

/*! 基站配对失败 */
/*! Base station pairing failed */
 +(NSString *)Addevice_basestation_pairing_fail;

/*! 添加需要花费一些时间，请您耐心等候 */
/*! It takes some time to add, please be patient */
 +(NSString *)addDevice_guideReset_configuration_suit;

/*! 佛得角 */
/*! Atlantic/Cape Verde */
 +(NSString *)Atlantic_Cape_Verde;

/*! 暂无录像视频 */
/*! No video yet */
 +(NSString *)devicesetting_No_video_yet;

/*! 请选择定时录像时间段： */
/*! Please select timed recording period: */
 +(NSString *)devicesetting_gw_set_timed_period;

/*! 德黑兰/伊朗 */
/*! Asia/Tehran */
 +(NSString *)Asia_Tehran;

/*! 云存即将过期 */
/*! Cloud storage is about to expire */
 +(NSString *)cloud_is_about_expire;

/*! 购买时间获取失败 */
/*! Purchase time acquisition failed */
 +(NSString *)devicesetting_purchase_time_fail;

/*! 淘宝账户授权 */
/*! Taobao account authorization */
 +(NSString *)person_taobao_authorization;

/*! 选择相对应的设备后，按照提示进行添加。 */
/*! Choose the device and add  */
 +(NSString *)newbie_guide_text_4;

/*! 抱歉，由于您的“%@”正在使用非云存专属流量套餐，将不再上传云录像，如需继续上传，请前往4G商城购买云存流量专属套餐。 */
/*! Sorry, as your \"%@\" is using a non-Cloud Storage exclusive traffic package, it will no longer upload cloud video, if you want to continue uploading, please go to 4G Mall to purchase a Cloud Storage exclusive traffic package. */
 +(NSString *)devicesetting_Sorry_Cloud_Storage_exclusive_traffic_package_ios;

/*! 基站不支持配对 */
/*! The base station does not support pairing */
 +(NSString *)devicelist_code_matching_fail_reason_1;

/*! 添加涂鸦设备 */
/*! Add a Tuya device */
 +(NSString *)addDevice_add_tuya_device;

/*! 艳丽 */
/*! Gorgeous */
 +(NSString *)gorgeous;

/*! 请勿在逆光环境下扫码，以免造成二维码曝光导致扫码失败； */
/*! Do not scan the code in the backlight environment, so as not to cause QR code exposure and code scanning failure; */
 +(NSString *)adddevice_battey_prompt_3;

/*! Stripe支付 */
/*! Stripe payment */
 +(NSString *)cloud_pay_stripe_payment;

/*! 请检查网络是否正常 */
/*! Please check whether the network is normal */
 +(NSString *)Update_check_network;

/*! 其他 */
/*! Others */
 +(NSString *)other;

/*! 开启WiFi */
/*! Turn on WiFi */
 +(NSString *)adddevice_turn_on_wifi_2;

/*! 5M测试流量 */
/*! 5M test flow */
 +(NSString *)devicesetting_5M_test_flow;

/*! 麦克风权限开启后App才可以正常录制报警提示音 */
/*! The app can record alarm sounds normally after the microphone permission is turned on. */
 +(NSString *)NSMicrophoneUsageDescription_alarm;

/*! 关闭 */
/*! Shut down */
 +(NSString *)person_feedback_shut_down;

/*! 方法1：打开APP，在设备列表界面中点击①“+”按钮；再点击②“添加设备”按钮。 */
/*! Method 1: start APP,click \"+\" on device list interface,then click \"add device\" */
 +(NSString *)help_addDevice_textTips_3;

/*! 取消订单 */
/*! Cancel order */
 +(NSString *)order_cancel;

/*! 请设置看守位置时间 */
/*! Please set the home position time */
 +(NSString *)devicesetting_set_guard_position_time;

/*! 设置其他摄像机中，请稍等... */
/*! Setting up other cameras, please wait... */
 +(NSString *)devicesetting_Setting_other_cameras_wait;

/*! 巴库 */
/*! Asia/Baku */
 +(NSString *)Asia_Baku;

/*! 类型一、带无线上网的NVR设备 */
/*! Type 1, NVR device with wireless Internet access */
 +(NSString *)adddevice_suit_type_1;

/*! 设备自动根据当前电量值进行模式切换，当电量充足时，设备常电工作，此时会一直录像；当电量低时，切换到最佳录像模式。 */
/*! The device will automatically switches modes according to the current power value. When the power is sufficient and always powered on,it will keep recording; when the battery is insufficient, it will switch to best recording mode */
 +(NSString *)devicesetting_Adaptive_mode_description;

/*! 有新版本未安装，立即安装体验。 */
/*! A new version is not installed. Please install it now. */
 +(NSString *)Update_install_it_experience;

/*! GPS位置权限开启后，APP才可以访问附近WiFi列表 */
/*! After the GPS location permission is enabled, the APP can access the list of nearby WiFi */
 +(NSString *)addevice_GPS_permission;

/*! 精简交互 */
/*! Streamlined Interaction */
 +(NSString *)Lead_page_2;

/*! 下载(%1$s) */
/*! Download (%1$s) */
 +(NSString *)preview_download_number;

/*! 已使用流量：%1$s */
/*! Used traffic: %1$s */
 +(NSString *)devicesetting_4G_card_sim_card_total_flow_Unlimited;

/*! 已失效 */
/*! Invalid */
 +(NSString *)devicesetting_4G_device_invalid;

/*! 伊朗 */
/*! Iran */
 +(NSString *)devSetting_Iran;

/*! 选择夜视模式 */
/*! Select night vision mode */
 +(NSString *)deviceSetting_Select_night_vision_mode;

/*! 不支持5GHz无线网络 */
/*! Does not support 5GHz wireless network */
 +(NSString *)adddevice_input_wifi_5G_prompt;

/*! 智能场景 */
/*! Smart scene */
 +(NSString *)devicelist_tuya_smart_scene;

/*! 五 */
/*! F */
 +(NSString *)Friday;

/*! 1、确认设备已接通电源 */
/*! 1、 Please confirm that the device is powered on. */
 +(NSString *)adddevice_Confirm_device_powered;

/*! SIM卡激活失败，请联系客服了解具体原因与解决方法。 */
/*! SIM card activation failed, please contact customer service for specific reasons and solutions. */
 +(NSString *)devicesetting_4G_card_sim_card_unlock_fail_detail;

/*! 基站WIFI异常 */
/*! The WIFI of base station is abnormal */
 +(NSString *)devicelist_code_matching_fail_reason_2;

/*! 选择设备工作WiFi */
/*! Select the working WiFi of the device */
 +(NSString *)devicesetting_select_device_WiFi;

/*! 重新添加 */
/*! Re-add */
 +(NSString *)adddevice_re_add;

/*! 问题记录 */
/*! My feedback */
 +(NSString *)Help_my_feedback;

/*! 连接网线 */
/*! Connecting network cable */
 +(NSString *)adddevice_suit_connecet_network;

/*! 忘记密码？ */
/*! Forget password? */
 +(NSString *)forgot_password;

/*! 录像 */
/*! Recording */
 +(NSString *)record;

/*! 当前设备只允许一个用户同时在线，如需观看使用，请等待其他用户断开后再连接 */
/*! The current device allows only one user to be online at the same time. If you want to watch and use, please wait for other users to disconnect and then connect */
 +(NSString *)Preview_connect_number_full_help;

/*! 摄像机类型 */
/*! Camera type */
 +(NSString *)deviceSetting_Camera_type;

/*! 删除 */
/*! Delete */
 +(NSString *)person_setting_preview_Clear;

/*! Q1：收不到报警推送消息怎么办 */
/*! Q1: What should I do if I cannot receive the alarm push message? */
 +(NSString *)person_feedback_question_alarm_push;

/*! 侦测到移动物体时会自动录像 */
/*! Automatic video recording when a moving object is detected */
 +(NSString *)devicesetting_automatic_record_video_description;

/*! 门铃提示音 */
/*! Doorbell tone */
 +(NSString *)devicesetting_doorbell_tone;

/*! 如手机与设备未在同一局域网，将无法搜索对应的设备 */
/*! If the phone and the device are not in the same LAN, the corresponding device will not be searchable */
 +(NSString *)addevice_no_device_found_tip_1;

/*! 连接失败… */
/*! Connection failed… */
 +(NSString *)play_error_tips_1;

/*! 1.接通设备电源，确认设备已处于工作状态 */
/*! 1. Power on the device and confirm that the device is in working condition */
 +(NSString *)adddevice_prompt_step_1;

/*! 抱歉,您当前所在的城市暂无服务网点! */
/*! Sorry, there are no service outlets in your current city! */
 +(NSString *)Service_map_no_service_point;

/*! 巡航开关：设置自动巡航 */
/*! Cruise: setup auto cruise */
 +(NSString *)help_preview_ttextTips_11;

/*! 云ID添加方式仅支持NVR设备 */
/*! Only support NVR ID adding */
 +(NSString *)addDevice_cloud_ID_support_NVR;

/*! 录像回放的内容为什么是断断续续的？ */
/*! Why the playback  recording video  content is  uncontinuous? */
 +(NSString *)help_normal_problem_text_10;

/*! 设备删除失败 */
/*! Failed to delete device */
 +(NSString *)devSetting_delete_failure;

/*! %1$d分钟 */
/*! %1$d minutes */
 +(NSString *)min;

/*! 已准备好了 */
/*! Ready */
 +(NSString *)adddevice_ready;

/*! 第二步：查看设备指示灯，直到指示灯闪烁 */
/*! Step 2: Check the device indicator until the indicator flashes */
 +(NSString *)adddevice_check_device_light;

/*! 网络配置失败 */
/*! Network configuration failed */
 +(NSString *)adddevice_network_configure_fail;

/*! 最多可绘制%1$d条警戒线 */
/*! Up to %1$d cordon lines can be drawn */
 +(NSString *)devicesetting_up_to_4_warn_line;

/*! 现在登录 */
/*! Log in now. */
 +(NSString *)local_mode_tips_login;

/*! 录像保存 */
/*! Video saving */
 +(NSString *)cloud_video_save;

/*! 手机连接的WiFi： */
/*! Wi-Fi connected by mobile phone: */
 +(NSString *)adddevice_Currently_connect_wifi;

/*! 解绑 */
/*! unbundle */
 +(NSString *)person_unbundle;

/*! 省电管理：安全中心里设置省电模式，在［待机耗电管理］中允许应用待机时，保持允许，否则手机休眠或者应用闲置一段时间，无法正常接收消息； */
/*! Power-saving management: set the power-saving mode in the security center, keep the permission when the application is allowed to stand by in [Standby Power Consumption Management], otherwise the phone will sleep or the application will be idle for a period of time, and it cannot receive messages normally */
 +(NSString *)person_feedback_question_ROM_software_3_Powersaving;

/*! 2.如果您手动更改过设备的网络参数，建议将设备恢复默认参数，按住设备上的Reset键10秒即可。 */
/*! 2.If users manually change network parameter of device,please change it to default parameter. Just press reset button for 10 seconds. */
 +(NSString *)help_normal_problem_text_3;

/*! 设置中... */
/*! Setting up... */
 +(NSString *)devicesetting_Setting_up;

/*! 邮箱未被绑定 */
/*! E-mail is not bound */
 +(NSString *)password_not_bindingFailed_email;

/*! 已启用多个时间段 */
/*! Multiple time periods enabled */
 +(NSString *)Devicesetting_enabled_Multiple_time_periods;

/*! 对讲模式下，需要您说完话后才能听到对方的声音； */
/*! In intercom mode, you need to finish speaking then you can hear the other party\'s voice; */
 +(NSString *)devicesetting_intercom_speaking_voice;

/*! 录像删除后无法恢复 */
/*! Cannot recover after video deletion */
 +(NSString *)devicesetting_Videobackup_Eliminar_video_unrecover;

/*! 卡不支持 */
/*! Card not supported */
 +(NSString *)Devicesetting_Card_not_supported;

/*! 夜晚光线不足时，自动开启LED白光灯，画面始终为彩色。 */
/*! Spotlights stay on while illumination is low. The camera sees color image. */
 +(NSString *)deviceSetting_full_color_night_vision_describe;

/*! 验证码错误 */
/*! Wrong verification code */
 +(NSString *)wrong_verifica_code;

/*! 开罗/东欧 */
/*! Africa/Cairo */
 +(NSString *)Africa_Cairo;

/*! 输入的路由器密码需要不少于8位且不大于128位 */
/*! The router password must be no less than 8 digits and no more than 128 digits */
 +(NSString *)adddevice_router_password_8_to_128;

/*! 设备密码不能为空 */
/*! Device password cannot be empty */
 +(NSString *)adddevice_device_password_cannot_be_empty;

/*! 分组名称不能为空 */
/*! Group name cannot be empty */
 +(NSString *)device_group_unempty;

/*! 小米［MIU] */
/*! Xiaomi [MIU] */
 +(NSString *)person_feedback_question_ROM_software_mi;

/*! 摄像机WIFI初始化失败 */
/*! The camera\'s WIFI initial use failed */
 +(NSString *)devicelist_code_matching_fail_reason_3;

/*! 云存储套餐 */
/*! Cloud storage package */
 +(NSString *)me_Cloud_storage_package;

/*! Line登录 */
/*! Line */
 +(NSString *)login_line;

/*! 即将过期 */
/*! Be about to expire */
 +(NSString *)cloud_be_about_to_expire;

/*! 订单获取失败，请重试 */
/*! Fails to get orders,please try again */
 +(NSString *)cloud_order_fail;

/*! 验证码错误(验证码区分大小写) */
/*! Wrong verification code (clarify capital and small letter) */
 +(NSString *)verify_error_caseSensitive;

/*! 摄像机型号 */
/*! Camera model */
 +(NSString *)deviceSetting_Camera_model;

/*! 云存服务 */
/*! Cloud storage service */
 +(NSString *)cloud_storage_service;

/*! 转申请为维修员后将会撤销服务商申请，会清空已提交的资料。 */
/*! The service provider application will be cancelled after transferring the application to a maintenance worker, and the submitted information will be cleared. */
 +(NSString *)service_Transfer_application_detail;

/*! 开启相机使用权限，允许本应用使用摄像头，您可以使用扫描二维码的方式添加设备 */
/*! Turn on camera access, allow the app to use the camera, you can add a device by scanning the QR code */
 +(NSString *)person_Camera_permissions_instructions;

/*! 邮箱绑定 */
/*! Bind by email */
 +(NSString *)email_address;

/*! 是否删除该设备？ */
/*! Delete this device or not? */
 +(NSString *)devSetting_delete_ask;

/*! 最多可设置256个常看位置，您可以每个常看位置编辑场景名称，方便后续观看。 */
/*! Up to 256 preset positions can be set, and you can edit the scene name for each preset position to facilitate subsequent viewing. */
 +(NSString *)person_feedback_question_add_preset_number_detail;

/*! 服务内容不能为空 */
/*! Service content cannot be empty */
 +(NSString *)service_content_not_empty;

/*! 通过色块遮挡部分画面，保护隐私 */
/*! Block part of the screen with color blocks to protect privacy */
 +(NSString *)deviceSetting_color_blocks_protect_privacy;

/*! 设置设备密码，防止设备被他人配对占用 */
/*! Set a device password to secure this device and only you have access */
 +(NSString *)deviceSetting_Set_device_password_prevent_others;

/*! 微信登录 */
/*! WeChat */
 +(NSString *)login_wechat;

/*! 全选 */
/*! Select all */
 +(NSString *)selectAll;

/*! 请删除并复位设备后再重新添加 */
/*! Please delete and reset the device before adding it again */
 +(NSString *)adddevice_delete_reset_add;

/*! 4.连接成功后，返回APP */
/*! 4. After connecting successfully, return to APP */
 +(NSString *)addevice_connect_success_return;

/*! 流量充值 */
/*! Mobile data top-up */
 +(NSString *)devicesetting_4G_card_Traffic_recharge;

/*! 4G卡管理 */
/*! 4G card management */
 +(NSString *)devicesetting_4G_card_management;

/*! 如果手机在WiFi配置里开启了WLAN+、智能WiFi、WiFi+、WiFi助手，配置时请关闭 */
/*! If the phone has WLAN+, smart Wi-Fi, Wi-Fi+, Wi-Fi assistant enabled in the Wi-Fi configuration,  please close it when configuring. */
 +(NSString *)adddevice_close_effect_WLAN;

/*! 手机号未被绑定 */
/*! The phone number is not bound */
 +(NSString *)password_not_bindingFailed_phone;

/*! 展开模式不支持巡航功能 */
/*! Expand mode doesn\'t support auto cruise function */
 +(NSString *)preview_does_not_support_cruise;

/*! 支持中心 */
/*! Support Center */
 +(NSString *)Person_support_Center;

/*! 时间同步 */
/*! Time synchronization */
 +(NSString *)synchronous_time;

/*! 摄像机不支持配对 */
/*! Camera does not support pairing */
 +(NSString *)devicelist_code_matching_fail_reason_4;

/*! 自定义侦测区设置 */
/*! Custom detection area settings */
 +(NSString *)deviceSetting_Custom_detection_area_settings;

/*! 警报声音量 */
/*! Siren volume */
 +(NSString *)deviceSetting_siren_volume;

/*! 侦测到移动物体时录制一小段录像，可选择录像时长 */
/*! Record a video clip when an event detected. You can set the video clip duration */
 +(NSString *)Devicesetting_select_video_time;

/*! 赫尔辛基/东欧 */
/*! Europe/Helsinki */
 +(NSString *)Europe_Helsinki;

/*! 云录像分为报警录制与全天录制两种类型。 */
/*! Cloud recording is divided into two types: alarm recording and full-day recording. */
 +(NSString *)cloud_storage_details_types_1;

/*! 立即添加 */
/*! Add it now */
 +(NSString *)cloud_add_now;

/*! 门店地址 */
/*! Store Address */
 +(NSString *)Service_map_Store_Address;

/*! 设备未购买云存，是否前往购买？ */
/*! Device not purchased cloud storage,whether go to buy? */
 +(NSString *)cloud_tips_text_4;

/*! 编辑 */
/*! Edit */
 +(NSString *)edit;

/*! 固件升级成功，已为设备恢复出厂设置 */
/*! The firmware upgrade is successful and the device has been factory reset. */
 +(NSString *)devicelist_firmware_update_all_sucess_prompt;

/*! 使用云存兑换码 */
/*! Use cloud deposit code */
 +(NSString *)cloud_purchase_use_code;

/*! 视频服务已关闭，请打开后再查看 */
/*! The video service has been turned off, please turn it on and check again */
 +(NSString *)preview_video_turnedoff_turn_check;

/*! 安放指南 */
/*! Placement guide */
 +(NSString *)addDevice_Placement_guide;

/*! 授权失败 */
/*! Fail to authorize */
 +(NSString *)authorization_fail;

/*! 松开刷新 */
/*! Release Refresh */
 +(NSString *)device_Release_Refresh;

/*! 录像回放 */
/*! Video playback */
 +(NSString *)devicelist_share_equipment_Video_playback;

/*! 下载失败(%1$s)个，已下载(%2$s)个。 */
/*! Downloads failed (%1$s), downloaded (%2$s). */
 +(NSString *)preview_download_fail;

/*! 消息推送时段 */
/*! Message push period */
 +(NSString *)deviceSetting_Message_push_period;

/*! 您的流量已用完，请尽快充值 */
/*! Traffic exhausted, please recharge */
 +(NSString *)devicelist_Insufficient_traffic_out;

/*! 为确保您能够正常添加设备，请在添加 过程中保持您的蜂窝网络处于关闭状态 */
/*! To ensure that you can add devices normally, please keep your cellular network turned off during the adding process */
 +(NSString *)addevice_turned_off_cellular_network;

/*! 耶路撒冷/以色列 */
/*! Asia/Jerusalem */
 +(NSString *)Asia_Jerusalem;

/*! 3.尽量减少摄像头附近的干扰；有可能你的摄像机被附近其他电子设备干扰了，尽量远离微波炉，还有一些大屏幕电视或家庭影院系统。 */
/*! 3. Minimize interference near the camera; it is possible that your camera is disturbed by other nearby electronic devices,as far away as possible from the microwave oven,as well as some large-screen TVs or home theater systems. */
 +(NSString *)devicelist_offline_help_content_more_help_three;

/*! 选择IPC开头的设备热点 */
/*! Choose hotspot with \"IPC…\" */
 +(NSString *)addDevice_select_IPC;

/*! 释放刷新 */
/*! Release refresh */
 +(NSString *)cloud_release_refresh;

/*! 我知道了 */
/*! Get it */
 +(NSString *)newbie_guide_text_1;

/*! 经验年限 */
/*! Years of experience */
 +(NSString *)service_map_year_of_experience;

/*! 安装模式： */
/*! Installation mode */
 +(NSString *)devicesetting_video_center_correction_Installation_mode;

/*! 可用套餐 */
/*! Available packages */
 +(NSString *)Devicesetting_Available_packages;

/*! 摄像机已休眠 */
/*! Camera dormant */
 +(NSString *)playback_camera_dormant;

/*! 反馈内容不能为空! */
/*! Feedback cannot be empty! */
 +(NSString *)appealsDescripeNull;

/*! 截图失败 */
/*! Screenshot fails */
 +(NSString *)play_screenshot_fail;

/*! 1.如果您已经购买了云服务，并且尚未过期。 您可以在“云录像服务管理页”和“个人中心的云商城”进行购买云录像。购买后，新的云服务套餐将会在当前套餐到期后立即生效。 */
/*! 1. If you have purchased a cloud service and it has not expired. You can purchase cloud video on \"Cloud Video Service Management Page\" and \"Cloud Center of Personal Center\". After purchase, the new cloud service package will take effect immediately after the current package expires. */
 +(NSString *)person_feedback_question_Cloud_video_renewal_detail_1;

/*! 请输入设备密码 */
/*! Please enter the device password */
 +(NSString *)adddevice_Wireless_add_mode_wired_device_password;

/*! 请选择购买套餐 */
/*! Please choose to purchase a package */
 +(NSString *)devicesetting_4G_card_choose_package;

/*! 正在下载新版本 */
/*! Downloading new version */
 +(NSString *)Update_Downloading;

/*! 1.打开设置->选择无线局域网，将手机无线网络连接到设备热点 */
/*! 1. Open Settings-> Select Wireless LAN，connect the mobile phone wireless network to the device hotspot */
 +(NSString *)addevice_open_Wlan_ios;

/*! 开 */
/*! On */
 +(NSString *)play_open;

/*! 自定义报警提示音 */
/*! Custom alarm tone */
 +(NSString *)deviceSetting_custom_tone_record;

/*! 设置画面上时间和信息水印 */
/*! Set the time and information watermark on the screen */
 +(NSString *)deviceSetting_Set_time_information_watermark;

/*! 摄像机进行水平360拍摄 */
/*! Camera performs horizontal 360° shot */
 +(NSString *)devicesetting_Camera_horizontal_360_shot;

/*! 是否删除通道设备 */
/*! Delete device channel or not */
 +(NSString *)devSetting_delete_channelDevcive;

/*! 无效MAC地址 */
/*! Invalid MAC address */
 +(NSString *)devicelist_code_matching_fail_reason_5;

/*! 历史总流量 */
/*! Total traffic */
 +(NSString *)history_total_data;

/*! 1天约{mount} */
/*! 1 day about {mount} */
 +(NSString *)cloud_1_day_mount;

/*! 返回 */
/*! Return */
 +(NSString *)interface_return;

/*! 设置设备WiFi密码 */
/*! Set the device WiFi password */
 +(NSString *)adddevice_set_device_wifi_password;

/*! 检测到云存设备%1$s的通道%2$s的布防已关闭，请前往设备设置开启布防 */
/*! Detected that the alarm of the channel%2$s of the cloud storage device%1$s has been disabled. Please go to the device settings to enable alarm */
 +(NSString *)devicelist_cloud_detecte_prompt;

/*! 打开微信扫描二维码 */
/*! Open WeChat and scan the QR code */
 +(NSString *)person_save_open_wechat_scan_code;

/*! 更新完成 */
/*! Update completed */
 +(NSString *)devicelist_update_completed;

/*! 本地存储访问权限 */
/*! Local storage access */
 +(NSString *)person_local_storage_access;

/*! 请输入姓名 */
/*! Please enter your name */
 +(NSString *)service_enter_name;

/*! 曼谷 */
/*! Asia/Bangkok */
 +(NSString *)Asia_Bangkok;

/*! (2)云存续费的过程：点击设备“云录像”进入云录像界面-点击“云存服务”图标进入云存服务-选择要续费的通道-点击下方“立即续费”按钮-进入云商城界面-选择设备续费的通道与套餐-点击立即续费支付后完成续费。 */
/*! (2) Process of cloud surviving fee: Click the device \"Cloud Recording\" to enter the cloud recording interface - click the \"Cloud Storage Service\" icon to enter the cloud storage service - select the channel to renew the fee - click the \"Renew Now\" button below to enter the cloud mall interface - Select the channel and package for renewal of the device - click on the renewal fee immediately to complete the renewal. */
 +(NSString *)cloud_storage_details_how_to_renew_tips_2;

/*! 云台锁定 */
/*! PTZ lock */
 +(NSString *)preview_PTZ_lock;

/*! 全新操作更便捷 */
/*! New operation is more convenient */
 +(NSString *)Lead_page_describe_2;

/*! 开启摄像机 */
/*! Turn on the camera */
 +(NSString *)addDevice_Turn_on_camera;

/*! 正在清理... */
/*! Cleaning up… */
 +(NSString *)person_set_cleaning_cache;

/*! 2.设备所在区域有信号。 */
/*! 2. There is a signal in the area where the device is located. */
 +(NSString *)devicesetting_4G_card_sim_card_device_has_signal;

/*! 区域颜色 */
/*! Area color */
 +(NSString *)devicesetting_area_color;

/*! 正在刷新... */
/*! Refreshing... */
 +(NSString *)cloud_refreshing;

/*! 摄像机离线了如何处理？ */
/*! What should do if the camera is offline? */
 +(NSString *)person_feedback_question_1;

/*! 演示 */
/*! Demo */
 +(NSString *)square;

/*! 1.接通设备电源 */
/*! 1. Power on the device */
 +(NSString *)adddevice_power_device;

/*! 录像传输中，请稍等... */
/*! In the video transmission,please wait a moment... */
 +(NSString *)devicesetting_Device_video_transmission;

/*! 格式化中 */
/*! Formatting */
 +(NSString *)formatting;

/*! 3.手机和设备处于同一路由器下 */
/*! 3. The phone and device are under the same router */
 +(NSString *)addDevice_help_text8;

/*! 当前4G卡已锁定，是否进行解锁？ */
/*! The current 4G card is locked. Is it unlocked? */
 +(NSString *)devicesetting_unlock_question;

/*! 检测到云存设备%@智能侦测已关闭，请前往设备设置开启智能侦测 */
/*! If it is detected that the motion detection of cloud storage devices %@ has been turned off, please go to the device settings to enable motion detection */
 +(NSString *)devicelist_cloud_motion_prompt_ios;

/*! 前往查看审核进度 */
/*! View review progress */
 +(NSString *)service_map_review_progress;

/*! 该时间点没有录像 */
/*! No recording at this time */
 +(NSString *)playback_no_video_this_time;

/*! %@ - %@推送消息 */
/*! %@ - %@forward news */
 +(NSString *)deviceSetting_Push_during_day_time_ios;

/*! 3.若设备指示灯没有闪烁，按照提示进行操作。 */
/*! 3.If  the indicator light of  device doesn\'t blink,please follow the instruction to operate. */
 +(NSString *)help_addDevice_textTips_8;

/*! 固件升级失败，请点击失败帮助查看手动升级指引 */
/*! The firmware upgrade failed. Please click the failure help to view the manual upgrade guide. */
 +(NSString *)devicelist_firmware_update_all_fail_prompt;

/*! 设备“%@”正在升级，大约需要1-2分钟，请不要离开 */
/*! The device \"%@\" is being upgraded, it will take about 1-2 minutes, please do not leave */
 +(NSString *)devicelist_upgraded_linkvisual_ios;

/*! 请将设备与路由器连接 */
/*! Please connect the device to the router */
 +(NSString *)adddevice_Wireless_add_mode_confirm;

/*! 流量不足 */
/*! Insufficient flow */
 +(NSString *)devicesetting_Insufficient_flow;

/*! 添加 */
/*! Add */
 +(NSString *)add;

/*! 目前摄像机联网暂不支持这种情况， 需要选择其他可用的WiFi连接。 */
/*! At present, this situation is not supported by camera networking, need to select other available WiFi connections. */
 +(NSString *)person_feedback_question_check_other_question_connect;

/*! 无效UID */
/*! Invalid UID */
 +(NSString *)devicelist_code_matching_fail_reason_6;

/*! 选择摄像机通话模式 */
/*! Select camera call mode */
 +(NSString *)devicesetting_Select_camera_call_mode;

/*! 数亿用户都在用，安全可托付 */
/*! Hundreds of millions of users are using it,security can be entrusted */
 +(NSString *)cloud_Pay_alipay;

/*! 购买完成云存套餐后，云录像功能会自动开启，您可以点击设备列表相对应的“云录像”按钮进入云录像界面-点击服务管理图标进入“云存服务管理”-关闭云录像功能。 */
/*! After purchasing and completing the cloud storage package, the cloud recording function will be automatically enabled. You can click the \"cloud recording\" button corresponding to the device list to enter the cloud recording interface - click the service management icon to enter \"cloud storage service management\" - turn off the cloud recording function. */
 +(NSString *)cloud_close_cloud_video_process;

/*! 名称未填写 */
/*! Name not filled */
 +(NSString *)service_name_unfilled;

/*! 相册权限 */
/*! Album permissions */
 +(NSString *)person_Album_permissions;

/*! 重置配置提示 */
/*! Reset configuration prompt */
 +(NSString *)adddevice_reset_configuration_prompt;

/*! 全部类型 */
/*! All types */
 +(NSString *)AlarmMessage_all_type;

/*! 该设备不支持有线添加模式 */
/*! The device does not support wired add mode */
 +(NSString *)adddevice_Wireless_add_not_support;

/*! 设置消息时间间隔 */
/*! Set the message interval */
 +(NSString *)deviceSetting_Set_message_interval;

/*! 低 */
/*! Low */
 +(NSString *)low;

/*! 请详细的描述您遇到的问题，必要时请附上截图 */
/*! Please describe the problem in detail, and attach a screenshot if necessary */
 +(NSString *)person_feedback_add_picture_indetail;

/*! 加载更多 */
/*! Load more */
 +(NSString *)cloud_load_more;

/*! ③ 点击“确定”，即可开启时间同步。 */
/*! ③ Click \"OK\" to enable time synchronization. */
 +(NSString *)Cloud_detail_guide_step3;

/*! 清晰度切换失败 */
/*! Definition switching failed */
 +(NSString *)preview_Definition_switching_failed;

/*! 确认跳转 */
/*! Confirm jump */
 +(NSString *)devicelist_Confirm_jump;

/*! 教学视频 */
/*! Learn Video */
 +(NSString *)help_teach_video;

/*! 正在配对 */
/*! Pairing in progress */
 +(NSString *)addDevice_Pairing_progress;

/*! 若没收到验证码请点击“重新获取验证码” */
/*! If not get verification code,please click \"get verification code again\" */
 +(NSString *)userInfo_tips_text_2;

/*! 电话模式下，您和对方可以像打电话一样同时说话； */
/*! In phone mode, you and the other party can talk at the same time as making a call; */
 +(NSString *)devicesetting_phone_other_same_call;

/*! IP地址 */
/*! IP address */
 +(NSString *)deviceSetting_IP_address;

/*! 服务 */
/*! Service */
 +(NSString *)cloud_service_day;

/*! 正在解绑... */
/*! Unbinding... */
 +(NSString *)Unbinding;

/*! 1、请检查手机蓝牙是否已开启 */
/*! 1、 please check if the phone Bluetooth is turned on */
 +(NSString *)IOS_phone_bluetooth_status;

/*!   为了提供更好的用户体验，避免混乱，我们将用IP Pro代替本应用，本应用原有的功能体验不受影响，请您点击“下载”按钮下载使用IP Pro。 */
/*! In order to provide a better user experience and avoid confusion, we will use IP Pro instead of this application. The original functional experience of this application is not affected. Please click the \"Download\" button to download and use IP Pro. */
 +(NSString *)App_update_IP_Pro;

/*! 设备用户名格式错误 */
/*! Format of device user name is wrong */
 +(NSString *)addDevice_userName_error;

/*! 联系方式 */
/*! Contact information */
 +(NSString *)ContactInformation;

/*! 用户协议 */
/*! User Agreement */
 +(NSString *)person_userPolicy;

/*! 烟雾 */
/*! Smoke and fog */
 +(NSString *)smoke;

/*! 未发现TF卡 */
/*! No TF card found */
 +(NSString *)playback_No_TFcard_found;

/*! 添加设备帮助 */
/*! Device adding help */
 +(NSString *)help_addDevice;

/*! 当前设备连接WiFi： */
/*! The current device is connected to WiFi: */
 +(NSString *)device_wifi_connect;

/*! 云存套餐免费体验 */
/*! Free Cloud Storage Package */
 +(NSString *)cloud_package_promotion;

/*! 时间轴：左右拖动时间轴，选择播放录像段；手势缩放进行时间轴的缩放 */
/*! Timeline:drag the time line left and right to choose recording period . Use fingers to zoom in or zoom out the timeline */
 +(NSString *)help_preview_ttextTips_16;

/*! 开启看守位置，摄像机跟随移动目标转动后会自动回到当前常看位置 */
/*! Turn on the home position, the camera will automatically return to the current Preset position after rotating with the moving target */
 +(NSString *)devicesetting_Guard_position_prompt;

/*! 请保持设备、手机、路由器的距离在1.5米以内 */
/*! Please keep the distance between the device, mobile phone and router within 1.5 meters. */
 +(NSString *)adddevice_distance_prompt;

/*! c.若为单通道设备，则直接迁移，提示迁移成功跳转至设备列表界面；若为多通道设备，则需要选择数量相等的通道数才能迁移； */
/*! If the device is a single-channel device, the device migrates directly to the device list interface. If the device is a multi-channel device, you need to select an equal number of channels to migrate. */
 +(NSString *)cloud_help_migration_device_c;

/*! 连接失败原因 */
/*! Connection failure reason */
 +(NSString *)adddevice_connect_fail_reason_3;

/*! 关机时段全选，设备将24小时处于关机状态，是否确认保存？ */
/*! Select all the shutdown periods, and the device will be in the shutdown state for 24 hours. Are you sure to save? */
 +(NSString *)devicesetting_Select_all_shutdown_periods;

/*! 在微信中搜索“九安云服务”公众号，关注成功后授权登录即可 */
/*! Search for the \"JuanCloud Service\" official account in WeChat, and you can log in after you follow */
 +(NSString *)person_set_how_to_follow_prompt;

/*! %1$d个月 */
/*! %1$d Month */
 +(NSString *)months_plural;

/*! 没有找到设备所在的位置 */
/*! The location of the device was not found */
 +(NSString *)preview_device_not_found;

/*! 流量购买 */
/*! Mobile data purchase */
 +(NSString *)devicesetting_4G_card_Traffic_purchase;

/*! 下载(%@) */
/*! Download(%@) */
 +(NSString *)preview_download_number_ios;

/*! 已通过 */
/*! Passed */
 +(NSString *)Service_map_pass;

/*! 选择添加方式 */
/*! Select add mode */
 +(NSString *)adddevice_select_add_mode;

/*! 可根据不同场景调节曝光值，数值越大画面越明亮 */
/*! The exposure value can be adjusted according to different scenes, the larger the value, the brighter the picture */
 +(NSString *)deviceSetting_Exposure_adjusted_different_scenes;

/*! 账号下存在云存服务可迁移至该设备 */
/*! Cloud storage services under the account can be migrated to the device */
 +(NSString *)playback_have_cloud_can_migrate;

/*! 1.选择录像机。 */
/*! 1.Choose DVR/NVR */
 +(NSString *)help_addDevice_textTips_18;

/*! 已保存至手机相册 */
/*! Saved to phone album */
 +(NSString *)devicesetting_Videobackup_save_to_system_album;

/*! 设备添加成功 */
/*! Device added successfully */
 +(NSString *)adddevice_add_success;

/*! 保持手机与设备处于同一路由WiFi下，点击下方按钮 开始搜索设备 */
/*! Keep the phone and the device under the same route WiFi, click the button below to start searching for the device */
 +(NSString *)adddevice_click_start_searching_device;

/*! 激活失败 */
/*! Activation fails */
 +(NSString *)devicesetting_4G_card_sim_card_activated_fail;

/*! 倍速播放功能仅云录像支持 */
/*! High-speed playbackk function is only supported by cloud recording */
 +(NSString *)Playback_Multi_speed_playback_hint;

/*! 请具体描述您遇到的问题 */
/*! Please describe the problem you encountered in detail */
 +(NSString *)person_feedback_describe_detail_question;

/*! 设备验证失败，请重新配置 */
/*! Fail to verify device,please configure again */
 +(NSString *)addDevice_validationFailed_reconfigure;

/*! 1.请确认设备所在的网络能正常访问互联网,并且路由器已开启DHCP功能; */
/*! 1. Make sure that the network where the device is located can access the Internet, and the router has enabled the DHCP function; */
 +(NSString *)person_feedback_question_prompt_error_1;

/*! 为了提供更好的用户体验，避免混乱，我们将用易视云代替本应用，本应用原有的功能体验不受影响，请您点击“下载”按钮下载使用易视云。 */
/*! In order to provide a better user experience and avoid confusion, we will replace this application with EseeCloud. The original functional experience of this application is not affected. Please click the \"Download\" button to download and use EseeCloud. */
 +(NSString *)App_update_Eseecloud;

/*! 扫码 */
/*! Scan code */
 +(NSString *)adddevice_scan_code_nav;

/*! APP需要获取局域网权限,以获取设备的局域网状态给设备配置网络 */
/*! App needs to obtain the LAN permission to obtain the LAN status of the device and configure the network for the device */
 +(NSString *)NSLocalNetworkUsageDescription;

/*! 连接后，等待状态栏出现WiFi图标，返回APP。 */
/*! After connecting, wait for the WiFi icon to appear in the status bar and return to the APP. */
 +(NSString *)addDevice_waittingAndBack_APP;

/*! 下载手机客户端，添加云台摄像机，点击“云台按钮”，选择常看位置，即可添加常看位置。 */
/*! Download the mobile client, add a PTZ camera, click the \"PTZ button\", and select a preset position to add a preset position. */
 +(NSString *)person_feedback_question_add_preset_detail;

/*! PIR红外感应有效区 */
/*! PIR infrared sensor effective area */
 +(NSString *)deviceSetting_PIR_infrared_sensor_effective;

/*! 云台锁定开启，启用自定义侦测区或隐私区功能后，云台将自动锁定 */
/*! The gimbal lock is turned on, and the gimbal will be automatically locked after enabling the custom detection area or privacy zone function */
 +(NSString *)deviceSetting_gimbal_lock_turned_locked_after_enabling_custom_privacy_function;

/*! 可用： */
/*! Available: */
 +(NSString *)deviceSetting_Available;

/*! 设备连接中 */
/*! Device connected */
 +(NSString *)addDevice_device_connect;

/*! 4、其它网络要求 */
/*! 4、 Other network requirements */
 +(NSString *)adddevice_other_network_require;

/*! 拖动屏幕上的网球经过红点碰到球拍 */
/*! Drag the tennis ball on the screen to touch the racket through the red dot */
 +(NSString *)Register_drag_tennis_balltouch_the_racket;

/*! 看守位：首个位置带有看守功能，摄像机跟随移动目标转动后会自动回到该位置。 */
/*! Home position: The first position has a guard function, and the camera will automatically return to this position after rotating with the moving target. */
 +(NSString *)preview_Guard_position_describe;

/*! 配对失败 */
/*! Pairing failed */
 +(NSString *)Addevice_pairing_fail;

/*! 温馨提示： */
/*! Tips: */
 +(NSString *)cloud_storage_details_tips;

/*! 商品已下架 */
/*! Goods have been removed */
 +(NSString *)cloud_removed;

/*! 请按住话筒录制报警提示音 */
/*! Please press and hold the microphone to record the alarm prompt aduio */
 +(NSString *)deviceSetting_custom_tone_set;

/*! 开启自动巡航 */
/*! Turn on auto cruise */
 +(NSString *)preview_turn_on_auto_cruise;

/*! 配置WiFi */
/*! Configure WiFi */
 +(NSString *)devicesetting_Configure_WiFi;

/*! 萨拉热窝/中欧 */
/*! Europe/Sarajevo */
 +(NSString *)Europe_Sarajevo;

/*! 录像日程添加 */
/*! Add video schedule */
 +(NSString *)devicesetting_Add_video_schedule;

/*! 请输入注册的邮箱/手机号 */
/*! Please input registered email address/cellphone number */
 +(NSString *)enter_email_number_of_register;

/*! 云录像介绍 */
/*! Cloud video introduction */
 +(NSString *)cloud_help_video_introduce;

/*! 云存自动上传录像开通失败，请重试 */
/*! Fail to enable cloud storage automatically  upload recording,please try again */
 +(NSString *)cloud_auto_upload_failure;

/*! 关于电量管理模式 */
/*! About power management mode */
 +(NSString *)devicesetting_About_power_management;

/*! 云存储尊享权益 */
/*! Cloud storage exclusive rights */
 +(NSString *)cloud_exclusive_rights;

/*! 新添加的设备 */
/*! Newly added device */
 +(NSString *)cloud_newly_add_migrate;

/*! 每款设备支持的功能有所不同，预览界面上只显示该设备支持的功能。 */
/*! Different devices support different functions. Preview interface only shows the functions supported. */
 +(NSString *)help_preview_ttextTips_1;

/*! 正在为您连接设备，请耐心等候。 */
/*! Please be patient while connecting your device. */
 +(NSString *)devicelist_connecting_device_pop;

/*! 马上去体验一下吧 */
/*! Go and experience it now */
 +(NSString *)devicelist_cloud_guide_2;

/*! 点击设备列表设备“云录像”按钮或个人中心“云商城”-进入“云商城”界面-点击“切换”选择需要购买的设备以及设备通道-选择完成后自动为您匹配合适的套餐-点击“立即购买”付款完成后即可开启设备云存功能 */
/*! Click the device list device \"Cloud Record\" button or the personal center \"Cloud Mall\" - enter the \"Cloud Mall\" interface - click \"Switch\" to select the device you want to purchase and the device channel - automatically select the appropriate package for you after the selection is completed - click \" Buy now\" Once the payment is complete, you can turn on device cloud storage. */
 +(NSString *)cloud_storage_details_how_to_buy_guide;

/*! 扫码添加 */
/*! Scan code added */
 +(NSString *)adddevice_scan_code_add;

/*! 密码：请输入 */
/*! Password: Please enter */
 +(NSString *)adddevice_please_enter_password;

/*! 继续下载(%@) */
/*! Continue(%@) */
 +(NSString *)preview_continue_download_ios;

/*! 存储卡安装 */
/*! Memory card installation */
 +(NSString *)addDevice_Memory_card_installation;

/*! 请填写您要建议的内容，建议填写格式：我希望加入()功能，因为我经常() */
/*! Please fill out the content you want to suggest, fill in the format: I hope to join () function, because I often () */
 +(NSString *)person_product_suggest;

/*! %1$s更新固件大约需要几分钟，请确保设备电源与网络正常 */
/*! %1$s update firmware takes about a few minutes, please make  sure the device power and network are normal. */
 +(NSString *)devicelist_firmware_update_wait;

/*! 个人推送 */
/*! Personal push */
 +(NSString *)person_Personal_push;

/*! 正在配置，请勿断开网络！ */
/*! Configuring, do not unplug the network! */
 +(NSString *)adddevice_need_wait;

/*! 公告消息 */
/*! Announcement news */
 +(NSString *)person_Announcement_message;

/*! 摄像机根据设置的时间段进行录像工作 */
/*! The camera performs recording according to the set time period */
 +(NSString *)devicesetting_Recording_schedule_describe;

/*! 倍速 */
/*! Speed up */
 +(NSString *)playback_times_the_speed;

/*! 配置WiFi后，如网线被拔出，基站将自动切换到WiFi */
/*! After configuring WiFi, if the network cable is unplugged, the base station will automatically switch to WiFi */
 +(NSString *)deviceSetting_Configure_WiFi_describe;

/*! 为保障设备信息安全，请设置密码。 */
/*! For security,please setup password */
 +(NSString *)addDevice_setting_tips_advice;

/*! 扫描对方账号二维码（“我的”-“个人资料”-“我的二维码” 中）分享设备 */
/*! Scan the QR code of the other party\'s account (\"My\"-\"Personal Information\"-\"My QR Code\") to share the device */
 +(NSString *)share_device_scan_code;

/*! 查看云存录像 */
/*! Check cloud storage recording */
 +(NSString *)help_cloud_storage_textTips_6;

/*! 第三方服务授权 */
/*! Third-party service authorization */
 +(NSString *)deviceSetting_Third_party_service_authorization;

/*! 发送 */
/*! Send */
 +(NSString *)Stand_alone_station_Send;

/*! 3.开启视频服务 */
/*! 3. Turn on the video service */
 +(NSString *)preview_no_video_open_service;

/*! 2.确认设备是否存在网线接口，若没有网线接口，选择①否进入无线添加流程； */
/*! 2. Check whether if  the network cable interface is  existed . If there have no network cable interface,select ① \"NO\" to enter the wireless adding process. */
 +(NSString *)help_addDevice_textTips_26;

/*! 现在 */
/*! Now */
 +(NSString *)playback_now;

/*! 重置后需要重新设置接收邮箱才能接收警报消息 */
/*! After reset, you need to reset the receiving mailbox to receive alert messages */
 +(NSString *)person_reset_need_receiving_mailbox_aler;

/*! 设备语音列表 */
/*! Device voice list */
 +(NSString *)devicesetting_Device_voice_list;

/*! Polski */
/*! Polski */
 +(NSString *)Polish;

/*! 解绑后，你将不能使用此邮箱登录该账号哦~是否继续解绑？ */
/*! After unbinding, you will not be able to use this email address to log in to the account~ Do you want to continue unbinding? */
 +(NSString *)Unbind_mailbox_describe;

/*! 版本下载失败 */
/*! Version download failed */
 +(NSString *)Update_download_failed;

/*! 2.如果您手动更改过设备的网络参数,建议将设备恢复默认参数,按住设备上的 Reset键10秒即可。 */
/*! 2. If you have manually changed the network parameters of the device, it is recommended to restore the device to the default parameters, press and hold the Reset button on the device for 10 seconds. */
 +(NSString *)person_feedback_question_prompt_error_2;

/*! 记住登录密码 */
/*! Remember Password */
 +(NSString *)login_Remember_Password;

/*! 增加接单率 */
/*! Increase order acceptance rate */
 +(NSString *)service_increase_order;

/*! 备份完成 */
/*! Backup completed */
 +(NSString *)backup_download_completed;

/*! Amazon */
/*! Amazon */
 +(NSString *)help_Amazon;

/*! 云存试用套餐仅剩%1$d天，请立即续费！ */
/*! There are only %1$d days left in the cloud storage trial package, please renew now! */
 +(NSString *)preview_cloud_Free_tier;

/*! 全天24小时启用智能侦测 */
/*! Enable motion detection 24 hours a day */
 +(NSString *)devicesetting_All_day_detection_time;

/*! 设备未插入存储卡 */
/*! No memory card inserted in the device */
 +(NSString *)devicesetting_No_memory_card;

/*! 上门安装 */
/*! On-site installation */
 +(NSString *)Service_map_On_site_installation;

/*! 调整侦测区域，减少不重要的警报信息 */
/*! Adjust the detection area to reduce unimportant alarm information */
 +(NSString *)devicesetting_Customize_detection_reduce_information;

/*! 体验一下 */
/*! Local experience */
 +(NSString *)login_experience;

/*! 连接设备工作WiFi */
/*! Connect device to work WiFi */
 +(NSString *)addDevice_connect_work_WiFi;

/*! 请为设备选择2.4G WiFi网络，此设备暂不支持5G WiFi网络。 */
/*! Please select a 2.4G WiFi network for the device. This device does not support 5G WiFi network at this time. */
 +(NSString *)addDevice_WiFi_rule;

/*! Wireless Camera System */
/*! Wireless Camera System */
 +(NSString *)help_Wireless_Camera_System;

/*! 当前为移动网络，您确定要继续播放吗？ */
/*! It\'s mobile network currently,are you sure to continue playing? */
 +(NSString *)myDevice_mobileNetworkAlert;

/*! 1.目前只支持容量小于128GB的储存卡,且FAT32文件系统,如果文件系统不对请格式化,并选择FAT32格式; */
/*! 1. Currently only supports memory cards with a capacity of less than 128GB, and the FAT32 file system, if the file system is wrong, please format and select FAT32 format; */
 +(NSString *)person_feedback_question_SDcard_error_1;

/*! 连接中 */
/*! Connecting */
 +(NSString *)myDevice_connection;

/*! 对码添加失败 */
/*! Failed to add by matching code */
 +(NSString *)devicelist_code_matching_fail;

/*! 设置录像日程 */
/*! Set the recording schedule */
 +(NSString *)devicesetting_Set_recording_schedule;

/*! 建议您根据实际通话效果选择最合适的通话模式！ */
/*! It is recommended that you choose the most suitable call mode according to the actual call effect! */
 +(NSString *)devicesetting_recommended_suitable_call;

/*! 请输入新密码 */
/*! Please input new password */
 +(NSString *)password_new_input;

/*! 取消下载 */
/*! Cancel download */
 +(NSString *)deviceSetting_videoBackup_cancelLoading;

/*! SIM卡已锁卡 */
/*! SIM card locked */
 +(NSString *)devicesetting_4G_card_sim_card_locked;

/*! 添加方式差异说明 */
/*! Add method difference description */
 +(NSString *)addevice_difference_description;

/*! 重新下载 */
/*! Download again */
 +(NSString *)devicesetting_Videobackup_download_again;

/*! SIM卡状态正常 */
/*! SIM card status is normal */
 +(NSString *)devicesetting_4G_card_sim_card_normal;

/*! 定点巡航：根据设置的常看位置，每个跑一遍。 */
/*! Fixed-point cruise: according to the preset points set, each run once. */
 +(NSString *)person_feedback_question_gimbal_cruise_detail_2;

/*! 开启布防后，将打开设备智能侦测功能 */
/*! The motion detection function of the device will be turned on after opening the alarm function */
 +(NSString *)alarm_enable_alarm;

/*! 其它添加方式 */
/*! Other ways to add */
 +(NSString *)adddevice_not_find_other;

/*! 网络带宽：%@KB/s */
/*! Network bandwidth: %@KB/s */
 +(NSString *)deviceSetting_Network_bandwidth_ios;

/*! 打开GPS，才能发现附近设备 */
/*! Turn on GPS and then can find devices nearby */
 +(NSString *)GPS_openAndFind;

/*! 开启时段会生成智能侦测警报，警报消息保存在APP智能警报列表中，并同步推送手机通知，如果您不想收到推送通知，可以前往 */
/*! Motion detection alarms will be generated during the open period, and the alarm messages will be saved in the APP smart alarm list, and push notifications to mobile phones synchronously. If you do not want to receive push notifications, you can go to */
 +(NSString *)devicesetting_Intelligent_detection_period_describe;

/*! 电池电量 */
/*! Battery power */
 +(NSString *)deviceSetting_battery_power;

/*! 低电量推送 */
/*! Low battery push */
 +(NSString *)person_alarm_Low_battery_alarm;

/*! 已下载成功 */
/*! Successfully downloaded */
 +(NSString *)playback_download_success;

/*! 松开结束 */
/*! Release end */
 +(NSString *)preview_release_end;

/*! 常看位置设置 */
/*! Preset position settings */
 +(NSString *)person_setting_preview_Preset_setting;

/*! 格式化TF卡将会清空所有录像，是否继续 */
/*! Format micro-SD card will delete all recordings, continue? */
 +(NSString *)tfCard_format_alert_tips;

/*! 请选择服务内容 */
/*! Please select service content */
 +(NSString *)Service_map_select_service_content;

/*! 系统定位您在%1$s，是否切换？ */
/*! The system locates you at %1$s. Do you want to switch? */
 +(NSString *)service_map_city_locate;

/*! 圣地亚哥 */
/*! America/Santiago */
 +(NSString *)America_Santiago;

/*! %@元/月 */
/*! %@ yuan/month */
 +(NSString *)deviceSetting_yuan_month_ios;

/*! 电话模式 */
/*! Phone mode */
 +(NSString *)devicesetting_Phone_mode;

/*! 可能是WiFi密码错误或网络原因导致连接失败，您可以点击查看帮助查看具体原因 */
/*! It may be that the WiFi password is incorrect or the network is causing the connection to fail. You can click the help to see the specific reason. */
 +(NSString *)adddevice_connect_fail_other_reason;

/*! 正在切换为在家模式... */
/*! Switching to at home mode... */
 +(NSString *)devicelist_switch_inhome;

/*! 原密码错误 */
/*! Original password is wrong */
 +(NSString *)password_old_error_tips;

/*! 通道5 */
/*! Channel 5 */
 +(NSString *)channel_five;

/*! 警报声设置 */
/*! Siren setting */
 +(NSString *)devicesetting_Alarm_sound_setting;

/*! Q1：摄像机支持什么类型的存储卡？ */
/*! Q1: What type of memory card does the camera support? */
 +(NSString *)person_feedback_question_type_memory_card;

/*! 固件升级完成，请点击下方按钮查看相关引导帮助 */
/*! The firmware upgrade is complete, please click the button below to view related boot help. */
 +(NSString *)devicelist_firmware_update_fail_sucess_prompt;

/*! 请输入密码 */
/*! Please input a password */
 +(NSString *)Addevice_input_password;

/*! 输入新密码 */
/*! New password */
 +(NSString *)deviceSetting_Enter_new_password;

/*! 设备播放声音的音量 */
/*! The volume at which the device plays sound */
 +(NSString *)devicesetting_device_emitted_volume;

/*! Paypal */
/*! Paypal */
 +(NSString *)paypal;

/*! 当前设备连接的WiFi： */
/*! WiFi currently connected to the device: */
 +(NSString *)devicesetting_WiFi_currently_connected;

/*! 夜间补光 */
/*! Fill light at night */
 +(NSString *)deviceSetting_Fill_light_night;

/*! 请选择门店地址 */
/*! Please select the store address */
 +(NSString *)Service_map_select_store_address;

/*! a.若设备指示灯常亮，您可点击“手动添加”按钮前往使用ID添加设备 */
/*! a. If the device indicator is always on, you can click the \"Manual Add\" button to add the device by ID. */
 +(NSString *)adddevice_Wireless_flash_always_on;

/*! 立即修复 */
/*! Fix now */
 +(NSString *)playback_Immediate_repair;

/*! 添加图片 */
/*! Add pictures */
 +(NSString *)person_feedback_add_picture;

/*! 前往开启 */
/*! Go to open */
 +(NSString *)devicelist_go_to_open;

/*! 1.目前只支持容量小于128GB的储存卡，且FAT32文件系统，如果文件系统不对请格式化，并选择FAT32格式； */
/*! 1.Only support SD card max 128GB and FAT32 format. If the system file is error,please formart the SD card and choose FAT32 format. */
 +(NSString *)help_normal_problem_text_8;

/*! 端口号格式错误 */
/*! Format of port number is wrong */
 +(NSString *)addDevice_port_format;

/*! 自动登录 */
/*! Automatic logon */
 +(NSString *)cloud_auto_login;

/*! 我们将第一时间为您推送最新安防设备信息,让您一直走在行业前列。 */
/*! We will push the latest security equipment information for you as soon as possible, so that you have always been at the forefront of the industry. */
 +(NSString *)Service_map_push_information;

/*! 立即开启 */
/*! Immediately open */
 +(NSString *)service_map_Immediately_open;

/*! 连接失败，请点击查看帮助了解具体原因 */
/*! Connection failed, please click View to help understand the specific reason */
 +(NSString *)preview_play_fail_help;

/*! 禁用补光灯 */
/*! Disable fill light */
 +(NSString *)deviceSetting_Disable_fill_light;

/*! 基站通道 */
/*! Base station channel */
 +(NSString *)devicesetting_base_station_channel_1;

/*! 办公室 */
/*! Office */
 +(NSString *)addDevice_nameExample_office;

/*! 云录像开启成功，检测到设备通道%@布防已关闭，请前往设备设置开启布防 */
/*! Cloud recording is turned on successfully, it is detected that the device channel%@ alarm is disabled, please go to the device settings to enable alarm. */
 +(NSString *)cloud_deployment_off_prompt_ios;

/*! 报警消息删除失败，请重试 */
/*! Alarm message deletion failed, please try again */
 +(NSString *)devicesetting_alarmMessage_delete_fail;

/*! 可用 */
/*! Available */
 +(NSString *)devicesetting_4G_card_package_available;

/*! 日光 */
/*! White light */
 +(NSString *)sunlight;

/*! 无云录像 */
/*! No cloud video */
 +(NSString *)playback_cloudless_video;

/*! 4.人为原因导致摄像机断电，例如人为切断电源，导致机器无法正常工作； */
/*! 4. The camera is powered off because of human reasons, such as artificially cutting off the power, causing the machine to not work properly; */
 +(NSString *)person_feedback_question_video_incomplete_4;

/*! 对码完成 */
/*! Matching code completed */
 +(NSString *)devicelist_Matching_code_completed;

/*! 取消订单成功 */
/*! Succeed to cancel order */
 +(NSString *)order_cancel_success;

/*! 云ID */
/*! Cloud ID */
 +(NSString *)cloud_ID;

/*! 设置成功 */
/*! Set successfully */
 +(NSString *)Set_successfully;

/*! 设备离线 */
/*! Device offline */
 +(NSString *)setting_4G_device_offline;

/*! 设备一直处于录像状态 */
/*! The device is always in the recording state */
 +(NSString *)devicesetting_Plug_in_Description;

/*! 配置网络失败 */
/*! Failed to configure network */
 +(NSString *)devicesetting_Failed_configure_network;

/*! 侦测到有人移动时，摄像机发出警报声 */
/*! Siren will be triggered when human movement is detected. */
 +(NSString *)devicesetting_Alarm_sound_setting_describe;

/*! 订单支付成功 */
/*! Succeed to pay */
 +(NSString *)payment_success;

/*! 可能是连接设备失败 */
/*! Device connection might fail */
 +(NSString *)adddevice_fail_view_help_1;

/*! 更多功能 */
/*! More features */
 +(NSString *)preview_More_features;

/*! 实时加密，不惧设备损坏、丢失 */
/*! Real-time encrypted transmission without fear of equipment damage or loss */
 +(NSString *)cloud_storage_introduce_encryption;

/*! 德国 */
/*! Germany */
 +(NSString *)devSetting_Germany;

/*! 暂无登录日志 */
/*! No login log */
 +(NSString *)person_no_login_log;

/*! 2.SD卡损坏或者文件系统有误,应考虑更换或重新格式化SD卡。 */
/*! 2. The SD card is damaged or the file system is wrong, you should consider replacing or reformatting the SD card. */
 +(NSString *)person_feedback_question_SDcard_error_2;

/*! 温得和克 */
/*! Africa/Windhoek */
 +(NSString *)Africa_Windhoek;

/*! 重新加载 */
/*! Reload */
 +(NSString *)me_cloudStore_reload;

/*! 门店门脸照 */
/*! Store face photo */
 +(NSString *)service_Store_face_photo;

/*! 继续 */
/*! Continue */
 +(NSString *)interface_continue;

/*! 获取相册权限失败！ */
/*! Fail to get photo album permission */
 +(NSString *)auth_photos_disable_alanTitle;

/*! 2G/3G/4G网络提醒 */
/*! 2G/3G/4G network reminder  */
 +(NSString *)userSettings_network_remind;

/*! 纽约/美国东部 */
/*! America/New York */
 +(NSString *)America_New_York;

/*! 报警录像时长 */
/*! Alarm recording duration */
 +(NSString *)deviceSetting_Alarm_Settings_time;

/*! 检测到您的TF卡出现异常，请立即格式化TF卡 */
/*! It is detected that your TF card is abnormal, please format the TF card immediately */
 +(NSString *)devicesetting_TF_card_need_formatte_prompt;

/*! 密码强度： */
/*! Password strength: */
 +(NSString *)Registered_password_strength;

/*! 配置WiFi连接 */
/*! Configure WiFi connection */
 +(NSString *)deviceSetting_Configure_WiFi_connection;

/*! 立即购买 */
/*! Purchase now */
 +(NSString *)buy_now;

/*! 型号： */
/*! Model: */
 +(NSString *)devicesetting_Model;

/*! 最多输入“%@”个字符 */
/*! Enter up to \"%@\" characters */
 +(NSString *)service_enter_up_characters_ios;

/*! %1$s - 次日%2$s启动智能侦测 */
/*! %1$s - Motion detection will be activated for %2$s the next day */
 +(NSString *)devicesetting_Night_detection_only_time_android;

/*! 常看位置 */
/*! Preset position */
 +(NSString *)preview_Preset_position;

/*! 密码修改失败 */
/*! Fail to change password */
 +(NSString *)password_change_failure;

/*! 建议您根据实际通话效果选择最合适的通话模式 */
/*! It is recommended that you choose the most suitable call mode according to the actual call effect */
 +(NSString *)devicesetting_recommended_choose_suitable_call;

/*! 下载失败 */
/*! Download failed */
 +(NSString *)devicesetting_Videobackup_download_failed;

/*! 添加设备成功 */
/*! Add device successfully */
 +(NSString *)addDevice_success;

/*! 画面锁定 */
/*! Screen lock */
 +(NSString *)preview_Screen_lock;

/*! 智能 */
/*! Intelligent */
 +(NSString *)smart;

/*! 温馨提示：续费时，若续费通道正在使用的套餐以及套餐其他通道满足续费条件，会默认为您选中之前的套餐与通道。 */
/*! Tips: When you are renewing, if the renewal plan are using the package and the other channels of the package meet the renewal conditions, it will default to select previous package and channel. */
 +(NSString *)cloud_storage_details_how_to_renew_tips_3;

/*! 约 */
/*! about */
 +(NSString *)service_map_about;

/*! 固件： */
/*! Firmware: */
 +(NSString *)deviceSetting_firmware;

/*! 提示2：是否听到提示音“启动配置模式”？ */
/*! Tip 2: Do you hear prompt voice \"Starting configuration mode\"? */
 +(NSString *)addDevice_guide_hearSound;

/*! 常看位置巡航功能需存在常看位置才能正常使用，若您的设备没有常看位置，请及时前往预览-常看位置中添加 */
/*! The frequent viewing position cruise function needs to have a preset position to be used normally. If your device does not have a preset position, please go to the preview-preset position to add it in time */
 +(NSString *)devicesetting_need_set_preset;

/*! 问题反馈 */
/*! Feedback */
 +(NSString *)person_feedback_problem;

/*! 其他日期 */
/*! Other dates */
 +(NSString *)devicesetting_other_data;

/*! 卡萨布兰卡 */
/*! Africa/Casablanca */
 +(NSString *)Africa_Casablanca;

/*! 2、无线单品摄像机请查看设备指示灯状态 */
/*! 2、 Wireless standalone camera, please check the device indicator status */
 +(NSString *)adddevice_Wireless_flash_status;

/*! 3、听到“启动配置模式”提示音，点击“重置成功”按钮 */
/*! 3、 Camera says\'start configuration mode\', press reset succesfully.  */
 +(NSString *)addDevice_help_text5;

/*! 摄像机启动完成 */
/*! Camera startup completed */
 +(NSString *)addDevice_Camera_startup_completed;

/*! 关机期间，智能侦测、录像、报警相关功能将暂停工作 */
/*! During shutdown, motion detection, video recording, and alarm related functions will be suspended. */
 +(NSString *)deviceSetting_Shutdown_timer_describe;

/*! 提交申诉 */
/*! Issue complaints */
 +(NSString *)complaint_submit;

/*! Ebay. */
/*! Ebay. */
 +(NSString *)help_Ebay_;

/*! 在弹出重置密码框中输入6-19个字符组成的新密码后，即可成功重置密码。 */
/*! After entering a new password consisting of 6-19 characters in the reset password box that pops up, the password can be reset successfully. */
 +(NSString *)help_recorder_reset_password_3;

/*! 摄像机始终关闭夜视模式，适合光线一直较明亮的室内 */
/*! The camera always turns off the night vision mode, suitable for indoors where the light is always bright */
 +(NSString *)deviceSetting_camera_always_turns_off_suitable_indoors_bright;

/*! 输入登录密码 */
/*! Enter login password */
 +(NSString *)person_Enter_login_password;

/*! 使用场景 */
/*! Usage scenarios */
 +(NSString *)devicesetting_usage_scenarios;

/*! 设备排序 */
/*! Equipment sorting */
 +(NSString *)deviceSetting_Equipment_sorting;

/*! 普通模式：普通模式下，设置常看位置会截取当前位置的图片，可以很直观看到常看位置内容； */
/*! Normal mode: In normal mode, setting the preset position will capture the picture of the current position, and you can see the content of the preset position intuitively; */
 +(NSString *)preview_preset_help_6;

/*! 六 */
/*! S */
 +(NSString *)Saturday;

/*! 分组不存在 */
/*! Group does not exist */
 +(NSString *)device_group_unexist;

/*! 清理缓存后不会丢失您的设备数据和个人信息 */
/*! No loss of your device data and personal information after  clearing the cache */
 +(NSString *)person_set_clean_cache_influences;

/*! 设备设置 */
/*! Setup */
 +(NSString *)device_setting;

/*! 选择提示音 */
/*! Choose a prompt tone */
 +(NSString *)devicesetting_select_a_tone;

/*! 暂无配对通道 */
/*! No pairing channel */
 +(NSString *)devicesetting_No_pairing_channel;

/*! 剩余服务天数 */
/*! Rest service days */
 +(NSString *)remaining_days_service;

/*! 远程使用添加设备时，需要您的设备附近有可上网的路由器，给设备连上路由器WiFi后，您可以随时随地观看设备画面、录像以及接收设备的报警消息，推荐您优先使用此添加方式； */
/*! When using the device remotely, a router with Internet access is required near your device. After connecting the device with WiFi, you can watch the device\'s video screen and recording and receive the alarm message of the device anytime and anywhere. It is recommended that you give priority to using this add-on method. */
 +(NSString *)addevice_remote_use_description;

/*! 套装 */
/*! Kit */
 +(NSString *)adddevice_suit;

/*! 录像机 */
/*! DVR/NVR */
 +(NSString *)addDevice_video_products;

/*! Русский язык */
/*! Русский язык */
 +(NSString *)Russian;

/*! 设备所在的80端口不支持该功能 */
/*! The 80 port where the device is located does not support this function */
 +(NSString *)addDevice_port_not_support;

/*! 图片路径不存在 */
/*! The image path does not exist */
 +(NSString *)me_image_path_not_exist;

/*! 留言 */
/*! Leave a message */
 +(NSString *)Stand_alone_station_leave_a_message;

/*! 重置帮助 */
/*! Reset help */
 +(NSString *)adddevice_reset_help;

/*! 是否确定删除该常看位置？ */
/*! Are you sure you want to delete this preset position? */
 +(NSString *)preview_delete_preset;

/*! 截取位置失败 */
/*! Intercept location failed */
 +(NSString *)preset_current_location_fail;

/*! 迁移成功 */
/*! Successful migration */
 +(NSString *)cloud_migration_success;

/*! ”无线局域网，并开启。 */
/*! \"Wireless LAN and turn it on. */
 +(NSString *)addevice_wireless_LAN;

/*! 当前手机连接网络为此设备热点，无法正常配置网络，请切换其它WiFi */
/*! The current mobile phone is connected to the hotspot of the device, and the network cannot be configured normally. Please switch to another WiFi */
 +(NSString *)adddevice_connect_device_hotspot;

/*! 关于带云台的摄像机 */
/*! About the camera with pan */
 +(NSString *)person_feedback_question_6;

/*! 已为您的设备%@添加成功 */
/*! Added success for your device %@ */
 +(NSString *)adddevice_add_success_prompt_ios;

/*! 以下可直接选择 */
/*! The following can be directly selected */
 +(NSString *)adddevice_direct_select;

/*! 画面移动 */
/*! Screen movement */
 +(NSString *)playback_Screen_movement;

/*! 我们将在APP上展示出您的信息与地址，让更多的消费者用户联系您。 */
/*! We will display your information and address on the APP, so that more consumers and users can contact you. */
 +(NSString *)service_map_display_info;

/*! 请用网线将设备与路由器连接(如下图) */
/*! Please connect the device to the router with a network cable (as shown below) */
 +(NSString *)adddevice_suit_type_2_detail;

/*! 充值金额： */
/*! Top-up amount: */
 +(NSString *)devicesetting_4G_card_recharge_amount;

/*! 更多存储空间，视频一键下载 */
/*! One-click video download */
 +(NSString *)person_More_storage_space;

/*! 填入信息有误 */
/*! Fill in the information is incorrect */
 +(NSString *)public_param_error;

/*! 是否删除通道设备？ */
/*! Delete channel or not? */
 +(NSString *)devSettings_delect_tips;

/*! 原“智能模式” */
/*! Original \"Smart Mode\" */
 +(NSString *)devicesetting_Original_Smart_Mode;

/*! 专业设备维修、上门安装，服务态度好 */
/*! Professional equipment maintenance, on-site installation, good service attitude */
 +(NSString *)service_introduce;

/*! 移动追踪 */
/*! Motion tracking */
 +(NSString *)deviceSetting_Mobile_tracking;

/*! 本次流量 */
/*! Current traffic */
 +(NSString *)userSettings_mobileData_trafficStat_thisTime;

/*! 当前手机为 */
/*! Current mobile phone is */
 +(NSString *)adddeevice_network_prompt_mobile;

/*! 您成功配对%@台摄像机 */
/*! You successfully paired %@ cameras */
 +(NSString *)addDevice_successfully_paired_cameras_ios;

/*! 设置失败 */
/*! Setup failed */
 +(NSString *)Setup_failed;

/*! IP端口已存在 */
/*! IP port already exists */
 +(NSString *)addDevice_IP_existed;

/*! 蓝牙连接失败 */
/*! Bluetooth connection failed */
 +(NSString *)addDevice_bluetooth_connnectionFail;

/*! 色调调节 */
/*! Hue adjustment */
 +(NSString *)deviceSetting_Hue_adjustment;

/*! 移动侦测区域为空将会导致设备不产生移动侦测录像与云录像 */
/*! If the motion detection area is empty, the device will not produce motion detection video and cloud video */
 +(NSString *)devicesetting_motion_detection_area_empty_prompt;

/*! 设置设备密码 */
/*! Set device password */
 +(NSString *)adddevice_set_device_password;

/*! 若无法检测到TF存储卡，请做以下尝试： */
/*! If the TF memory card cannot be detected, please try the following: */
 +(NSString *)person_feedback_question_Unable_to_detect_TF_card_detail;

/*! 巡航 */
/*! Cruise */
 +(NSString *)preview_cruise;

/*! 第比利斯 */
/*! Asia/Tbilisi */
 +(NSString *)Asia_Tbilisi;

/*! APP推送警报消息 */
/*! APP push alert message */
 +(NSString *)deviceSetting_APP_push_alert_message;

/*! 系统检测到你的账号异常，密码输入错误次数超过5次，请5分钟后再重试。 */
/*! The system detected that your account is abnormal. The password was entered incorrectly more than 5 times. Please try again after 5 minutes. */
 +(NSString *)login_wrong_password_abnormal;

/*! 编辑设备成功 */
/*! Succeed to edit device */
 +(NSString *)devSetting_edit_success;

/*! 周二 */
/*! Tuesday */
 +(NSString *)person_alarm_selct_time_tuesday;

/*! 请先检查设备是否通电，再检查设备是否在线状态，若状态不正确，可长按Reset键5秒以上重置设备。 */
/*! Please check whether the device is powered on, and then check whether the device is online. If the status is incorrect, you can reset the device by pressing and holding the Reset button for more than 5 seconds. */
 +(NSString *)adddevice_check_device_power;

/*! 您的门店地址在将在我们的APP上展示出，提高门店爆光率，为您吸引更多的用户。 */
/*! Your store address will be displayed on our APP to increase the store\'s exposure rate and attract more users for you. */
 +(NSString *)Service_map_displayed_store;

/*! 网络状态 */
/*! Network status */
 +(NSString *)deviceSetting_network_status;

/*! 无法获取到当前手机WiFi，请尝试重启手机 */
/*! Unable to get the current mobile WiFi, please try to restart the phone */
 +(NSString *)adddevice_unable_get_WiFi;

/*! 删除通道成功 */
/*! Succeed to delete channel */
 +(NSString *)devSetting_delete_channelDevice_success;

/*! 若流量用完或者流量套餐已过期引起的锁卡则不能解锁成功，需要为SIM卡 */
/*! If the locked card caused by running out of data or the data package has expired cannot be successfully unlocked, the SIM card needs to  */
 +(NSString *)devicesetting_4G_card_sim_card_not_unlock_reason;

/*! 选择补光灯模式 */
/*! Select fill light mode */
 +(NSString *)deviceSetting_Select_fill_light_mode;

/*! 夜间关机 */
/*! Shut down at night */
 +(NSString *)deviceSetting_Shut_down_night;

/*! 弱光环境下，当检测到移动物体或用户远程查看画面时，自动开启LED补光灯 */
/*! In a low light environment, when a moving object is detected or the user is viewing the screen remotely, the LED fill light is automatically turned on */
 +(NSString *)deviceSetting_low_light_environment_detected_screen_remotely_viewing;

/*! 云录像关闭后，将不再自动上传录像至云空间，云服务时间仍然减少，是否确定关闭？ */
/*! After the cloud video is closed, the video will no longer be automatically uploaded to the cloud space, and the cloud service time is still reduced. Are you sure to close it? */
 +(NSString *)cloud_close_cloud_video_question;

/*! 信息加密上传 */
/*! Information encryption upload */
 +(NSString *)cloud_info_encryption;

/*! 注册成功 */
/*! Register successfully */
 +(NSString *)register_success;

/*! 已到账，套餐已生效 */
/*! Has arrived, the package has taken effect */
 +(NSString *)devicesetting_4G_card_has_arrived;

/*! 2.离线设备云服务迁移 */
/*! 2. Offline device cloud service migration */
 +(NSString *)cloud_help_migration_device;

/*! 解绑中... */
/*! Unbinding... */
 +(NSString *)myDevice_unbunding_cloud;

/*! 密码输入错误 */
/*! Incorrect password */
 +(NSString *)cloud_incorrect_password;

/*! 至 */
/*! to */
 +(NSString *)Cloud_storage_service_to;

/*! 超值 */
/*! Value */
 +(NSString *)cloud_value;

/*! 5.确认宽带是否为公司等有防火墙限制的网络，可能是由于网络原因导致设备不能正常连接服务器而导致设备不在线。 */
/*! 5. Check if the broadband is a network with firewall restrictions, such as a company. The device may not be connected to the server due to network reasons, and the device may be offline. */
 +(NSString *)devicelist_offline_help_content_more_help_five;

/*! 无记录 */
/*! No record */
 +(NSString *)MJRefreshHeaderNoneLastDateText;

/*! 连接成功，正在获取云存状态... */
/*! The connection is successful,and the status of the cloud storage is being obtained... */
 +(NSString *)cloud_obtain_connect;

/*! 取消置顶 */
/*! Unpin */
 +(NSString *)devicelist_unpin;

/*! 4、未完成支付则签约失败。 */
/*! 4. The signing fails if the payment is not completed. */
 +(NSString *)cloud_sign_fail;

/*! 设备名字 */
/*! Name of device */
 +(NSString *)device_nick_name;

/*! 设置设备WiFi名称和密码 */
/*! Set device WiFi name and password */
 +(NSString *)adddevice_set_device_name_password;

/*! 报警消息推送 */
/*! Alarm message push */
 +(NSString *)motion_detection_alarm;

/*! 关闭视频服务后，设备预览将无法正常使用，是否确定关闭？ */
/*! After turning off the video service, the device preview will not work properly. Is it determined to be closed? */
 +(NSString *)devicesetting_video_service_prompt;

/*! 快进播放暂不支持开启声音 */
/*! Fast forward playback does not support opening sound */
 +(NSString *)playback_fast_forward_does_not_open_sound;

/*! 桌面鱼眼镜头向上 */
/*! Desktop fisheye lens up */
 +(NSString *)devicesetting_Video_center_correction_Desktop_fisheye_lens_up;

/*! 当天没有录像 */
/*! No recording */
 +(NSString *)meDevice_playback_no_video_thisDay;

/*! 下载固件失败 */
/*! Download firmware failed */
 +(NSString *)devicesetting_firmware_upgrade_load_fail;

/*! 已设置好，重试 */
/*! Has been set, retry */
 +(NSString *)adddevice_has_been_set_retry;

/*! 旧版灯控功能已经全面改版 */
/*! The old version of the light control function has been completely revised */
 +(NSString *)devicesetting_old_Light_Control_revised;

/*! 全彩夜视 */
/*! Full color night vision */
 +(NSString *)deviceSetting_full_color_night_vision;

/*! 请关闭4G、移动网络 */
/*! Please turn off 4G, mobile network */
 +(NSString *)adddevice_turn_off_mobile_4G;

/*! 结束对码 */
/*! End code matching */
 +(NSString *)devicelist_End_code_matching;

/*! App需要打开WiFi */
/*! App need to turn on WiFi */
 +(NSString *)access_WIFI;

/*! 固件升级失败，重新升级固件 */
/*! Firmware upgrade failed, re-upgrade firmware */
 +(NSString *)devicelist_firmware_fail_again;

/*! 请输入设备名称 */
/*! Please input device name */
 +(NSString *)addDevice_name_input;

/*! 视频播放失败 */
/*! Video playback failed */
 +(NSString *)preview_no_video_fail;

/*! 加载中… */
/*! Loading… */
 +(NSString *)loading;

/*! 获取设备信息失败(密码错误，超时) */
/*! Fail to get device info (wrong password,timeout) */
 +(NSString *)prompt_obtainInformation_failed;

/*! 当前网络不可用，请检查你的网络配置 */
/*! Network Failure,Please Check Your Network Connection */
 +(NSString *)myDevice_networkAlert;

/*! 正在说话... */
/*! Talking... */
 +(NSString *)Preview_talking;

/*! 开启后设备会有音频提示 */
/*! Have audio prompt when the device is turned on  */
 +(NSString *)prompt_sounds_content;

/*! 套餐库存为0，无法续费 */
/*! Package stock is 0,can\'t renew */
 +(NSString *)cloud_unable_to_renew;

/*! 服务网点 */
/*! Service outlets */
 +(NSString *)Service_map_Service_outlets;

/*! 提供服务支持 */
/*! Provide service support */
 +(NSString *)person_Provide_service_support;

/*! 零售体验 */
/*! Retail experience */
 +(NSString *)Service_map_Retail_experience;

/*! 波哥大/哥伦比亚 */
/*! America/Bogota */
 +(NSString *)America_Bogota;

/*! 配置网络 */
/*! Configure the network */
 +(NSString *)adddevice_configure_network;

/*! Q2：设备在线并且有报警事件发生时,但手机却收不到消息？ */
/*! Q2: When the device is online and an alarm event occurs, but the phone does not receive the message? */
 +(NSString *)person_feedback_question_no_alarm_push;

/*! 将于%@到期 */
/*! Will expire at %@ */
 +(NSString *)cloud_will_expire_ios;

/*! 注销成功 */
/*! Delete succeeded */
 +(NSString *)person_Cancellation_successful;

/*! 开始时间 */
/*! Start time */
 +(NSString *)deviceSetting_videoBackup_startTime;

/*! 是 */
/*! Yes */
 +(NSString *)yes;

/*! 已授权 */
/*! Authorized */
 +(NSString *)person_Have_authorized;

/*! 白光灯闪烁警报 */
/*! White light flashing alarm */
 +(NSString *)devicesetting_White_light_flashing_alarm;

/*! 四 */
/*! T */
 +(NSString *)Thursday;

/*! 修复成功 */
/*! Repaired successfully */
 +(NSString *)devicesetting_repair_success;

/*! 通过WiFi或其他网络观看，请选择远程使用。(最多人选择） */
/*! View video via WIFI or other network,please select Remote View.(most people choose) */
 +(NSString *)adddevice_deecription_remote_use;

/*! 2.长按Reset键重置设备，直到设备处于配置模式。 */
/*! 2.Press and hold the Reset key to reset the device until the device is in configuration mode. */
 +(NSString *)adddevice_reset_help_2;

/*! 4.由于路由器设置及实际上网环境比较复杂， 如果您对以上问题仍无法解决摄像机联网的问题， 请电话咨询我们的官方客服。 */
/*! 4. Due to the complicated settings of the router and the actual network environment, if you still can\'t solve the problem of connecting the camera to the above problems, please call our official customer service. */
 +(NSString *)person_feedback_question_check_other_question_4;

/*! TF卡未找到，是否购买云存储服务，查看云录像？ */
/*! TF card not found, whether to buy cloud storage service, view cloud video? */
 +(NSString *)playback_not_found_TFcard;

/*! %@ - %@关闭摄像机 */
/*! %@ - %@ turn off camera */
 +(NSString *)deviceSetting_deviceSetting_evening_turn_off_next_ios;

/*! 检查版本信息失败 */
/*! Fail to check version info */
 +(NSString *)me_version_failure;

/*! 对码添加成功 */
/*! Matching code succeed */
 +(NSString *)devicelist_Matching_code_succeed;

/*! 暂停云存录像 */
/*! Stop cloud storage recording */
 +(NSString *)cloud_video_stop;

/*! 我的二维码 */
/*! My QR code */
 +(NSString *)person_my_QR_code;

/*! 云录像开启成功，检测到设备智能侦测已关闭，请前往设备设置开启智能侦测 */
/*! The cloud video recording is successfully turned on, and it is detected that the smart detection of the device has been turned off, please go to the device settings to enable motion detection */
 +(NSString *)cloud_video_on_off_prompt;

/*! mini NVR设备 */
/*! Mini NVR device */
 +(NSString *)device_mini_NVR;

/*! 产品建议 */
/*! Product Suggests */
 +(NSString *)person_feedback_product_suggest;

/*! 启动配置模式 */
/*! Start configuration mode */
 +(NSString *)adddevice_start_configuration;

/*! 联系方式不能全为空，至少有一个! */
/*! The contact method cannot be completely empty,at least one! */
 +(NSString *)appealsNoneNull;

/*! 设备AP密码修改成功 */
/*! The device AP password was successfully modified. */
 +(NSString *)deviceSetting_modify_AP_password_success;

/*! %@个任务 */
/*! %@ tasks */
 +(NSString *)add_smart_scenes_task_IOS;

/*! 无效二维码 */
/*! Invalid QR code */
 +(NSString *)addDevice_error_qrcodeInvalid;

/*! 连热点 */
/*! Connect IPC WiFi */
 +(NSString *)adddevice_even_hotspot_nav;

/*! 不丢失，超安全，有云存录像看家更安心 */
/*! No loss, super-safe, guard the house are more at ease with cloud-storage video */
 +(NSString *)playback_cloud_video_purchase;

/*! APP版本过低 */
/*! App version too low */
 +(NSString *)addDevice_version_too_low;

/*! 壁挂 */
/*! Wall hanging */
 +(NSString *)devicesetting_Wall_hanging;

/*! 请将夜视模式设置为“自动切换”后再启用补光灯功能 */
/*! Please set the night vision mode to \"auto switch\" before enabling the fill light function */
 +(NSString *)deviceSetting_night_vision_auto_switch_enabling_fill_light;

/*! 前往选择系统声音 */
/*! Go to select system sound */
 +(NSString *)devicesetting_select_system_sound;

/*! 已格式化 */
/*! Formatted */
 +(NSString *)tfCard_already_for_mat;

/*! 请将手机无线网络连接到设备热点 */
/*! Please connect your mobile WiFi to the device hotspot */
 +(NSString *)adddevice_connect_mobile_device_hotspot;

/*! 三 */
/*! W */
 +(NSString *)Wednesday;

/*! Battery Camera */
/*! Battery Camera */
 +(NSString *)help_Battery_Camera;

/*! 设备连接网中，请稍等... */
/*! Device  is connecting network, please wait a moment... */
 +(NSString *)smartlink_device_distribution_networking;

/*! 分组名称 */
/*! Group Name */
 +(NSString *)device_group_name;

/*! 手机绑定 */
/*! Bind by cellphone */
 +(NSString *)binding_mobile_phone;

/*! 设备连接超时，您可以点击查看帮助查看超时原因 */
/*! When device connection timeout, you can click help button to view the timeout reason */
 +(NSString *)adddevice_connect_fail_reason_2;

/*! 待更新 */
/*! Pending upgrade */
 +(NSString *)devicesetting_gw_pending_upgrade;

/*! 明亮 */
/*! Brightness */
 +(NSString *)bright;

/*! IP参考地址： */
/*! IP reference address: */
 +(NSString *)person_login_log_IP;

/*! 设备网络带宽检测中... */
/*! Device network bandwidth checking... */
 +(NSString *)Devicesetting_check_network_bandwidth;

/*! 关闭后系统将继续为您升级固件，但您将无法实时查看升级状态，是否确定关闭？ */
/*! After the shutdown, the system will continue to upgrade the firmware for you, but you will not be able to view the upgrade status in real time. Are you sure to close it? */
 +(NSString *)devicelist_firmware_close_update_prompt;

/*! 拷贝 */
/*! copy */
 +(NSString *)copy;

/*! 单次报警闪烁时长 */
/*! Single alarm flashing time */
 +(NSString *)devicesetting_single_flash_time;

/*! 请为带无线上网的NVR设备连接上WiFi(如下图) */
/*! Please connect WiFi to NVR devices with wireless Internet access (as shown below) */
 +(NSString *)adddevice_suit_type_1_detail;

/*! 设备密码 */
/*! Password of device */
 +(NSString *)addDevice_setting_password;

/*! 请留下您的QQ、手机号等联系方式 */
/*! Please leave your QQ, mobile phone number or other contact information */
 +(NSString *)person_feedback_leave_contact_info;

/*! 关闭报警推送，设备生成报警消息时，将不再推送消息给手机。 */
/*! Turn off the alarm push. When the device generates an alarm message, it will no longer push the message to the mobile phone. */
 +(NSString *)Devicelist_turn_off_alarm_push_description;

/*! 晚上20:00 - 次日早上08:00启动智能侦测 */
/*! 20:00 pm-Start smart detection at 08:00 the next morning */
 +(NSString *)devicesetting_Night_detection_only_time;

/*! 修改密码 */
/*! Change password */
 +(NSString *)userInfo_change_password;

/*! 立即充值流量 */
/*! Recharge data immediately */
 +(NSString *)devicesetting_4G_card_sim_card_recharge_now_page;

/*! 1.将摄像机与基站尽量靠近，距离小于1m。 */
/*! 1. Place the camera and the base station as close as possible, and the distance is less than 1m. */
 +(NSString *)Addevice_close_possible_distance_less_1m;

/*! 未到账 */
/*! Not arrived */
 +(NSString *)devicesetting_4G_card_not_arrived;

/*! 密码错误，请输入正确密码 */
/*! The password is wrong, please enter the correct password */
 +(NSString *)preview_password_wrong_enter_correct;

/*! 云录像开启失败，请前往云存服务手动开启 */
/*! Cloud video failed to open, please go to the cloud storage service to open manually */
 +(NSString *)cloud_purchase_video_open_fail;

/*! 3.如果多次操作仍听不到提示音，请尝试其它添加方式。 */
/*! 3.If you still can\'t hear the tone after multiple operations, please try other ways to add. */
 +(NSString *)addDevice_no_sound_help_3;

/*! 关注“%1$s”公众号 */
/*! Follow the\"%1$s\" public account */
 +(NSString *)person_follow_public_account;

/*! 通道%@正在录像中，请关闭后再退出 */
/*! Channel %@ is recording, please close and then exit */
 +(NSString *)preview_channel_recording_peompt_ios;

/*! 设备扫描手机上的二维码配网 */
/*! The device scans the QR code on the mobile phone to configure the network */
 +(NSString *)addDevice_qr_code_phone_configure;

/*! 3、取消自动续费：如需取消续订，请在当前服务周期到期前24小时内，进入微信，点击右下角>【我】>【支付】>右上角【…】>【扣费服务】在已签约项目中，点击取消。 */
/*! 3. Cancel automatic renewal: If you need to cancel the renewal, please enter WeChat within 24 hours before the expiration of the current service period, click the lower right corner> [I]> [Pay]>C56 upper right corner […]> [deduction service] In the signed project, click Cancel. */
 +(NSString *)cloud_cancel_automatic_description;

/*! 解锁 */
/*! Unlock */
 +(NSString *)devicesetting_unloack;

/*! 配置WiFi前，请先确定摄像机是否正确，若不正确，可长按Reset键5秒重置设备。 */
/*! Before configuring WiFi, please make sure that the camera is correct. If it is not correct, press and hold the Reset button for 5 seconds to reset the device. */
 +(NSString *)adddevice_check_device_prompt;

/*! 4.普通家用路由器连接摄像机数量最好不要超过3-4个。 */
/*! 4. The number of cameras connected to ordinary home routers should not exceed 3-4. */
 +(NSString *)devicelist_offline_help_content_more_help_four;

/*! 智能侦测录像 */
/*! Motion detection recording */
 +(NSString *)devSettings_motionDetection_record;

/*! 获取灯控信息失败 */
/*! Fail to get light control info */
 +(NSString *)play_lamp_forFailure;

/*! 响铃时间 */
/*! Ring time */
 +(NSString *)bell_timeRing;

/*! 暂停 */
/*! Pause */
 +(NSString *)cloud_stop;

/*! 变倍与对焦按钮 */
/*! Zoom and focus button */
 +(NSString *)deviceSetting_Zoom_and_focus_button;

/*! 2.找到设备二维码。(若找不到二维码，请选择“其它添加方式”) */
/*! 2. Find the device QR code. (If you can\'t find the QR code, please choose \"Additional Addition\") */
 +(NSString *)adddevice_prompt_step_2;

/*! 解绑手机号 */
/*! unbundle mobile phone number */
 +(NSString *)person_unbundle_phone_number;

/*! 请检查蓝牙设备是否正常通电，手机蓝牙是否已经打开 */
/*! Please check whether the Bluetooth device is normally powered on, and whether the Bluetooth of the mobile phone is turned on */
 +(NSString *)adddevice_check_Bluetooth;

/*! 请选择购买的产品类型 */
/*! Please select the type of product to purchase */
 +(NSString *)help_select_product_type;

/*! 已过期 */
/*! Expired */
 +(NSString *)expired;

/*! 状态指示灯 */
/*! Status Indicator */
 +(NSString *)deviceSetting_Status_Indicator;

/*! 摄像机关机中 */
/*! Camera is shutting down */
 +(NSString *)devicesetting_Camera_shutting_down;

/*! 扫码成功，请点击“确认添加” */
/*! Scan the code successfully, please click \"confirm add\" */
 +(NSString *)adddevice_scan_confirm_add;

/*! 摄像机电量极低，已不能传送视频，请立即充电！ */
/*! The power of the camera is extremely low and it can no longer transmit video. Please charge it now! */
 +(NSString *)alarm_battery_low;

/*! 立即迁移 */
/*! Migrate now */
 +(NSString *)playback_Migrate_now;

/*! 设置尚未保存，是否确定退出？ */
/*! The settings have not been saved, are you sure to quit? */
 +(NSString *)setting_tips;

/*! 没有录像 */
/*! No recording */
 +(NSString *)preview_playback_no_video;

/*! 去预约 */
/*! Go to make a reservation */
 +(NSString *)Service_map_make_a_reservation;

/*! Q3：插入SD卡后提示“储存卡错误”。 */
/*! Q3: After inserting the SD card, it prompts \"SD card error\". */
 +(NSString *)person_feedback_question_SDcard_error;

/*! 标清 */
/*! Standard Definition */
 +(NSString *)devicesetting_sd;

/*! %1$s可免费体验%2$s云存套餐(开启云存会消耗较多流量，4G插卡枪机用户谨慎使用)，确定体验？ */
/*! %1$s can experience the %2$s cloud storage package for free (Enabling cloud storage will consume a lot of traffic, using 4G camerashould be cautious),are you sure to experience? */
 +(NSString *)cloud_package_promotion_condition;

/*! 继续添加摄像机 */
/*! Continue to add cameras */
 +(NSString *)addDevice_Continue_add_cameras;

/*! 3、套装设备请确认设备是否已连接网络 */
/*! 3、For kit device, please confirm whether the device is connected to the network. */
 +(NSString *)adddevice_confirm_suit_network_status;

/*! 继续下载(%1$s) */
/*! Continue(%1$s) */
 +(NSString *)preview_continue_download;

/*! 侦测到有人移动时，摄像机会使用灯光警示 */
/*! Light warning will be triggered when human movement is detected. */
 +(NSString *)Devicesetting_light_to_warn;

/*! 2、请前往设置确认APP“蓝牙共享”权限是否已开启 */
/*! 2、 Go to the settings to confirm whether the  \"Bluetooth Sharing\" permission of APP is enabled. */
 +(NSString *)IOS_app_bluetooth_status;

/*! 正在检测中，请稍后... */
/*! Testing now ,please wait… */
 +(NSString *)devicesetting_Device_signal_Being_tested;

/*! 已为您的设备%@成功配置网络 */
/*! The network has been successfully configured for your device %@ */
 +(NSString *)adddevice_configure_network_success_ios;

/*! 设备版本 */
/*! Device version */
 +(NSString *)device_setting_version;

/*! 最多可选择下载20个录像视频 */
/*! You can choose to download up to 20 recorded videos */
 +(NSString *)devicesetting_choose_download_recorded_videos;

/*! 雅典/东欧 */
/*! Europe/Athens */
 +(NSString *)Europe_Athens;

/*! 出入 */
/*! In and out */
 +(NSString *)deviceSetting_in_and_out;

/*! 反馈已提交，请耐心等候... */
/*! Feedback has been submitted, please be patient ... */
 +(NSString *)person_feedback_wait_replay;

/*! 请确保您的账号下所有设备已删除 */
/*! Please make sure all devices under your account have been deleted */
 +(NSString *)person_Cancellation_failed_tips;

/*! 重新搜索 */
/*! Search again */
 +(NSString *)adddevice_Search_again;

/*! 存储设置 */
/*! Storage settings */
 +(NSString *)deviceSetting_Storage_settings;

/*! 人形跟踪 */
/*! Humanoid tracking */
 +(NSString *)devicesetting_motion_detection_track;

/*! 输入的手机号格式有误，请重新输入 */
/*! Format of cellphone number is wrong,input again */
 +(NSString *)register_error_numberFormatFail;

/*! 已为您的设备%1$s成功配置网络 */
/*! The network has been successfully configured for your device %1$s */
 +(NSString *)adddevice_configure_network_success;

/*! 云存购买 */
/*! Cloud storage purchase */
 +(NSString *)help_cloud_storage_textTips_2;

/*! A.检查APP中通知是否有开启？ */
/*! A. Check if the notification is turned on in the APP? */
 +(NSString *)person_feedback_question_alarm_push_detail_a;

/*! 正在获取最新的32位兼容版 */
/*! Getting the latest 32-bit compatible version */
 +(NSString *)person_get_last_32_bit;

/*! 警报消息 */
/*! Events */
 +(NSString *)preview_Events;

/*! TF卡状态异常 */
/*! TF card status is abnormal */
 +(NSString *)person_alarm_tf_abnormal;

/*! 1、付款：确认购买并签约付款后，自动续费服务生效。 */
/*! 1. Payment: After confirming the purchase and signing the contract, the automatic renewal service takes effect. */
 +(NSString *)cloud_payment_description;

/*! ② 在WLAN列表选择IPC开头的设备热点，如“IPCXXX”XXX为设备ID(即二维码下面的数字)，8位初始密码为11111111 */
/*! ② Select the device hotspot that starts with IPC in the WLAN list. For example, \"IPCXXX\" XXX is the device ID (that is, the number below the QR code). The 8-digit initial password is 11111111. */
 +(NSString *)addevice_select_IPC_wlan;

/*! 去打开 */
/*! Go open */
 +(NSString *)preview_Go_open;

/*! 通道 */
/*! Channel */
 +(NSString *)channel;

/*! 录像完成，时间 */
/*! Recording completed, time  */
 +(NSString *)preview_record_completed;

/*! 正在配对摄像机，请耐心等待... */
/*! Pairing camera, please be patient... */
 +(NSString *)Addevice_Pairing_camera_patient;

/*! 设备指示灯是否闪烁？ */
/*! Does indicator light of the device flash? */
 +(NSString *)addDevice_help_text2;

/*! 已使用流量：%@ */
/*! Used traffic: %@ */
 +(NSString *)devicesetting_4G_card_sim_card_total_flow_Unlimited_ios;

/*! 定时关机 */
/*! Shutdown timer */
 +(NSString *)deviceSetting_Shutdown_timer;

/*! 您可以在设备机身上查看设备云ID，不同设备标签位置不一样 */
/*! You can view the device cloud ID on the device body. Different device tags are located differently. */
 +(NSString *)addevice_ID_location_device_body;

/*! IP添加 */
/*! ADD by IP address */
 +(NSString *)addDevice_IP_addition;

/*! 1.指示灯慢闪： */
/*! 1. The indicator light flashes slowly： */
 +(NSString *)Addevice_light_flashes_slowly;

/*! 了解添加方式的差异 */
/*! Understand the differences in adding methods */
 +(NSString *)adddevice_understand_difference_add_methods;

/*! 手机空间不足 */
/*! Insufficient mobile phone space */
 +(NSString *)Download_Insufficient_phone_space;

/*! 最后更新： */
/*! Last update: */
 +(NSString *)MJRefreshHeaderLastTimeText;

/*! 当前套餐 */
/*! Current package */
 +(NSString *)devicesetting_4G_card_sim_card_current_package;

/*! 充值设备： */
/*! Top-up device: */
 +(NSString *)devicesetting_4G_card_recharge_device;

/*! 最多可设置4个移动侦测区域 */
/*! Up to 4 motion detection areas can be setted  */
 +(NSString *)devicesetting_motion_area_Upper_limit;

/*! 移动侦测灵敏度 */
/*! Motion detection sensitivity */
 +(NSString *)alarmMessage_msgType_sensitivity;

/*! 选择城市 */
/*! Select the city */
 +(NSString *)Service_map_select_city;

/*! 电量过低！ */
/*! Battery is too low! */
 +(NSString *)alarm_battery_too_low;

/*! 曝光度调节 */
/*! Exposure adjustment */
 +(NSString *)deviceSetting_Exposure_adjustment;

/*! 2、如何兑换云存套餐？ */
/*! 2、 How to redeem the cloud storage package? */
 +(NSString *)cloud_storage_details_how_to_redeem;

/*! 智能补光 */
/*! Smart fill light */
 +(NSString *)deviceSetting_Smart_fill_light;

/*! Banggood */
/*! Banggood */
 +(NSString *)help_Banggood;

/*! TF卡未找到 */
/*! TF card not found */
 +(NSString *)playback_tf_card_not_found;

/*! 找不到IP/DDNS？ */
/*! Can\'t find IP/DDNS? */
 +(NSString *)addevice_unfind_IP;

/*! 云存自动上传录像开启失败，是否重新开启？ */
/*! Cloud storage automatic upload video failed to open,is it re-opened? */
 +(NSString *)cloud_tips_text_9;

/*! 自启动管理：需要将应用加入“i管家”中的［自启动管理］列表，否则重启手机后进程不会自启。 但强制手动杀进程，即使加了这个列表中，后续进程也无法自启动； */
/*! Self-booting management: The application needs to be added to the [self-booting management] list in \"i-Housekeeper\", otherwise the process will not start automatically after restarting the phone. However, it is mandatory to manually shut down the process, even if it is added to this list, subsequent processes cannot start automatically; */
 +(NSString *)person_feedback_question_ROM_software_4_Selfbooting;

/*! 视频服务 */
/*! Video service */
 +(NSString *)devicesetting_video_service;

/*! 输入数字不能为0 */
/*! Input number cannot be 0 */
 +(NSString *)devicelist_share_equipment_QR_code_prompt;

/*! 请确认您已将基站用网线连接至路由器的LAN口。 */
/*! Please confirm that you have connected the base station to the LAN port of the router with a network cable. */
 +(NSString *)Addevice_confirm_already_connect_network;

/*! 设备未响应 */
/*! Device not responding */
 +(NSString *)devicelist_firmware_update_no_respond;

/*! 看守位 */
/*! Home */
 +(NSString *)preview_Guard;

/*! 请填写您的电话号码 */
/*! Please fill in your telephone number */
 +(NSString *)person_feedback_fill_phone_number;

/*! 设备WiFi连接失败 */
/*! Device WiFi connection failed */
 +(NSString *)addDevice_hotspot_conectionFail;

/*! 点击个人中心云商城-进入“云商城”界面-选择设备进入套餐选择界面-点击“兑换码购买”-输入或扫描正确的兑换码-在套餐界面点击“立即兑换”即可完成套餐兑换 */
/*! Click the personal center cloud mall - enter the \"cloud mall\" interface - select the device to enter the package selection interface - click \"exchange code to buy\" - enter or scan the correct exchange code - click \"exchange now\" in the package interface to complete the package exchange */
 +(NSString *)cloud_exchange_process;

/*! stripe */
/*! stripe */
 +(NSString *)cloud_pay_stripe;

/*! 奥克兰 */
/*! Pacific/Auckland */
 +(NSString *)Pacific_Auckland;

/*! 开启布防 */
/*! Enable Alarm */
 +(NSString *)devicelist_open_arming;

/*! 如何关注公众号？ */
/*! How to follow the official account? */
 +(NSString *)person_set_how_to_follow;

/*! 或者可以通过对方账号进行分享 */
/*! Or you can share it through the other party\'s account */
 +(NSString *)devicelist_share_through_party_account;

/*! 暂不支持自动续费功能 */
/*! Does not support the automatic renewal function */
 +(NSString *)cloud_does_not_support_renewal;

/*! 为设备%@取个名字吧~ */
/*! Give the device %@ a name~ */
 +(NSString *)adddevice_give_device_name_ios;

/*! 固件升级需要等待一段时间，请耐心等候 */
/*! Firmware upgrade needs to wait for a while, please be patient */
 +(NSString *)devicelist_firmware_update_prompt;

/*! 请简短说说您的门铺服务，增进客户对店铺的了解。 */
/*! please simply talk about your store service，in order to enhance customer\'s understanding of your store */
 +(NSString *)service_Facilitator_profile_prompt;

/*! 温馨提示：关闭云录像功能后，云存有效期并不会延长； */
/*! Tips: After the cloud recording function is turned off, the validity period of the cloud storage will not be extended; */
 +(NSString *)cloud_storage_details_off_record_tips;

/*! 总时长： */
/*! Total length: */
 +(NSString *)device_playback_Total_video;

/*! 没有更多数据 */
/*! No more data */
 +(NSString *)Stand_alone_station_No_more_data;

/*! 网络配置成功 */
/*! Network configuration succeeded */
 +(NSString *)adddevice_network_configure_success;

/*! 选择服务 */
/*! Select service */
 +(NSString *)cloud_migaration_select_service;

/*! 输入设备名 */
/*! Input device name */
 +(NSString *)addDevice_enter_name;

/*! 2.在通电或开机状态下，长按摄像机RESET按键，直至听到设备发出语音提示。 */
/*! 2. When the camera is powered on or turned on, press and hold the RESET button of the camera until you hear a voice prompt from the device. */
 +(NSString *)Addevice_powered_turned_RESET_button_voice_prompt;

/*! 录像时间段 */
/*! Recording time period */
 +(NSString *)devicesetting_Recording_time_period;

/*! 配置成功 */
/*! Configuration done */
 +(NSString *)configuration_successful;

/*! 在手机设置中连接“%@”的WiFi后，返回APP观看视频 */
/*! After connecting to the WiFi of \"%@\" in the phone settings, return to the APP to watch the video */
 +(NSString *)adddevice_connec_device_wifi_return_watch_ios;

/*! 白天 */
/*! Daytime */
 +(NSString *)daytime;

/*! 已下载最新版本，是否安装(新版本安装需要开启应用的未知来源权限) */
/*! Already download newest version,install or not (installation need to enable permission) */
 +(NSString *)version_downloadedAndInstalled_tips;

/*! 当前提示音内容 */
/*! The current prompt tone content */
 +(NSString *)devicesetting_Current_tone_sound_content;

/*! 移动侦测区域支持大小改变和位置的移动，设置区域进行移动侦测 */
/*! The motion detection area supports size change and position movement, and set the area for motion detection. */
 +(NSString *)devicesetting_motion_area_description;

/*! 正在连接，请耐心等候... */
/*! Connecting, please be patient... */
 +(NSString *)adddevice_connecting_patient;

/*! 很抱歉，您还未添加可购买云存储的设备 */
/*! Sorry, you have not added a device which can purchase cloud storage */
 +(NSString *)cloud_no_device_can_purchase_cloud;

/*! 流量免费体验 */
/*! Free experience traffic */
 +(NSString *)cloud_free_experience_traffic;

/*! 色温 */
/*! Color temperature */
 +(NSString *)play_lamp_colorThermometry;

/*! 连接断开 */
/*! Disconnect */
 +(NSString *)connection_broken;

/*! 存储卡在录制时，会有稍许发烫的现象，但我们经过严格的测试，目前的温度是不会损坏存储卡的。 */
/*! The memory card may be slightly hot during recording, but we have passed rigorous testing and the current temperature will not damage the memory card. */
 +(NSString *)person_feedback_question_card_hot_detail;

/*! 为保障您的使用体验，请参照以下建议安放设备： */
/*! To ensure your use experience, please place the equipment according to the following suggestions: */
 +(NSString *)Addevice_place_following_suggestions;

/*! 添加蓝牙摄像机 */
/*! Add bluetooth camera */
 +(NSString *)help_addDevice_textTips_14;

/*! 5、环境要求 */
/*! 5.Environmental requirements */
 +(NSString *)adddevice_environmental_require;

/*! 侦测区域设置 */
/*! Motion detect area */
 +(NSString *)devicesetting_motion_detection_mode;

/*! 跳过%ld秒 */
/*! Skip %ld sec */
 +(NSString *)addDevice_setting_password_tips_plural_ios;

/*! 请打开设置->易视云->照片，选择读写选项 */
/*! Please check setup--EseeCloud--photo,choose read and write option */
 +(NSString *)setting_phone_selectAndWrite_options;

/*! 语音对讲：长按按钮进行对讲 */
/*! Two way talk:press the button and talk for a long time  */
 +(NSString *)help_preview_ttextTips_8;

/*! 持续侦测移动物体时持续录像 */
/*! Keep recording while continuously detecting moving objects */
 +(NSString *)devicesetting_Best_video_Description;

/*! 当电量充足时，设备一直持续录像，当电量低时，自动切换到最佳录像模式。该模式耗电较快，适合外接电源使用。 */
/*! Uninterrupted recording when the power is sufficient. When the battery is insufficient, automatically switches to the Optimal Surveillance mode.This mode consumes faster power and is suitable for connecting to a power source. */
 +(NSString *)devicesetting_Uninterrupted_record_battery_sufficient_insufficient;

/*! 温馨提示：不可迁移全天录制云服务至NVR设备 */
/*! Tips: Do not migrate all day recording cloud services to NVR devices */
 +(NSString *)cloud_help_migration_tip;

/*! 设备指示灯已闪烁 */
/*! Device light is blinking */
 +(NSString *)adddevice_device_light_blinking;

/*! 摄像机复位成功，删除失败，请手动删除后再配网添加 */
/*! The camera reset is successful, but the deletion fails. Please manually delete it before adding it */
 +(NSString *)devicesetting_reset_success_delete_fail;

/*! 云存即将过期，是否前往续费？ */
/*! Cloud storage is about to expire,go on renewal? */
 +(NSString *)cloud_tips_text_3;

/*! 切换失败,切换到了其他WiFi */
/*! Switch failed, switched to other WiFi */
 +(NSString *)adddevice_switch_other_wifi;

/*! 请选择%1$s个需要迁移云存的设备通道 */
/*! Please select %1$s devices that need to migrate the cloud */
 +(NSString *)cloud_select_device_channel;

/*! 解绑失败 */
/*! Unbind failed */
 +(NSString *)person_Unbundling_failure;

/*! 常看位置巡航 */
/*! Preset position cruise */
 +(NSString *)deviceSetting_preset_position_cruise;

/*! 最后更新日期 */
/*! Last update date */
 +(NSString *)Stand_alone_station_Last_update_date;

/*! 服务点信息更新 */
/*! Service point information update */
 +(NSString *)service_information_update;

/*! 一直录像 */
/*! Uninterrupted recording */
 +(NSString *)devicesetting_Plug_in;

/*! 邮箱地址 */
/*! Email address */
 +(NSString *)appealsCmpContactemail;

/*! 克拉斯诺亚尔斯克 */
/*! Asia/Krasnoyarsk */
 +(NSString *)Asia_Krasnoyarsk;

/*! 重置 */
/*! Reset */
 +(NSString *)cloud_purchase_reset;

/*! 云存信息 */
/*! Cloud storage information */
 +(NSString *)cloud_infoormation;

/*! 看守位置 */
/*! Home position */
 +(NSString *)devicesetting_Guard_position;

/*! 问题类型 */
/*! Question type */
 +(NSString *)person_feedback_promble_type;

/*! 侦测到移动物体时触发报警 */
/*! Trigger an alarm when a moving object is detected */
 +(NSString *)devicesetting_alarm_prompt;

/*! 下载中(%1$s) */
/*! Downloading(%1$s) */
 +(NSString *)Playback_downloading_backup;

/*! 禁用补光 */
/*! Disable fill light */
 +(NSString *)devicesetting_Disable_fill_light_1;

/*! 正在使用中的套餐数据 */
/*! Package data in use */
 +(NSString *)cloud_manage_package_data;

/*! 微信推送 */
/*! WeChat push */
 +(NSString *)person_wechat_push;

/*! 如未能分辨原因，请恢复出厂设置后重新添加网络。 */
/*! If you are unable to resolve the cause,please restore the factory settings and re-add the network. */
 +(NSString *)devicelist_offline_help_content_three;

/*! 云录像在账号下设备被删除、关闭设备上传云录像、设备断网断电等异常情况下会导致设备与服务器失联，设备网络宽带不足，设备无法正常上传录像视频。 */
/*! The cloud video is lost when the device is deleted, the device uploads the cloud video, and the device is disconnected from the network. The device and the server are disconnected. The device network bandwidth is insufficient and the device cannot upload video and video. */
 +(NSString *)cloud_storage_details_types_4;

/*! 充值订单 */
/*! Recharge order */
 +(NSString *)devicesetting_4G_card_Recharge_order;

/*! 本地直连添加设备适用于设备附近没有网络时使用，您只需用手机连上设备的WiFi即可观看设备视频与录像，缺点是您只有在设备附近才能连接设备WiFi，无法随时随地查看设备的情况。 */
/*! Local direct connection device is suitable for use when there is no network near the device. You only need to connect your mobile phone to the device\'s WiFi to watch the device\'s video and recording. The disadvantage is that you can only connect to the device\'s WiFi near the device, so you cannot view the device anytime and anywhere. */
 +(NSString *)addevice_direct_connection_description;

/*! 请用电脑访问%1$s，根据指引进行手动升级 */
/*! Please use the computer to access %1$s and manually upgrade according to the guidelines. */
 +(NSString *)devicelist_firmware_fail_copy_prompt;

/*! 常看位置：保存摄像机当前录像位置为常看位置，当摄像机发生移动时可以调用常看位置使摄像机回到保存位置。 */
/*! Preset position: Save the current recording position of the camera as the Preset position. When the camera moves, the preset position can be called to return the camera to the saved position. */
 +(NSString *)preview_Preset_position_describe;

/*! 弱 */
/*! Weak */
 +(NSString *)weak;

/*! 模式 */
/*! Mode */
 +(NSString *)mode;

/*! 720°全景 */
/*! 720° panorama */
 +(NSString *)devicesetting_Video_center_correction_panorama;

/*! 输入联系方式 */
/*! Enter contact information */
 +(NSString *)cloud_Enter_contact_information;

/*! 开启定位权限 */
/*! Turn on location permissions */
 +(NSString *)devicelist_turn_on_permission;

/*! 重启设备 */
/*! Reboot the device */
 +(NSString *)devicesetting_reboot_device;

/*! 您的云录像已过期，是否前往续费？ */
/*! Your cloud recording has expired. Do you want to renew it? */
 +(NSString *)cloud_expired_renew_pop;

/*! 服务器连接失败（%@） */
/*! Server connection failed (%@) */
 +(NSString *)Addevice_Server_connection_failed_ios;

/*! 定时关机时间段 */
/*! Timer shutdown time period */
 +(NSString *)deviceSetting_Timer_shutdown_time_period;

/*! 定时录像 */
/*! Timed recording */
 +(NSString *)devicesetting_timed_recording;

/*! “摇一摇”连接失败 */
/*! \"Shake to add\" connection fails */
 +(NSString *)meDevice_shake_failure;

/*! 请求失败 */
/*! Request failure */
 +(NSString *)request_unsuccessful;

/*! 设备扫码添加 */
/*! Scan code to add devices */
 +(NSString *)addDevice_scan_code_add_device;

/*! 云存未使用 */
/*! Cloud storage is not used */
 +(NSString *)cloud_not_used;

/*! 开始添加 */
/*! Start adding */
 +(NSString *)adddevice_suit_start_add;

/*! %1$s元/月 */
/*! %1$s yuan/month */
 +(NSString *)deviceSetting_yuan_month;

/*! 云录像已关闭，将不再上传录像至云端 */
/*! Cloud recording has been closed and will no longer upload videos to the cloud */
 +(NSString *)playback_cloud_service_no_enable;

/*! 改后需要重新提交审核，审核通过前，用户将看不到您的网点地址，是否确定修改？ */
/*! After the change, you need to resubmit for review. Before the review is passed, users will not see your branch address. Are you sure to modify? */
 +(NSString *)service_sure_to_modify;

/*! 该设备已被其他账号绑定 */
/*! The device has been bound by other accounts */
 +(NSString *)adddevice_device_tied_to_another_acount;

/*! 侦测到移动物体时录制%1$s录像 */
/*! Record %1$s video when a moving object is detected */
 +(NSString *)devicesetting_best_detected_Description;

/*! 我们承诺您信息仅用于平台的审核,不做其他用途 */
/*! We promise that your information will only be used for the review of the platform and will not be used for other purposes */
 +(NSString *)Service_map_promise;

/*! 侦测灵敏度 */
/*! Detection sensitivity */
 +(NSString *)devicesetting_human_sensitivity;

/*! 视频图像设置 */
/*! Video quality settings */
 +(NSString *)devicesetting_Video_image_settings;

/*! 发送蓝牙数据失败，数据错误 */
/*! Fail to send bluetooth data. Wrong data */
 +(NSString *)addDevice_bluetooth_data_failed;

/*! NVR */
/*! NVR */
 +(NSString *)addDevice_choose_NVR;

/*! 连接失败 */
/*! Connection failed */
 +(NSString *)myDevice_deviceStatus_authFail;

/*! 开始下载 */
/*! Begin to download */
 +(NSString *)download_start;

/*! 警戒线模式 */
/*! Cordon mode */
 +(NSString *)deviceSetting_Cordon_mode;

/*! 立即支付 */
/*! Pay immediately */
 +(NSString *)pay_now;

/*! 输入访问密码 */
/*! Enter access password */
 +(NSString *)editDevice_enter_password;

/*! 在登录界面输入错误的密码后，点击登录 */
/*! After entering the wrong password in the login interface, click Login */
 +(NSString *)help_recorder_reset_password_1;

/*! 马加丹 */
/*! Asia/Magadan */
 +(NSString *)Asia_Magadan;

/*! 需要开启本地存储访问权限才能进行版本更新 */
/*! Local storage access needs to be turned on for version updates */
 +(NSString *)person_storage_access_needs_version_updates;

/*! 添加分享设备 */
/*! Add and share device */
 +(NSString *)help_addDevice_textTips_22;

/*! 1.点击设备列表添加按钮 */
/*! 1. Click the device list add button */
 +(NSString *)person_help_bluetooth;

/*! 稍后再安装存储卡 */
/*! Install the memory card later */
 +(NSString *)addDevice_Install_memory_card_later;

/*! 流畅 */
/*! Fluency */
 +(NSString *)person_setting_selectPreviewMode_fluency;

/*! 信道 */
/*! Wi-Fi channel */
 +(NSString *)gwdeviceSetting_signal_path;

/*! 下载云存视频文件 */
/*! Download cloud video files */
 +(NSString *)Playback_Download_cloud_video_files;

/*! 设备流量已用完，请前往充值 */
/*! Device traffic is exhausted, please go to recharge */
 +(NSString *)devicesetting_4G_traffic;

/*! 已解锁 */
/*! Unlocked */
 +(NSString *)devicesetting_unlocked;

/*! 请输入设备ID号(九位) */
/*! Please enter the device ID number (nine digits) */
 +(NSString *)adddevice_device_ID;

/*! 临时关闭白光灯，如需长时间关闭请到画面设置中修改夜视模式 */
/*! Temporarily turn off the white light, if you need to turn it off for a long time, please go to the screen settings to modify the night vision mode */
 +(NSString *)preview_white_light_off_night_vision;

/*! 开启后进入设备预览回放界面时屏幕亮度自动调高 */
/*! After opening, the screen brightness will automatically increase when entering the device preview playback interface */
 +(NSString *)person_screen_brightness_switch_Description;

/*! 亚洲 */
/*! Asia */
 +(NSString *)cloud_asia;

/*! 如需查看预览，请联系分享者打开视频服务 */
/*! To view the preview, please contact the sharer to open the video service */
 +(NSString *)devicelist_view_preview;

/*! 到 */
/*! To */
 +(NSString *)devSettings_schedule_to;

/*! 日 */
/*! S */
 +(NSString *)Sunday;

/*! 录像列表 */
/*! Recording list */
 +(NSString *)video_list;

/*! 两次输入的密码不一致，请重新输入 */
/*! The password is not consistent,please input again */
 +(NSString *)password_not_agree;

/*! 分组名称已存在 */
/*! The group name already exists */
 +(NSString *)device_group_name_already_exist;

/*! 设备已被其他账号绑定，请解绑后重试 */
/*! The device has been bound by another account. Please untie and try again. */
 +(NSString *)device_bound_unbindAndRetry;

/*! 云ID不存在，导致设备添加失败，请联系技术支持了解具体原因。 */
/*! The cloud ID does not exist, causing the device to fail to be added. Please contact technical support for specific reasons. */
 +(NSString *)adddevice_Isolation_equipment;

/*! 莫斯科 */
/*! Europe/Moscow */
 +(NSString *)Europe_Moscow;

/*! 关闭摄像机 */
/*! Turn off the camera */
 +(NSString *)deviceSetting_Turn_off_camera;

/*! 已存在相同的日程 */
/*! Same schedule already exists */
 +(NSString *)devSettings_schedule_error_exist;

/*! 前往选择WiFi */
/*! Go to choose WiFi */
 +(NSString *)addDevice_setting_WIFIToPhone;

/*! 南乔治亚 */
/*! Atlantic/South Georgia */
 +(NSString *)Atlantic_South_Georgia;

/*! 问题描述 */
/*! Problem Description */
 +(NSString *)person_feedback_problem_description;

/*! 实时 */
/*! Real time */
 +(NSString *)play_realTime;

/*! 搜索地区或时区 */
/*! Search area or time zone */
 +(NSString *)deviceSetting_Search_area_time_zone;

/*! 试听 */
/*! Audition */
 +(NSString *)deviceSetting_audition;

/*! 一 */
/*! M */
 +(NSString *)Monday;

/*! 智能侦测录像：摄像机侦测到物体移动时录像 */
/*! Motion detection recording: recording when the camera detects the moving object */
 +(NSString *)playback_motion_detection_record;

/*! 2.选择需要添加的设备类型，按照提示完成添加流程。 */
/*! 2.Choose device type,follow instruction and complete adding */
 +(NSString *)help_addDevice_textTips_5;

/*! 前往设置页面，开启手机WiFi功能 */
/*! Go to the settings page and turn on WiFi for your phone. */
 +(NSString *)adddevice_go_to_set_page;

/*! 更新 */
/*! Update */
 +(NSString *)devicesetting_Update;

/*! 邮箱 */
/*! E-mail */
 +(NSString *)email;

/*! 版本过低，不支持该功能 */
/*! The version is too low,to support this  features */
 +(NSString *)deviceSetting_deviceWIFI_version;

/*! 隐私区 */
/*! Privacy area */
 +(NSString *)deviceSetting_Privacy_area;

/*! 录像时限 */
/*! Video time limit */
 +(NSString *)deviceSetting_Video_time_limit;

/*! 跳过%1$d秒 */
/*! Skip %1$d sec */
 +(NSString *)addDevice_setting_password_tips_plural;

/*! 充值流量： */
/*! Top-up mobile data: */
 +(NSString *)devicesetting_4G_card_recharge_traffic;

/*! 手机号码 */
/*! Phone number */
 +(NSString *)appealsCmpContactphone;

/*! 网络带宽: */
/*! Network bandwidth: */
 +(NSString *)devicesetting_Device_signal_Network_bandwidth;

/*! 完成 */
/*! Confirm */
 +(NSString *)completion;

/*! 添加设备提示 */
/*! Add device prompt */
 +(NSString *)adddevice_prompt;

/*! Q5：其他问题 */
/*! Q5：Other questions */
 +(NSString *)person_feedback_question_check_other_question;

/*! 您确定要删除此设备吗？ */
/*! Are you sure you want to delete this device? */
 +(NSString *)devicelist_Are_delete_this_device;

/*! 新版更新 */
/*! Update to new version */
 +(NSString *)version_notificationBar_tips;

/*! 连续包月 */
/*! Continuous monthly subscription */
 +(NSString *)cloud_Continuous_monthly_subscription;

/*! 下载期间需要停留在此界面，请耐心等候 */
/*! Need to stay in this interface during download,please wait patiently */
 +(NSString *)deviceSetting_videoBackup_loadTips;

/*! APP平台入驻协议 */
/*! APP platform settlement agreement */
 +(NSString *)Service_map_agreement;

/*! 信号等级： */
/*! Signal level: */
 +(NSString *)devicesetting_Device_signal_level;

/*! 正在获取最新版本消息… */
/*! Getting info of newest version */
 +(NSString *)me_version_getting;

/*! 正在截取当前位置 */
/*! Intercepting current location */
 +(NSString *)preset_current_location;

/*! 检测中... */
/*! Checking... */
 +(NSString *)devicesetting_Device_signal_checking;

/*! 上传成功 */
/*! Upload successfully */
 +(NSString *)person_set_Upload_crash_success;

/*! 网络中断，连接中... */
/*! Network interruption, connection... */
 +(NSString *)preview_no_video_network_interruption;

/*! 推送报警消息 */
/*! Push alarm message */
 +(NSString *)deviceSetting_Push_alarm_message;

/*! 卡存储 */
/*! LocalStorage */
 +(NSString *)playback_Card_storage;

/*! 切换码流：切换预览画面显示码流质量高清、标清 */
/*! Swith code stream:switch HD and SD */
 +(NSString *)help_preview_ttextTips_13;

/*! 开始播放时间 */
/*! Start playback time */
 +(NSString *)playback_start_time;

/*! 您可在设备编辑中修改设备密码 */
/*! You can change your device password in device editing. */
 +(NSString *)preview_help_4_detail;

/*! 录像播放完毕 */
/*! The video has finished playing */
 +(NSString *)cloud_video_play_over;

/*! 设备在线并且有报警事件发生时，但手机却收不到消息？ */
/*! Device is online and there happen alarm ,but cellphone gets no message? */
 +(NSString *)help_normal_problem_text_4;

/*! 1.我们对您的个人信息的收集/保存/使用/对外提供/保护等规则条款，以及您的用户权利等条款； */
/*! 1. We collect/save/use/provide/protect your personal information and other rules, as well as your user rights; */
 +(NSString *)login_explain_1;

/*! 时间周期 */
/*! Time period */
 +(NSString *)devicesetting_Time_period;

/*! 2.如果您是校园／企业用户，且学校／公司给每个学生／员工分配的是静态IP上网，能通过手动输入静态IP信息才能上网。
 */
/*! 2. If you are a campus / enterprise user and the school / company assigns each student / employee a static IP to access the Internet, you can manually enter the static IP information to access the Internet.
 */
 +(NSString *)person_feedback_question_check_other_question_2;

/*! 仅在检测到画面变化时录像，节省存储空间 */
/*! Only record when the screen changes are detected, saving storage space */
 +(NSString *)devicesetting_record_when_screen_changes_saving_storage_space;

/*! 连接超时 */
/*! Connection timed out */
 +(NSString *)adddevice_connect_time_out;

/*! 版本更新成功 */
/*! Update succeed */
 +(NSString *)me_version_updateSuccess;

/*! 智能添加 */
/*! Smart add */
 +(NSString *)adddevice_smartlink;

/*! 电池机低电量无法升级 */
/*! Battery low battery cannot be upgraded */
 +(NSString *)devicesetting_firmware_upgrade_battery_low;

/*! 录像休眠时长 */
/*! Video sleep duration */
 +(NSString *)deviceSetting_Video_sleep_duration;

/*! 网络不给力哦 */
/*! The network is not strong. */
 +(NSString *)preview_no_video_network_is_weakness;

/*! 地址 */
/*! Addresss */
 +(NSString *)Service_map_Addresss;

/*! 立即完善 */
/*! Improve it immediately */
 +(NSString *)service_Improve_it_immediately;

/*! 开启移动录像 */
/*! Start motion recording */
 +(NSString *)open_motion_record;

/*! 婴儿手环脱落 */
/*! The baby\'s bracelet came off */
 +(NSString *)alarm_baby_bracelet_fall;

/*! 抱歉，该设备已分享给%@个用户，请逐个删除分享用户 */
/*! Sorry, this device has been shared with %@ users, please delete shared users one by one */
 +(NSString *)person_linkvisual_share_prompt_ios;

/*! 1、云录像类型与异常情况 */
/*! 1、cloud video types and abnormal conditions */
 +(NSString *)cloud_storage_details_types;

/*! 当前已配网%ld台设备 */
/*! Currently equipped with %ld devices */
 +(NSString *)smartlink_device_number_prompt_ios;

/*! 锁卡 */
/*! Lock card */
 +(NSString *)devicesetting_locking;

/*! 最佳录像 */
/*! Optimal Surveillance */
 +(NSString *)devicesetting_Best_video;

/*! 密码错误，您还可以输入%@次 */
/*! The password is wrong, you can also enter %@ times */
 +(NSString *)login_wrong_password_enter_ios;

/*! 为确保安全分享，建议您前往电脑NVR系统配置中设置设备密码后再分享 */
/*! To ensure safety of this sharing, we recommend that you open the NVR computer system, click the configuration and set  the  device password before sharing  */
 +(NSString *)share_device_NVR_set_password;

/*! 3.设备所在区域没信号。 */
/*! 3.There is no signal in the area where the device is located. */
 +(NSString *)devicesetting_4G_card_sim_card_no_signal;

/*! 次/分 */
/*! Times/min */
 +(NSString *)alarm_heart_rate_times_min;

/*! 密码输入错误，是否重新输入？ */
/*! The password is entered incorrectly. please re-enter it? */
 +(NSString *)adddevice_re_enter_password;

/*! 蓝牙摄像机 */
/*! Bluetooth camera */
 +(NSString *)addDevice_bluetooth_products;

/*! ② 在WiFi列表选择IPC开头的设备热点，如“IPCXXX”XXX为设备ID(即二维码下面的数字)，8位初始密码为11111111 */
/*! ② Select the device hotspot that starts with IPC in the WiFi list. For example, \"IPCXXX\" XXX is the device ID (that is, the number below the QR code). The 8-digit initial password is 11111111. */
 +(NSString *)addevice_select_IPC_WiFi;

/*! %@已被其他提示音选择 */
/*! %@ Selected by another prompt tone */
 +(NSString *)devicesetting_selected_by_another_tone_IOS;

/*! 请选择您要反馈的类型 */
/*! Please select the type of feedback you want */
 +(NSString *)person_feedback_select_type;

/*! 7*24小时智能侦测存储 */
/*! 7*24 hours motion detection and storage */
 +(NSString *)cloud_storage_introduce_motion_detection;

/*! Google登录 */
/*! Google */
 +(NSString *)login_google;

/*! 清晰度 */
/*! Image quality */
 +(NSString *)clarity;

/*! 2、距离太远，信号不稳定 */
/*! 2、 The distance is too far, the signal is unstable */
 +(NSString *)adddevice_signal_unstable;

/*! 请接通电源，等待设备指示灯 */
/*! Please turn on the power and wait for the device indicator */
 +(NSString *)adddevice_configure_indicator_blink;

/*! 修正广角镜头的边有畸变，开启后会裁切部分画面 */
/*! Correct the distortion on the side of the wide-angle lens. Part of the screen will be cropped when turned on */
 +(NSString *)deviceSetting_Distortion_correction_Distortion_correction;

/*! 夜视关闭 */
/*! Night vision off */
 +(NSString *)preview_night_vision_off;

/*! *若不能正确找到重置键，请参考说明书。 */
/*! *If can\'t find reset button,please refer to the manual. */
 +(NSString *)addDevice_help_text13;

/*! 正在切换成离家模式... */
/*! Switching to away mode... */
 +(NSString *)devicelist_switch_outhome;

/*! 自动发现附近新设备 */
/*! Find nearnew devices automatically */
 +(NSString *)me_setting_discover_device;

/*! 选择预览通道 */
/*! Select preview channel */
 +(NSString *)preview_switch_channel;

/*! 添加基站 */
/*! Add base station */
 +(NSString *)addDevice_base_station;

/*! 客服回复： */
/*! Customer service reply */
 +(NSString *)service_Customer_service_reply;

/*! 输入的邮箱格式有误，请重新输入 */
/*! Format of email address is wrong,input again */
 +(NSString *)register_error_emailFormatFail;

/*! 微信安全支付 */
/*! WeChat secure payment */
 +(NSString *)cloud_client_wechat_secure_payment;

/*! 请输入邮箱验证码，验证通过后解绑邮箱 */
/*! Please input the email verification code and unbind the email after the verification is passed */
 +(NSString *)Unbind_enter_email_verification;

/*! 登录失败 */
/*! Failed to log in */
 +(NSString *)login_failed;

/*! 한국어 */
/*! 한국어 */
 +(NSString *)Korean;

/*! 暂无推送消息 */
/*! No push message */
 +(NSString *)person_no_push_message;

/*! 手动输入 */
/*! Input manually */
 +(NSString *)addDevice_enter_manually;

/*! 添加设备开启智能生活 */
/*! Add a device to start a smart life */
 +(NSString *)devicelist_add_device_open_smart_life;

/*! 现在下载 */
/*! Download now */
 +(NSString *)me_version_download_now;

/*! 下载完成 */
/*! Download done */
 +(NSString *)download_complete;

/*! 请用电脑访问%@，根据指引进行手动升级 */
/*! Please use the computer to access %@ and follow the instructions for manual upgrade. */
 +(NSString *)devicelist_firmware_fail_copy_prompt_ios;

/*! 硬盘空间不足 */
/*! Not enough HDD space */
 +(NSString *)devSetting_hardDisk_insufficient;

/*! 标清模式切换成功 */
/*! SD mode is successfully switched */
 +(NSString *)preview_sd_mode_switch_success;

/*! SIM卡在线状态 */
/*! SIM card online status */
 +(NSString *)devicesetting_4G_card_sim_card_on_off_status;

/*! 设备扫描二维码 */
/*! Device scan QR code */
 +(NSString *)addDevice_device_scan_code;

/*! 置顶设备 */
/*! Move device to the top  */
 +(NSString *)devicelist_topping_device;

/*! 常见问题解答 */
/*! FAQ */
 +(NSString *)help_normal_problem;

/*! 二维码已过期，请点击刷新 */
/*! The QR code has expired, please click refresh */
 +(NSString *)addevice_QR_code_expired;

/*! 欧美非 */
/*! Europe, The US and Africa */
 +(NSString *)cloud_europe_us_africa;

/*! 其他摄像机 */
/*! Other camera */
 +(NSString *)adddevice_other_camera;

/*! 可根据编号设置画面色温（夜视模式下无效） */
/*! The color temperature of the screen can be set according to the number (invalid in night vision mode) */
 +(NSString *)deviceSetting_color_temperature_according_number_invalid_night;

/*! 设备一直持续录像，当电量降至%@以下时自动切换为最佳录像，当电量提升至%@以上时恢复一直录像，该模式耗电较快，适合外接电源使用。 */
/*! Record videos continuously. When battery level below %@, automatically switches to optimal surveillance mode. When battery level above %@, resumes to uninterrupted recording mode. This mode consumes power fast and is suggested only when your camera works with plug-in power */
 +(NSString *)devicesetting_Adaptive_mode_more_Description_new_firmware_ios;

/*! 斐济 */
/*! Pacific/Fiji */
 +(NSString *)Pacific_Fiji;

/*! 提示音 */
/*! Prompt */
 +(NSString *)prompt_sounds;

/*! 强 */
/*! Strong */
 +(NSString *)strong;

/*! TF卡不存在 */
/*! TF card does not exist */
 +(NSString *)person_alarm_not_exist;

/*! 让夜晚或室内光线差时，始终开启LED补光灯 */
/*! When the night or indoor light is poor, always turn on the LED fill light */
 +(NSString *)deviceSetting_night_indoor_light_poor_LED_fill_light;

/*! 找不到云ID？ */
/*! Can\'t find the cloud ID? */
 +(NSString *)addevice_unfind_ID;

/*! 永远有效 */
/*! Always effective */
 +(NSString *)devicelist_share_equipment_Always_effective;

/*! 新增/设置常看位置：摄像机会记录当前位置； */
/*! Add/set preset position: the camera will record the current position; */
 +(NSString *)preview_preset_help_3;

/*! 方法2：进入个人中心“云商城”界面，选择“云存服务”①，进入云存服务信息界面，点击②设备通道条目，进入设备云存服务界面，点击“播放”按钮③即可查看录像。 */
/*! Method 2: Enter the \"Cloud Mall\" interface  on the personal center,select \"Cloud Storage Service \"①,enter the cloud storage service information interface,click ② device channel entry and enter the device cloud storage service interface,click \"Play\" button ③ to view the video.   */
 +(NSString *)help_cloud_storage_textTips_9;

/*! 魅族［Flyme] */
/*! Meizu [Flyme] */
 +(NSString *)person_feedback_question_ROM_software_flyme;

/*! 保存至本地成功 */
/*! Save to local succeed */
 +(NSString *)person_save_success;

/*! %@天存储/移动侦测录像 */
/*! %@ days storage/motion detection recording */
 +(NSString *)deviceSetting_days_storage_motion_detection_ios;

/*! 录像机重置密码 */
/*! Recorder reset password */
 +(NSString *)help_recorder_reset_password;

/*! 夜视模式 */
/*! Night vision mode */
 +(NSString *)preview_Night_vision_mode;

/*! 文档搜索 */
/*! Document search */
 +(NSString *)Stand_alone_station_Document_search;

/*! 正在加载更多的数据... */
/*! Loading... */
 +(NSString *)MJRefreshBackFooterRefreshingText;

/*! 其他云存套餐 */
/*! Other cloud storage packages */
 +(NSString *)cloud_other_package;

/*! 系统消息 */
/*! System message */
 +(NSString *)person_system_message;

/*! 设备“%@”暂不支持第三方4G卡，无法正常使用设备功能，请尽快切换回设备自带4G卡 */
/*! The device \"%@\" does not support third-party 4G cards temporarily, and the device functions cannot be used normally. Please switch back to the device\'s own 4G card as soon as possible */
 +(NSString *)devicelist_third_party_4G_cards_prompt_ios;

/*! 上下方向翻转 */
/*! Flip up and down */
 +(NSString *)devicesetting_reversal_up_down;

/*! 确定密码 */
/*! Confirm password */
 +(NSString *)userInfo_password_determine;

/*! 开启布防后，将打开设备报警录像功能 */
/*! When the arming is turned on, the device alarm recording function will be turned on. */
 +(NSString *)devicelist_defense_open_prompt;

/*! 当侦测到人形时，自动转头跟随拍摄 */
/*! When a human figure is detected, automatically turn your head to follow the shot */
 +(NSString *)devicesetting_human_figure_prompt;

/*! 侦测到移动物体时录制一小段录像 */
/*! Record a short video when a moving object is detected */
 +(NSString *)deviceSetting_Best_power_saving_describe;

/*! 扫描结果 */
/*! Scan result */
 +(NSString *)scan_results;

/*! %@ - %@启动智能侦测 */
/*! %@ - %@ enable motion detection */
 +(NSString *)devicesetting_Detect_only_during_day_time_ios;

/*! 设备一直持续录像，当电量降至%@以下时自动切换为最佳录像，当电量提升至%@以上时恢复一直录像 */
/*! Record videos continuously. When battery level below %1$s, automatically switches to optimal surveillance mode. When battery level above %2$s, resumes to uninterrupted recording mode */
 +(NSString *)devicesetting_Adaptive_mode_Description_new_firmware_ios;

/*! 遥控器 */
/*! Controller */
 +(NSString *)remote_control;

/*! 网络异常 */
/*! Network anomalies */
 +(NSString *)network_anomalies;

/*! 自定义侦测时段 */
/*! Custom detection period */
 +(NSString *)devicesetting_Custom_detection_period;

/*! 设备连接超时，您可以点击重试按钮重新连接设备 */
/*! When device connection timeout, you can click Retry to reconnect the device */
 +(NSString *)adddevice_connect_fail_reason_1;

/*! 24小时不间断录制视频 */
/*! 24 hours of uninterrupted video recording */
 +(NSString *)cloud_24_hour_uninterrupted;

/*! 请等待播放后再执行此操作 */
/*! Please wait for the play before doing this */
 +(NSString *)preview_wait_tips;

/*! 获取商品列表失败，请重试 */
/*! Fails to get commodity list,please try again */
 +(NSString *)cloud_renewal_forFailure;

/*! 摄像机添加失败原因与解决方法 */
/*! Camera add failure reasons and solutions */
 +(NSString *)person_feedback_question_2;

/*! 启动摄像机 */
/*! Start the camera */
 +(NSString *)deviceSetting_Start_camera;

/*! 通道4 */
/*! Channel 4 */
 +(NSString *)channel_four;

/*! 删除警戒线 */
/*! Delete cordon */
 +(NSString *)deviceSetting_Delete_cordon;

/*! 个设备通道 */
/*! device channels */
 +(NSString *)cloud_purchase_select_several_device_channel;

/*! 固件版本 */
/*! Software version */
 +(NSString *)devSetting_firmware_version;

/*! 正在发起对讲 */
/*! Initiating an intercom */
 +(NSString *)preview_intercom_initiat;

/*! 檀香山 */
/*! Pacific/Honolulu */
 +(NSString *)Pacific_Honolulu;

/*! 充值 */
/*! Recharge */
 +(NSString *)devicelist_recharge;

/*! 切换网络均为2.4GHz，适合配置 */
/*! Switching network is 2.4GHz, suitable for configuration */
 +(NSString *)adddevice_switch_4G_wifi;

/*! 扫码没反应？ */
/*! No response when scanning the code? */
 +(NSString *)addDevice_no_sound;

/*! 通道%1$d 云存有效期 */
/*! Channel %1$d  cloud validity period */
 +(NSString *)Cloud_storage_service_valid_period_ios;

/*! 重新配对 */
/*! Re-pairing */
 +(NSString *)Addevice_repairing;

/*! 升级成功 */
/*! Upgrade successed */
 +(NSString *)devicelist_firmware_update_success;

/*! 暂无配对成功的摄像机 */
/*! There is no camera successfully paired */
 +(NSString *)Addevice_no_camera_paried;

/*! 1.异常动态发生前，存储卡已经损坏，导致TF卡录像无法进行； */
/*! 1. Before the abnormal dynamic occurs, the memory card has been damaged, which makes the TF card recording impossible; */
 +(NSString *)person_feedback_question_video_incomplete_1;

/*! 无线频道须符合法律法规 */
/*! The wireless channel should meets local laws */
 +(NSString *)gwdeviceSetting_signal_path_tip;

/*! 北京 */
/*! Beijing */
 +(NSString *)service_map_beijing;

/*! 微信登录已过期，请重新登录 */
/*! Wechat login has expired, please log in again */
 +(NSString *)login_wechat_license_expired;

/*! 营业时间未选择 */
/*! The business time not selected */
 +(NSString *)service_not_store_time;

/*! 向你分享摄像机设备，是否添加至设备列表？ */
/*! Share the camera device with you, do you want to add it to the device list? */
 +(NSString *)devicelist_share_camera_add_device_list;

/*! 用户数据 */
/*! User data */
 +(NSString *)user_date;

/*! 注意：格式化TF卡会清空所有录像 */
/*! Note：formatting TF card will erase all history videos. */
 +(NSString *)tfCard_format_alert;

/*! 联系方式 */
/*! Contact information */
 +(NSString *)appealsContact;

/*! 最多输入“%1$s”个字符 */
/*! Enter up to \"%1$s\" characters */
 +(NSString *)service_enter_up_characters;

/*! 请联系机主删除解绑或分享添加 */
/*! Please contact the owner to delete unbundling or share added */
 +(NSString *)adddevice_contact_owner;

/*! 修改 */
/*! Revise */
 +(NSString *)userInfo_change;

/*! 关机中 */
/*! In shutdown */
 +(NSString *)devicelist_In_shutdown;

/*! 密码包含不支持的字符 */
/*! Password contains unsupported characters */
 +(NSString *)login_password_contains_unsupportrd_character;

/*! 刷新成功 */
/*! Refresh successfully */
 +(NSString *)cloud_refresh_success;

/*! 设置单次报警白光灯闪烁时长 */
/*! Set the duration of single alarm white light flashing */
 +(NSString *)devicesetting_set_flash_time;

/*! Q4：带云台的摄像机是如何巡航的？ */
/*! Q4: How does the camera with a gimbal cruise? */
 +(NSString *)person_feedback_question_gimbal_cruise;

/*! 选择设备与通道 */
/*! Select device and channel */
 +(NSString *)cloud_purchase_select_device_channel;

/*! 注销账号后，数据将无法恢复 */
/*! After deleted account, data will not be restored. */
 +(NSString *)person_Account_cannot_restored;

/*! 选择夜视补光灯模式 */
/*! Select night vision fill light mode */
 +(NSString *)devicesetting_Select_night_vision;

/*! 该手机号不存在，请重新输入 */
/*! This cellphone number doesn\'t exsist,please input again */
 +(NSString *)reset_numberExist;

/*! 天猫精灵互动 */
/*! Tmall Elf Interaction */
 +(NSString *)devicelist_Tmall_Elf;

/*! 只展示最近一个月的登录记录 */
/*! Only show login records for the last month */
 +(NSString *)person_login_log_one_month;

/*! 这种情况比较少见，出现时，根据提示点击修复即可。 */
/*! This situation is rare, and when it appears, click Repair as prompted. */
 +(NSString *)person_feedback_question_type_memory_card_repair_detail;

/*! 2.指示灯快闪： */
/*! 2. The indicator light flashes quickly: */
 +(NSString *)Addevice_light_flashes_quickly;

/*! 请勿频繁操作 */
/*! Do not operate frequently */
 +(NSString *)devicesetting_not_operate_frequently;

/*! 云存有效期 */
/*! Cloud retention period */
 +(NSString *)cloud_help_retention_period;

/*! 开始对码 */
/*! Start to match code */
 +(NSString *)devicelist_Start_match_code;

/*! 正在对码 */
/*! Matching code */
 +(NSString *)devicelist_Matching_code;

/*! 左右方向翻转 */
/*! Flip left and right */
 +(NSString *)devicesetting_reversal_left_right;

/*! 通话中，暂不可操作 */
/*! During a call, temporarily unavailable */
 +(NSString *)Preview_During_call_temporarily_unavailable;

/*! 正在搜索WiFi */
/*! Searching WiFi */
 +(NSString *)adddevice_search_wifi;

/*! 配置WiFi中... */
/*! Configuring WiFi... */
 +(NSString *)deviceSetting_Configuring_WiFi;

/*! 云台设置 */
/*! Gimbal settings */
 +(NSString *)devicesetting_Gimbal_settings;

/*! 设备初始密码为：11111111 */
/*! Initial password is 11111111 */
 +(NSString *)addDevice_initial_password;

/*! 关于本机 */
/*! About this device */
 +(NSString *)deviceSetting_About_this_machine;

/*! 摇一摇 */
/*! Shake and shake */
 +(NSString *)meDevice_shake;

/*! PIR红外有效区 */
/*! PIR infrared effective area */
 +(NSString *)addDevice_PIR_infrared_effective_area;

/*! 扫描分享设备 */
/*! Scan sharing device */
 +(NSString *)addDevice_have_the_device;

/*! 微信号已被绑定 */
/*! This wechat ID is bound */
 +(NSString *)password_bindingFailed_wechat;

/*! 第二步：开启手机WiFi */
/*! Step 2: Turn on your phone WiFi */
 +(NSString *)adddevice_turn_on_wifi;

/*! 检查到有新的固件版本,是否需要更新? */
/*! Check there have new firmware,update? */
 +(NSString *)devSetting_deviceUpdate_tips_1;

/*! 成为服务商可以获得什么? */
/*! What can I get as a service provider? */
 +(NSString *)Service_map_get_what_provider;

/*! 请为设备自带WiFi设置密码，添加成功后您需连接设备WiFi才能正常观看视频。 */
/*! Please set the password for the device\'s own WiFi. After successful addition, you need to connect to the device\'s WiFi to watch the video normally. */
 +(NSString *)addevice_set_wifi_password_description;

/*! Q10：哪些情况可能会导致TF卡或云录像不完整？ */
/*! Q10: Under what circumstances may the TF card or cloud recording be incomplete? */
 +(NSString *)person_feedback_question_video_incomplete;

/*! 通道数 */
/*! Channel number */
 +(NSString *)addDevice_choose_channel;

/*! 设备不存在 */
/*! Device does not exist */
 +(NSString *)cloud_device_delete;

/*! 库存 */
/*! Inventory */
 +(NSString *)Stock;

/*! 移到顶部 */
/*! Top */
 +(NSString *)Top;

/*! 授权 */
/*! Authorization */
 +(NSString *)devicelist_Authorization;

/*! 清空摄像机所有报警消息记录 */
/*! Clear all alarm message records of the camera */
 +(NSString *)devicesetting_delete_reset_camera_clear_alarm_message;

/*! 默认提示音 */
/*! Default prompt tone */
 +(NSString *)devicesetting_default_tone;

/*! 下载 IP Pro */
/*! Download IP Pro */
 +(NSString *)download_IP_Pro;

/*! 设备ID */
/*! Device ID */
 +(NSString *)device_id;

/*! (2)迁移云服务过程： */
/*! (2) Migration cloud service process: */
 +(NSString *)cloud_help_migration_service_2;

/*! 已选择设备 */
/*! Device selected */
 +(NSString *)cloud_device_selected;

/*! 2.输入设备ID等内容，完成添加。 */
/*! 2.Input ID to complete adding. */
 +(NSString *)help_addDevice_textTips_19;

/*! 立即清理 */
/*! Clean up immediately */
 +(NSString *)person_set_clean_cache_immediately;

/*! 报警闪烁时长 */
/*! Alarm flashing time */
 +(NSString *)devicesetting_alarm_flash_time;

/*! 提供服务支持 */
/*! Provide service support */
 +(NSString *)Stand_alone_station_Provide_service_support;

/*! 逆光环境下 */
/*! Backlight environment */
 +(NSString *)adddevice_backlight_environment;

/*! 云存自购买之日起生效，即云存的有效期为：“购买当天当时”至“一个月后/一年后的同一时间点”。例如：2019年4月1日0时0分购买了7天/月的云存套餐，那么云存的有效期为一个自然月。为：2019年4月1日0时0分至2019年5月1日0时0分。 */
/*! Cloud deposits take effect from the date of purchase, that is, the validity period of cloud deposits is: \"at the time of purchase\" to \"the same time point after one month / one year later\". For example, the cloud deposit package of 7 days/month was purchased at 0:00 on April 1, 2019, and the validity period of the cloud deposit is a natural month. It is: 0:00 on April 1, 2019, and 0:00 on May 1, 2019. */
 +(NSString *)cloud_storage_details_cloud_period_guide;

/*! 基础设置 */
/*! General settings */
 +(NSString *)devicesetting_basic_settings;

/*! 通话模式 */
/*! Call mode */
 +(NSString *)devicesetting_Call_mode;

/*! 您还未设置录像日程，退出设置将会关闭定时录像功能 */
/*! You have not set a recording schedule， Exiting the settings will turn off the scheduled recording function */
 +(NSString *)Devicesetting_not_set_recorg_turn_off_scheduled_record;

/*! 设置完成后，可将摄像机快速转动到常看位置 */
/*! After the setup is complete, the camera can be quickly panned to the preset position */
 +(NSString *)preview_frequently_viewed_Description;

/*! 录像备份 */
/*! Backup */
 +(NSString *)deviceSetting_videoBackup;

/*! 再次点击确认,确保手机地区编号正确 */
/*! Click OK again to make sure the phone area number is correct. */
 +(NSString *)log_make_sure_phone_number;

/*! 到期时间： */
/*! Expire date: */
 +(NSString *)devicesetting_4G_card_sim_card_expire_date;

/*! 澳大利亚 */
/*! Australia */
 +(NSString *)Australia;

/*! 分享失败 */
/*! Share unsuccessfully */
 +(NSString *)person_alarm_share_fail;

/*! 请检查网络状态 */
/*! Please check the network status */
 +(NSString *)preview_check_network_status;

/*! 订单编号 */
/*! Order number */
 +(NSString *)order_reference;

/*! 基站设置 */
/*! Base station settings */
 +(NSString *)deviceSetting_Base_station_settings;

/*! 电池摄像机 */
/*! Battery camera */
 +(NSString *)addDevice_battery_camera;

/*! 进入WiFi连接界面，将手机连接与设备同一WiFi */
/*! Enter the WiFi connection interface, connect the phone to the same WiFi device */
 +(NSString *)addDevice_connect_the_same_WIFI;

/*! 不能含有中文 */
/*! Can\'t contain Chinese */
 +(NSString *)cannot_contain_chinese;

/*! 云存详情 */
/*! Cloud storage details */
 +(NSString *)cloud_details;

/*! 年 */
/*! year */
 +(NSString *)deviceSetting_videoBackup_startTimeYY;

/*! 云商城 */
/*! Cloud mall */
 +(NSString *)me_cloudStore;

/*! 安防经验年限 */
/*! Years of security experience */
 +(NSString *)Service_map_security_experience;

/*! 布鲁塞尔/中欧 */
/*! Europe/Brussels */
 +(NSString *)Europe_Brussels;

/*! 哥斯达黎加/美国中部 */
/*! America/Costa Rica */
 +(NSString *)America_Costa_Rica;

/*! 选择设备提示音语言 */
/*! Select device voice assistant language */
 +(NSString *)select_the_language_content;

/*! 区域%1$d */
/*! Area %1$d */
 +(NSString *)devicesetting_area_number;

/*! 推送消息 */
/*! Push messages */
 +(NSString *)deviceSetting_Push_messages;

/*! 确认添加 */
/*! Confirm add */
 +(NSString *)adddevice_confirm_add;

/*! 暂未购买云存储 */
/*! No cloud storage purchased */
 +(NSString *)cloud_no_cloud_purchased;

/*! 好友给你分享了“%1$s”，赶紧打开%2$s扫一扫吧！ */
/*! Friends shared \"%1$s\" for you, and quickly opened %2$s scan it! */
 +(NSString *)share_device_friend_device;

/*! 亚述尔群岛 */
/*! Atlantic/Azores */
 +(NSString *)Atlantic_Azores;

/*! 全屏：点击按钮切换横屏显示 */
/*! Full screen:tap button and switch to landscape viewing */
 +(NSString *)help_preview_ttextTips_5;

/*! 视频服务已关闭 */
/*! Video service is off */
 +(NSString *)preview_no_video_service_off;

/*! 挂断 */
/*! Hang up */
 +(NSString *)preview_speak_hang_up;

/*! 设置中心 */
/*! Settings Center */
 +(NSString *)Lead_page_3;

/*! 请按以下步骤开启摄像机： */
/*! Please turn on the camera as follows: */
 +(NSString *)Addevice_turn_on_camera_as_follows;

/*! 设置密码 */
/*! Set password */
 +(NSString *)setting_password;

/*! 已使用容量 */
/*! Used capacity */
 +(NSString *)Devicesetting_Used_capacity;

/*! 未使用 */
/*! Unused */
 +(NSString *)devicesetting_4G_card_package_unused;

/*! 广告开关 */
/*! AD switch */
 +(NSString *)person_Launch_page_ads;

/*! 等待录像生成中，请稍后重试 */
/*! Waiting for recording, please try again later */
 +(NSString *)preview_wait_generate_video;

/*! C.是否已开启APP的相关系统权限， 如自启动权限、悬浮窗权限、锁屏显示权限、后台弹出界面权限。 */
/*! C. Whether the relevant system permissions of the APP have been opened, such as self-starting permissions, floating window permissions, lock screen display permissions, and background pop-up interface permissions. */
 +(NSString *)person_feedback_question_alarm_push_detail_c;

/*! Q2：用于第三方ROM的管理软件需要用户手动操作 */
/*! Q2: The management software from third-party ROM requires manual operation by the user */
 +(NSString *)person_feedback_question_ROM_software;

/*! 设备处于离线状态，无法设置上传录像状态 */
/*! Device is offline,can\'t upload video */
 +(NSString *)cloud_unable_upload_videos_offline;

/*! 录像中 */
/*! In the video */
 +(NSString *)preview_in_the_video;

/*! 网络信息 */
/*! Internet Information */
 +(NSString *)deviceSetting_Internet_Information;

/*! *密码9-20位，需包含字母、数字、字符 */
/*! *Password is 9-20 digits, which must contain letters, numbers, and characters */
 +(NSString *)devicelist_Password_contain_letter_number_character;

/*! 人体红外感应 */
/*! PIR */
 +(NSString *)alarmMessage_msgType_bi;

/*! 搜索地点 */
/*! Search place */
 +(NSString *)Service_map_Search_place;

/*! 贝尔格莱德/中欧 */
/*! Europe/Belgrade */
 +(NSString *)Europe_Belgrade;

/*! 8.确认设备是否存在网线接口，若存在网线接口，选择①是进入有线添加流程； */
/*! 8. Check whether if  the network cable interface is existed . If there have a network cable interface,select ② \"YES\"  to enter the wired add process. */
 +(NSString *)help_addDevice_textTips_27;

/*! 警报器 */
/*! Siren */
 +(NSString *)preview_Siren;

/*! 最佳省电设置 */
/*! Optimal power saving settings */
 +(NSString *)deviceSetting_Optimal_power_saving_settings;

/*! 1、云存有效期 */
/*! 1、 Cloud deposit validity period */
 +(NSString *)cloud_storage_details_cloud_period;

/*! 下一步 */
/*! Next */
 +(NSString *)next;

/*! 检测到设备通道%1$s布防已关闭，请前往设备设置开启布防 */
/*! Detected that device channel%1$s alarm is disabled, please go to device settings to enable it */
 +(NSString *)devicelist_cloud_channel_detecte_prompt;

/*! 24h安全守护 */
/*! 24h safe guard */
 +(NSString *)cloud_24h_safe_guard;

/*! 雅库茨克 */
/*! Asia/Yakutsk */
 +(NSString *)Asia_Yakutsk;

/*! 页面出错啦 */
/*! The page is wrong */
 +(NSString *)cloud_error_tips_1;

/*! 类型：TF卡（micro--SD卡） */
/*! Type: TF card (micro--SD card) */
 +(NSString *)person_feedback_question_type_memory_card_detail_Type;

/*! 系统限制了连接设备通道的用户数量，可能是设备的通道连接数已满 */
/*! The system limits the number of users connected to the device channel, possibly because the device\'s channel connection is full. */
 +(NSString *)preview_no_video_channel_open_fail_detail;

/*! 类型二、普通NVR与mini NVR设备 */
/*! Type 2, normal NVR and mini NVR devices */
 +(NSString *)adddevice_suit_type_2;

/*! 快捷模式 */
/*! Number mode */
 +(NSString *)preview_preset_shortcut_mode;

/*! 当前手机连接WiFi为： */
/*! The current mobile phone WiFi is: */
 +(NSString *)adddeevice_WIFI_promp;

/*! 1.需App在运行/后台,并且允许App消息通知,才能接收到报警推送； */
/*! 1. Only when the App is running / backstage, and the App message notification is allowed, then the alarm push can be received; */
 +(NSString *)person_feedback_question_no_alarm_push_1;

/*! 设备一直处于唤醒状态，同时一直进行录像（会导致电池电量消耗过快）。 */
/*! The device is always awake and recording is being performed at the same time (which will cause the battery to be consumed too quickly). */
 +(NSString *)devicesetting_working_mode_Description_1;

/*! 仅当画面中有人出现时通知我 */
/*! Notify me only when human appears on the screen */
 +(NSString *)deviceSetting_Notify_someone_appears_me;

/*! Q1：摄像机中的常看位置有什么作用？ */
/*! Q1: What does the preset position in the camera do? */
 +(NSString *)person_feedback_question_preset;

/*! 点击警戒线左上角的删除ICON，可以删除警戒线 */
/*! You can delete the cordon by clicking Delete ICON in the upper left corner of the warning line. */
 +(NSString *)devicesetting_delete_warn_line_detail;

/*! (1)只要购买了云存服务就可以获得相应的云空间，比如您购买了云存月套餐，云空间有效期为一个月，自购买成功起生效。 */
/*! (1) As long as you purchase the cloud storage service, you can get the corresponding cloud space. For example, if you purchase the cloud deposit monthly package, the cloud space is valid for one month, and it will take effect from the successful purchase. */
 +(NSString *)cloud_storage_details_introduce_tips_1;

/*! 格式化成功 */
/*! Format succeeded */
 +(NSString *)Devicesetting_Format_succeeded;

/*! 运营商信息 */
/*! Carrier information */
 +(NSString *)devicesetting_Carrier_information;

/*! 二维码有效期 */
/*! QR code validity period */
 +(NSString *)devicelist_share_equipment_QR_code;

/*! 将有可能成为九安的正规经销商伙伴，或加盟为当地代理商，享受对应的福利政策 */
/*! Will likely become a regular distributor of JUAN, or join as a local agent, enjoy the corresponding welfare policy */
 +(NSString *)Service_map_local_agent;

/*! 悉尼 */
/*! Australia/Sydney */
 +(NSString *)Australia_Sydney;

/*! 已连接 */
/*! Connected */
 +(NSString *)adddevice_Wireless_add_mode_confirm_connect;

/*! 选择报警后延迟录像时长 */
/*! Delay recording time after selecting alarm */
 +(NSString *)devicesetting_alarm_set_video_delay_duration;

/*! 密码与网络设置 */
/*! Password and network settings */
 +(NSString *)devicesetting_password_network_setting;

/*! 仍未解决，请 */
/*! Still unresolved, please */
 +(NSString *)Preview_Still_unresolved_contact_customer;

/*! 夜视常开 */
/*! Night vision always on */
 +(NSString *)preview_Night_vision_always_on;

/*! 离家模式 */
/*! Away mode */
 +(NSString *)deviceSetting_offhome;

/*! 聊天 */
/*! Chat */
 +(NSString *)Stand_alone_station_Chat;

/*! 请附上截图，方便我们快速解决问题 */
/*! Please attach the screenshot so that we can solve the problem quickly */
 +(NSString *)person_feedback_attach_screenshot;

/*! 打开手机设置，选择“WLAN”； */
/*! Open cell phone Settings and select \"WLAN\"; */
 +(NSString *)adddevice_open_phone_set;

/*! 设备密码错误，不能购买云存 */
/*! The device password is incorrect. You cannot purchase cloud storage. */
 +(NSString *)cloud_device_password_incorrect;

/*! 设备报警音量 */
/*! Device Alarm Volume */
 +(NSString *)devicesetting_alarm_volume;

/*! 您已完成全部设置，请在使用前记得为设备充电： */
/*! You have completed all settings. Please remember to charge the device before use: */
 +(NSString *)Addevice_charge_device_ptompt;

/*! 巴西 */
/*! Brazil */
 +(NSString *)devSetting_Brazil;

/*! 设备名重复 */
/*! Device name repetition */
 +(NSString *)addDevice_name_repeat;

/*! 感谢您使用APP，我们非常重视您的个人信息和隐私保护，为了更好地保障您的个人权益，在您使用我们的产品前，请务必仔细阅读并充分理解《隐私政策》与《用户协议》内的所有条款。我们将通过以上协议向您说明: */
/*! Thank you for using the APP. We attach great importance to the protection of your personal information and privacy. In order to better protect your personal rights, please read carefully and fully understand the \"Privacy Policy\" and \"User Agreement\" before you use our products. All terms within. We will explain to you through the above agreement: */
 +(NSString *)login_APP_Privacy_Policy;

/*! 获取设备设置失败 */
/*! Failed to get device settings */
 +(NSString *)deviceSetting_setupFail;

/*! 报警音量 */
/*! Alarm volume */
 +(NSString *)Devicesetting_Alarm_volume_device;

/*! 第一步：接通电源(如已接通，请看第二步) */
/*! Step 1: turn on the power (if it is connected, please follow the second step) */
 +(NSString *)adddevice_first_step_turn_on_power;

/*! 密码错误，请重新输入 */
/*! Wrong password,input again */
 +(NSString *)password_not_match;

/*! 云台速度等级 */
/*! PTZ speed grade */
 +(NSString *)play_PTZ_speed_grade;

/*! 剩余流量小于300MB，请尽快充值 */
/*! Traffic less than 300MB, please recharge */
 +(NSString *)devicelist_Insufficient_traffic_less_100;

/*! 刷新失败 */
/*! Refresh failed */
 +(NSString *)cloud_refresh_fail;

/*! 侦测到移动物体时持续录像，直至移动结束 */
/*! When an event detected, record video till it ends */
 +(NSString *)devicesetting_Best_video_Description_new_firmware;

/*! 通用设置 */
/*! General setup */
 +(NSString *)common_setting;

/*! 分钟 */
/*! minute */
 +(NSString *)deviceSetting_minute;

/*! 二维码对准设备镜头15-25cm，等待设备发出提示音或指示灯不再闪烁。 */
/*! Align the QR code with the device lens 15-25cm, and wait for the device to emit a prompt voice or the indicator light stops flashing. */
 +(NSString *)addDevice_scan_code_success_prompt;

/*! 婴儿心率异常 */
/*! Abnormal baby heart rate */
 +(NSString *)alarm_baby_heart;

/*! 未付款 */
/*! Unpaid */
 +(NSString *)cloud_Unpaid;

/*! 远程配置失败 */
/*! Remote configuration failed */
 +(NSString *)adddevice_remote_configuration_fail;

/*! (2)云存录像保存时间由套餐类型来决定，若您开通7天的云存套餐，摄像机云录像视频保存周期为7天。开通30天云存套餐，摄像机云录像保存周期也将升级为30天。若您开通的是7G/月的云存套餐，那么在这一个月内您的云录像存储空间为7G，空间存满之后，就不再保存云录像，已经存储的录像保存时长为一个月。 */
/*! (2) The storage time of cloud storage video is determined by the type of package. If you open the cloud storage package for 7 days, the camera cloud video storage period is 7 days. The 30-day cloud storage package will be opened, and the camera cloud video storage cycle will be upgraded to 30 days. If you open a 7G/month cloud storage package, then your cloud recording storage space is 7G in this month. After the space is full, the cloud recording will not be saved. The stored video will be saved for one month. */
 +(NSString *)cloud_storage_details_introduce_tips_2;

/*! 电池摄像机内置PIR红外传感器，只有感应到移动物体才会启动录像，PIR传感器的有效区在画面红色区域，请注意摄像机安装时的角度。 */
/*! The battery camera has a built-in PIR infrared sensor, which will start recording only when it senses a moving object. The effective area of the PIR sensor is in the red area of the picture. Please pay attention to the angle of the camera during installation. */
 +(NSString *)Addevice_pay_attention_install_angle;

/*! 设备扫码操作步骤 */
/*! Operation steps of QR code scanning */
 +(NSString *)addDevice_device_sacn_steps;

/*! 不开启夜视功能。 */
/*! Disable night vision. */
 +(NSString *)deviceSetting_night_vision_off_describe;

/*! 新设备 */
/*! New device */
 +(NSString *)device_new;

/*! 色彩风格 */
/*! Color style */
 +(NSString *)deviceSetting_Color_style;

/*! 请选择套餐通道数 */
/*! Please select the number of package channels */
 +(NSString *)cloud_select_service_channel;

/*! 配置模式 */
/*! Configuration mode */
 +(NSString *)adddevice_configure_mode;

/*! 1.建议使用设备自带的电源适配器，使用外接电源如果电源不稳定可能会对设备造成损坏。 */
/*! 1.Suggest to use original power adapter. If use other adapter with the power is not stable,the device may be damaged. */
 +(NSString *)help_normal_problem_text_13;

/*! 确认密码：请输入 */
/*! Confirm password: please enter */
 +(NSString *)adddevice_confirm_password;

/*! 密码长度为6-20个字符，使用数字、符号或字母并区分大小写 */
/*! The password is 6-20 characters long,using numbers,symbols or letters and distinguish Capitalization */
 +(NSString *)register_password_tips;

/*! 圆心1： */
/*! Center 1: */
 +(NSString *)devicesetting_Video_center_correction_center_one;

/*! 2.SD卡损坏或者文件系统有误，应考虑更换或重新格式化SD卡。 */
/*! 2.When SD card is ruined or file system is wrong,please try to change or re-format the SD card. */
 +(NSString *)help_normal_problem_text_9;

/*! 检查设备状态 */
/*! Check device status */
 +(NSString *)adddevice_check_device_status;

/*! 网络连接失败，请重新加载 */
/*! Network connection  is failure,please reload. */
 +(NSString *)me_cloudStore_error_network;

/*! 新增区域 */
/*! New area */
 +(NSString *)devicesetting_new_zone;

/*! 云ID/IP */
/*! Cloud ID/IP */
 +(NSString *)adddevice_cloud_IDIP;

/*! 剩余服务时间 */
/*! Remaining service time */
 +(NSString *)cloud_remain_time;

/*! 智能侦测灵敏度 */
/*! Motion detection sensitivity */
 +(NSString *)devicesetting_Intelligent_detection_sensitivity;

/*! KB */
/*! KB */
 +(NSString *)traffic_statistics_KB;

/*! 当前日期没有报警信息 */
/*! No alarm information under current date */
 +(NSString *)current_date_have_no_alarm_message;

/*! 开通 */
/*! Enable */
 +(NSString *)open_2;

/*! 本地直连 */
/*! Direct Connection */
 +(NSString *)adddevice_local_use_alone;

/*! 微信支付 */
/*! WeChat payment */
 +(NSString *)cloud_client_wechat;

/*! 产品类型 */
/*! Product type */
 +(NSString *)help_product_type;

/*! 输入数字（7-255） */
/*! Enter a number (7-255) */
 +(NSString *)person_setting_preview_enterpreset;

/*! 删除后自动重置设备 */
/*! Auto reset device after deletion */
 +(NSString *)devicelist_delete_reset;

/*! 清空 */
/*! Empty */
 +(NSString *)clear;

/*! 智能侦测警报 */
/*! Motion Detection Alert */
 +(NSString *)deviceSetting_Smart_detection_alarm;

/*! 开启后设备会发出报警声音，您可以手动关闭或等待15s后自动关闭。 */
/*! After opening, the device will give an alarm sound. You can manually close it or automatically close it after waiting for 15s. */
 +(NSString *)Preview_open_alarm;

/*! 在家模式 */
/*! At Home mode */
 +(NSString *)deviceSetting_athome;

/*! 抱歉，当前系统没有与设备相匹配的套餐 */
/*! Sorry, the current system does not have a package that matches the device */
 +(NSString *)cloud_no_matche_package;

/*! 支付成功 */
/*! payment successful */
 +(NSString *)devicesetting_4G_card_pay_success;

/*! 点击“查看帮助”或“在线客服”解决问题 */
/*! Click\"View Help\" or\"Online Customer Service\" to solve the problem */
 +(NSString *)adddevice_fail_view_help_2;

/*! Q1：摄像机离线处理方法 */
/*! Q1: Camera offline processing method */
 +(NSString *)person_feedback_Camera_offline_processing_method;

/*! 不支持输入表情符号 */
/*! Emoji input is not supported */
 +(NSString *)service_Emoji_not_supported;

/*! 播放 */
/*! Play */
 +(NSString *)deviceSetting_Alarm_voice_Custom_play;

/*! 状态良好 */
/*! In good condition */
 +(NSString *)deviceSetting_good_condition;

/*! 请输入搜索内容 */
/*! Enter search content */
 +(NSString *)Stand_alone_station_Enter_search_content;

/*! 支持录制声音。但录制过程中如果使用语音对讲功能， 对讲过程中的声音不会被录制。 */
/*! Support recording sound. But if the voice intercom function is used during recording, the voice during the intercom will not be recorded. */
 +(NSString *)person_feedback_question_record_video_detail;

/*! 开启/暂停云存录像 */
/*! Turn on or stop cloud storage recording */
 +(NSString *)cloud_video_openOrStops;

/*! 乌拉尔 */
/*! Asia/Oral */
 +(NSString *)Asia_Oral;

/*! 已关注该公众号 */
/*! Followed the official account */
 +(NSString *)person_already_follow_official_account;

/*! 二维码已过期，请重新获取 */
/*! QR code has expired, please re-acquire */
 +(NSString *)addDevice_share_overdue;

/*! 购买 */
/*! GET */
 +(NSString *)cloud_pay;

/*! APP需要读取手机状态，请前往手机系统设置开启 */
/*! APP needs to read the phone status, please go to the phone system settings to open */
 +(NSString *)cloud_phone_status;

/*! 门店地址未选择 */
/*! The store address not selected */
 +(NSString *)service_not_store_address;

/*! 新密码 */
/*! New password */
 +(NSString *)userInfo_password_new;

/*! ③ 可在WLAN列表中选择如：“IPCXXX”连接，XXX即为设备ID，初始密码为11111111 */
/*! 3 In the WLAN list, select: \"IPCXXX\" connection, XXX is the device ID, and the initial password is 11111111. */
 +(NSString *)adddevice_mobile_WiFi_list;

/*! 价格 */
/*! Price */
 +(NSString *)OrderPrice;

/*! 布宜诺斯艾利斯 */
/*! America/Argentina/Buenos Aires */
 +(NSString *)America_Argentina_Buenos_Aires;

/*! 左右滑动时间轴可查看进度；也可通过缩放调节时间轴精度。 */
/*! Drage timeline left and right to check schedule,can also narrow and enlarge timeline to adjust timeline accuracy */
 +(NSString *)newbie_guide_text_5;

/*! 添加分享设备成功 */
/*! Succeed to add and share device */
 +(NSString *)add_share_device_success;

/*! 视频一键下载 */
/*! One-click video download */
 +(NSString *)cloud_video_download_oneclick;

/*! 问题详情 */
/*! Problem details */
 +(NSString *)cloud_help_problem_detail;

/*! 查看设备指示灯是否闪烁，可长按Reset键重置设备。 */
/*! Check if the device indicator is flashing, you can press and hold the Reset button to reset the device. */
 +(NSString *)adddevice_check_indicator;

/*! 连接成功后返回APP */
/*! Return to APP after successful connection */
 +(NSString *)addevice_connect_success_return_app;

/*! 32位兼容版下载 */
/*! 32-bit compatible version download */
 +(NSString *)person_32_compatible_download;

/*! 2.如果您之前的云录像已经过期。您可以在“云录像服务管理页面”和“个人中心—云商城”进行购买。 购买后，新的云录像套餐将立即生效。 */
/*! 2. If your previous cloud recording has expired. You can purchase on the \"Cloud Video Service Management Page\" and \"Personal Center-Cloud Mall\". After purchase, the new cloud video package will take effect immediately. */
 +(NSString *)person_feedback_question_Cloud_video_renewal_detail_2;

/*! 安装新版本 */
/*! Install new version */
 +(NSString *)Update_Install_new_version;

/*! %@云存录像开启失败，请手动开启 */
/*! %@Cloud storage video failed to open,please open it manually  */
 +(NSString *)devicelist_cloud_failed_channel_prompt_ios;

/*! 设备连接WiFi */
/*! Connect the device to WiFi */
 +(NSString *)addDevice_device_connect_WiFi;

/*! 总流量%1$s */
/*! Total mobile data %1$s */
 +(NSString *)devicesetting_total_traffic;

/*! 电量管理 */
/*! Power management */
 +(NSString *)devicesetting_operate_mode;

/*! 选择添加 */
/*! Select add */
 +(NSString *)adddevice_select_add_nav;

/*! 取消分享 */
/*! Cancel sharing */
 +(NSString *)me_device_share_cancel;

/*! 使用其它添加方式 */
/*! Use other ways to add */
 +(NSString *)addDevice_use_other_method;

/*! 例：广州市天河区xx维修员 */
/*! Example: xx maintenance staff in Tianhe District, Guangzhou */
 +(NSString *)Service_map_Example;

/*! 云录像开启成功 */
/*! Cloud video is successfully opened */
 +(NSString *)cloud_purchase_cloud_video_open_success;

/*! 立即修改密码 */
/*! change your password immediately */
 +(NSString *)person_login_log_change_password;

/*! 卡录像设置 */
/*! Record setting */
 +(NSString *)deviceSetting_Card_recording_settings;

/*! 门磁 */
/*! Door sensor */
 +(NSString *)magnetic_door;

/*! 守护隐私更安全 */
/*! Protect privacy and be safer */
 +(NSString *)Lead_page_describe_4;

/*! WiFi信号强度 */
/*! WiFi signal strength */
 +(NSString *)deviceSetting_WiFi_signal_strength;

/*! 巴巴多斯/大西洋 */
/*! America/Barbados */
 +(NSString *)America_Barbados;

/*! 我的 */
/*! Me */
 +(NSString *)me;

/*! 请先安装微信 */
/*! Please install wechat */
 +(NSString *)install_Wechat;

/*! b.选择一台离线设备进行迁移，若离线设备为多通道，则需要选择迁移的设备通道； */
/*! b. Select an offline device to migrate. If the offline device is multi-channel, you need to select the migrated device channel. */
 +(NSString *)cloud_help_migration_device_b;

/*! 您可以直接联系我们的业务人员，用最低的价格购买安防设备。 */
/*! You can contact our sales staff directly to buy the security equipment with the lowest price. */
 +(NSString *)service_map_contact_sales;

/*! 2.开启消息通知后:在手机设置>应用管理,找到“易视云”并开启/允许通知即可收到报警推送。 */
/*! 2. After opening the message notification: In the phone settings> application management, find \"EseeCloud\" and enable / allow notification to receive the alarm push. */
 +(NSString *)person_feedback_question_no_alarm_push_2;

/*! 云录像即将过期，是否前往续费？ */
/*! Cloud recording is about to expire, do you want to renew? */
 +(NSString *)cloud_expire_pop;

/*! 检测到云存设备%1$s智能侦测已关闭，请前往设备设置开启智能侦测 */
/*! If it is detected that the motion detection of cloud storage devices %1$s has been turned off, please go to the device settings to enable motion detection */
 +(NSString *)devicelist_cloud_motion_prompt;

/*! 设备侦测到移动物体时，持续顺延录像，超过（可自定义录像时长：10S、20S、30S）时长未侦测到移动物体，设备进入休眠状态。 */
/*! When the device detects a moving object, it will continue to postpone the recording time. If the time exceeds (customizable recording time: 10S, 20S, 30S), no moving object is detected,the device enters the sleep state. */
 +(NSString *)devicesetting_working_mode_Description_2;

/*! 已选%ld个 */
/*! %ld selected */
 +(NSString *)chosen_number_ios;

/*! 版本更新失败 */
/*! Update fail */
 +(NSString *)me_version_updateFail;

/*! 当前处于非WiFi网络，下载录像将消耗流量，是否继续？ */
/*! Currently, no Wi-Fi network is connected, downloading video will consume traffic. Do you want to continue? */
 +(NSString *)playback_download_traffic;

/*! 输入的验证码已过期，请重新获取 */
/*! Verification code expires,please re-gain */
 +(NSString *)verify_overdue;

/*! 亮度 */
/*! Brightness */
 +(NSString *)play_lamp_brightness;

/*! 录像保存时长/空间 */
/*! Video saving time/space */
 +(NSString *)cloud_video_save_time_space;

/*! 确认密码 */
/*! Confirm password */
 +(NSString *)enter_password_confirm;

/*! 5.为设备配置WiFi */
/*! 5.Configure WiFi for device */
 +(NSString *)help_addDevice_textTips_10;

/*! 允许APP获取录音权限，才能正常使用此功能 */
/*! Allow the APP to obtain the recording permission to use this function normally */
 +(NSString *)permissions_recording_function_normally;

/*! 秒 */
/*! s */
 +(NSString *)deviceSetting_videoBackup_startTimeSS;

/*! 1.下载亚马逊Alexa App，注册亚马逊Alexa用户后，请按照下图所示操作。 */
/*! 1. Download the Amazon Alexa App, and after registering as an Amazon Alexa user, please follow the steps below. */
 +(NSString *)devicesetting_Alexa_operation_guide_1;

/*! 全天侦测 */
/*! All day */
 +(NSString *)devicesetting_All_day_detection;

/*! 意见反馈 */
/*! Feedback */
 +(NSString *)cloud_help_feedback;

/*! 复制 */
/*! Copy */
 +(NSString *)devicesetting_alarm_copy;

/*! 其他问题 */
/*! Other questions */
 +(NSString *)person_feedback_question_7;

/*! 正在删除 */
/*! Deleting */
 +(NSString *)deleting;

/*! 输入设备密码 */
/*! Input device password */
 +(NSString *)addDevice_enter_password;

/*! 3.先检查您的网络状况是否良好 */
/*! 3. Check if your network is in good condition first. */
 +(NSString *)smartlin_distribution_network_fail_prompt_three;

/*! 在线状态 */
/*! Online status */
 +(NSString *)devicesetting_4G_card_sim_card_online_status;

/*! 回复： */
/*! Reply: */
 +(NSString *)person_feedback_replay;

/*! 服务详情 */
/*! Service details */
 +(NSString *)cloud_detail_service;

/*! 2.当您的设备添加到Alexa APP后，请对Echo Show说：“Alexa，show me the test”，Echo Show会完成“test”设备的投屏。（提示：“test”表示设备名称 ） */
/*! 2. When your device is added to the Alexa APP, please say \"Alexa, show me the test\" to the Echo Show, and the Echo Show will complete the screen casting of the \"test\" device. (Hint: \"test\" means the device name) */
 +(NSString *)devicesetting_Alexa_operation_guide_2;

/*! 服务周期 */
/*! Service cycle */
 +(NSString *)devicesetting_4G_card_Service_cycle;

/*! 荷兰 */
/*! Netherlands */
 +(NSString *)devSetting_Netherlands;

/*! 24小时推送消息 */
/*! 24 hours push message */
 +(NSString *)deviceSetting_Push_all_day_time;

/*! 验证码发送失败 */
/*! Failed to send verification code */
 +(NSString *)send_verify_fail;

/*! 最低 */
/*! Lowest */
 +(NSString *)deviceSetting_lowest;

/*! APP闪退问题 */
/*! APP flashback problem */
 +(NSString *)person_feedback_APP_flashback_problem;

/*! 时间设置 */
/*! Time setting */
 +(NSString *)devicesetting_time_set;

/*! 找不到硬盘 */
/*! Can\'t find HDD */
 +(NSString *)devSetting_hardDisk_cannotFind;

/*! 如果您已接入无线局域网： */
/*! If you are connected to a wireless LAN: */
 +(NSString *)preview_no_video_connect_wireless_LAN;

/*! 当前网络不可上网，请连接可上网的WiFi或打开移动数据 */
/*! The current network is not available online. Please connect to WiFi or open mobile data. */
 +(NSString *)adddevice_need_network;

/*! 下载进度 */
/*! Download progress */
 +(NSString *)preview_download_progress;

/*! 正在保存中... */
/*! Saving */
 +(NSString *)saving;

/*! 点击安装 */
/*! Click and install */
 +(NSString *)click_install;

/*! 本地直连: */
/*! Direct Connection： */
 +(NSString *)adddevice_local_use;

/*! 重启摄像机 */
/*! Restart the camera */
 +(NSString *)devicesetting_restart_camera;

/*! 尽量不要在信号干扰较大的环境内进行配置，如果干扰较大，请切换移动网络。 */
/*! Try not to configure it in an environment with large signal interference. If the interference is large, Please switch the mobile network. */
 +(NSString *)adddevice_environmental_requir_detail;

/*! 选择视频通道(%ld) */
/*! Select video channel(%ld) */
 +(NSString *)device_Select_video_channel_ios;

/*! 兼容版下载 */
/*! Compatible version download */
 +(NSString *)devicelist_download_compatible_version;

/*! 离线帮助 */
/*! Offline help */
 +(NSString *)devicelist_offline_help;

/*! 侦测到人脸时，生成报警信息 */
/*! When a human face is detected, an alarm message is generated */
 +(NSString *)devicesetting_face_set_prompt;

/*! %@年维修经验 */
/*! %@ years maintenance experience */
 +(NSString *)service_map_year_experience_ios;

/*! 连接设备需要开启WiFi，检测到您WiFi已断开，是否前往开启？ */
/*! WiFi is required to connect the device,it is detected that your WiFi is disconnected. Do you want to turn it on? */
 +(NSString *)adddevice_turn_on_wifi_prompt;

/*! 事件录像 */
/*! Event recording */
 +(NSString *)devicesetting_Event_recording;

/*! 吉隆坡 */
/*! Asia/Kuala Lumpur */
 +(NSString *)Asia_Kuala_Lumpur;

/*! 已添加成功 */
/*! Added successfully */
 +(NSString *)adddevice_add_succed;

/*! 对讲开启失败 */
/*! Intercom open failed */
 +(NSString *)preview_intercom_fail;

/*! 提交反馈失败，请重试 */
/*! Failed to submit feedback. Please try again */
 +(NSString *)appealSubmitFail;

/*! 本日流量 */
/*! Traffic today */
 +(NSString *)userSettings_molileData_trafficStat_thisDay;

/*! 共%@，已用%@ */
/*! %@ total,%@ used */
 +(NSString *)devicesetting_4G_card_sim_card_data_ios;

/*! 开启后App才可以正常使用蓝牙添加设备 */
/*! App can use Bluetooth to add devices normally after it is turned on */
 +(NSString *)NSBluetoothPeripheralUsageDescription;

/*! 您已成功支付 */
/*! You have successfully paid */
 +(NSString *)devicesetting_4G_card_have_paid_success_ios;

/*! 32位兼容版是为了适配部分不支持64位版本APP的设备，是否确定下载？ */
/*! The 32-bit compatible version is for adapting some devices that do not support the 64-bit version of the APP. Are you sure to download? */
 +(NSString *)person_get_last_32_bit_detail;

/*! 取消分享后，该用户将无法查看设备内容。 */
/*! After cancel sharing,this user can\'t check the device */
 +(NSString *)me_share_tips;

/*! 绑定微信公众号 */
/*! Bind WeChat Official Account */
 +(NSString *)person_bind_wechat;

/*! 该设备已被删除 */
/*! The device has been deleted */
 +(NSString *)preview_device_already_delete;

/*! 云存订单 */
/*! Cloud storage order */
 +(NSString *)person_cloud_storage_order;

/*! 立即更新 */
/*! Update now */
 +(NSString *)Update_now;

/*! 时间范围 */
/*! Time range */
 +(NSString *)AlarmMessage_time_range;

/*! Q7：云录像续费 */
/*! Q7: Cloud video renewal */
 +(NSString *)person_feedback_question_Cloud_video_renewal;

/*! 当前手机连接网络为5G WiFi，此设备不支持5G网络，请切换为2.4G WiFi */
/*! The current mobile phone is connected to 5G WiFi. This device does not support 5G networks. Please switch to 2.4G WiFi. */
 +(NSString *)adddevice_5G_prompt;

/*! 立即开通 */
/*! Open now */
 +(NSString *)deviceSetting_Open_now;

/*! 警戒线 */
/*! Warning line */
 +(NSString *)devicesetting_warn_line;

/*! 一键清除 */
/*! One-click clearance */
 +(NSString *)devicesetting_onclick_clearance;

/*! 中 */
/*! Medium */
 +(NSString *)centre;

/*! 安克雷奇 */
/*! America/Anchorage */
 +(NSString *)America_Anchorage;

/*! 新增维修员工作简介信息功能，完善信息能增进客户对您维修服务的了解，吸引更多客户。 */
/*! Added the function of maintenance worker\’s profile information, improved information can enhance customers\' understanding of your maintenance,and get more customers. */
 +(NSString *)service_function_of_maintenance_prompt;

/*! 2.选择所需购买的云存套餐①，选择购买数量②后点击“立即购买”③跳转至“订单详情页”，确认无误后，点击“立即支付”。 */
/*! 2.Choose cloud storage package ①,choose quantity,click \"buy\",and redirect to \"order details\" page. confirm and click \"pay now\" */
 +(NSString *)help_cloud_storage_textTips_5;

/*! 科伦坡 */
/*! Asia/Colombo */
 +(NSString *)Asia_Colombo;

/*! 圣约翰/纽芬兰 */
/*! America/St Johns */
 +(NSString *)America_St_Johns;

/*! 网络助手：可以手动禁止已安装的第三方程序访问2G/3G和WIFI的网络和设置以后新安装程序是否允许访问2G/3G和WIFI的网络； */
/*! Network Assistant: You can manually prohibit installed third-party programs from accessing 2G / 3G and WIFI networks and set whether the new installation program will allow access to 2G / 3G and WIFI networks in the future; */
 +(NSString *)person_feedback_question_ROM_software_1_Network;

/*! 如果摄像机所连接的WiFi设置了防蹭网（黑白名单、MAC地址过滤等），会导致摄像机不能联网。需要取消路由器的防蹭网设置。 */
/*! If the Wi-Fi connected to the camera is set to prevent Wi-fi squatter(black and white lists, MAC address filtering, etc.), the camera will not be able to connect to the Internet. The router\'s prevent Wi-fi squatter settings need to be canceled. */
 +(NSString *)person_feedback_question_check_router_1_detail;

/*! 截图录像 */
/*! Screenshot video */
 +(NSString *)me_Screenshot_video;

/*! 直到设备发出“启动配置模式”提示音 */
/*! Until the device issues a \"boot configuration mode\" tone */
 +(NSString *)adddevice_until_device_issues_tone;

/*! 反馈截图 */
/*! Feedback screenshot */
 +(NSString *)person_feedback_Feedback_screenshots;

/*! 多套餐生效中 */
/*! Multi package is in effect */
 +(NSString *)devicesetting_4G_card_multi_use_package;

/*! 选择WiFi */
/*! Choose WiFi */
 +(NSString *)adddevice_choose_wifi;

/*! 阿德莱德 */
/*! Australia/Adelaide */
 +(NSString *)Australia_Adelaide;

/*! 请用浏览器访问易视云云存网站前往管理云计划 */
/*! Please visit EseeCloud Storage website with your browser to manage cloud plans */
 +(NSString *)cloud_tip_url;

/*! 旧版 */
/*! The old */
 +(NSString *)devicesetting_The_old;

/*! 录像日程 */
/*! Recording schedule */
 +(NSString *)video_schedule;

/*! 云存自动上传录像开启成功 */
/*! Cloud storage automatically uploads the video and opens successfully. */
 +(NSString *)cloud_tips_text_8;

/*! 用户名 */
/*! User name */
 +(NSString *)addDevice_user_name;

/*! 相册 */
/*! Photo album */
 +(NSString *)photo_album;

/*! 亮度与色调 */
/*! Brightness and hue */
 +(NSString *)deviceSetting_Brightness_hue;

/*! 安曼/东欧 */
/*! Asia/Amman */
 +(NSString *)Asia_Amman;

/*! 让摄像机与WiFi摄像机基站保持在1米范围以内 */
/*! Keep the camera and Base Station within 1 meter */
 +(NSString *)devicelist_match_code_describe_1;

/*! 按住摄像机复位键5秒钟，使摄像机进入对码状态， 状态灯快速闪烁 */
/*! Press and hold the camera reset button for 5 seconds to make the camera enter the code-matching state, and the status light flashes quickly */
 +(NSString *)devicelist_match_code_describe_2;

/*! 查看详情 */
/*! View details */
 +(NSString *)devicesetting_see_details;

/*! 搜索结束 */
/*! Search ends */
 +(NSString *)addevice_Search_ends;

/*! 3、网络输入错误或密码错误 */
/*! 3、 Network input error or password error */
 +(NSString *)adddevice_network_error;

/*! 视图放大/缩小 */
/*! View zoom in/out */
 +(NSString *)preview_ptz_electronic_zoom;

/*! 自动化 */
/*! Automation */
 +(NSString *)add_smart_scenes_task_Automation;

/*! 对码添加 */
/*! Match code */
 +(NSString *)devicelist_defense_add_to_code;

/*! 连接WiFi */
/*! Connecting WiFi */
 +(NSString *)connetion_WIFI;

/*! 是否确定重启摄像机 */
/*! Are you sure to restart the camera */
 +(NSString *)devicesetting_Are_sure_restart_camera;

/*! 1.确认设备已正常连接电源，设备连接的网络可以正常访问互联网。 */
/*! 1. Confirm that the device is properly connected to the power supply,and the network connected to the device can access the Internet normally. */
 +(NSString *)devicelist_offline_help_content_more_help_one;

/*! 开通云服务，享受专属用户特权【免广告】 */
/*! Activate cloud services and enjoy exclusive user privileges [Free of ads] */
 +(NSString *)person_set_Activate_cloud_free_ads;

/*! 领取成功，明天可继续领取 */
/*! Get it successfully, you can continue to receive it tomorrow */
 +(NSString *)devicelis_Get_successfully_tomorrow;

/*! 新设备领免费云存 */
/*! Free cloud storage for new devices */
 +(NSString *)devicelis_Free_cloud_storage_devices;

/*! 领取成功，明天可在商城中继续领取 */
/*! Get it successfully, you can continue to collect it in the mall tomorrow */
 +(NSString *)devicelis_Get_successfully_tomorrow_mall;

/*! 选择回放通道 */
/*! Select playback channel */
 +(NSString *)person_set_select_channel;

/*! 立即领取 */
/*! Get it now */
 +(NSString *)devicelis_Get_it_now;

/*! 抱歉给您带来不好的体验，在此期限内我们将不再向您展示广告 */
/*! Sorry for the bad experience, we will no longer show you ads during this period */
 +(NSString *)person_set_experience_longer_adsdur;

/*! 1天存储/3天服务云存套餐 */
/*! 1-day storage/3-day service cloud storage package */
 +(NSString *)devicelis_Free_cloud_storage_package;

/*! 保持广告开启，将更有利于我们为您提供免费的软件服务 */
/*! Keeping ads turned on will be more beneficial for us to provide you with free software services */
 +(NSString *)person_set_Keeping_ads_turned_on;

/*! 感谢您的支持，未来我们会加倍努力，为您带来更优质的服务 */
/*! Thank you for your support, we will redouble our efforts in the future to bring you better service */
 +(NSString *)person_set_support_redouble_better_service;

/*! 免费领取1天存储/3天服务云存套餐 */
/*! Free 1-day storage/3-day service cloud storage package */
 +(NSString *)playback_Free_cloud_storage_package;

/*! 感谢！ */
/*! Grateful! */
 +(NSString *)person_set_Grateful;

/*! 诚挚感谢您对本平台的信任与支持。我们非常重视每一位用户朋友的使用体验，一直以来我们承担视频传输和报警消息功能的成本，为了缓解不断上升的成本压力不得已增加了广告，您可以自行选择是否支持，如果关闭将不再向您展示广告。我们会一如既往地为您提供更优质的服务，不辜负朋友们的信任。 */
/*! Sincerely thank you for your trust and support of this platform. We attach great importance to every user's experience, we have been bearing the cost of video transmission and alarm message function, in order to alleviate the rising cost pressure had to add ads, you can choose whether to support, if off will no longer show you ads. We will continue to provide you with better service and live up to the trust of our friends. */
 +(NSString *)person_set_Thank_letter_content;

/*! 致尊敬的用户朋友： */
/*! Dear users and friends: */
 +(NSString *)person_set_Thank_letter;

/*! *4G设备开启后会消耗较多流量，请谨慎使用 */
/*! *4G device will consume a lot of data when turned on, please use it with caution */
 +(NSString *)devicelis_4Gdevice_consume_data_turned;

/*! 领取失败 */
/*! Get failed */
 +(NSString *)devicelis_Get_failed;

/*! 关闭广告 */
/*! Turn off ads */
 +(NSString *)person_set_Turn_offads;

/*! 保持开启 */
/*! Keep it on */
 +(NSString *)person_set_Keep_it_on;

/*! 3.如设备没有读取4G卡，需要将设备恢复出厂设置，再重新添加。 */
/*! 3. If the device does not read the 4G card, you need to restore the device to factory settings and add it again. */
 +(NSString *)addDevice_solution_for_device_offline_8;

/*! 保存设备二维码 */
/*! Save device QR code */
 +(NSString *)deviceSetting_save_device_QRcode;

/*! 多次扫码仍听不到提示音，请点击下方按钮改用设备热点连接； */
/*! If you still cannot hear the prompt after scanning the code several times, please click the button below to use the device hotspot connection instead; */
 +(NSString *)addDevice_no_sound_help_5;

/*! １.设备被其他账号添加，需要将设备恢复出厂设置重新添加。 */
/*! 1. If the device is added by another account, you need to restore the device to factory settings and add it again. */
 +(NSString *)addDevice_bound_by_other_accounts_1;

/*! ２.设备的密码错误，忘记密码需要将设备恢复出厂设置。 */
/*! 2. The password of the device is wrong. If you forget the password, you need to restore the device to the factory settings. */
 +(NSString *)addDevice_bound_by_other_accounts_2;

/*! 1.检查云ID是否正确，云ID是摄像机的唯一标识号，每个摄像机只对应一个ID，可在设备机身上的二维码标签查看。 */
/*! 1. Check whether the cloud ID is correct. The cloud ID is the unique identification number of the camera. Each camera corresponds to only one ID, which can be viewed on the QR code label on the device body. */
 +(NSString *)addDevice_cloud_id_inexistence_help_1;

/*! 2.如云ID标签打印错误，请联系商家。 */
/*! 2. If the cloud ID label is printed incorrectly, please contact the merchant. */
 +(NSString *)addDevice_cloud_id_inexistence_help_2;

/*! 预置位 */
/*! Preset */
 +(NSString *)preview_Preset;

/*! 将设备断电拔出4G卡重插重启设备，如设备仍然离线，请按以下步骤检查问题： */
/*! Power off the device, unplug the 4G card, reinsert the device, and restart the device. If the device is still offline, please follow the steps below to check the problem: */
 +(NSString *)devicelis_4Gdevice_offline_help_1;

/*! 检查摄像机供电问题 */
/*! Check for camera power problems */
 +(NSString *)devicelis_4Gdevice_offline_help_2;

/*! 检查您的设备是否处于通电状态，状态灯是否点亮，确保摄像机正常通电。 */
/*! Check if your device is powered on and if the status light is on, make sure the camera is powered on normally. */
 +(NSString *)devicelis_4Gdevice_offline_help_3;

/*! 检查摄像机网络问题 */
/*! Check for camera network issues */
 +(NSString *)devicelis_4Gdevice_offline_help_4;

/*! 1.查询4G卡是否有流量： */
/*! 1. Check whether the 4G card has traffic: */
 +(NSString *)devicelis_4Gdevice_offline_help_5;

/*! 震动效果 */
/*! Vibration effect */
 +(NSString *)person_Vibration_effect;

/*! 关注微信公众号易视物联查询，如果没有流量可通过APP商城或微信公众号易视物联充值。如查询还剩余流量可把摄像机断电重启，并等待2分钟后再重新打开APP。 */
/*! Please contact your 4G service provider to check if there is still traffic, if there is still traffic left, you can power off the camera and restart it, and wait for 2 minutes before reopening the app. */
 +(NSString *)devicelis_4Gdevice_offline_help_6;

/*! 2.检查摄像机尾线灯： */
/*! 2. Check the camera tail light: */
 +(NSString *)devicelis_4Gdevice_offline_help_7;

/*! 检查一下摄像机的尾线灯状态。尾线灯常亮表示设备正常联网，尾线灯快闪表示4G卡没流量或者没信号，尾线灯慢闪表示沒有成功读取4G卡。（快闪1秒钟闪2次，慢闪2-3秒闪一次） */
/*! Check the status of the camera\'s tail light. The tail line light is always on, indicating that the device is connected to the Internet normally, the tail line light flashing quickly means that the 4G card has no traffic or no signal, and the tail line light flashing slowly means that the 4G card was not successfully read. (fast flash 2 times in 1 second, slow flash once in 2-3 seconds) */
 +(NSString *)devicelis_4Gdevice_offline_help_8;

/*! 更换4G卡后可测试能否上线： */
/*! After replacing the 4G card, you can test whether it can go online: */
 +(NSString *)devicelis_4Gdevice_offline_help_9;

/*! 官方网站 */
/*! Official Website */
 +(NSString *)person_Official_Website;

/*! 根据您的录像设置，摄像机将于%@再次关机，您可以到录像设置-定时关机时段中做变更 */
/*! According to your recording settings, the camera will be turned off again at %@, you can go to Recording Settings - Scheduled Shutdown Period to make changes */
 +(NSString *)deviceSetting_Shutdown_prompt_Pop_up_copy_ios;

/*! 联系信息 */
/*! Contact Information */
 +(NSString *)person_Contact_Information;

/*! 注意换卡后先把摄像机恢复出厂设置，如更换4G卡后可以上线则表明设备正常，否则4G卡存在问题。 */
/*! Note that after changing the card, restore the camera to the factory settings. If you can go online after replacing the 4G card, it means that the device is normal, otherwise there is a problem with the 4G card. */
 +(NSString *)devicelis_4Gdevice_offline_help_10;

/*! 4G摄像机与APP连接时提示连接失败，有可能是设备离线导致，需要检查设备是否在线，请确认设备在线再使用APP完成添加。 */
/*! When the 4G camera is connected to the APP, it prompts that the connection fails. It may be caused by the device being offline. You need to check whether the device is online. Please confirm that the device is online and then use the APP to complete the addition. */
 +(NSString *)addDevice_ID_add_failed_help_describe;

/*! 添加方式 */
/*! Add method */
 +(NSString *)adddevice_add_method;

/*! 查看流量套餐状态 */
/*! View traffic package status */
 +(NSString *)devicelis_View_traffic_package_status;

/*! 开启后点按云台按钮有震动反馈 */
/*! After opening, click the gimbal button to have vibration feedback */
 +(NSString *)person_Vibration_effect_Description;

/*! 检查您的设备是否处于通电状态，状态灯是否已经点亮，确保摄像机正常通电； */
/*! Check whether your device is powered on and whether the status light is on to ensure that the camera is powered on normally; */
 +(NSString *)devicelis_wifi_device_offline_help_1;

/*! 检查路由器WiFi，确认WiFi的密码名称没有修改过，如修改过请重新配置WiFi，并确保摄像机和路由器的距离不要过远； */
/*! Check the WiFi of the router, and confirm that the password name of the WiFi has not been modified. If it is modified, please reconfigure the WiFi, and ensure that the distance between the camera and the router is not too far; */
 +(NSString *)devicelis_wifi_device_offline_help_2;

/*! 如设备仍然处于离线状态，请将设备恢复出厂设置并重新配置网络，然后再次添加设备。 */
/*! If the device is still offline, please factory reset the device and reconfigure the network, then add the device again. */
 +(NSString *)devicelis_wifi_device_offline_help_3;

/*! 标清录像 */
/*! SD video */
 +(NSString *)deviceSetting_clarity_SD_video;

/*! 不支持添加7*24小时日程，请添加区间时段 */
/*! Adding 7*24 hours schedule is not supported, please add interval period */
 +(NSString *)deviceSetting_7x24_schedule_not;

/*! 服务时间 */
/*! Service time */
 +(NSString *)person_Service_Hours;

/*! 设备可能离线，请按以下步骤检查设备是否在线： */
/*! The device may be offline, please follow the steps below to check if the device is online: */
 +(NSString *)addDevice_device_maybe_offline_check;

/*! 1.通过声音检查： */
/*! 1. Check by sound: */
 +(NSString *)addDevice_device_maybe_offline_check_1;

/*! 通电重启设备后检查设备提示音是否正常播放“4G连网成功”，无法正常播放则表示设备离线； */
/*! After powering on the device and restarting the device, check whether the device prompt sound \"4G connected successfully\" is played normally. If it cannot be played normally, it means the device is offline; */
 +(NSString *)addDevice_device_maybe_offline_check_2;

/*! 2.通过摄像机指示灯判断： */
/*! 2. Judging by the camera indicator light: */
 +(NSString *)addDevice_device_maybe_offline_check_3;

/*! 录像清晰度 */
/*! Video clarity */
 +(NSString *)deviceSetting_Video_clarity;

/*! 检查指示灯状态，指示灯闪烁表示设备离线，如指示灯长亮则表示设备在线； */
/*! Check the status of the indicator light, if the indicator light flashes, it means the device is offline, if the indicator light is on, it means the device is online; */
 +(NSString *)addDevice_device_maybe_offline_check_4;

/*! 设备ID： */
/*! Device ID: */
 +(NSString *)deviceSetting_device_ID;

/*! 如指示灯慢闪，表示设备沒有成功读取4G卡； */
/*! If the indicator light flashes slowly, it means that the device has not successfully read the 4G card; */
 +(NSString *)addDevice_device_maybe_offline_check_5;

/*! 电池摄像机可查看LED灯，红灯慢闪表示离线，绿灯常亮则为配网成功。 */
/*! The battery camera can check the LED light. The red light flashes slowly to indicate offline, and the green light is always on to indicate that the network configuration is successful. */
 +(NSString *)addDevice_device_maybe_offline_check_6;

/*! 设备被独占绑定 */
/*! Device is exclusively bound */
 +(NSString *)addDevice_device_exclusively_bound;

/*! 如多次添加仍然失败可尝试更换添加方式，点击下方按钮改用设备热点连接； */
/*! If multiple additions still fail, you can try to change the addition method, and click the button below to use the device hotspot connection instead; */
 +(NSString *)adddevice_add_method_prompt;

/*! 技术支持 */
/*! Tech Support */
 +(NSString *)person_Technical_Support;

/*! 为避免添加时机身查看不便或机身二维码受损，请将二维码保存至手机相册并妥善保管。 */
/*! In order to avoid inconvenient viewing of the fuselage or damage to the QR code of the fuselage when adding, please save the QR code to the mobile phone album and keep it properly. */
 +(NSString *)deviceSetting_save_device_QRcode_describe;

/*! 设备热点连接 */
/*! Device hotspot connection */
 +(NSString *)adddevice_device_hotspot_connection;

/*! 正在通话中，请挂断后再使用Pro模式 */
/*! During a call, please hang up before using Pro mode */
 +(NSString *)preview_call_hangup_Promode;

/*! ID号可在设备机身上的二维码标签旁边找到 */
/*! The ID number can be found next to the QR code label on the body of the device */
 +(NSString *)addDevice_ID_QRcode_label_device;

/*! 1.4G卡没有流量或者没有激活； */
/*! 1. The 4G card has no traffic or is not activated; */
 +(NSString *)addDevice_solution_for_device_offline_1;

/*! 联系我们 */
/*! Contact Us */
 +(NSString *)person_Contact_Us;

/*! 设备离线的解决方法： */
/*! Solution for device offline: */
 +(NSString *)addDevice_solution_for_device_offline;

/*! 开启后实时预览会出现Pro按钮，点击Pro按钮云台面板会开启专业模式，专业模式面板包含变倍对焦调节和预置位调用一系列镜头控制功能。 */
/*! After opening, the Pro button will appear in the real-time preview. Clicking the Pro button will turn on the professional mode on the gimbal panel. The professional mode panel includes zoom focus adjustment and preset calling a series of lens control functions. */
 +(NSString *)deviceSetting_Zoom_and_focus_illustrate;

/*! 充值方式： */
/*! Recharge method: */
 +(NSString *)addDevice_solution_for_device_offline_2;

/*! （1）打开APP界面，找到商城，选择4G流量，确认卡号是否正确； */
/*! (1) Open the APP interface, find the mall, select 4G traffic, and confirm whether the card number is correct; */
 +(NSString *)addDevice_solution_for_device_offline_3;

/*! 您还未添加任何日程，关闭录像日程设备将恢复全天录像 */
/*! You haven\'t added any schedule yet, closing the recording schedule device will resume all-day recording */
 +(NSString *)deviceSetting_schedule_not_allday_record;

/*! （2）手机微信关注公众号易视物联，九安云服务充值。 */
/*! (2) Please contact your 4G service provider for data recharge. */
 +(NSString *)addDevice_solution_for_device_offline_4;

/*! 激活方式： */
/*! Activation method: */
 +(NSString *)addDevice_solution_for_device_offline_5;

/*! 联系商家刷新，或者激活4G卡。 */
/*! Contact the merchant to refresh, or activate the 4G card. */
 +(NSString *)addDevice_solution_for_device_offline_6;

/*! 1.设备被独占，请使用原账号登录或联系机主解绑设备 */
/*! 1. The device is exclusive, please log in with the original account or contact the owner to unbind the device */
 +(NSString *)addDevice_device_exclusively_bound_1;

/*! 2.联系在线客服解绑设备 */
/*! 2. Contact online customer service to unbind the device */
 +(NSString *)addDevice_device_exclusively_bound_2;

/*! 2.4G卡没有信号，可以换一个地方重新启动设备或更换一张4G卡； */
/*! 2. If the 4G card has no signal, you can restart the device in another place or replace a 4G card; */
 +(NSString *)addDevice_solution_for_device_offline_7;

/*! 已被其他账号绑定 */
/*! Bound by other accounts */
 +(NSString *)addDevice_bound_by_other_accounts;

/*! 超清录像 */
/*! HD video */
 +(NSString *)deviceSetting_clarity_HD_video;

/*! 最佳录像 */
/*! Event Record Mode */
 +(NSString *)devicesetting_Best_video_zhiou;

/*! 设备暂不支持本地回放倍速功能 */
/*! The device does not currently support the local speed up playback function */
 +(NSString *)playback_device_not_support_speed_playback;

/*! 云服务 */
/*! Cloud */
 +(NSString *)devicelist_service_simplify;

/*! 卡存储 */
/*! SD */
 +(NSString *)playback_Card_storage_simplify;

/*! 购买云服务可将报警图片升级为视频 */
/*! Purchase cloud service to upgrade alarm picture to video */
 +(NSString *)playback_purchase_cloud_picture_video;

/*! 云存储 */
/*! CLOUD */
 +(NSString *)playback_storage_simplify;

/*! 设备一直持续录像，当电量降至%@以下时自动切换为最佳录像，当电量提升至%@以上时恢复一直录像 */
/*! Record videos continuously. When battery level below %@, automatically switches to event record mode. When battery level above %@, resumes to continuous record mode */
 +(NSString *)devicesetting_Adaptive_mode_Description_new_firmware_ios_zhiou;

/*! 免费云存可在商城中继续领取 */
/*! Free cloud storage can continue to be collected in the mall */
 +(NSString *)devicelist_free_cloud_collected_mall;

/*! 设备当前不在线，删除设备可能导致密码无法清除（需手动重置后才能重新添加），是否确认删除？ */
/*! The device is currently offline, Deleting the device may cause the password to fail to be cleared (it needs to be reset manually before adding it again), Do you want to confirm the deletion? */
 +(NSString *)devicelis_device_offline_Deleting_reset_before_add;

/*! 设备一直持续录像，当电量降至%@以下时自动切换为最佳录像，当电量提升至%@以上时恢复一直录像，该模式耗电较快，适合外接电源使用。 */
/*! Record videos continuously. When battery level below %@, automatically switches to event record mode. When battery level above %@, resumes to continuous record mode. This mode consumes power fast and is suggested only when your camera works with plug-in power */
 +(NSString *)devicesetting_Adaptive_mode_more_Description_new_firmware_ios_zhiou;

/*! 设备密码错误，删除设备可能导致密码无法清除（需手动重置后才能重新添加），是否确认删除？ */
/*! The password of the device is wrong, Deleting the device may cause the password to fail to be cleared (it needs to be reset manually before adding it again), Do you want to confirm the deletion? */
 +(NSString *)devicelis_password_wrong_Deleting_reset_before_add;

/*! 常看位置 */
/*! Preset */
 +(NSString *)preset_position_simplify;

/*! 免费领取30天云存储服务套餐 */
/*! Get a free 30-day cloud storage service package */
 +(NSString *)devicelis_free_30_day_cloud_storage;

/*! 帮助与反馈 */
/*! Help and Feedback */
 +(NSString *)me_help_and_feedback;

/*! 3天循环云存储，录像安全不丢失 */
/*! 3-day loop cloud storage, video security will not be lost */
 +(NSString *)devicelis_3day_loop_cloud_video_not_lost;

/*! 设置 */
/*! Set */
 +(NSString *)preset_setting_simplify;

/*! 设备一直持续录像，当电量降至%1$s以下时自动切换为最佳录像，当电量提升至%2$s以上时恢复一直录像，该模式耗电较快，适合外接电源使用。 */
/*! Record videos continuously. When battery level below %1$s, automatically switches to event record mode. When battery level above %2$s, resumes to continuous record mode. This mode consumes power fast and is suggested only when your camera works with plug-in power */
 +(NSString *)devicesetting_Adaptive_mode_more_Description_new_firmware_zhiou;

/*! 受设备性能或网络带宽限制，倍速功能暂无法正常工作 */
/*! Due to the limitation of device performance or network bandwidth, the speed up function cannot work normally. */
 +(NSString *)playback_limitation_network_speed_cannot_work;

/*! 立即使用 */
/*! Use immediately */
 +(NSString *)devicelis_Use_immediately;

/*! 30天云存储服务套餐 */
/*! 30-day cloud storage service package */
 +(NSString *)devicelis_30_day_cloud_storage_service;

/*! 设备一直持续录像，当电量降至%1$s以下时自动切换为最佳录像，当电量提升至%2$s以上时恢复一直录像 */
/*! Record videos continuously. When battery level below %1$s, automatically switches to event record mode. When battery level above %2$s, resumes to continuous record mode */
 +(NSString *)devicesetting_Adaptive_mode_Description_new_firmware_zhiou;

/*! 设备录像 */
/*! LOCAL */
 +(NSString *)playback_Device_storage_simplify;

/*! 一直录像 */
/*! Continuous Record Mode */
 +(NSString *)devicesetting_Plug_in_zhiou;

/*! 新设备已启用免费云存 */
/*! Free cloud storage enabled for new devices */
 +(NSString *)devicelis_Free_cloud_new_devices;

/*! 最佳省电 */
/*! Power Saving Mode */
 +(NSString *)devicesetting_Longest_battery_life_zhiou;

/*! 领取成功 */
/*! Get it successfully */
 +(NSString *)devicelist_Get_successfully;

/*! 云存储 */
/*! Cloud */
 +(NSString *)preset_storage_simplify;

/*! 向您展示广告，将更有利于易视云为您持续提供免费且优质的软件功能迭代服务，如报警消息推送，报警图片存储等。 */
/*! Showing advertisements to you will be more conducive to Eseecloud continuing to provide you with free and high-quality iterative software services, such as alarm message push,alarm picture storage, etc. */
 +(NSString *)start_ad_introduce;

/*! 购买云服务可查看完整录像视频 */
/*! Purchase the cloud service to view the full recorded video */
 +(NSString *)message_Purchase_cloud_full_video;

/*! 上下滑动改变摄像机镜头倍率 */
/*! Swipe up and down to change the camera lens magnification */
 +(NSString *)preview_swipeup_down_change_lens_magnifica;

/*! 车辆、宠物、包裹为AI智能识别功能，使用AI智能识别功能需先购买开通云存储服务 */
/*! Cars, pets and packages can be identified by smart detection, smart detection is available after purchasing cloud storage service. */
 +(NSString *)AI_Smart_detection_purchase_activate_cloud;

/*! AI识别 */
/*! Smart detection */
 +(NSString *)AI_Smart_detection_1;

/*! 车辆 */
/*! Car */
 +(NSString *)message_Car;

/*! 开启本地权限 */
/*! Enable local permissions */
 +(NSString *)addDevice_enable_local_permiss;

/*! 消息类型 */
/*! Message type */
 +(NSString *)message_type;

/*! 云存过期 */
/*! Cloud storage expired */
 +(NSString *)message_Cloud_storage_expired;

/*! 已选%1$s种类型 */
/*! Selected %1$s types */
 +(NSString *)message_Selected_types;

/*! 详情> */
/*! Details> */
 +(NSString *)Details;

/*! 直播画面 */
/*! Live screen */
 +(NSString *)message_Live_screen;

/*! iOS手机连接设备需要先开启本地网络权限 */
/*! To connect an iOS phone to a device, you need to enable the local network permission first. */
 +(NSString *)addDevice_iOS_connect_need_enable_local_permiss;

/*! SIM卡异常 */
/*! SIM card abnormality */
 +(NSString *)Devicesetting_SIM_card_abnormality;

/*! 购买云服务> */
/*! Buy cloud services > */
 +(NSString *)message_Buy_cloud_services;

/*! 正在加载视频 */
/*! Loading video */
 +(NSString *)message_Loading_video;

/*! 在15分钟内，您将不会收到任何检测报警消息，但所有的事件仍会被记录 */
/*! For 15 minutes, you will not receive any detection alarm messages, but all events will still be logged */
 +(NSString *)message_not_disturb_15_minutes_describe;

/*! 已开通 */
/*! Activated */
 +(NSString *)Activated;

/*! 剩余%1$s天 */
/*! %1$s days remaining */
 +(NSString *)cloud_days_remain;

/*! 购买云存服务 */
/*! Purchase cloud storage service */
 +(NSString *)AI_Purchase_cloud_storage;

/*! 云存储服务 */
/*! Cloud storage service */
 +(NSString *)AI_Cloud_storage_service;

/*! 自动模式 */
/*! Auto */
 +(NSString *)Devicesetting_Auto;

/*! 网络配置中... */
/*! Network configuration in progress... */
 +(NSString *)Devicesetting_Network_configura_progress;

/*! 查看完整云录像> */
/*! View full cloud video> */
 +(NSString *)message_View_full_cloud_video;

/*! 查看回放录像 */
/*! View playback video */
 +(NSString *)message_View_playback_video;

/*! 上拉加载更多信息 */
/*! Pull up to load more messages */
 +(NSString *)message_Pull_up_load_more;

/*! 报警画面 */
/*! Alarm screen */
 +(NSString *)message_Alarm_screen;

/*! 设备通道 */
/*! Device channels */
 +(NSString *)message_Device_channels;

/*! 设备电量低 */
/*! Equipment low battery */
 +(NSString *)message_Equipment_low_battery;

/*! 剩余%@天 */
/*! %@ days remaining */
 +(NSString *)cloud_days_remain_ios;

/*! 清除未读 */
/*! Clear unread */
 +(NSString *)message_Clear_unread;

/*! 强烈提醒 */
/*! Strong reminder */
 +(NSString *)message_Strong_reminder;

/*! 视频加载失败 */
/*! Video loading failed */
 +(NSString *)message_Video_loading_failed;

/*! AI智能识别 */
/*! Smart detection */
 +(NSString *)AI_Smart_detection;

/*! 检测到车辆 */
/*! Car detected */
 +(NSString *)message_Car_detected;

/*! 商城大促销 */
/*! Mall promotion */
 +(NSString *)message_Mall_promotion;

/*! 包裹 */
/*! Package */
 +(NSString *)message_Package;

/*! 检测到WiFi网络 */
/*! WiFi network detected */
 +(NSString *)preview_WiFi_network_detected;

/*! 4G信号强度 */
/*! 4G signal strength */
 +(NSString *)deviceSetting_4G_signal_strength;

/*! 无法读取SIM卡，请检查设备SIM卡插入状态 */
/*! Unable to read the SIM card, please check the device SIM card insertion status */
 +(NSString *)Devicesetting_Unable_read_SIM_check_insertion_status;

/*! 报警日期 */
/*! Alarm date */
 +(NSString *)message_Alarm_date;

/*! 未设置WiFi网络 */
/*! WiFi network not set up */
 +(NSString *)Devicesetting_WiFi_not_setup;

/*! 尝试WiFi连接 */
/*! Try wifi connection */
 +(NSString *)add_Try_wifi_connection;

/*! 报警消息提示音 */
/*! Alarm message tone */
 +(NSString *)message_Alarm_tone;

/*! 请输入 %1$s 密码 */
/*! Please enter %1$s password */
 +(NSString *)preview_Please_enter_password;

/*! 点击“查看帮助”解决问题 */
/*! Click \"View Help\" to solve the problem */
 +(NSString *)add_Click_Help_solve_problem;

/*! 检测到%@ */
/*! %@ detected */
 +(NSString *)message_detected_ios;

/*! 没有报警消息 */
/*! No alarm message */
 +(NSString *)message_No_alarm_message_1;

/*! 全部通道 */
/*! All channels */
 +(NSString *)message_All_channels;

/*! 立即前往> */
/*! Go to> */
 +(NSString *)message_Go_to;

/*! 已选%1$s个通道 */
/*! Selected %1$s channels */
 +(NSString *)message_Selected_channels;

/*! 总剩余时间 */
/*! Total remaining time */
 +(NSString *)cloud_total_remain_time;

/*! 增值服务订单 */
/*! Value-added service order */
 +(NSString *)Value_added_service_order;

/*! 已选%@个通道 */
/*! Selected %@ channels */
 +(NSString *)message_Selected_channels_ios;

/*! 只推送以下类型消息 */
/*! Only the following types of messages will be pushed */
 +(NSString *)message_Only_following_pushed;

/*! 暂无设备 */
/*! No equipment */
 +(NSString *)message_No_equipment;

/*! 报警图片获取失败 */
/*! Failed to get alarm picture */
 +(NSString *)message_Failed_get_alarm_picture;

/*! 未开通 */
/*! Nonactivated */
 +(NSString *)Nonactivated;

/*! 请到设备设置中的WiFi模式下进入网络状态选择WiFi网络进行重新配置 */
/*! Please go to the WiFi mode in the device settings to enter the network state and select the WiFi network to reconfigure */
 +(NSString *)preview_device_setting_WiFi_network_reconfigure;

/*! 购买云服务存储7天报警消息 */
/*! Purchase cloud service to store 7-day alarm messages */
 +(NSString *)message_Purchase_cloud_alarm;

/*! 更多报警消息> */
/*! More alarm messages> */
 +(NSString *)message_More_alarm;

/*! 画面变化 */
/*! Screen change */
 +(NSString *)Screen_change;

/*! 推送消息类型 */
/*! Push message types */
 +(NSString *)message_Push_type;

/*! 15分钟内消息勿扰 */
/*! Do not disturb messages within 15 minutes */
 +(NSString *)message_not_disturb_15_minutes;

/*! 暂无更多报警消息 */
/*! No more alarm messages */
 +(NSString *)message_No_more_alarm;

/*! 结束 */
/*! Finish */
 +(NSString *)message_Finish;

/*! 关闭后您的手机将不再接收此设备的系统推送消息，但您仍可在APP内的报警消息中查看记录 */
/*! After it is turned off, your phone will no longer receive system push messages from this device, but you can still view the record in the alarm message in the APP */
 +(NSString *)message_After_closing_nolonger_alarm_notifica_record;

/*! 重播 */
/*! Replay */
 +(NSString *)message_Replay;

/*! 暂无系统通知 */
/*! No system notifications */
 +(NSString *)message_No_system_notifications;

/*! 播放中 */
/*! Playing */
 +(NSString *)message_Playing;

/*! 直播 */
/*! Live broadcast */
 +(NSString *)message_Live_broadcast;

/*! 检测到您已关闭本APP的系统消息通知权限，会导致手机无法收到设备的报警消息通知，请前往系统设置中开启 */
/*! System message permission has been turned off, cannot receive push notifications, please go to the system settings to turn it on */
 +(NSString *)message_detected_turned_app_notifica_not_alarm_settings;

/*! 循环存储%@天 */
/*! Cyclic storage %@ days */
 +(NSString *)cloud_cyclic_storage_day_ios;

/*! 报警设备 */
/*! Alarm devices */
 +(NSString *)message_Alarm_devices;

/*! 移动 */
/*! Mobile */
 +(NSString *)Mobile;

/*! 有%@条新消息 */
/*! There are %@ new messages */
 +(NSString *)message_There_are_new_ios;

/*! 轻微提示 */
/*! Slight reminder */
 +(NSString *)message_slight_reminder;

/*! 报警图片升级为视频 */
/*! Alarm picture upgraded to video */
 +(NSString *)message_Alarm_picture_upgraded_video;

/*! 当前设备网络异常无法使用WiFi模式，请检测路由器WiFi状态是否正常 */
/*! The current device network is abnormal and the WiFi mode cannot be used. Please check whether the WiFi status of the router is normal. */
 +(NSString *)Devicesetting_network_abnormal_check_WiFi_normal;

/*! 宠物 */
/*! Pet */
 +(NSString *)message_Pet;

/*! 选择时间范围 */
/*! Select time range */
 +(NSString *)message_Select_time_range;

/*! 设备4G卡无法正常联网 */
/*! The 4G card of the device cannot be connected to the Internet normally */
 +(NSString *)add_4G_network_abnormality_describe;

/*! 已选%@种类型 */
/*! Selected %@ type */
 +(NSString *)message_Selected_types_ios;

/*! 重新加载> */
/*! Reload> */
 +(NSString *)message_Reload;

/*! 收起 */
/*! Put away */
 +(NSString *)message_Put_away;

/*! 正在下载录像视频，退出会停止下载队列中的录像视频，是否确定后退出？ */
/*! Downloading the recorded video, exiting will stop the recorded video in the download queue. Are you sure you want to exit? */
 +(NSString *)message_download_video_stop_exit_queue_sure;

/*! 识别宠物、车辆、包裹 */
/*! Identify pets, cars, packages */
 +(NSString *)AI_Identify_pet_car_package;

/*! 购买开通云存储服务套餐，立即享用AI智能识别推送功能 */
/*! Purchasing cloud storage services, you can use the smart detection service. */
 +(NSString *)AI_Purcha_cloud_storage_smart_detection;

/*! 筛选报警消息 */
/*! Filter alarm messages */
 +(NSString *)message_Filter_alarm;

/*! 结束消息勿扰？ */
/*! Do not disturb the end message? */
 +(NSString *)message_not_disturb_end_message;

/*! 设置WiFi网络 */
/*! Set up a WiFi network */
 +(NSString *)Devicesetting_Setup_WiFi_network;

/*! 设备支持连接2.4G 或5G WiFi网络 */
/*! The device supports connecting to 2.4G or 5G WiFi network */
 +(NSString *)addDevice_supports_24G_5G_network;

/*! 延长使用 */
/*! Extended use */
 +(NSString *)cloud_extended_use;

/*! 自动模式优先使用WiFi网络 */
/*! Auto mode prioritizes the use of WiFi networks */
 +(NSString *)Devicesetting_Auto_prioritizes_use_wifi;

/*! 已将所有消息标记为已读 */
/*! Marked all messages as read */
 +(NSString *)message_Marked_all_read;

/*! 开启勿扰 */
/*! Turn on Do Not Disturb */
 +(NSString *)message_Turn_Do_Not_Disturb;

/*! 选择报警消息提示音 */
/*! Select an alarm message tone */
 +(NSString *)message_Select_alarm_tone;

/*! 共%@条消息 */
/*! Total %@ messages */
 +(NSString *)messages_Total_ios;

/*! 报警录像获取失败 */
/*! Alarm video access failed */
 +(NSString *)message_Alarm_video_access_failed;

/*! 系统通知 */
/*! System notification */
 +(NSString *)System_notification;

/*! 停止 */
/*! Stop */
 +(NSString *)message_Stop;

/*! 请耐心等待1-2分钟 */
/*! Please be patient for 1-2 minutes */
 +(NSString *)Devicesetting_Please_patient_minutes;

/*! 共%1$s条消息 */
/*! Total%1$s messages */
 +(NSString *)messages_Total;

/*! 无法收到报警消息？立即开启通知> */
/*! Can\'t receive alarm message? Turn on notifications immediately> */
 +(NSString *)alarm_message_turn_notifications;

/*! 选择通道查看云服务管理 */
/*! Select a channel to view cloud service management */
 +(NSString *)cloud_Select_channel_management;

/*! 查看回放录像> */
/*! View playback video> */
 +(NSString *)message_View_playback_video_1;

/*! 循环存储%1$s天 */
/*! Cyclic storage %1$s days */
 +(NSString *)cloud_cyclic_storage_day;

/*! 勿扰模式已开启 */
/*! Do Not Disturb is on */
 +(NSString *)message_Do_Not_Disturb_on;

/*! 检测到宠物 */
/*! Pet detected */
 +(NSString *)message_Pet_detected;

/*! 检测到包裹 */
/*! Package detected */
 +(NSString *)message_Package_detected;

/*! 人 */
/*! Human */
 +(NSString *)message_People;

/*! 重新连接> */
/*! Reconnect> */
 +(NSString *)message_Reconnect;

/*! 4G过期 */
/*! 4G expired */
 +(NSString *)message_4G_expired;

/*! 展开全部 */
/*! Expand all */
 +(NSString *)message_Expand_all;

/*! 立即修复> */
/*! Fix now> */
 +(NSString *)message_Fix_now;

/*! 检测到%1$s */
/*! %1$s detected */
 +(NSString *)message_detected;

/*! 选择摄像机联网模式 */
/*! Select camera networking mode */
 +(NSString *)Devicesetting_Select_camera_network;

/*! 给摄像机配置WIFI网络 */
/*! Configure the WIFI network for the camera */
 +(NSString *)Devicesetting_Configure_WIFI_network;

/*! 4G网络异常 */
/*! 4G network abnormality */
 +(NSString *)add_4G_network_abnormality;

/*! 智能识别、视频VIP等增值服务 */
/*! Smart detection, video VIP and other value-added services */
 +(NSString *)Value_added_service_order_describe;

/*! 请输入 %@ 密码 */
/*! Please enter %@ password */
 +(NSString *)preview_Please_enter_password_ios;

/*! 报警消息 */
/*! Alarm message */
 +(NSString *)Alarm_message;

/*! 暂无报警消息 */
/*! No alarm message */
 +(NSString *)message_No_alarm_message;

/*! 4G模式 */
/*! 4G */
 +(NSString *)Devicesetting_4G;

/*! 有%1$s条新消息 */
/*! There are %1$s new messages */
 +(NSString *)message_There_are_new;

/*! 请检测路由器WiFi状态是否正常，再选择网络信号正常的WiFi进行配置 */
/*! Please check whether the WiFi status of the router is normal, and then select the WiFi with normal network signal to configure */
 +(NSString *)Devicesetting_check_WiFi_status_select_signal;

/*! 精确识别人、车、宠物、包裹等并通过APP推送通知 */
/*! Accurately identify human, cars, pets, packages, etc. and push notifications through APP */
 +(NSString *)AI_Smart_detection_describe;

/*! 查看帮助> */
/*! View help> */
 +(NSString *)message_View_Help;

/*! 视频加载中··· */
/*! Video loading... */
 +(NSString *)message_Video_loading;

/*! WiFi模式 */
/*! WiFi */
 +(NSString *)Devicesetting_WiFi;

/*! 有报警消息时，手机消息提示声音将持续15秒 */
/*! When there is an alarm message, the mobile phone message prompt sound will last for 15 seconds */
 +(NSString *)message_Strong_reminder_describe;

/*! 关闭后设备将不再产生报警消息记录，且您将不再接收到此设备的报警消息通知 */
/*! After shutting down the device will no longer generate alarm messages and you will no longer receive push notifications */
 +(NSString *)message_After_shutdown_nolonger_alarm_notifica;

/*! 有报警消息时，手机消息提示声音将持续5秒 */
/*! When there is an alarm message, the mobile phone message prompt sound will last for 5 seconds */
 +(NSString *)message_slight_hint_describe;

/*! 当前设备还未设置WiFi网络，请先给设备设置WiFi网络，否则无法使用WiFi模式 */
/*! The current device has not set up the WiFi network, please set the WiFi network for the device first, otherwise the WiFi mode cannot be used */
 +(NSString *)Devicesetting_WiFi_not_setup_describe;

/*! 开启消息勿扰 */
/*! Turn on Do Not Disturb */
 +(NSString *)message_Turn_Do_Not_Disturb_1;

/*! 在此期间，您将不会收到任何检测报警消息，但所有的事件仍会被记录 */
/*! During this time, you will not receive any detection alarm messages, but all events will still be logged */
 +(NSString *)message_time_not_receive_alarm_messages_still_logged;

/*! 无网络 */
/*! No network */
 +(NSString *)message_No_network;

/*! 该设备已被绑定，请长按设备Reset键重启成功后再添加 */
/*! The device has been bound, please long press the reset button of the device to restart successfully before adding */
 +(NSString *)add_device_been_bound_long_press_reset_restart;

/*! 设备开机 */
/*! Device power on */
 +(NSString *)add_Device_power_on;

/*! 查看您的4G卡说明书中提到的充值方式，或联系4G卡运营商获取充值方式。 */
/*! Check the recharge method mentioned in your 4G card manual, or contact the 4G card operator for the recharge method. */
 +(NSString *)addDevice_solution_for_device_offline_9;

/*! 警报录像 */
/*! Alarm recording */
 +(NSString *)cloud_Alarm_recording;

/*! 身份验证类型 */
/*! Authentication type */
 +(NSString *)add_Authentication_type;

/*! 设备已被添加，请删除后再重新添加 */
/*! The device has been added, please delete it and add it again */
 +(NSString *)add_device_been_add_delete_again;

/*! 100M免费流量试用 */
/*! 100M free data trial */
 +(NSString *)add_100M_free_data;

/*! 听到提示音 */
/*! Hear the prompt tone */
 +(NSString *)add_Hear_prompt_tone;

/*! 已获赠%@天云存储服务 */
/*! %@ days of cloud storage service has been given */
 +(NSString *)cloud_storage_been_given_ios;

/*! 我要使用自己的SIM卡 */
/*! I want to use my own SIM card */
 +(NSString *)add_use_my_own_SIM;

/*! 启用设备内置云卡（虚拟SIM卡），请点击此处 */
/*! To enable the device built-in cloud card (virtual SIM card), please click here */
 +(NSString *)add_enable_device_built_cloud_virtual_click;

/*! 点击此处 */
/*! click here */
 +(NSString *)click_here;

/*! *免费流量可试用 */
/*! *Free data available for trial */
 +(NSString *)add_Free_data_available_trial;

/*! 月套餐 */
/*! Monthly Plan */
 +(NSString *)add_Monthly_Plan;

/*! %1$s天套餐 */
/*! %1$s day plan */
 +(NSString *)add_day_plan;

/*! 检查您的设备是否插入了实体SIM卡，如果设备中有实体SIM卡请将其拔出，然后点击下方“已拔出SIM卡”按钮。 */
/*! Check whether your device has a physical SIM card inserted, if there is a physical SIM card in the device, please pull it out, and then click the \"SIM card removed\" button below. */
 +(NSString *)add_Check_device_physical_SIM_pull_out_click_button;

/*! 配置失败 */
/*! Configuration failed */
 +(NSString *)add_Configuration_failed;

/*! 云存储服务将在%@天后过期 */
/*! Cloud storage service will expire in %@ days */
 +(NSString *)cloud_storage_service_will_expire_ios;

/*! 云卡配置 */
/*! Cloud card configuration */
 +(NSString *)add_Cloud_card_configuration;

/*! 以下操作请遵循说明书或商家指导操作，如果您不懂下面功能的含义，请不要点击。 */
/*! For the following operations, please follow the instructions or business instructions. If you do not understand the meaning of the following functions, please do not click. */
 +(NSString *)add_follow_operations_business_instructions_not_click;

/*! 如果听到设备播报“配网失败”请点击此处 */
/*! If you hear the device broadcast \"Network configuration failed\", click here */
 +(NSString *)add_Click_hear_broadcast_Network_failed;

/*! 联络您的摄像机销售商协助解决配网问题，或点击下方“在线客服”联系客服解决问题。 */
/*! Contact your camera seller to help solve the distribution network problem, or click \"Online Customer Service\" below to contact customer service to solve the problem. */
 +(NSString *)add_Camera_networking_failed_3;

/*! 你的设备可能需要设置 APN 才能配置网络 */
/*! Your device may need to set up an APN to configure the network */
 +(NSString *)add_device_need_set_APN_configure_network;

/*! 请插入SIM卡然后长按设备Reset键重启设备，等待设备重启完毕指示灯闪烁或常亮点击下一步 */
/*! Please insert the SIM card and restart the device by pressing and holding the reset button on the device,if the light flashes or stays on, click Next */
 +(NSString *)add_SIM_restart_button_light_flashes_stays;

/*! 确认4G SIM卡插入正确，没有接触不良的情况。 */
/*! Confirm that the 4G SIM card is inserted correctly and there is no bad contact. */
 +(NSString *)add_4G_camera_cannot_connected_Internet_check_3;

/*! 免费领取%@天AI套餐 */
/*! Get %@ day AI package for free */
 +(NSString *)AI_Get_package_free_ios;

/*! 云存储服务将在%1$s天后过期 */
/*! Cloud storage service will expire in %1$s days */
 +(NSString *)cloud_storage_service_will_expire;

/*! 设备中没有SIM卡 */
/*! There is no SIM card in the device */
 +(NSString *)add_no_SIM_card_device;

/*! 移动网络无法连接成功，可能是信号不佳导致，请换个地方尝试或稍后再试。 */
/*! The mobile network could not be connected successfully. It may be caused by poor signal. Please try another location or try again later. */
 +(NSString *)add_Camera_networking_failed_1;

/*! 4G摄像机无法正常联网，请排查以下情况： */
/*! The 4G camera cannot be connected to the Internet, please check the following situations: */
 +(NSString *)add_4G_camera_cannot_connected_Internet_check;

/*! 确认您的4G卡已激活，且剩余流量充足。 */
/*! Make sure your 4G card is activated and the remaining data is sufficient. */
 +(NSString *)add_4G_camera_cannot_connected_Internet_check_1;

/*! 请检查您的设备是否开机或通电。如果您的摄像机需要电池供电，请提前充电确保电量充足。 */
/*! Please check that your device is turned on or powered on. If your camcorder requires battery power, please charge it in advance to ensure sufficient power. */
 +(NSString *)add_indicator_light_not_on_1;

/*! 摄像机联网失败 */
/*! Camera networking failed */
 +(NSString *)add_Camera_networking_failed;

/*! 确认使用云卡 */
/*! Confirm to use cloud card */
 +(NSString *)add_Confirm_use_cloud_card;

/*! 设备正在配网确定是否退出？ */
/*! The device is configuring the network. Do you want to exit? */
 +(NSString *)add_device_network_want_exit;

/*! 输入APN */
/*! Enter APN */
 +(NSString *)add_Enter_APN;

/*! 了解更多云卡信息 */
/*! Learn more about cloud card information */
 +(NSString *)add_Learn_more_cloud_information;

/*! 已插入SIM卡并重启设备 */
/*! SIM card inserted and device restarted */
 +(NSString *)add_SIM_card_restarted;

/*! 云存将在%@天后过期 */
/*! Cloud storage will expire in %@ days */
 +(NSString *)cloud_storage_will_expire_ios;

/*! 资费参考 */
/*! Fee reference */
 +(NSString *)add_Fee_reference;

/*! 重启设备 */
/*! restart the device */
 +(NSString *)restart_the_device;

/*! 二维码正对设备镜头15-25cm处待设备反应 */
/*! Hold the QR code about 15-25cm in front of your camera and wait for the device to respond */
 +(NSString *)add_QR_code_front_camera_wait_respond;

/*! 设备添加成功，为您的设备命名吧 */
/*! The device is added successfully, please name your device */
 +(NSString *)add_device_added_successfully_name;

/*! 连接过程大约需要3-5分钟，请不要离开此页面 */
/*! The connection process takes about 3-5 minutes, please do not leave this page */
 +(NSString *)add_connection_process_minutes_not_leave_this_page;

/*! *APN (必填) */
/*! *APN (required) */
 +(NSString *)add_APN_required;

/*! 自动备份 安全存储 */
/*! Automatic backup of Safe storage */
 +(NSString *)cloud_auto_backup_safe_storage;

/*! 实体SIM卡 */
/*! Physical SIM */
 +(NSString *)add_Physical_SIM;

/*! 重启设备并跟随指示操作，请长按设备Reset键重启设备，待设备重启完毕指示灯闪烁或常亮点击下一步 */
/*! Restart the device and follow the instructions, please long press the reset button of the device to restart the device, and when the device restarts, the indicator light flashes or stays on, click Next */
 +(NSString *)add_Restart_device_follow_instructions_reset_button_light_flashes_stays_Next;

/*! 设备指示灯闪烁或长亮 */
/*! Device indicator blinks or stays on */
 +(NSString *)add_Device_indicator_blinks_stayson;

/*! 使用设备自带的虚拟SIM卡方案，自动选择信号最佳的运营商网络。 */
/*! Use the virtual SIM card solution that comes with the device to automatically select the carrier network with the best signal. */
 +(NSString *)add_Using_cloud_card_virtual_describe;

/*! 指示灯闪烁：代表设备正在检索网络。 */
/*! Blinking light: The device is retrieving the network. */
 +(NSString *)add_difference_between_flicker_always_on_1;

/*! 无限容量 */
/*! Unlimited capacity */
 +(NSString *)cloud_Unlimited_capacity;

/*! 季套餐 */
/*! Season Plan */
 +(NSString *)add_Season_Plan;

/*! 请将您的设备通电开机，查看设备指示灯是否处于闪烁状态，然后点击下一步 */
/*! Please power on your device, check if the device indicator is flashing, and then click Next */
 +(NSString *)add_power_on_device_indicator_flashing_Next;

/*! 输入APN user */
/*! Enter APN user */
 +(NSString *)add_Enter_APN_user;

/*! 连接过程大约需要1-3分钟，请不要离开此页面 */
/*! The connection process takes about 1-3 minutes, please do not leave this page */
 +(NSString *)add_connection_process_minutes_not_leave_this_page_1;

/*! SIM卡配置 */
/*! SIM card configuration */
 +(NSString *)add_SIM_card_configuration;

/*! 已拔出SIM卡 */
/*! SIM card removed */
 +(NSString *)add_SIM_card_removed;

/*! 输入APN password */
/*! Enter APN password */
 +(NSString *)add_Enter_APN_password;

/*! *如果设备配有SIM卡请先插入SIM卡再开机 */
/*! *If the device is equipped with a SIM card, please insert the SIM card before turning it on */
 +(NSString *)add_device_SIM_card_before_turning_on;

/*! 声光报警 */
/*! Sound and light siren */
 +(NSString *)preview_Sound_and_light_siren;

/*! PAP 或 CHAP */
/*! PAP or CHAP */
 +(NSString *)add_PAP_or_CHAP;

/*! 云存将在%1$s天后过期 */
/*! Cloud storage will expire in %1$s days */
 +(NSString *)cloud_storage_will_expire;

/*! 年套餐 */
/*! Annual Plan */
 +(NSString *)add_Annual_Plan;

/*! 指示灯常亮：代表设备已经联网成功。 */
/*! The indicator light is always on: it means that the device has been successfully connected to the Internet. */
 +(NSString *)add_difference_between_flicker_always_on_2;

/*! AI识别数据载入中... */
/*! AI recognition data loading... */
 +(NSString *)AI_recognition_data_loading;

/*! 联系您的4G卡运营商，协助排查无法联网的原因。 */
/*! Contact your 4G card operator to assist in troubleshooting the reason for the inability to connect to the Internet. */
 +(NSString *)add_4G_camera_cannot_connected_Internet_check_4;

/*! 使用云卡（虚拟SIM卡） */
/*! Using a cloud card (virtual SIM card) */
 +(NSString *)add_Using_cloud_card_virtual;

/*! 免费领取%1$s天AI套餐 */
/*! Get %1$s day AI package for free */
 +(NSString *)AI_Get_package_free;

/*! 已获赠%1$s天云存储服务 */
/*! %1$s days of cloud storage service has been given */
 +(NSString *)cloud_storage_been_given;

/*! 使用实体SIM卡 */
/*! Use a physical SIM card */
 +(NSString *)add_Use_physical_SIM_card;

/*! %@天套餐 */
/*! %@ day plan */
 +(NSString *)add_day_plan_ios;

/*! 在线客服 */
/*! Online service */
 +(NSString *)add_Online_service;

/*! 如内置云卡（虚拟卡）始终无法联网，可能是当地没有适合的网络，您可以插入实体SIM让设备联网。 */
/*! If the built-in cloud card (virtual card) is still unable to connect to the Internet, it may be that there is no suitable network in the local area. You can insert the physical SIM to connect the device to the Internet. */
 +(NSString *)add_Camera_networking_failed_2;

/*! 以下参数设置请查阅SIM卡说明书，或联系SIM卡渠道客服 */
/*! Please refer to the SIM card manual for the following parameter settings, or contact the SIM card channel customer service */
 +(NSString *)add_refer_SIM_manual_parameter_settings_customer_service;

/*! 4G卡没有信号，换一个地方重启设备。 */
/*! If the 4G card has no signal, change to another place，restart the device. */
 +(NSString *)add_4G_camera_cannot_connected_Internet_check_2;

/*! 云卡（虚拟SIM卡）联网成功 */
/*! Cloud Card (Virtual SIM Card) Networking Successfully */
 +(NSString *)add_Cloud_Virtual_SIM_Successfully;

/*! 配网中... */
/*! Networking... */
 +(NSString *)add_Networking;

/*! 套餐时间 */
/*! Package time */
 +(NSString *)cloud_Package_time;

/*! 部分4G运营商需要设置APN才能联网，请点击下方按钮进行设置。 */
/*! Some 4G operators need to set up APN to connect to the Internet, please click the button below to set. */
 +(NSString *)add_Some_4G_operators_APN_Internet_click_set;

/*! 为了更好的帮助设备配网，请选择您使用的联网方式。 */
/*! In order to better help the device to configure the network, please select the network connection method you use. */
 +(NSString *)add_better_help_device_network_select_use;

/*! 无法配置网络 */
/*! Unable to configure network */
 +(NSString *)add_Unable_configure_network;

/*! 配置设备 */
/*! Configure the device */
 +(NSString *)add_Configure_device;

/*! CHAP */
/*! CHAP */
 +(NSString *)add_CHAP;

/*! 指示灯没有亮？ */
/*! The indicator light is not on? */
 +(NSString *)add_indicator_light_not_on;

/*! 设备卡槽中有插入实体SIM卡，使用此SIM卡运营商网络联网。 */
/*! There is a physical SIM card inserted in the card slot of the device, and use the SIM card to connect to the network of the operator. */
 +(NSString *)add_Use_physical_SIM_card_describe;

/*! 倍速播放 */
/*! High-speed playback */
 +(NSString *)cloud_High_speed_playback;

/*! APN设置 */
/*! APN settings */
 +(NSString *)add_APN_settings;

/*! 闪烁与常亮的区别 */
/*! The difference between flickering and always on */
 +(NSString *)add_difference_between_flicker_always_on;

/*! PAP */
/*! PAP */
 +(NSString *)add_PAP;

/*! 您将失去以下权益： */
/*! You will lose the following benefits: */
 +(NSString *)cloud_will_lose_following_benefits;

/*! SIM卡需要配置APN，请点击此处 */
/*! SIM card needs to be configured with APN, please click here */
 +(NSString *)add_SIM_configured_with_APN_click;

/*! 录像加密 */
/*! Video encryption */
 +(NSString *)cloud_Video_encryption;

/*! 网页由%1$s提供 */
/*! Web page provided by %1$s */
 +(NSString *)mall_Web_page_provided;

/*! 网页由%@提供 */
/*! Web page provided by %@ */
 +(NSString *)mall_Web_page_provided_ios;

/*! 网络切换中，可能需要2-3分钟时间，请耐心等待 */
/*! During the network switching, it may take 2-3 minutes, please be patient */
 +(NSString *)Devicesetting_network_switch_patient;

/*! 如果不想使用云卡了怎么关闭？ */
/*! How to close if I don\'t want to use the cloud card? */
 +(NSString *)add_Learn_about_cloud_card_7;

/*! 4G流量套餐 */
/*! 4G Data Plan */
 +(NSString *)Person_4G_data_plan;

/*! 各地区的运营商资费不同，云卡激活后有免费的试用流量。您可以在试用期间点击充值，查看具体的套餐资费。 */
/*! Operators in different regions have different tariffs. After the cloud card is activated, there is free trial traffic. You can click Recharge during the trial period to view the specific package tariff. */
 +(NSString *)add_Learn_about_cloud_card_6;

/*! 主页 */
/*! Homepage */
 +(NSString *)Person_Homepage;

/*! 选择迁移通道 */
/*! Select the migration channel */
 +(NSString *)cloud_select_migration_channel;

/*! 云卡的费用是怎样的？ */
/*! What is the cost of the cloud card? */
 +(NSString *)add_Learn_about_cloud_card_5;

/*! 了解云卡 */
/*! Learn about cloud card */
 +(NSString *)add_Learn_about_cloud_card;

/*! 云卡可以支持全球范围内绝大多数运营商网络，并且可以自动选择最佳信号与最优资费的运营商网络进行联网，如果您当前使用的实体卡运营商网络体验不佳，可以尝试使用云卡进行网络连接。 */
/*! The cloud card can support the vast majority of operator networks in the world, and can automatically select the best signal and the operator network with the best tariff for networking. card for network connection. */
 +(NSString *)add_Learn_about_cloud_card_4;

/*! 商店 */
/*! Store */
 +(NSString *)Person_store;

/*! 云卡有什么优点？ */
/*! What are the advantages of cloud card? */
 +(NSString *)add_Learn_about_cloud_card_3;

/*! 客服 */
/*! Support */
 +(NSString *)Person_support;

/*! 云卡是摄像机内置的虚拟SIM卡方案，无需用户插入实体SIM卡就可以让摄像机连接4G网络。 */
/*! The cloud card is a virtual SIM card solution built into the camera, which allows the camera to connect to the 4G network without inserting a physical SIM card. */
 +(NSString *)add_Learn_about_cloud_card_2;

/*! 免费礼物/保修登记 */
/*! Free Gift/Register Warranty */
 +(NSString *)Person_free_gift;

/*! 什么是云卡？ */
/*! What is a cloud card? */
 +(NSString *)add_Learn_about_cloud_card_1;

/*! 如果您不想再使用云卡，可以插入实体SIM卡后重启摄像机，摄像机开机后会自动切换使用您的实体SIM卡网络。 */
/*! If you don\'t want to use the cloud card, you can insert the physical SIM card and restart the camera. After the camera is powered on, it will automatically switch to use your physical SIM card network. */
 +(NSString *)add_Learn_about_cloud_card_8;

/*! 上次登录 */
/*! Last login */
 +(NSString *)Last_login;


@end

NS_ASSUME_NONNULL_END
