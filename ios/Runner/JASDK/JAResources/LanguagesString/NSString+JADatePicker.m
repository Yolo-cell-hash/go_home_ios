//
//  NSString+JADatePicker.m
//  eseecloud
//
//  Created by haidong on 26/04/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "NSString+JADatePicker.h"

@implementation NSString (JADatePicker)

+ (NSString *)ja_cancelText {
    return @"取消";//LT(cancel, JADatePicker);
}

+ (NSString *)ja_okText {
    return @"确定";//LT(confirm, JADatePicker);
}

@end
