//
//  JALanguageManager.m
//  EseeAWS
//
//  Created by developer on 2021/7/17.
//

#import "JALanguageManager.h"

#define NSLocalizedStringTableName @"Localizable"

@interface JALanguageManager()

@property (nonatomic,strong) NSBundle *bundle;
@property (nonatomic,  copy) NSString *currentLanguage;

@end

@implementation JALanguageManager
SingleM()

- (NSString *)localizedStringForKey:(NSString *)key tableName:(NSString *)tableName {

    if (!tableName || tableName.length == 0) {
        tableName = NSLocalizedStringTableName;
    }
    if (key.length > 0) {
        NSString *str = NSLocalizedStringFromTableInBundle(key, tableName, self.bundle, nil);
        if (str.length > 0) {
            return str;
        }
    }
    
    return @"";
}

-(NSBundle *)bundle
{
    if (! _bundle) {
        
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
        
        self.currentLanguage = [NSLocale preferredLanguages].firstObject;
        
        BOOL constainLanguage = NO;
        for (int i = 0; i<languageArr.count; i++) {
            if ([self.currentLanguage containsString:languageArr[i]]) {
                self.currentLanguage = languageArr[i];
                constainLanguage = YES;
            }
        }
        if (!constainLanguage) {
            _currentLanguage = @"en";
        }

        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:_currentLanguage ofType:@"lproj"];
        _bundle = [NSBundle bundleWithPath:path];
        
    }
    
    return _bundle;
}


@end
