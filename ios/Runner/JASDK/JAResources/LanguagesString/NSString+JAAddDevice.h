//
//  NSString+JAAddDevice.h
//  JUANUtil
//
//  Created by Wynton on 2018/3/11.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JASettingLanguagesManager.h"

#define LTAddDev(key) [[JASettingLanguagesManager shareInstance] localizedStringForKey:key tableName: @"JAAddDeviceLocalizable"]
@interface NSString(JAAddDevice)

+ (NSString *)ja_addDevice_unfinished;

+ (NSString *)ja_ok;

+ (NSString *)ja_addDevice;

+ (NSString *)ja_IDAddDevice;
+ (NSString *)ja_IPAddDevice;

+ (NSString *)ja_deviceID;
+ (NSString *)ja_deviceIDPlackholer;

+ (NSString *)ja_eseeID;
+ (NSString *)ja_eseeIDPlackholer;

+ (NSString *)ja_IPDDNS;
+ (NSString *)ja_IPDDNSPlackholer;

+ (NSString *)ja_port;
+ (NSString *)ja_portPlackholer;

+ (NSString *)ja_deviceNick;
+ (NSString *)ja_deviceNickPlackholer;

+ (NSString *)ja_userName;
+ (NSString *)ja_userNamePlackholder;

+ (NSString *)ja_password;
+ (NSString *)ja_passwordPlackholer;

+ (NSString *)ja_channelCount;
+ (NSString *)ja_panorama;

+ (NSString *)ja_pushToChooseWiFi;

+ (NSString *)ja_apHelp1;
+ (NSString *)ja_apHelp2;
+ (NSString *)ja_apHelp3;
+ (NSString *)ja_apHelp4;
+ (NSString *)ja_apHelp5;

+ (NSString *)ja_connectWiFi;
+ (NSString *)ja_inputWiFiSSIDPlaceholder;
+ (NSString *)ja_inputWiFiPasswordPlaceholder;

+ (NSString *)ja_configWiFiWithDevice:(NSString *)device;
+ (NSString *)ja_configWiFiTips;

+ (NSString *)ja_next;
+ (NSString *)ja_retry;

+ (NSString *)ja_configTimeout;
+ (NSString *)ja_configConnectFail;
+ (NSString *)ja_configFail;
+ (NSString *)ja_configSuccess;

+ (NSString *)ja_chooseDevice;
+ (NSString *)ja_deviceConnecting;
+ (NSString *)ja_deviceConnectFail;
+ (NSString *)ja_deviceDisconnect;

+ (NSString *)ja_currentWiFiNotDeviceAP;
+ (NSString *)ja_connectingDeviceAP;

+ (NSString *)ja_addDeviceWithOtherWays;

+ (NSString *)ja_addDeviceConfigTopTips;
+ (NSString *)ja_addDeviceConfigBtmTips;

+ (NSString *)ja_addDeviceSetPaswordForDevice;
+ (NSString *)ja_pleaseConnectLANWithSameOfDevice;
+ (NSString *)ja_connectAuthFailAndConfigAgain;


+ (NSString *)ja_deviceNickFormatFail;
+ (NSString *)ja_ipFormatFail;
+ (NSString *)ja_eseeIDFormatFail;
+ (NSString *)ja_portFormatFail;
+ (NSString *)ja_deviceUserFormatFail;
+ (NSString *)ja_devicePasswordFormatFail;
+ (NSString *)ja_devicePasswordLengthExceed;

+ (NSString *)ja_scanDevices;
+ (NSString *)ja_existDeviceID;
+ (NSString *)ja_existDeviceNickname;

+ (NSString *)ja_adding;
+ (NSString *)ja_invalidQRCode;

+ (NSString *)ja_lanSearch;
+ (NSString *)ja_skip:(int)second;

+ (NSString *)ja_passwordWrong;
+ (NSString *)ja_connectUserWifiFailOrNoFindDevice;
+ (NSString *)ja_networkTimeout;
+ (NSString *)ja_connectDeviceFailOrPWDWrongOrTimeout;
+ (NSString *)ja_connectDeviceHotspotOrBLEFail;
+ (NSString *)ja_getDeviceInfoFailOrPWDWrongOrTimeout;
+ (NSString *)ja_setDeviceFailPWDWrongOrTimeout;
+ (NSString *)ja_sendBLEFailBLECloseOrnoReplyOrTimeout;

+ (NSString *)ja_livingRoom;
+ (NSString *)ja_masterBedroom;
+ (NSString *)ja_studyRoom;
+ (NSString *)ja_office;

+ (NSString *)ja_resetSuccess;
+ (NSString *)ja_yes;
+ (NSString *)ja_no;
+ (NSString *)ja_add;
+ (NSString *)ja_enterPassword;

+ (NSString *)ja_deviceNetworked;
+ (NSString *)ja_configFailPrompt;
+ (NSString *)ja_MyDevice;
+ (NSString *)ja_unsearchable;
+ (NSString *)ja_setting;
+ (NSString *)ja_continue;
+ (NSString *)ja_dropout;

+ (NSString *)ja_networkAlert;

+ (NSString *)ja_networkChoose;
+ (NSString *)ja_networkWIFI;
+ (NSString *)ja_networkWired;
+ (NSString *)ja_networkPrompt;
+ (NSString *)ja_networkConfirm;
+ (NSString *)ja_networkDevicePassword;
+ (NSString *)ja_cancel;
+ (NSString *)ja_notSuport;
+ (NSString *)ja_connetFailed;
+ (NSString *)ja_connetButtonTitle;

+ (NSString *)ja_addDeviceRichScan;
+ (NSString *)ja_addDeviceWirelessSingleProduct;
+ (NSString *)ja_addDeviceSuit;
+ (NSString *)ja_addDeviceOtherCamera;
+ (NSString *)ja_addDeviceScanTimePrompt;
+ (NSString *)ja_addDeviceFailPrompt;
+ (NSString *)ja_addDeviceRescan;

+ (NSString *)ja_addDevicehint1;
+ (NSString *)ja_addDevicehint2;
+ (NSString *)ja_addDevicehint3;
+ (NSString *)ja_addDevicehint4;
+ (NSString *)ja_addDeviceSuitHelp;
+ (NSString *)ja_addDeviceSetPwdAlertMessage;
@end
