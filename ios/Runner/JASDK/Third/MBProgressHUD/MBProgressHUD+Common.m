//
//  MBProgressHUD+Common.m
//  ProgressHUB
//
//  Created by haidong on 03/01/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import "MBProgressHUD+Common.h"
#import <objc/runtime.h>


#define topWindow(name) UIWindow *name = [UIApplication sharedApplication].windows.lastObject



@implementation MBProgressHUD (Common)

@dynamic dismissable;
@dynamic touchAction;
@dynamic completion;

static char dismissableKey;
static char touchActionKey;
static char completionKey;

+ (instancetype)showWithType:(JAProgressHUDType)type
                      status:(NSString *)status
                        mask:(BOOL)mask
                    autoHide:(BOOL)autoHide
                    progress:(CGFloat)progress
                      toView:(UIView *)view
                    animated:(BOOL)animated
                  touchEvent:(void(^)(MBProgressHUD *))touchEvent
                  completion:(MBCompletionBlock)completion {
    if (!view) {
        return nil;
    }
    [MBProgressHUD removeExistingHudOnView:view];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    if (!mask) {
        hud.userInteractionEnabled = NO;
        hud.backgroundView.userInteractionEnabled = NO;
    } else {
        if (touchEvent) {
            hud.touchAction = touchEvent;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:hud action:@selector(hudDidTouch)];
            [hud addGestureRecognizer:tap];
        }
    }
    
    hud.completion = completion;
    
    if (autoHide) {
        
        if (type == JAProgressHUDTypeSuccess) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud dismissAnimated:animated];
            });
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud dismissAnimated:animated];
            });
        }
    }
    
    if (status) {
        hud.label.text = status;
        hud.label.numberOfLines = 0;
    }
    
    switch (type) {
        case JAProgressHUDTypeDefault:
        {
            
        }
            break;
        case JAProgressHUDTypeSuccess:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(success)]];
        
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
        }
            break;
        case JAProgressHUDTypeFailure:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(error)]];
        
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
        
        }
            break;
        case JAProgressHUDTypeInfo:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(info)]];
            
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
        }
            break;
        case JAProgressHUDTypeProgress:
        {
            if (hud.mode == MBProgressHUDModeDeterminate) {
                hud.progress = progress;
                return hud;
            }

            hud.mode = MBProgressHUDModeDeterminate;
            hud.progress = progress;
            
        }
            break;
            
        case JAProgressHUDTypeText:
        {
            hud.mode = MBProgressHUDModeText;
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.bezelView.backgroundColor = UIColor.blackColor;
            hud.label.textColor = UIColor.whiteColor;
        }
            break;
        
        case JAProgressHUDTypeCloudSucess:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(cloudSuccess)]];
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.bezelView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
            hud.label.textColor = UIColor.whiteColor;
        }
            break;
            
        case JAProgressHUDTypeCloudFailure:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(cloudError)]];
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.bezelView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
            hud.label.textColor = UIColor.whiteColor;
        }
            break;
        case JAProgressHUDTypeFirmwareUpdate:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(update_firmware)]];
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.bezelView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            hud.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
            hud.label.textColor = UIColor.whiteColor;
        }
            break;
        case JAProgressHUDTypeFirmwareUpdateSuccess:
        {
            UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:MBPROGRESSHUD_IMG_PATH(cloudSuccess)]];
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.bezelView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            hud.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imgv;
            hud.label.textColor = UIColor.whiteColor;
        }
            break;
            
        default:
            break;
    }
    
    return hud;
}

+ (void)dismissForView:(UIView *)view animated:(BOOL)animated {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud) {
        [hud hudWillComplete];
        [hud hideAnimated:animated];
    }
}

+ (void)dismissForView:(UIView *)view afterDelay:(NSTimeInterval)delay animated:(BOOL)animated {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud) {
        [hud hudWillComplete];
        [hud hideAnimated:animated afterDelay:delay];
    }
}

- (void)dismissAnimated:(BOOL)animated {
    [self hudWillComplete];
    [self hideAnimated:animated];
}

- (void)dismissAfter:(NSTimeInterval)delay animated:(BOOL)animated {
    [self hudWillComplete];
    [self hideAnimated:animated afterDelay:delay];
}

- (void)hudDidTouch {
    if (self.touchAction) {
        self.touchAction(self);
    }
}

- (void)hudWillComplete {
    if (self.completion) {
        self.completion();
    }
}

+ (void)removeExistingHudOnView:(UIView *)view {
    MBProgressHUD *hud;
    if ((hud = [self HUDForView:view])) {
        [hud hideAnimated:NO];
        hud = nil;
    }
}

- (UITapGestureRecognizer *)hideTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToHide)];
    tap.numberOfTapsRequired = 1;
    return tap;
}

- (void)tapToHide {
    [self hideAnimated:YES];
}

#pragma mark -- styling --

- (void)setHUDCenter:(CGPoint)center {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGPoint offsetForCenter = CGPointZero;
    CGFloat centerX = width/2;
    CGFloat centerY = height/2;
    if (centerX > center.x) {
        offsetForCenter.x = -(centerX - center.x);
    } else {
        offsetForCenter.x = center.x - centerX;
    }
    if (centerY > center.y) {
        offsetForCenter.y = -(centerY - center.y);
    } else {
        offsetForCenter.y = center.y - centerY;
    }

    self.offset = offsetForCenter;
}


