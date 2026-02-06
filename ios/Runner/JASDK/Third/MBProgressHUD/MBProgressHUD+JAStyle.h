//
//  MBProgressHUD+JAStyle.h
//  eseecloud
//
//  Created by haidong on 27/02/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, MBProgressHUDStyle) {
    MBProgressHUDStyleDarkBottomText
};

@interface MBProgressHUD (JAStyle)

//+ (instancetype)showMessage:(NSString *)text style:(MBProgressHUDStyle)style;

+ (instancetype)showMessage:(NSString *)text style:(MBProgressHUDStyle)style forController:(UIViewController *)controller;

@end
