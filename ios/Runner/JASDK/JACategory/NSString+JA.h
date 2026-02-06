//
//  NSString+JA.h
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(JA)

- (NSInteger)ja_indexOf:(NSString*)substring;
- (NSInteger)ja_indexOf:(NSString *)substring StartFrom:(NSUInteger)index;
- (NSInteger)ja_lastIndexOf:(NSString*)substring;
- (NSInteger)ja_lastIndexOf:(NSString *)substring StartFrom:(NSUInteger)index;

- (NSString*)ja_substringFromIndex:(NSUInteger)from ToIndex:(NSUInteger)to;

- (NSString*)ja_trim;

- (NSArray *)ja_split:(NSString*)token;
- (NSArray*)ja_split:(NSString *)token Limit:(NSUInteger)maxResults;

- (NSString *)ja_base64Encode;
- (NSString *)ja_base64Decode;

- (NSDictionary *)ja_formatToDictionary;

+ (NSString *)ja_stringWithNSArray:(NSArray *)array;

- (NSArray*) split: (NSString*) token;

- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults;

- (BOOL) contains: (NSString*) substring;

- (NSUInteger) indexOf: (NSString*) substring;

- (NSString*) substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to;
//根据内容和固定宽度字体大小来计算高度
- (CGFloat) computeHeightUIfont:(UIFont *)font Width:(CGFloat)width;
//单行字符串长度
- (CGSize) computeWidthUIfont:(UIFont *)font;
//把多个json字符串转为一个json字符串
+ (NSString *)objArrayToJSON:(NSArray *)array;
/// 字典转json
+ (NSString *)ja_stringWithDictionary:(NSDictionary *)dict;

/// 正则表达式查找字符串
/// @param regex 正则表达式
-(NSString *)searchWithRegex:(NSString *)regex;

/// 时间转换时分秒
//+ (NSString *)ja_stringWithTimeInterval:(long)timeInterval;

@end