- (void)showWithOptions:(MBProgressHUDOption)options {
    if (options & MBProgressHUDOptionDimBackground) {
        //
        self.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.backgroundView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    if (options & MBProgressHUDOptionTouchDismiss ) {
        [self addGestureRecognizer:[self hideTapGesture]];
    }

}

#pragma mark -- convenient method --

+ (instancetype)showForController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeDefault status:nil mask:YES autoHide:NO progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showForControllerWithNoMskeView:(UIViewController *)controller {
     return [self showWithType:JAProgressHUDTypeDefault status:nil mask:NO autoHide:NO progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (void)dismissForController:(UIViewController *)controller {
    [self dismissForView:controller.view animated:YES];
}

+ (instancetype)showWithStatus:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeDefault status:text mask:YES autoHide:NO progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}
+ (instancetype)showWithStatus:(NSString *)text forView:(UIView *)view{
    return [self showWithType:JAProgressHUDTypeDefault status:text mask:YES autoHide:NO progress:0 toView:view animated:YES touchEvent:nil completion:nil];
}
+ (instancetype)show:(MBProgressHUDOption)options forController:(UIViewController *)controller {
    MBProgressHUD *hud = [self showForController:controller];
    if (hud) {
        [hud showWithOptions:options];
    }
    return hud;
}

+ (instancetype)showSuccessForController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeSuccess status:nil mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showSuccessWithStatus:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeSuccess status:text mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showSuccessWithCloudStatus:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeCloudSucess status:text mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showSuccessWithCloudStatus:(NSString *)text forView:(UIView *)view {
    return [self showWithType:JAProgressHUDTypeCloudSucess status:text mask:NO autoHide:YES progress:0 toView:view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showErrorForController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeFailure status:nil mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showErrorWithStatus:(NSString *)text forController:(UIViewController *)controller {
    if([text isEqualToString:@"3003"]){//token过期时，不显示提示，并自动重新登录
        [self dismissForController:controller];
        return nil;
    }
    return [self showWithType:JAProgressHUDTypeFailure status:text mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showErrorWithCloudStatus:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeCloudFailure status:text mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showInfoForController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeInfo status:nil mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showInfoWithStatus:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeInfo status:text mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showProgress:(CGFloat)progress forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeProgress status:nil mask:NO autoHide:NO progress:progress toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showProgress:(CGFloat)progress withStatus:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeProgress status:text mask:NO autoHide:NO progress:progress toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showMessage:(NSString *)text forController:(UIViewController *)controller {
    return [self showWithType:JAProgressHUDTypeText status:text mask:NO autoHide:YES progress:0 toView:controller.view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showMessage:(NSString *)text forView:(UIView *)view {
    return [self showWithType:JAProgressHUDTypeText status:text mask:NO autoHide:YES progress:0 toView:view animated:YES touchEvent:nil completion:nil];
}

+ (instancetype)showToTopNavController:(UINavigationController *)navController status:(NSString *)text mask:(BOOL)mask animated:(BOOL)animated {
    return [self showWithType:JAProgressHUDTypeDefault status:text mask:mask autoHide:NO progress:0 toView:navController.view animated:animated touchEvent:nil completion:nil];
}

+ (instancetype)showProgress:(CGFloat)progress toTopNavController:(UINavigationController *)navController status:(NSString *)text mask:(BOOL)mask animated:(BOOL)animated {
    return [self showWithType:JAProgressHUDTypeProgress status:text mask:mask autoHide:NO progress:progress toView:navController.view animated:animated touchEvent:nil completion:nil];
}

#pragma mark -- property --

- (BOOL)dismissable {
    return [(NSNumber *)objc_getAssociatedObject(self, &dismissableKey) boolValue];
}

- (void)setDismissable:(BOOL)dismissable {
    objc_setAssociatedObject(self, &dismissableKey, @(dismissable), OBJC_ASSOCIATION_ASSIGN);
}

- (TouchActionBlock)touchAction {
    return objc_getAssociatedObject(self, &touchActionKey);
}

- (void)setTouchAction:(TouchActionBlock)touchAction {
    objc_setAssociatedObject(self, &touchActionKey, touchAction, OBJC_ASSOCIATION_COPY);
}

- (MBCompletionBlock)completion {
    return objc_getAssociatedObject(self, &completionKey);
}

- (void)setCompletion:(MBCompletionBlock)completion {
    objc_setAssociatedObject(self, &completionKey, completion, OBJC_ASSOCIATION_COPY);
}

// 2018.7.4
+ (instancetype)showToAnyView:(UIView *)view
{
    return [self showWithType:JAProgressHUDTypeDefault status:nil mask:YES autoHide:NO progress:0 toView:view animated:YES touchEvent:nil completion:nil];
}
+ (instancetype)showMessageToAnyView:(UIView *)view message:(NSString *)message
{
    return [self showWithType:JAProgressHUDTypeText status:message mask:NO autoHide:YES progress:0 toView:view animated:YES touchEvent:nil completion:nil];
    
}

+ (instancetype)dismissAnyView:(UIView *)view animated:(BOOL)animated
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud) {
        [hud hudWillComplete];
        [hud hideAnimated:animated];
    }
    return hud;
}

@end
