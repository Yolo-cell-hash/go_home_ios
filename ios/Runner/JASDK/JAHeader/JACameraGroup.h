//
//  JACameraGroup.h
//  JA_Item
//
//  Created by Mr.Z on 2018/1/12.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JACamera.h"
@interface JACameraGroup : NSObject
@property (nonatomic,   copy) NSString *group_id;
@property (nonatomic,   copy) NSString *name;
@property (nonatomic,   copy) NSString *remark;
@property (nonatomic, strong) NSArray <JACamera *> *cameraslist;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)saveCameraGroupToFMDB;
//- (JADevice *)generateVirtualDevice;
@end
