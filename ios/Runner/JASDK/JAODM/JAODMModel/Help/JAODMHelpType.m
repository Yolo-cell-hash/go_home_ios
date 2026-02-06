//
//  JAODMHelpType.m
//  eseecloud
//
//  Created by lixianliang on 2019/3/5.
//  Copyright © 2019年 juanvision. All rights reserved.
//

#define HELPTYPE @"JAHelpType"
#import "JAODMHelpType.h"
#import "JAODMGeneral.h"

@implementation JAODMHelpType

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        JAODMGeneral *general = [[JAODMGeneral alloc]init];
        [general setup];
        if ([general.project isEqualToString:@"SW360"] || [general.project isEqualToString:@"Pano360s"]) {
            NSString *filePath = [[NSBundle mainBundle] pathForResource:HELPTYPE ofType:@"json"];
            NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
            NSDictionary *helptype = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            _helpType = [[helptype objectForKey:@"helpType"] integerValue] == JAODMHelpTypeNone ? @"JAHelp" : @"JAHelpHuaYi";
        } else {
            _helpType = @"JAHelp";
        }
        
        

    }
    return self;
}


/*
 helpType
 JAODMHelpTypeNone = 0   通用版本的帮助
 JAODMHelpTypeHuaYi = 1  华熠app的帮助
 */
@end



