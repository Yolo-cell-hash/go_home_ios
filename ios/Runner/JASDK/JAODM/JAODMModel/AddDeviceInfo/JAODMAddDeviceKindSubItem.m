//
//  JAODMAddDeviceKindSubItem.m
//  eseecloud
//
//  Created by gxl on 2018/12/24.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMAddDeviceKindSubItem.h"

@implementation JAODMAddDeviceKindSubItem
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        _name = dict[@"name"];
        _configType = [dict[@"configWay"] integerValue];
    }
    return self;
}
@end
