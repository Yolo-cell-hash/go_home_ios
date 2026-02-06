//
//  JAODMLOginRegister.m
//  eseecloud
//
//  Created by gxl on 2018/11/29.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAODMLoginRegister.h"
#define JA_FILE_NAME @"LoginRegisterForgot.json"
@implementation JAODMLoginRegister
- (void)setup
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:JA_FILE_NAME ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    self.regiesterType = [info[@"Register"][@"RegiesterType"] integerValue];
    self.privacyProtocalEnable = [info[@"Register"][@"PrivacyProtocalEnable"] integerValue];
    self.companyIntroduceEnable = [info[@"Register"][@"CompanyIntroduceEnable"] integerValue];
    self.loginLogoType = [info[@"Login"][@"LoginLogoType"] integerValue];
    self.privacyPolicyDict= info[@"Login"][@"PrivacyPolicy"];
    self.appDeclareEnable = [info[@"Login"][@"AppDeclareEnable"] boolValue];
    self.loginLogoName = info[@"loginLogo"];
}
@end



/* ********************备注********************
{
    "Register":{
        "RegiesterType":0,//支持的注册方式, 0:默认. 位数0:手机, 1:邮箱, 2:账号
    },
    "Login":{
        "LoginLogoType":0,//登录logo类型, 0:默认，1:文字, 2:图片
        "PrivacyPolicy":{
            "zh-hans":"",
            "en":""
        },
    },
}
*/
