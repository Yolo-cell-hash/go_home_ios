//
//  JALanguageManager.h
//  EseeAWS
//
//  Created by developer on 2021/7/17.
//

#import <Foundation/Foundation.h>
#import "JASingle.h"

NS_ASSUME_NONNULL_BEGIN

#define DEFINE_LANGUAGE_KEY(KEY) \
+(NSString *)KEY{ \
    return [[JALanguageManager share] localizedStringForKey:@#KEY tableName: @"JAExternMutiLanguage"];\
}

#define DEFINE_X35_LANGUAGE_KEY(KEY) \
+(NSString *)KEY{ \
    return [[JALanguageManager share] localizedStringForKey:@#KEY tableName: @"X35MutiLanguage"];\
}

@interface JALanguageManager : NSObject
SingleH()

- (NSString *)localizedStringForKey:(NSString *)key tableName:(NSString *)tableName;

@end

NS_ASSUME_NONNULL_END
