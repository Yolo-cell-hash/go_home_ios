//
//  JAODMHelpInfo.m
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMHelpInfo.h"
#import "JAODMHelpType.h"
//#import "JASettingLanguagesManager.h"

#define LOC_STR(_STR) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_STR tableName: ([[[JAODMHelpType alloc] init] helpType])]
#define LOC_STR_ADD(_STR) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_STR tableName: @"JAAddDeviceLocalizable"]
#define LOC_STR_Cloud(_STR) [[JASettingLanguagesManager shareInstance] localizedStringForKey:_STR tableName: @"JACloud"]

@implementation JAODMHelpInfo
+ (instancetype)modelWithJson:(NSDictionary *)json
{
    return [[JAODMHelpInfo alloc] initWithJson:json];
}

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        
        self.separatorStyle = [[json objectForKey:@"SeparatorStyle"]integerValue];
        //先从JAHelp取值 ，如果取不到，就从JAAddDeviceLocalizable取
        NSString *string = LOC_STR(json[@"Name"]);
        if ([string isEqualToString:json[@"Name"]]) {
            string = LOC_STR_ADD(json[@"Name"]);
            if ([string isEqualToString:json[@"Name"]]) {
                string = LOC_STR_Cloud(json[@"Name"]);
            }
        }
        self.name = string;
        self.helpType = json[@"HelpType"];
        NSArray *arr = [json objectForKey:@"Rows"];
        for (NSArray *info in arr) {
            [self.groups addObject:[JAODMHelpInfoGroup modelsWithJSON:info]];
        }
    }
    return self;
}

- (NSMutableArray<JAODMHelpInfoGroup *> *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

@end
