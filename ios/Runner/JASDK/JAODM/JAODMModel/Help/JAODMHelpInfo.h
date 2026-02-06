//
//  JAODMHelpInfo.h
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMHelpInfoGroup.h"


@interface JAODMHelpInfo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *helpType;
@property (nonatomic, assign) UITableViewCellSeparatorStyle separatorStyle;

@property (nonatomic, strong) NSMutableArray<JAODMHelpInfoGroup *> *groups;

+ (instancetype)modelWithJson:(NSDictionary *)json;

@end
