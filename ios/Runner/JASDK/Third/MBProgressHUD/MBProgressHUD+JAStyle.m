//
//  MBProgressHUD+JAStyle.m
//  eseecloud
//
//  Created by haidong on 27/02/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "MBProgressHUD+JAStyle.h"
#import "MBProgressHUD+Common.h"
#import "JA.pch"

@implementation MBProgressHUD (JAStyle)

+ (instancetype)showMessage:(NSString *)text style:(MBProgressHUDStyle)style forController:(UIViewController *)controller {
    return [self showMessage:text style:style centerPosition:CGPointMake(kSCREEN_WIDTH/2, kSCREEN_HEIGHT-80) forController:controller];
}

+ (instancetype)showMessage:(NSString *)text style:(MBProgressHUDStyle)style centerPosition:(CGPoint)position forController:(UIViewController *)controller {
    MBProgressHUD *hud = [MBProgressHUD showForController:controller];
    
    switch (style) {
        case MBProgressHUDStyleDarkBottomText:
        {
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            
            hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.8];
            
            hud.bezelView.layer.cornerRadius = 10;
            
            hud.label.numberOfLines = 0;
            
            hud.margin = 10;
            
            
            
            hud.label.font = [UIFont T2_Font];
            
            [hud setHUDCenter:position];
            
            hud.contentColor = [UIColor whiteColor];
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    hud.mode = MBProgressHUDModeText;
    
    hud.label.text = text;
    
    [hud hideAnimated:YES afterDelay:2];
    
    [hud addGestureRecognizer:[hud hideTapGesture]];
    
    return hud;
}

@end
