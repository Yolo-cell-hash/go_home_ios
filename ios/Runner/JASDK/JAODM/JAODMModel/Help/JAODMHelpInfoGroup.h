//
//  JAODMHelpInfoGroup.h
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMHelpInfoItem.h"

typedef NS_ENUM(NSUInteger, JAODMHelpInfoGroupType) {
    JAODMHelpInfoGroupTypeText,
    JAODMHelpInfoGroupTypeVideo,
};

@interface JAODMHelpInfoGroup : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) JAODMHelpInfoGroupType type;
@property (nonatomic, assign) BOOL separatorStyle;

@property (nonatomic, strong) NSMutableArray<JAODMHelpInfoItem *> *itemArr;

+ (instancetype)modelsWithJSON:(NSArray *)json;

@end
