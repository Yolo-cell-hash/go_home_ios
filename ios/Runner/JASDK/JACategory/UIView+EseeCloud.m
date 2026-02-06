//
//  UIView+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-7.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "UIView+EseeCloud.h"
//#import <QuartzCore/QuartzCore.h>
//#import <objc/runtime.h>


@implementation UIView (EseeCloud)

- (float)btmY
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setBtmY:(float)y
{
    CGRect rect = self.frame;
    rect.origin.y = y - self.frame.size.height;
    self.frame = rect;
}

- (float)rightX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRightX:(float)x
{
    CGRect rect = self.frame;
    rect.origin.x = x - self.frame.size.width;
    self.frame = rect;
}

- (float)boundsWidth
{
    return self.bounds.size.width;
}

- (float)boundsHeight
{
    return self.bounds.size.height;
}

- (void)setBoundsWidth:(float)w
{
    CGRect frame = self.bounds;
    frame.size.width = w;
    self.bounds = frame;
}

- (void)setBoundsHeight:(float)h
{
    CGRect frame = self.bounds;
    frame.size.height = h;
    self.bounds = frame;
}

- (CGPoint)boundsCenter
{
    CGPoint temp = self.center;
    temp.y = self.center.y - self.y;
    temp.x = self.center.x - self.x;
    return temp;
}

- (float)centerX
{
    return self.center.x;
}
- (float)centerY
{
    return self.center.y;
}

- (void)setCenterY:(float)y
{
    CGPoint temp = self.center;
    temp.y = y;
    self.center = temp;
}
- (void)setCenterX:(float)x
{
    CGPoint temp = self.center;
    temp.x = x;
    self.center = temp;
}

- (float)x
{
    return self.frame.origin.x;
}

- (float)y
{
    return self.frame.origin.y;
}

- (float)width
{
    return self.frame.size.width;
}

- (float)height
{
    return self.frame.size.height;
}

- (void)setX:(float)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(float)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(float)w
{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

- (void)setHeight:(float)h
{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}


- (void)setSize:(CGSize)size
{
    CGRect rt = self.frame;
    rt.size = size;
    self.frame = rt;
}

- (CGSize)size
{
    return self.frame.size;
}


- (CGFloat)BH_bottom
{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)BH_height
{
    return self.frame.size.height;
}


//渐入动画：从透明逐渐清晰
- (void)fadeInWithDuration:(NSTimeInterval)duration
{
    [self fadeInWithDuration:duration OnComplet:nil];
}

- (void)fadeInWithDuration:(NSTimeInterval)duration OnComplet:(void(^)(BOOL finished))complet
{
    self.alpha = 0;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 1;
    } completion:complet];
}

//渐出动画：逐渐透明消失
- (void)fadeOutWithDuration:(NSTimeInterval)duration
{
    [self fadeOutWithDuration:duration OnComplet:nil];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration OnComplet:(void(^)(BOOL finished))complet
{
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 0;
    } completion:complet];
    
	if ([UIView areAnimationsEnabled])
    {
		[UIView setAnimationsEnabled:YES];
	}
}

- (void)removeAllSubviews
{
    for (UIView *temp in self.subviews) {
        [temp removeFromSuperview];
    }
}

- (void)removeSubviewWithTag:(NSInteger)tag
{
    for (UIView *temp in self.subviews) {
        if (temp.tag==tag) {
            [temp removeFromSuperview];
        }
    }
}

- (void)removeSubviewExceptTag:(NSInteger)tag
{
    for (UIView *temp in self.subviews) {
        if (temp.tag!=tag) {
			if ([temp isKindOfClass:[UIImageView class]])
            {
				[(UIImageView *)temp setImage:nil];
			}
            [temp removeFromSuperview];
        }
    }
}

- (void)removeSubviewExceptClass:(Class)class
{
    for (UIView *temp in self.subviews) {
        if (![temp isKindOfClass:class]) {
            [temp removeFromSuperview];
        }
    }
}

- (UIView *)addLine:(UIColor *)color frame:(CGRect)frame
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = color;
    [self addSubview:line];
    return line;
}






#pragma mark - --- 截图 ---
- (UIImage *)toImageWithRect:(CGRect)frame withAlpha:(BOOL)alpha
{
    UIGraphicsBeginImageContextWithOptions(frame.size, !alpha, 1);//这里通过设置scale为1来截取{[UIScreen screenWidth], 49}大小的图,而不是在retina下截取2x大小的图
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, CGAffineTransformMakeTranslation(-frame.origin.x, -frame.origin.y));
    [self.layer renderInContext:context];
    UIImage *screenShot1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenShot1;
}

