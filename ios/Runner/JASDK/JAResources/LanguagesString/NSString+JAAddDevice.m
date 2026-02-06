//
//  NSString+JAAddDevice.m
//  JUANUtil
//
//  Created by Wynton on 2018/3/11.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSString+JAAddDevice.h"

@implementation NSString(JAAddDevice)

+ (NSString *)ja_addDevice_unfinished{return LTAddDev(@"addDevice_unfinished");}

+ (NSString *)ja_ok{return LTAddDev(@"confirm");}

+ (NSString *)ja_addDevice{return LTAddDev(@"addDevice");}

+ (NSString *)ja_IDAddDevice{return LTAddDev(@"addDevice_ID_addition");};
+ (NSString *)ja_IPAddDevice{return LTAddDev(@"addDevice_IP_addition");};

+ (NSString *)ja_deviceID{return LTAddDev(@"device_id");}
+ (NSString *)ja_deviceIDPlackholer{return LTAddDev(@"addDevice_ID_input");}

+ (NSString *)ja_eseeID{return LTAddDev(@"cloud_ID");}
+ (NSString *)ja_eseeIDPlackholer{return LTAddDev(@"addDevice_ID_cloud_input");}

+ (NSString *)ja_IPDDNS{return LTAddDev(@"addDevice_process_IP_DDNS");}
+ (NSString *)ja_IPDDNSPlackholer{return LTAddDev(@"addDevice_IP_or_DDNS");}

+ (NSString *)ja_port{return LTAddDev(@"addDevice_port_number");}
+ (NSString *)ja_portPlackholer{return LTAddDev( @"addDevice_port_input");}

+ (NSString *)ja_deviceNick{return LTAddDev(@"device_nick_designation");}
+ (NSString *)ja_deviceNickPlackholer{return LTAddDev(@"addDevice_name_input");}

+ (NSString *)ja_userName{return LTAddDev(@"addDevice_user_name");}
+ (NSString *)ja_userNamePlackholder{return LTAddDev(@"addDecice_user_input");}

+ (NSString *)ja_password{return LTAddDev(@"password");}
+ (NSString *)ja_passwordPlackholer{return LTAddDev(@"addDevice_enter_password");}

+ (NSString *)ja_channelCount{return LTAddDev(@"addDevice_choose_channel");}
+ (NSString *)ja_panorama{return LTAddDev(@"addDevice_choose_panorama");}

+ (NSString *)ja_pushToChooseWiFi{return LTAddDev(@"addDevice_setting_wifiToPhone");}

+ (NSString *)ja_apHelp1{return LTAddDev(@"addDevice_openThePhone_setting");}
+ (NSString *)ja_apHelp2{return LTAddDev(@"addDevice_into_WIFI");}
+ (NSString *)ja_apHelp3{return LTAddDev(@"addDevice_select_IPC");}
+ (NSString *)ja_apHelp4{return LTAddDev(@"addDevice_initial_password");}
+ (NSString *)ja_apHelp5{return LTAddDev(@"addDevice_waittingAndBack_APP");}

+ (NSString *)ja_connectWiFi{return LTAddDev(@"connetion_WIFI");}
+ (NSString *)ja_inputWiFiSSIDPlaceholder{return LTAddDev(@"addDevice_WIFI_name_input");}
+ (NSString *)ja_inputWiFiPasswordPlaceholder{return LTAddDev(@"addDevice_WIFI_password_input");}

+ (NSString *)ja_configWiFiWithDevice:(NSString *)device{return [NSString stringWithFormat:LTAddDev(@"addDevice_connection_WIFI_ios"),device];}

+ (NSString *)ja_configWiFiTips{return LTAddDev(@"addDevice_update_network");}

+ (NSString *)ja_next{return  LTAddDev(@"next");}
+ (NSString *)ja_retry{return LTAddDev(@"retry");}

+ (NSString *)ja_configTimeout{return LTAddDev(@"connection_timeout");}
+ (NSString *)ja_configConnectFail{return LTAddDev(@"myDevice_deviceStatus_authFail");}
+ (NSString *)ja_configFail{return LTAddDev(@"addDevice_fail");}
+ (NSString *)ja_configSuccess{return LTAddDev(@"configuration_successful");}

