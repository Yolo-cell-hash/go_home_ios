//
//  JAODMLOginRegister.h
//  eseecloud
//
//  Created by gxl on 2018/11/29.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, JAODMRegiesterType) {
    JAODMRegiesterTypeDefault        = 1 << 0,
    JAODMRegiesterTypePhone           = 1 << 1,
    JAODMRegiesterTypeEmail           = 1 << 2,
    JAODMRegiesterTypeAccount           = 1 << 3
};
typedef NS_OPTIONS(NSUInteger, JAODMLoginLogoType) {
    JAODMLoginLogoTypeDefault        = 1 << 0,
    JAODMLoginLogoTypeText           = 1 << 1,
    JAODMLoginLogoTypeImage           = 1 << 2
};
@interface JAODMLoginRegister : NSObject
@property (nonatomic, assign) JAODMRegiesterType regiesterType;
@property (nonatomic, assign) JAODMLoginLogoType loginLogoType;
@property (nonatomic, strong) NSDictionary *privacyPolicyDict;
@property (nonatomic, copy) NSString *loginLogoName;
@property (nonatomic,assign)BOOL privacyProtocalEnable;
@property (nonatomic,assign)BOOL companyIntroduceEnable;
@property (nonatomic,assign)BOOL appDeclareEnable;
- (void)setup;
@end
