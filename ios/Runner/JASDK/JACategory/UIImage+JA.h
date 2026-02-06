//
//  UIImage+JA.h
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(JA)

- (UIImage *)ja_tintColor:(UIColor *)color;
- (UIImage *)ja_blur:(CGFloat)blur;
- (UIImage *)ja_scaleToSize:(CGSize)size;
+ (UIImage*)ja_createImageWithColor:(UIColor*)color;
+ (UIImage *)ja_imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithNumber:(NSInteger)number Color:(UIColor *)color Size:(CGSize)size;

@end
