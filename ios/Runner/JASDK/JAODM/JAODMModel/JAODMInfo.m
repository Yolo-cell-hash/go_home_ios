//
//  JAODMInfo.m
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "JAODMInfo.h"

@implementation JAODMInfo
+ (instancetype)info
{
    static JAODMInfo *onceODM;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        onceODM = [[JAODMInfo alloc] init];
        [onceODM _setupInfo];
    });
    return onceODM;
}

- (void)_setupInfo
{
    self.isAllowJump = YES;
    self.general = [[JAODMGeneral alloc] init];
    [self.general setup];
    
    self.playerInfo = [[JAODMPlayerInfo alloc] init];
    [self.playerInfo setup];
    
    self.devieceListInfo = [[JAODMDevicesList alloc] init];
    [self.devieceListInfo setup];
    
    self.loginRegisterInfo = [[JAODMLoginRegister alloc] init];
    [self.loginRegisterInfo setup];
    
    self.helpInfo = [[JAODMHelpInfo alloc] init];
    
    self.addDeviceInfo = [[JAODMAddDeviceInfo alloc] init];
    self.addType = [[JAODMAddDeviceType alloc]init];
    
    self.cloudInfo = [[JAODMCloud alloc]init];
    [self.cloudInfo setUp];
}
@end
