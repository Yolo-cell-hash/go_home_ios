//
//  JAODMThirdpartyItem.m
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMThirdpartyItem.h"

@implementation JAODMThirdpartyItem

- (instancetype)initWithType:(JAODMThirdpartyItemType)type Key:(NSString *)key Enble:(BOOL)enble Icon:(NSString *)icon Name:(NSString *)name
{
    self = [super init];
    if (self) {
        _type = type;
        _key = key;
        _isEnble = enble;
        _icon = icon;
        _name = name;
    }
    return self;
}

@end
