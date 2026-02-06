//
//  NSMutableDictionary+JADeviceSetting.m
//  JAKitDemo
//
//  Created by Wynton on 2017/12/26.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "NSMutableDictionary+JADeviceSetting.h"

@implementation NSMutableDictionary(JADeviceSetting)

- (id)ja_dictObj:(NSString *)key
{
    if (![self valueForKey:key]) {
        [self setValue:[NSMutableDictionary dictionary] forKey:key];
    }
    return [self valueForKey:key];
}

- (id)ja_arrObj:(NSString *)key
{
    if (![self valueForKey:key]) {
        [self setValue:[NSMutableArray array] forKey:key];
    }
    return [self valueForKey:key];
}

- (id)ja_numberObj:(NSString *)key value:(NSNumber*)value
{
    if (![self valueForKey:key]) {
        [self setValue:value forKey:key];
    }
    return [self valueForKey:key];
}


@end
