//
//  JAODMHelpType.h
//  eseecloud
//
//  Created by lixianliang on 2019/3/5.
//  Copyright © 2019年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JAODMHelpTypeEnum) {
    JAODMHelpTypeNone = 0,   //通用版本的帮助
    JAODMHelpTypeHuaYi = 1  //华熠app的帮助
};

@interface JAODMHelpType : NSObject

@property (nonatomic, strong) NSString *helpType;

@end


