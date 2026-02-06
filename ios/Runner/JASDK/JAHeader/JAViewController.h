//
//  JAViewController.h
//  Module360
//
//  Created by Wynton on 2018/8/9.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JADevice.h"


@interface JAViewController : UIViewController
- (void)backitemAction;
-(CGFloat)topSafeArerHeight;
@property (nonatomic, assign,readonly) CGFloat bottomSafeArerHight;
@property (nonatomic, strong) JADevice *device;
@property (nonatomic, assign) BOOL allowSwipeBack; //default to YES;
//@property (nonatomic, strong) JAServersBase *request;
@property (nonatomic, assign) BOOL isBlackBackImage;

@end
