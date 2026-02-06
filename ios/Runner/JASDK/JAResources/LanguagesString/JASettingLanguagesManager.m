//
//  JASettingLanguagesManager.m
//  JAJUANKit
//
//  Created by KingJames6 on 2019/8/15.
//  Copyright © 2019 juanvision. All rights reserved.
//

#import "JASettingLanguagesManager.h"
//#import "NSString+JA.h"

#define NSLocalizedStringTableName @"Localizable"

@interface JASettingLanguagesManager ()

@property (nonatomic,strong) NSBundle *bundle;
@property (nonatomic,  copy) NSString *currentLanguage;

@end

@implementation JASettingLanguagesManager

+ (instancetype)shareInstance {
    static JASettingLanguagesManager *_manager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

- (NSString *)localizedStringForKey:(NSString *)key tableName:(NSString *)tableName {
    if (!_bundle) {
        [self initUserLanguage];
    }
    if (!tableName) {
        tableName = NSLocalizedStringTableName;
    }
    if (key.length > 0) {
        NSString *str = NSLocalizedStringFromTableInBundle(key, tableName, _bundle, nil);
        if (str.length > 0) {
            return str;
        }
    }
    return @"";
}

- (void)initUserLanguage {
    NSArray *languageArr = @[
                             @"zh-Hans",//中文
                             @"zh-Hant",//中文
                             @"en",//英文
                             @"de",//德语
                             @"es",//西班牙语
                             @"fr",//法语
                             @"it",//意大利语
                             @"ja",//日语
                             @"ko",//韩语
                             @"nb",//挪威
                             @"pl",//波兰
                             @"he",//希伯来语
                             @"nl",//荷兰
                             @"id",//印度尼西亚
                             @"cs",//捷克
                             @"fi",//芬兰
                             @"pt-BR",//葡萄牙语-巴西
                             @"pt-PT",//葡萄牙语-葡萄牙
                             @"ro",//罗马尼亚
                             @"ru",//俄语
                             @"sv",//瑞典
                             @"tr",//土耳其
                             @"th",//泰语
                             @"vi", //越南语
                             ];
    if (_bundle == nil) {
        
        _currentLanguage = [NSLocale preferredLanguages].firstObject;
        //        if ([languageArr containsObject:_currentLanguage]) {
        //
        ////            _currentLanguage = @"zh-Hans"; // 简体中文
        //        } else {
        //            _currentLanguage = @"en";
        //        }
        BOOL constainLanguage = NO;
        for (int i = 0; i<languageArr.count; i++) {
            if ([_currentLanguage contains:languageArr[i]]) {
                _currentLanguage = languageArr[i];
                constainLanguage = YES;
            }
        }
        if (!constainLanguage) {
            _currentLanguage = @"en";
        }
        /*
         if ([language hasPrefix:@"en"]) {
         language = @"en";
         } else if ([language hasPrefix:@"zh"]) {
         //            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
         language = @"zh-Hans"; // 简体中文
         //            } else { // zh-Hant\zh-HK\zh-TW
         //                language = @"zh-Hant"; // 繁體中文
         //            }
         } else if([language hasPrefix:@"ko"]) {
         language = @"ko";
         } else if([language hasPrefix:@"ru"]) {
         language = @"ru";
         } else if([language hasPrefix:@"es"]) {
         language = @"es";
         } else if([language hasPrefix:@"de"]) {
         language = @"de";
         } else if([language hasPrefix:@"pt"]) {
         language = @"pt-PT";
         } else {
         language = @"en";
         }
         */
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:_currentLanguage ofType:@"lproj"];
        _bundle = [NSBundle bundleWithPath:path];
    }
}

//图片多语言处理 有2种处理方案，第一种就是和文字一样，根据语言或者对应路径下的图片文件夹，然后用获取文字的方式，获取图片名字，或者用下面这种方法，图片命名的时候加上语言后缀，获取的时候调用此方法，在图片名后面加上语言后缀来显示图片
- (UIImage *)deviceSettingLocalizedImageWithName:(NSString *)name common:(BOOL)common {
    
    if (!_currentLanguage) {
        [self initUserLanguage];
    }
    NSString *imageName = common ? name : [NSString stringWithFormat:@"%@_%@",name,_currentLanguage] ;
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

@end
