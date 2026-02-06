//
//  JAODMHelpInfoItem.m
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMHelpInfoItem.h"
#import "JAODMHelpType.h"
//#import "JASettingLanguagesManager.h"

#define LOC_STR(_STR) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_STR tableName: ([[[JAODMHelpType alloc] init] helpType])]
#define LOC_STR_ADD(_STR) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_STR tableName: @"JAAddDeviceLocalizable"]
#define LOC_STR_Cloud(_STR) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_STR tableName: @"JACloud"]

#define JAColorFromHex(hexValue,a) [UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:a]

@implementation JAODMHelpInfoItem
+ (instancetype)modelsWithJSON:(NSDictionary *)json
{
    return [[JAODMHelpInfoItem alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        self.type = [json[@"Type"] integerValue];
        NSString *colorStr = [json objectForKey:@"TextColor"];
        
        if ([colorStr hasPrefix:@"#"]) {
            colorStr = [colorStr substringFromIndex:1];
        }
        NSScanner * scanner = [NSScanner scannerWithString:colorStr];
        unsigned long long colorNum;
        [scanner scanHexLongLong:&colorNum];
        self.textColor = JAColorFromHex(colorNum, 1);
        
        BOOL isBold = [json[@"Bold"] boolValue];
        NSInteger textSize = [json[@"TextSize"] integerValue];
        if (isBold) {
            self.font = [UIFont boldSystemFontOfSize:textSize];
        }else{
            self.font = [UIFont systemFontOfSize:textSize];
        }
        
        //先从JAHelp取值 ，如果取不到，就从JAAddDeviceLocalizable取
        NSString *string = LOC_STR(json[@"Value"]);
        if ([string isEqualToString:json[@"Value"]]) {
            string = LOC_STR_ADD(json[@"Value"]);
            if ([string isEqualToString:json[@"Value"]]) {
                string = LOC_STR_Cloud(json[@"Value"]);
            }
        }
        self.value = string;
        self.language = json[@"Language"];
        
        self.inlineImage = json[@"InlineImage"];
        
        if (json[@"InlineImageWidth"] && json[@"InlineImageHeight"]) {
            self.inlineImageSize = CGSizeMake(((NSString *)json[@"InlineImageWidth"]).floatValue, ((NSString *)json[@"InlineImageHeight"]).floatValue);
        } else {
            self.inlineImageSize = CGSizeZero;
        }
        
    }
    return self;
}

@end