+ (NSString *)ja_chooseDevice{return LTAddDev(@"addDevice_choose");}
+ (NSString *)ja_deviceConnecting{return LTAddDev(@"myDevice_connection");}
+ (NSString *)ja_deviceConnectFail{return LTAddDev(@"myDevice_deviceStatus_authFail");}
+ (NSString *)ja_deviceDisconnect{return LTAddDev(@"connection_broken");}

+ (NSString *)ja_currentWiFiNotDeviceAP{return LTAddDev(@"addDevice_connecting_hotspot");}
+ (NSString *)ja_connectingDeviceAP{return LTAddDev(@"addDevice_connecting");}

+ (NSString *)ja_addDeviceWithOtherWays{return LTAddDev(@"addDevice_other_add");}

+ (NSString *)ja_addDeviceConfigTopTips{return LTAddDev(@"addDevice_connection_holdOn");}
+ (NSString *)ja_addDeviceConfigBtmTips{return LTAddDev(@"addDevice_guideReset_configuration");}

+ (NSString *)ja_addDeviceSetPaswordForDevice
{return LTAddDev(@"addDevice_setting_tips_advice");}

+ (NSString *)ja_pleaseConnectLANWithSameOfDevice{return LTAddDev(@"device_connect_LAN");}
+ (NSString *)ja_connectAuthFailAndConfigAgain{return LTAddDev(@"addDevice_validationFailed_reconfigure");}

+ (NSString *)ja_deviceNickFormatFail{return LTAddDev(@"addDevice_nickname_error");}
+ (NSString *)ja_ipFormatFail{return LTAddDev(@"addDevice_IP_formatFail");}
+ (NSString *)ja_eseeIDFormatFail{return LTAddDev(@"addDevice_ID_formatFail");}
+ (NSString *)ja_portFormatFail{return LTAddDev(@"addDevice_port_format");}
+ (NSString *)ja_deviceUserFormatFail{return LTAddDev(@"addDevice_userName_error");}
+ (NSString *)ja_devicePasswordFormatFail{return LTAddDev(@"addDevice_passwordFormat_error");}
+ (NSString *)ja_devicePasswordLengthExceed{return LTAddDev(@"password_tips_length");}

+ (NSString *)ja_scanDevices{return LTAddDev(@"scanning_device");}
+ (NSString *)ja_existDeviceID{return LTAddDev(@"addDevice_already_exists");}
+ (NSString *)ja_existDeviceNickname{return LTAddDev(@"devSetting_name_existing");}

+ (NSString *)ja_adding{return LTAddDev(@"add_being");}
+ (NSString *)ja_invalidQRCode{return LTAddDev(@"addDevice_error_qrcodeInvalid");}

+ (NSString *)ja_lanSearch{return LTAddDev(@"scan_LAN");}
+ (NSString *)ja_skip:(int)second{return [NSString stringWithFormat:LTAddDev(@"addDevice_setting_password_tips_plural_ios"),second] ;}

+ (NSString *)ja_passwordWrong{return LTAddDev(@"device_password_error");}
+ (NSString *)ja_connectUserWifiFailOrNoFindDevice{return  LTAddDev(@"prompt_connectToWiFi_failed");}
+ (NSString *)ja_networkTimeout{return LTAddDev(@"prompt_network_timeout");}
+ (NSString *)ja_connectDeviceFailOrPWDWrongOrTimeout{return LTAddDev(@"prompt_connection_failed");}
+ (NSString *)ja_connectDeviceHotspotOrBLEFail{return LTAddDev(@"prompt_connectHotspot_failed");}
+ (NSString *)ja_getDeviceInfoFailOrPWDWrongOrTimeout{return LTAddDev(@"prompt_obtainInformation_failed");}
+ (NSString *)ja_setDeviceFailPWDWrongOrTimeout{return LTAddDev(@"prompt_setInformation_failed");}
+ (NSString *)ja_sendBLEFailBLECloseOrnoReplyOrTimeout{return LTAddDev(@"prompt_sendData_bluetooth_failed");}

