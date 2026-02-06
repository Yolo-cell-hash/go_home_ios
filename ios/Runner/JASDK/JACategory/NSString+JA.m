//
//  NSString+JA.m
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSString+JA.h"

@implementation NSString(JA)

- (NSInteger)ja_indexOf:(NSString*)substring
{
    NSRange range = [self rangeOfString:substring options:NSCaseInsensitiveSearch];
    return range.location == NSNotFound ? -1 : range.location;
}

- (NSInteger)ja_indexOf:(NSString *)substring StartFrom:(NSUInteger)index
{
    NSString *test = [self substringFromIndex:index];
    return index+[test ja_indexOf:substring];
}

- (NSInteger)ja_lastIndexOf:(NSString*)substring
{
    NSRange range = [self rangeOfString:substring options:NSBackwardsSearch];
    return range.location == NSNotFound ? -1 : range.location;
}

- (NSInteger)ja_lastIndexOf:(NSString *)substring StartFrom:(NSUInteger)index
{
    NSString* test = [self substringFromIndex:index];
    return [test ja_lastIndexOf:substring];
}

- (NSString *)ja_substringFromIndex:(NSUInteger)from ToIndex:(NSUInteger)to
{
    NSRange range;
    range.location = from;
    range.length = to - from;
    return [self substringWithRange: range];
}

- (NSString *)ja_trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSArray *)ja_split:(NSString*)token
{
    return [self ja_split:token Limit:0];
}

- (NSArray*)ja_split:(NSString *)token Limit:(NSUInteger)maxResults
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:8];
    NSString* buffer = self;
    while ([buffer containsString:token]) {
        if (maxResults > 0 && [result count] == maxResults - 1) {
            break;
        }
        NSUInteger matchIndex = [buffer ja_indexOf:token];
        NSString* nextPart = [buffer ja_substringFromIndex:0 ToIndex:matchIndex];
        buffer = [buffer substringFromIndex:matchIndex + [token length]];
        [result addObject:nextPart];
    }
    if ([buffer length] > 0) {
        [result addObject:buffer];
    }
    return result;
}


- (NSString *)ja_base64Encode
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)ja_base64Decode
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)ja_formatToDictionary
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

+ (NSString *)ja_stringWithDictionary:(NSDictionary *)dict
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSString *)ja_stringWithNSArray:(NSArray *)array
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSArray*) split: (NSString*) token {
    return [self split:token limit:0];
}

- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults {
    NSMutableArray* result = [NSMutableArray arrayWithCapacity: 8];
    NSString* buffer = self;
    while ([buffer contains:token]) {
        if (maxResults > 0 && [result count] == maxResults - 1) {
            break;
        }
        NSUInteger matchIndex = [buffer indexOf:token];
        NSString* nextPart = [buffer substringFromIndex:0 toIndex:matchIndex];
        buffer = [buffer substringFromIndex:matchIndex + [token length]];
        [result addObject:nextPart];
    }
    if ([buffer length] > 0) {
        [result addObject:buffer];
    }
    return result;
}

- (BOOL) contains: (NSString*) substring {
    NSRange range = [self rangeOfString:substring];
    return range.location != NSNotFound;
}

- (NSUInteger) indexOf: (NSString*) substring {
    NSRange range = [self rangeOfString:substring options:NSCaseInsensitiveSearch];
    return range.location == NSNotFound ? -1 : range.location;
}

- (NSString*) substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to {
    NSRange range;
    range.location = from;
    range.length = to - from;
    return [self substringWithRange: range];
}


//根据内容和固定宽度字体大小来计算高度
- (CGFloat) computeHeightUIfont:(UIFont *)font Width:(CGFloat)width {
    CGSize size = CGSizeMake(width, MAXFLOAT);//设置高度宽度的最大限度
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    return rect.size.height;
}

- (CGSize) computeWidthUIfont:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName: font}];
    return size;
}

//把多个json字符串转为一个json字符串
+ (NSString *)objArrayToJSON:(NSArray *)array {
    NSString *jsonStr = @"[";
    for (NSInteger i = 0; i < array.count; ++i) {
        if (i != 0) {
            jsonStr = [jsonStr stringByAppendingString:@","];
        }
        jsonStr = [jsonStr stringByAppendingString:[NSString stringWithFormat:@"%@",array[i]]];
    }
    jsonStr = [jsonStr stringByAppendingString:@"]"];
    
    
    
    return jsonStr;
    
}

/// 正则表达式查找字符串
/// @param regex 正则表达式
-(NSString *)searchWithRegex:(NSString *)regex {
    NSError *error;
    NSString *result = @"";
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
    if (!error) {
       NSTextCheckingResult *match = [regular firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
       if (match) {
           result = [self substringWithRange:match.range];
       }
    }
    return result;
}

@end
