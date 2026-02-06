//
//  UIColor+JAColor.m
//  JA_Item
//
//  Created by Mr.Z on 2018/1/19.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "UIColor+JAColor.h"
 
@implementation UIColor (JAColor)
+ (UIColor *)theme_Color {
//    return [self ja_hexadecimalColor:[JAODMInfo info].general.themeColor];
    return JAColorFromHex(0x3e78c4,1.0);
}

+ (UIColor *)theme_ColorWithAlpha:(CGFloat)alpha {
    return JAColorFromHex(0x3e78c4, alpha);
}
+ (UIColor *)c1_Color {
//    return JAColorFromHex(0x00d050, 1);
    return [self theme_Color];
}

+ (UIColor *)c2_Color {
    return JAColorFromHex(0xec4e4e, 1);
};
/** 黑色*/
+ (UIColor *)c3_Color { //black
    
    if (@available(iOS 13.0, *)) {
        UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return JAColorFromHex(0x333333, 1);
            }
            else {
                return [UIColor labelColor];
            }
        }];
        return dyColor;
    } else {
        // Fallback on earlier versions
        return JAColorFromHex(0x333333, 1);
    }
};
/** GrayColor lightTextColor */
+ (UIColor *)c4_Color {
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0x808080, 1) : [UIColor lightTextColor];
        }];
    } else {
        // Fallback on earlier versions
        dyColor = JAColorFromHex(0x808080, 1);
    }
    return dyColor;
};
/** GrayColor */
+ (UIColor *)c5_Color { //graycolor
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0x888888, 1) : [UIColor systemGrayColor];
        }];
    } else {
        // Fallback on earlier versions
        dyColor = JAColorFromHex(0x888888, 1);
    }
    
    return dyColor;
};

+ (UIColor *)c6_Color {
    return JAColorFromHex(0xaaaaaa, 1);
};
/** LightGray Color */
+ (UIColor *)c7_Color {
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0xdddddd, 1) : [UIColor systemGray3Color];
        }];
    } else {
        // Fallback on earlier versions
        dyColor = JAColorFromHex(0xdddddd, 1);
    }
  return dyColor;
};
/** groupTableViewBackgroundColor */
+ (UIColor *)c8_Color {
    UIColor *dyColor;
      if (@available(iOS 13.0, *)) {
          dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
              return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0xefeff4, 1) : [UIColor groupTableViewBackgroundColor];
          }];
      } else {
          // Fallback on earlier versions
          dyColor = JAColorFromHex(0xefeff4, 1);
      }
  return dyColor;
};
/** white color*/
+ (UIColor *)c9_Color { //白色
    return JAColorFromHex(0xffffff,1);
};

+ (UIColor *)c10_Color  {
  return JAColorFromHex(0x009cff, 1);
};
/** 线条浅白灰色 */
+ (UIColor *)c11_Color {
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0xeeeeee, 1) : [UIColor systemGray3Color];
        }];
    } else {
        // Fallback on earlier versions
        dyColor = JAColorFromHex(0xeeeeee, 1);
    }
    return dyColor;
}

+ (UIColor *)c12_Color {
    return JAColorFromHex(0xa9aaab, 1);
}

+ (UIColor *)c13_Color {
    return [UIColor c11_Color];
}
/**蓝色字体颜色*/
+ (UIColor *)c14_Color {
    return JAColorFromHex(0x3E78C4, 1);
}

+ (UIColor *)c15_Color {
    return [self theme_Color];
}

+ (UIColor *)c16_Color {
    return JAColorFromHex(0x4B4B4C, 1);
}

//红色 警告
+ (UIColor *)c17_Color {
    return JAColorFromHex(0xE72222, 1);
}

+ (UIColor *)c18_Color {
    return JAColorFromHex(0xE41D1D, 1);
};
+ (UIColor *)c19_Color {
    return JAColorFromHex(0xff1f31, 1);
};
/** 浅色线条 */
+ (UIColor *)darkModel_lineColor { //
       return [UIColor c11_Color];
};
/** white colo白色r*/
+ (UIColor *)darkModel_WhiteColor { //白色
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor systemBackgroundColor];
    } else {
        dyColor = [UIColor whiteColor];
    }
       return dyColor;
};
/**暗黑模式弹窗背景色（深灰/白色）*/
+ (UIColor *)darkModel_Gray6Color {
    
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0xffffff, 1) : [UIColor systemGray6Color];
        }];
    } else {
        dyColor = JAColorFromHex(0xffffff, 1);
    }
    return dyColor;
};
/**暗黑模式表格选中高亮颜色*/
+ (UIColor *)darkModel_Gray2Color {
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0xC3C3C3, 1) : [UIColor systemGray2Color];
        }];
    } else {
        dyColor = JAColorFromHex(0xC3C3C3, 1);
    }
    return dyColor;
};
/**暗黑模式背景色（黑色/云台浅白色）*/
+ (UIColor *)darkModel_F0F0F5 {
    
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? JAColorFromHex(0xF0F0F5, 1) : [UIColor systemBackgroundColor];
        }];
    } else {
        dyColor = JAColorFromHex(0xF0F0F5, 1);
    }
    return dyColor;
};
/**黑se*/
+ (UIColor *)darkModel_BlackColor {
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor labelColor];
    } else {
        dyColor = [UIColor blackColor];
    }
    return dyColor;
};

