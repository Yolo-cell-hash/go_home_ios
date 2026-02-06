//
//  UIColor+JAColor.h
//  JA_Item
//
//  Created by Mr.Z on 2018/1/19.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JAColor)

+ (UIColor *)theme_Color;
+ (UIColor *)theme_ColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)c1_Color;
+ (UIColor *)c2_Color;
+ (UIColor *)c4_Color;
+ (UIColor *)c5_Color;
+ (UIColor *)c6_Color;
+ (UIColor *)c7_Color;
+ (UIColor *)c8_Color;
+ (UIColor *)c9_Color;
+ (UIColor *)c10_Color;
+ (UIColor *)c11_Color;
+ (UIColor *)c12_Color;
+ (UIColor *)c13_Color;
+ (UIColor *)c14_Color;
+ (UIColor *)c15_Color;
+ (UIColor *)c16_Color;
+ (UIColor *)c17_Color;
+ (UIColor *)c18_Color;
+ (UIColor *)c19_Color;
+ (UIColor *)c20_Color;
+ (UIColor *)c21_Color;
+ (UIColor *)c22_Color;
+ (UIColor *)c23_Color;
+ (UIColor *)c24_Color;
+ (UIColor *)c25_Color;
+ (UIColor *)c26_Color;
/**黑色*/
+ (UIColor *)c3_Color;
/** 浅色线条 */
+ (UIColor *)darkModel_lineColor;
/** white color*/
+ (UIColor *)darkModel_WhiteColor;
/**暗黑模式弹窗背景色（深灰/白色）*/
+ (UIColor *)darkModel_Gray6Color;
/**暗黑模式背景色（黑色/云台浅白色）*/
+ (UIColor *)darkModel_F0F0F5;
/**暗黑模式表格选中高亮颜色*/
+ (UIColor *)darkModel_Gray2Color;
/**黑se*/
+ (UIColor *)darkModel_BlackColor;
/**红色（删除警告等）*/
+ (UIColor *)color_F33F3F;

/**自定义暗黑模式动态颜色*/
+ (UIColor *)colorWithDynamicLight:(UIColor *)lightColor Dark:(UIColor *)darkColor;

+ (UIColor *)cloudUseingColor;
+ (UIColor *)cloudFailColor;
+ (UIColor *)cloudWillUseColor;

+ (UIColor *)jaNetWorkWithWIFIColor;
+ (UIColor *)jaCricleCorrectColor;
+ (UIColor *)jaPlaybackBackColor;
+ (UIColor *)jaPlaybackButtonColor;

+ (UIColor *)warningColor;
+ (UIColor *)statusBarColor;
+ (UIColor *)deviceListImageBackgroundColor;
+(UIColor *)cloudPlayerBackgroundColor;

+ (UIColor *)defaultTableBackgroundColor;

+ (UIColor *)switchToServiceViewBgGray;

+ (UIColor *)previewBG_Color;

+ (UIColor *)deviceConnectingColor;

+ (UIColor *)previewTheme_Color;
//+ (UIColor *)previewBackgroup_Color;
+ (UIColor *)previewChannelSelect_Color;
+ (UIColor *)previewToolBottom_Color;
+ (UIColor *)previewToolTop_Color;
+ (UIColor *)previewToolSelect_Color;

+ (UIColor *)ja_hexadecimalColor:(NSString *)hexColorStr;

+ (UIColor *)ja_hexColor:(NSString *)hexColorStr Alpha:(CGFloat)alpha;
+ (UIColor *)ja_randomColorWithAlpha:(CGFloat)alpha;

@end