#pragma mark - --- 旋转视图 ---
- (void)rotationWithAngle:(float)angle
{
    self.transform = CGAffineTransformMakeRotation(M_PI/360*angle);
}

#pragma mark - --- 阴影设置 ---
- (void)addShadow
{
	[self addShadowWithAlpha:1 Color:[UIColor grayColor]];
}

- (void)addShadowWithAlpha:(float)alpha Color:(UIColor *)color
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 5, self.bounds.size.width, self.bounds.size.height)];
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowOpacity:alpha];
    [self.layer setShadowRadius:10.0f];
    [self.layer setShadowPath:[path CGPath]];
}

- (void)removeShadow
{
	self.layer.shadowOpacity = 0;
	self.layer.shadowRadius = 0;
}

#pragma mark - --- 边框操作 ---
- (void)addBorder
{
    [self addBorderWithColor:[UIColor grayColor] BorderWidth:0.5f];
}

- (void)addBorderWithColor:(UIColor *)color BorderWidth:(float)width
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)removeBorder
{
    [self addBorderWithColor:nil BorderWidth:0.0];
}

#pragma mark - --- 查找第一相应者 ---
- (UIView *)findAndResignFirstResponder
{
    if (self.isFirstResponder)
    {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *temp = [subView findAndResignFirstResponder];
        if (temp!=nil) {
            return temp;
        }
    }
    return nil;
}

#pragma mark - --- 晃动动画 ---
- (void)shakeY:(float)range IsRepeat:(BOOL)isRepeat
{
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = isRepeat ? 0.6 : 0.5;
    if (isRepeat) {
        animation.repeatCount = NSIntegerMax;
    }
    animation.values = @[ @(-range), @(range), @(-range/2), @(range/2), @(-range/5), @(range/5), @(0) ];
    [self.layer addAnimation:animation forKey:@"shake"];
}

- (void)shakeX:(float)range IsRepeat:(BOOL)isRepeat
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = isRepeat ? 0.6 : 0.5;
    if (isRepeat) {
        animation.repeatCount = NSIntegerMax;
    }
    animation.values = @[ @(-range), @(range), @(-range/2), @(range/2), @(-range/5), @(range/5), @(0) ];
    [self.layer addAnimation:animation forKey:@"shake"];
}

- (void)beat:(float)range IsRepeat:(BOOL)isRepeat Duration:(CGFloat)duration Key:(NSString *)key;
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    if (isRepeat) {
        animation.repeatCount = NSIntegerMax;
    }
    animation.values = @[@(range/2),@(-range/2), @(range/2), @(-range/2), @(range/2), @(-range/2), @(range/2) ];
    [self.layer addAnimation:animation forKey:key];

}

#pragma mark - --- UIView动画 ---
+ (void)vviewAnimateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void (^)(void))animations
{
	[UIView vviewAnimateWithDuration:duration delay:delay animations:animations completion:nil];
}


+ (void)vviewAnimateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
	[UIView vviewAnimateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:animations completion:completion];
}

+ (void)vviewAnimateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
	if (![UIView areAnimationsEnabled]) {
		[UIView setAnimationsEnabled:YES];
	}
	[UIView animateWithDuration:duration delay:delay options:options animations:animations completion:completion];
}


- (BOOL)hasActionSheetOrAlert
{
    if ([self isKindOfClass:[UIAlertView class]]||[self isKindOfClass:[UIActionSheet class]])
    {
        return YES;
    }
    for (UIView *subView in self.subviews) {
        BOOL temp = [subView hasActionSheetOrAlert];
        if (temp) {
            return temp;
        }
    }
    return NO;
}

- (UIView *)subviewWithTag:(NSInteger)tag
{
    for (UIView *temp in self.subviews) {
        if (temp.tag==tag)
        {
            return temp;
        }
    }
    return nil;
}



- (void)vviewTransitionAnimateWithType:(WJAnimationType)animationType SubTypeString:(NSString *)subtypeString duration:(NSTimeInterval)duration
{
   
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self Duration:duration];
            break;
            
        case CurlDown:
            [self animationWithView:self WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
}

#pragma CATransition动画实现
- (void) transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView:(UIView *)view Duration:(NSTimeInterval)duration
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = duration;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}


#pragma UIView实现动画
- (void) animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition
{
    [UIView animateWithDuration:.7f animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}




@end