+ (UIColor *)color_F33F3F {
    return JAColorFromHex(0xF33F3F, 1);;
}
/**自定义暗黑模式动态颜色*/
+ (UIColor *)colorWithDynamicLight:(UIColor *)lightColor Dark:(UIColor *)darkColor {
    UIColor *dyColor;
    if (@available(iOS 13.0, *)) {
        dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) ? lightColor : darkColor;
        }];
    } else {
        dyColor = lightColor;
    }
    return dyColor;
}

+ (UIColor *)warningColor {
    return JAColorFromHex(0xffdcdd, 1);
}
+ (UIColor *)statusBarColor {
    return JAColorFromHex(0x2d5b8d, 1);
}

+ (UIColor *)deviceListImageBackgroundColor {
//    return JAColorFromHex(0xefeff4, 1);
    return [self c4_Color];
}

+(UIColor *)cloudPlayerBackgroundColor {
    return JAColorFromHex(0xC9C9C9, 1);
}



+ (UIColor *)defaultTableBackgroundColor {
    return JAColorFromHex(0xefeff4, 1);
}


+ (UIColor *)switchToServiceViewBgGray {
    return JAColorFromHex(0x7a7a7a, 1);
}


+ (UIColor *)deviceConnectingColor {
    return JAColorFromHex(0xf78135, 1);
}

+ (UIColor *)cloudUseingColor {
    return JAColorFromHex(0x0E9B39, 1);
}

+ (UIColor *)cloudFailColor {
    return JAColorFromHex(0xC61010, 1);
}

+ (UIColor *)cloudWillUseColor {
    return JAColorFromHex(0x808080, 1);
}

+ (UIColor *)jaNetWorkWithWIFIColor {
    return JAColorFromHex(0x3E78C4, 1);
}

+ (UIColor *)jaCricleCorrectColor {
    return JAColorFromHex(0x36C4B5, 1);
}

+ (UIColor *)jaPlaybackBackColor {
    return [UIColor darkModel_F0F0F5];
}

+ (UIColor *)jaPlaybackButtonColor {
    return [self theme_Color];
}

+ (UIColor *)previewTheme_Color {
    return [self theme_Color];
}

+ (UIColor *)previewBG_Color {
    //    return JAColorFromHex(0x1d1f21, 1);
    return [self ja_hexadecimalColor:@"#000000"];
    //return [UIColor redColor];
}

+ (UIColor *)previewChannelSelect_Color {
    return [self ja_hexadecimalColor:@"#800080"];
}

//需json定制项
+ (UIColor *)previewToolBottom_Color {
    return  [self ja_hexadecimalColor:@"#1D1F21"];//[UIColor previewTheme_Color];
}

//需json定制项
+ (UIColor *)previewToolTop_Color {
    return  [self ja_hexadecimalColor:@"#1D1F21"];//[UIColor previewTheme_Color];
}

//需json定制项
+ (UIColor *)previewToolSelect_Color{
    return  [self ja_hexadecimalColor:@"#3e78c4"];//[UIColor previewChannelSelect_Color];
}

//时间轴缩放控件背景色
+ (UIColor *)c20_Color
{
    return JAColorFromHex(0xcccccc, 1);
}

//回放时间颜色
+ (UIColor *)c21_Color
{
    return JAColorFromHex(0x6565667, 1);
}

//回放缩略图背景颜色
+ (UIColor *)c22_Color
{
    return JAColorFromHex(0x78787a, 1);
}

//UI设计出来的各种红色
+ (UIColor *)c23_Color
{
    return JAColorFromHex(0xDD4949, 1);
}
//UI设计出来的各种黑色字体
+ (UIColor *)c24_Color
{
    return JAColorFromHex(0x4D4D4D, 1);
}
//UI设计出来的各种蓝色switch背景色
+ (UIColor *)c25_Color
{
    return JAColorFromHex(0x4D83C9, 1);
}
//UI设计出来的各种黑色字体
+ (UIColor *)c26_Color
{
    return JAColorFromHex(0x26292E, 1);
}


+ (UIColor *)ja_hexadecimalColor:(NSString *)hexColorStr
{
    
    NSString *hexColor;
    if ([hexColorStr hasPrefix:@"#"]) {
        hexColor = [hexColorStr substringFromIndex:1];
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    //取得red的值
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    //取得green的值
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    //取得blue的值
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0];
}

+ (UIColor *)ja_hexColor:(NSString *)hexColorStr Alpha:(CGFloat)alpha
{
    
    NSString *hexColor;
    if ([hexColorStr hasPrefix:@"#"]) {
        hexColor = [hexColorStr substringFromIndex:1];
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    //取得red的值
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    //取得green的值
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    //取得blue的值
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}

+ (UIColor *)ja_randomColorWithAlpha:(CGFloat)alpha {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

@end
