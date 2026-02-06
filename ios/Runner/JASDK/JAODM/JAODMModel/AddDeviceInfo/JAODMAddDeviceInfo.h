//
//  JAODMAddDeviceInfo.h
//  WJFileTool
//
//  Created by OneJun on 2018/5/14.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMAddDeviceKindItem.h"

@interface JAODMAddDeviceInfo : NSObject
@property (nonatomic, assign) BOOL devicePasswordAuto;//设备密码自动
@property (nonatomic, assign) NSInteger columns;
@property (nonatomic, strong) NSMutableArray<JAODMAddDeviceKindItem *> *kindItemArr;
@property (nonatomic, strong) NSMutableArray<JAODMAddDeviceKindItem *> *kindType1ItemArr;
@property (nonatomic, strong) NSMutableArray<JAODMAddDeviceKindItem *> *kindType2ItemArr;
@property (nonatomic, strong) NSMutableArray<JAODMAddDeviceKindItem *> *deviceListkindItemArr;
@end
