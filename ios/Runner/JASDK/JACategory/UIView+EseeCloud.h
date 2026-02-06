//
//  UIView+Additions.h
//  Additions
//
//  Created by Wynton on 15-6-7.
//  Copyright (c) 2015年 Wynton. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} WJAnimationType;


@interface UIView (EseeCloud)



- (float)x;
- (float)y;
- (float)width;
- (float)height;

- (void)setX:(float)x;
- (void)setY:(float)y;
- (void)setWidth:(float)w;
- (void)setHeight:(float)h;

- (void)setSize:(CGSize)size;
- (CGSize)size;

- (float)btmY;
- (void)setBtmY:(float)y;

- (float)rightX;
- (void)setRightX:(float)x;

- (float)boundsWidth;
- (float)boundsHeight;
- (void)setBoundsWidth:(float)w;
- (void)setBoundsHeight:(float)h;   

- (float)centerX;
- (float)centerY;
- (void)setCenterX:(float)x;
- (void)setCenterY:(float)y;

- (CGFloat)BH_bottom;
- (CGFloat)BH_height;
- (CGPoint)boundsCenter;

//子视图操作
- (void)removeAllSubviews;                      //移除所有子视图
- (void)removeSubviewWithTag:(NSInteger)tag;    //移除指定Tag视图
- (void)removeSubviewExceptTag:(NSInteger)tag;  //移除除了该Tag值以外的视图
- (void)removeSubviewExceptClass:(Class)class1; //移除所有该类的视图
- (UIView *)subviewWithTag:(NSInteger)tag;      //获得指定子视图


/**
 *  截图
 *
 *  @param frame 截取范围
 *  @param alpha 截取后图透明度
 */
- (UIImage *)toImageWithRect:(CGRect)frame withAlpha:(BOOL)alpha;

//阴影操作
- (void)addShadow; //添加阴影 , 默认颜色为grayColor , alpht = 1
- (void)addShadowWithAlpha:(float)alpha Color:(UIColor *)color;
- (void)removeShadow;

//边框操作
- (void)addBorder; //添加边框（默认: color = grayColor , With = 0.5）;
- (void)addBorderWithColor:(UIColor *)color BorderWidth:(float)width;
- (void)removeBorder;

/**
 *  旋转
 *
 *  @param angle 选择度数
 */
- (void)rotationWithAngle:(float)angle;


/**
 *  查找第一响应者View
 */
- (UIView *)findAndResignFirstResponder;

///添加一条线（实质是添加一个单色view）
- (UIView *)addLine:(UIColor *)color frame:(CGRect)frame;

///UIView自定义动画(duration为动画时间,delay延时播放时间)
+ (void)vviewAnimateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void (^)(void))animations;
+ (void)vviewAnimateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;
+ (void)vviewAnimateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

///晃动动画： range:晃动幅度 ， isRepeat:是否重复
- (void)shakeX:(float)range IsRepeat:(BOOL)isRepeat;
- (void)shakeY:(float)range IsRepeat:(BOOL)isRepeat;

///淡入动画(duration为动画时间)
- (void)fadeInWithDuration:(NSTimeInterval) duration;     //淡入动画
- (void)fadeOutWithDuration:(NSTimeInterval)duration;    //淡出动画 （View仍然存在，只是alpha = 0）
- (void)fadeInWithDuration:(NSTimeInterval) duration  OnComplet:(void(^)(BOOL finished))complet;
- (void)fadeOutWithDuration:(NSTimeInterval)duration  OnComplet:(void(^)(BOOL finished))complet;

///判断视图和其子视图是否为ActionSheet或AlertView
- (BOOL)hasActionSheetOrAlert;

///transitiond动画
//@param animationTyoe 动画类型
//@param subTypeString 动画的子类型(如:向上,向左)
///@param duration 动画时长
- (void)vviewTransitionAnimateWithType:(WJAnimationType)animationType SubTypeString:(NSString *)subtypeString duration:(NSTimeInterval)duration;

- (void)beat:(float)range IsRepeat:(BOOL)isRepeat Duration:(CGFloat)duration Key:(NSString *)key;





@end
