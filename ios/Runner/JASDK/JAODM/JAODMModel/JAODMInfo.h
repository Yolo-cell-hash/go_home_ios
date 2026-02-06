//
//  JAODMInfo.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerInfo.h"
#import "JAODMPersonal.h"
#import "JAODMDevicesList.h"
#import "JAODMLoginRegister.h"
#import "JAODMGeneral.h"
#import "JAODMCloud.h"
#import "JAODMHelpInfo.h"
#import "JAODMAddDeviceInfo.h"
#import "JAODMAddDeviceType.h"


NS_ASSUME_NONNULL_BEGIN

@interface JAODMInfo : NSObject
@property (nonatomic, strong) JAODMGeneral *general;
@property (nonatomic, strong) JAODMPlayerInfo *playerInfo;
@property (nonatomic, strong) JAODMPersonal *personal;
@property (nonatomic, strong) JAODMDevicesList *devieceListInfo;
@property (nonatomic, strong) JAODMLoginRegister *loginRegisterInfo;
@property (nonatomic, strong) JAODMCloud *cloudInfo;
@property (nonatomic, strong) JAODMHelpInfo *helpInfo;
@property (nonatomic, strong) JAODMAddDeviceInfo *addDeviceInfo;
@property (nonatomic, strong) JAODMAddDeviceType *addType;

@property (nonatomic, assign) BOOL isAllowJump;//推送暂时解决某特定页面不允许跳转所设属性

+ (instancetype)info;

@end

NS_ASSUME_NONNULL_END
