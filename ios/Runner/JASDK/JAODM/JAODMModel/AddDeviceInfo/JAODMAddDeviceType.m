//
//  JAODMAddDeviceType.m
//  eseecloud
//
//  Created by lixianliang on 2019/3/21.
//  Copyright © 2019年 juanvision. All rights reserved.
//

#import "JAODMAddDeviceType.h"
#define FILE_NAME @"JAAddDeviceType"

@implementation JAODMAddDeviceType

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:FILE_NAME ofType:@"json"];
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.addDeviceType = [[info objectForKey:@"addDeviceType"] integerValue];
        self.addDeviceWay = [[info objectForKey:@"addDeviceWay"] integerValue];
        
    }
    return self;
}

@end
