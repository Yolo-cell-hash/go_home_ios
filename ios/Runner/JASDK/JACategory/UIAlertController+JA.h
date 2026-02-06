//
//  UIAlertController+JA.h
//  Module360
//
//  Created by Wynton on 2018/8/13.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController(JA)

+ (instancetype)ja_showAlertWithTitle:(NSString *)title
                           Message:(NSString *)msg
                           Buttons:(NSArray *)buttons
                     SelectedBlock:(void(^)(NSInteger selectedIndex))selectedBlock;

@end
