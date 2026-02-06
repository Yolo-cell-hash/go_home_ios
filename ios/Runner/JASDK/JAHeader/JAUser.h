//
//  JAUser.h
//  eseecloud
//
//  Created by haidong on 09/02/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, UserLoginType) {
    UserLoginTypeEmpty,
    UserLoginTypeAccount,
    UserLoginTypeEmail,
    UserLoginTypeWechat,
    UserLoginTypePhone
};

@interface JAUser : NSObject

@property (nonatomic, copy) NSString *accessToken;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *wxHeadimgurl;

@property (nonatomic, assign) UserLoginType loginType;

@property (nonatomic, copy) NSString *lastVisitDate; // 上次访问时间

@property (nonatomic, copy) NSString *currentTime; // 手机当前时间

@property (nonatomic, assign, readonly) BOOL isLogin;

@property (nonatomic, strong) NSString *expireTime;

@end
