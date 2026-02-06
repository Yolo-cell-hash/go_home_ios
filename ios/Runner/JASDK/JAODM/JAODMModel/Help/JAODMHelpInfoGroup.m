//
//  JAODMHelpInfoGroup.m
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMHelpInfoGroup.h"

@implementation JAODMHelpInfoGroup
+ (instancetype)modelsWithJSON:(NSArray *)json
{
    JAODMHelpInfoGroup *row = [[JAODMHelpInfoGroup alloc] init];
    for (NSDictionary *info in json) {
        [row.itemArr addObject:[JAODMHelpInfoItem modelsWithJSON:info]];
    }
    return row;
}

- (NSMutableArray<JAODMHelpInfoItem *> *)itemArr
{
    if (!_itemArr) {
        _itemArr = [NSMutableArray array];
    }
    return _itemArr;
}

@end
