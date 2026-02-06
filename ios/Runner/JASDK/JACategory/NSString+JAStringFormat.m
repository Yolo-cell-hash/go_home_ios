//
//  NSString+JAStringFormat.m
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSString+JAStringFormat.h"

@implementation NSString(JAStringFormat)


- (BOOL)ja_format_userPhoneNumber
{
     return [self ja_predicate:@"^(\\+)?[0-9]+$"]&&self.length<=20;
}

- (BOOL)ja_format_userEmail
{
    return [self ja_email];
}

- (BOOL)ja_format_userNick
{
    return self.length < 15;
}

- (BOOL)ja_format_userPassword
{
    if ([self ja_containsEmoji]) {
        return NO;
    }    
    return self.length <= 20 & self.length >= 6 & (![self ja_containsSpecialChar]);
}

- (BOOL)ja_format_deviceID
{
    if (self.length == 0 || self.length > 20) {
        return NO;
    }
    return YES;
//    return [self ja_predicate:@"^[1-9]{8,9}$"]||[self ja_predicate:@"^(zs)[1-9]{8,9}$"];
}

- (BOOL)ja_format_deviceNick
{
    if ([self ja_containsEmoji]) {
        return NO;
    }
    return self.length < 26 && self.length > 0;
}

- (BOOL)ja_format_deviceUserName
{
    return ![self ja_containsChinese] && self.length < 20;
}

- (BOOL)ja_format_devicePassword
{
    return (self.length==0)||([self ja_justNumberAndEnglishAlphabet] && self.length <= 20);
}

- (BOOL)ja_format_deviceIPDDNS
{
    return ![self ja_containsChinese] && [self containsString:@"."] && ![self ja_containsEmoji];
}

- (BOOL)ja_format_devicePort
{
    return [self ja_justNumber];
}

- (BOOL)ja_format_configWiFiSSID
{
    return self.length < 30;
}

- (BOOL)ja_format_configWiFiPassword
{
    return (![self ja_containsChinese]) && self.length < 50;
}

// wifi 设置
- (BOOL)ja_format_changeWiFiSSID
{
    return self.length > 0 && self.length < 30;
}

- (BOOL)ja_format_AP
{
    return [self hasPrefix:@"IPC"];
}
//支持空格输入
- (BOOL)ja_format_devicePasswordNoFilterSpace
{
    return (self.length==0)||([self ja_justNumberSpaceAndEnglishAlphabet] && self.length <= 20);

}
//支持空格输入且不少于4位（电池机密码不少于4位）
- (BOOL)ja_format_devicePasswordNoFilterSpace4Length
{
    return ([self ja_justNumberSpaceAndEnglishAlphabet] && (self.length > 5 && self.length <= 20));
}

#pragma mark - --- Helper ---

- (BOOL)ja_justNumberAndEnglishAlphabet {
//    return [self ja_predicate:@"^[0-9a-zA-Z]+$"];
    if ([self contains:@"&"] || [self contains:@"€"] || [self ja_containsChinese] || [self ja_containsEmoji] || [self ja_containsSpecialChar]) {
        return NO;
    }
    return YES;
}
//不过滤空格
- (BOOL)ja_justNumberSpaceAndEnglishAlphabet {
    if ([self contains:@"&"] || [self contains:@"€"] || [self ja_containsChinese] || [self ja_containsEmoji]) {
        return NO;
    }
    return YES;
}
- (BOOL)ja_email
{
    return [self ja_predicate:@"[\\w!#$%&\'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?"];
}

- (BOOL)ja_justNumber
{
    return [self ja_predicate:@"^[0-9]+$"];
}

- (BOOL)ja_predicate:(NSString *)predicateStr
{
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",predicateStr];
    return [numberPre evaluateWithObject:self];
}

- (BOOL)ja_containsChinese
{
    return [self ja_predicate:@".*[\\u4e00-\\u9faf].*"];
}

- (BOOL)ja_containsEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              const unichar hs = [substring characterAtIndex:0];
                              if (0xd800 <= hs && hs <= 0xdbff) {
                                  if (substring.length > 1) {
                                      const unichar ls = [substring characterAtIndex:1];
                                      const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                      if (0x1d000 <= uc && uc <= 0x1f77f) {
                                          returnValue = YES;
                                      }
                                  }
                              } else if (substring.length > 1) {
                                  const unichar ls = [substring characterAtIndex:1];
                                  if (ls == 0x20e3) {
                                      returnValue = YES;
                                  }
                              } else {
                                  if (0x2100 <= hs && hs <= 0x27ff) {
                                      returnValue = YES;
                                  } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                      returnValue = YES;
                                  } else if (0x2934 <= hs && hs <= 0x2935) {
                                      returnValue = YES;
                                  } else if (0x3297 <= hs && hs <= 0x3299) {
                                      returnValue = YES;
                                  } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                      returnValue = YES;
                                  }
                              }
                          }];
    return returnValue;
}

- (BOOL)ja_containsSpecialChar{
    for (int i = 0; i < self.length; i++) {
        unichar c = [self characterAtIndex:i];
        if (c <33 || c > 126) {
            return true;
        }
    }
    return false;
}
@end
