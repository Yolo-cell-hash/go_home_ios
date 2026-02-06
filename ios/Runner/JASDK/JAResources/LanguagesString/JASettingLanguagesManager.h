//
//  JASettingLanguagesManager.h
//  JAJUANKit
//
//  Created by KingJames6 on 2019/8/15.
//  Copyright © 2019 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASettingLanguagesManager.h"

#define kJADeviceSettings(KEY) [[JASettingLanguagesManager shareInstance] localizedStringForKey:KEY tableName: @"JADeviceSettings"]
#define JA_SETTINGLANGUAGES_STR(_KEY) NSLocalizedStringFromTable(_KEY, @"JACalendar", nil)


@interface JASettingLanguagesManager : NSObject


+ (instancetype)shareInstance;

/**
 设备设置国际化
 
 @param key key
 @param tableName 国际化自定义文件名(可为空，默认：Localizable)
 @return 国际化后的文案
 */
- (NSString *)localizedStringForKey:(NSString *)key tableName:(NSString *)tableName;

/**
 设备设置图片国际化
 
 @param name 图片名,图片命名的时候加上语言后缀，获取的时候调用此方法，在图片名后面加上语言后缀来显示图片(图片名传值不加语言后缀!!!)
 @param common Yes为共用，不做国际化区分；否则区分国际化
 @return UIImage
 */
- (UIImage *)deviceSettingLocalizedImageWithName:(NSString *)name common:(BOOL)common;

@end

