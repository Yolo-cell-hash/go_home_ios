//
//  JAODMCloud.m
//  eseecloud
//
//  Created by lixianliang on 2018/12/27.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMCloud.h"

#define JA_FILE_NAME @"Cloud.json"

@implementation JAODMCloud

-(instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:JA_FILE_NAME ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    self.cloudInfo = info;
}

@end
