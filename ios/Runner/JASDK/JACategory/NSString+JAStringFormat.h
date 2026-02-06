//
//  NSString+JAStringFormat.h
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+JA.h"
@interface NSString(JAStringFormat)

- (BOOL)ja_format_userPhoneNumber;
- (BOOL)ja_format_userEmail;
- (BOOL)ja_format_userNick;
- (BOOL)ja_format_userPassword;

- (BOOL)ja_format_deviceID;
- (BOOL)ja_format_deviceNick;
- (BOOL)ja_format_deviceUserName;
- (BOOL)ja_format_devicePassword;
- (BOOL)ja_format_deviceIPDDNS;
- (BOOL)ja_format_devicePort;

- (BOOL)ja_format_configWiFiSSID;
- (BOOL)ja_format_configWiFiPassword;

// wifi 设置
- (BOOL)ja_format_changeWiFiSSID;

- (BOOL)ja_format_AP;
//支持空格输入
- (BOOL)ja_format_devicePasswordNoFilterSpace;
//支持空格输入且不少于4位（电池机密码不少于4位）
- (BOOL)ja_format_devicePasswordNoFilterSpace4Length;

#pragma mark - --- Helper ---
- (BOOL)ja_justNumber;
- (BOOL)ja_containsChinese;
- (BOOL)ja_containsEmoji;
- (BOOL)ja_containsSpecialChar;

- (BOOL)ja_predicate:(NSString *)predicateStr;

@end
