//
//  MBProgressHUD+Common.h
//  ProgressHUB
//
//  Created by haidong on 03/01/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "MBProgressHUD.h"

#define MBPROGRESSHUD_IMGS_BUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MBProgressHUDStatus.bundle"]
#define MBPROGRESSHUD_IMG_PATH(name) [MBPROGRESSHUD_IMGS_BUNDLE_PATH stringByAppendingPathComponent:@#name]

typedef NS_ENUM(NSInteger, JAProgressHUDType) {
    JAProgressHUDTypeDefault,
    JAProgressHUDTypeSuccess,
    JAProgressHUDTypeFailure,
    JAProgressHUDTypeInfo,
    JAProgressHUDTypeProgress,
    JAProgressHUDTypeText,
    JAProgressHUDTypeCloudSucess,
    JAProgressHUDTypeCloudFailure,
    JAProgressHUDTypeFirmwareUpdate,
    JAProgressHUDTypeFirmwareUpdateSuccess,
};

typedef NS_OPTIONS(NSUInteger, MBProgressHUDOption) {
    MBProgressHUDOptionDimBackground = 1 << 0,
    MBProgressHUDOptionTouchDismiss = 1 << 1,
};

typedef void(^TouchActionBlock)(MBProgressHUD *hud);

typedef void(^MBCompletionBlock)(void);

@interface MBProgressHUD (Common)

@property (nonatomic, assign) BOOL dismissable;

@property (nonatomic, copy) TouchActionBlock touchAction;

@property (nonatomic, copy) MBCompletionBlock completion;


//@property (nonatomic, strong) UIColor *dimBackgroundColor;

/**
  显示指示器

 @param type 指示器类型: success failure info progress text
 @param msg 提示文字（可选）
 @param mask 是否禁止指示器后面view的触摸事件
 @param autoHide 是否自动消失
 @param progress 指示器类型为progress时启用
 @param view 添加到的view
 @param animated 动画启用与否
 @param touch 触摸屏幕事件，mask为否时不调用
 @param completion 指示器消失后执行事件
 @return hud
 */
+ (instancetype)showWithType:(JAProgressHUDType)type
                      status:(NSString *)msg
                        mask:(BOOL)mask
                    autoHide:(BOOL)autoHide
                    progress:(CGFloat)progress
                      toView:(UIView *)view
                    animated:(BOOL)animated
                  touchEvent:(TouchActionBlock)touch
                  completion:(MBCompletionBlock)completion;

+ (void)dismissForView:(UIView *)view animated:(BOOL)animated;

- (void)dismissAnimated:(BOOL)animated;

+ (void)dismissForView:(UIView *)view afterDelay:(NSTimeInterval)delay animated:(BOOL)animated;

- (void)dismissAfter:(NSTimeInterval)delay animated:(BOOL)animated;

#pragma mark -- hud style --

- (void)setHUDCenter:(CGPoint)center;

- (void)showWithOptions:(MBProgressHUDOption)options;

- (UITapGestureRecognizer *)hideTapGesture;

#pragma mark -- convenient method --

+ (instancetype)showForController:(UIViewController *)controller;

+ (instancetype)showForControllerWithNoMskeView:(UIViewController *)controller;

+ (void)dismissForController:(UIViewController *)controller;

+ (instancetype)showWithStatus:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)show:(MBProgressHUDOption)options forController:(UIViewController *)controller;

+ (instancetype)showSuccessForController:(UIViewController *)controller;

+ (instancetype)showSuccessWithStatus:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)showErrorForController:(UIViewController *)controller;

+ (instancetype)showErrorWithStatus:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)showInfoForController:(UIViewController *)controller;

+ (instancetype)showInfoWithStatus:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)showProgress:(CGFloat)progress forController:(UIViewController *)controller;

+ (instancetype)showProgress:(CGFloat)progress withStatus:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)showMessage:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)showMessage:(NSString *)text forView:(UIView *)view;
+ (instancetype)showWithStatus:(NSString *)text forView:(UIView *)view;

+ (instancetype)showSuccessWithCloudStatus:(NSString *)text forController:(UIViewController *)controller;

+ (instancetype)showSuccessWithCloudStatus:(NSString *)text forView:(UIView *)view;

+ (instancetype)showErrorWithCloudStatus:(NSString *)text forController:(UIViewController *)controller;
/**
 展示指示器到navigation controller顶层

 @param navController 展示源
 @param text 文本
 @param mask 是否禁止指示器背后视图的触摸事件
 @return hud
 */
+ (instancetype)showToTopNavController:(UINavigationController *)navController status:(NSString *)text mask:(BOOL)mask animated:(BOOL)animated;

+ (instancetype)showProgress:(CGFloat)progress toTopNavController:(UINavigationController *)navController status:(NSString *)text mask:(BOOL)mask animated:(BOOL)animated;


// 2018.7.4
+ (instancetype)showToAnyView:(UIView *)view;

+ (instancetype)showMessageToAnyView:(UIView *)view message:(NSString *)message;


+ (instancetype)dismissAnyView:(UIView *)view;


@end