+ (NSString *)ja_livingRoom{return LTAddDev(@"addDevice_nameExample_parlor");}
+ (NSString *)ja_masterBedroom{return LTAddDev(@"addDevice_nameExample_masterBedRoom");}
+ (NSString *)ja_studyRoom{return LTAddDev(@"addDevice_nameExample_study");}
+ (NSString *)ja_office{return LTAddDev(@"addDevice_nameExample_office");}

+ (NSString *)ja_resetSuccess{return LTAddDev(@"addDevice_reset_success");}
+ (NSString *)ja_yes{return  LTAddDev(@"yes");}
+ (NSString *)ja_no{return  LTAddDev(@"no");}
+ (NSString *)ja_add{return LTAddDev(@"add");}
+ (NSString *)ja_enterPassword{return LTAddDev(@"enter_your_password");}

+ (NSString *)ja_deviceNetworked{return LTAddDev(@"addDevice_networked");}
+ (NSString *)ja_configFailPrompt{return LTAddDev(@"addDevice_settingFail_prompt");}
+ (NSString *)ja_MyDevice{return LTAddDev(@"my_device");}
+ (NSString *)ja_unsearchable{return LTAddDev(@"addDevice_unsearchable");}
+ (NSString *)ja_setting{return LTAddDev(@"setting");}
+ (NSString *)ja_continue{return LTAddDev(@"interface_continue");}
+ (NSString *)ja_dropout{return LTAddDev(@"cloud_error_tips_drop");}

+ (NSString *)ja_networkAlert{return LTAddDev(@"myDevice_networkAlert");}

+ (NSString *)ja_networkChoose{return LTAddDev(@"adddevice_Wireless_add_mode");}
+ (NSString *)ja_networkWIFI{return LTAddDev(@"addDevice_WIFI");}
+ (NSString *)ja_networkWired{return LTAddDev(@"adddevice_Wireless_add_mode_wired");}
+ (NSString *)ja_networkPrompt{return LTAddDev(@"adddevice_Wireless_add_mode_prompt");}
+ (NSString *)ja_networkConfirm{return LTAddDev(@"adddevice_Wireless_add_mode_confirm");}
+ (NSString *)ja_networkDevicePassword{return LTAddDev(@"adddevice_Wireless_add_mode_wired_device_password");}
+ (NSString *)ja_cancel{return LTAddDev(@"cancel");}
+ (NSString *)ja_notSuport{return LTAddDev(@"adddevice_Wireless_add_not_support");}
+ (NSString *)ja_connetFailed{return LTAddDev(@"adddevice_Wireless_add_connect_failed");}
+ (NSString *)ja_connetButtonTitle{return LTAddDev(@"adddevice_Wireless_add_mode_confirm_connect");}
+ (NSString *)ja_addDeviceRichScan{return LTAddDev(@"help_addDevice_textTips_22");}
+ (NSString *)ja_addDeviceWirelessSingleProduct{return LTAddDev(@"adddevice_wireless_single_product");}
+ (NSString *)ja_addDeviceSuit{return LTAddDev(@"adddevice_suit");}
+ (NSString *)ja_addDeviceOtherCamera{return LTAddDev(@"adddevice_other_camera");}
+ (NSString *)ja_addDeviceScanTimePrompt{return LTAddDev(@"adddevice_scan_time_prompt");}
+ (NSString *)ja_addDeviceFailPrompt{return LTAddDev(@"adddevice_fail_prompt");}
+ (NSString *)ja_addDeviceRescan{return LTAddDev(@"adddevice_rescan");}
+ (NSString *)ja_addDevicehint1{return LTAddDev(@"addDevice_phone_no_WIFI");}
+ (NSString *)ja_addDevicehint2{return LTAddDev(@"addDevice_openThePhone_setting");}
+ (NSString *)ja_addDevicehint3{return LTAddDev(@"addDevice_connect_the_same_WIFI");}
+ (NSString *)ja_addDevicehint4{return LTAddDev(@"addDevice_waittingAndBack_APP");}
+ (NSString *)ja_addDeviceSuitHelp{return LTAddDev(@"addDevice_add_help");}
+ (NSString *)ja_addDeviceSetPwdAlertMessage
{
    //提示语：设备密码不能为空
    return LTAddDev(@"adddevice_device_password_cannot_be_empty");
    
}
@end
