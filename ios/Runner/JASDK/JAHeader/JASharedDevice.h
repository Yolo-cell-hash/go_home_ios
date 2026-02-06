//
//  JASharedDevice.h
//  eseecloud
//
//  Created by haidong on 15/03/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JASharedDeviceTargetUser;

@interface JASharedDevice : NSObject

@property (nonatomic, strong) NSArray *cameralist;

@property (nonatomic, assign) NSInteger channel_count;

@property (nonatomic, assign) NSInteger device_id;

@property (nonatomic, assign) NSInteger devicetype;

@property (nonatomic, strong) NSString *eseeid;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *origin_user;

@property (nonatomic, strong) NSString *serial_id;

@property (nonatomic, assign) NSInteger share_status;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSString *system;

@property (nonatomic, strong) NSArray<JASharedDeviceTargetUser *> *target_user;

@property (nonatomic, strong) NSString *tutkid;

@property (nonatomic, strong) NSString *verify;

@end

@interface JASharedDeviceTargetUser : NSObject

@property (nonatomic, assign) NSInteger share_id;

@property (nonatomic, strong) NSString *username;

@end
