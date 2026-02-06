 //
//  JAPanoramaScreen+Animation.m
//  VRCam
//
//  Created by Mr.Z on 2017/9/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "JAPanoramaScreen+Animation.h"
#import <objc/runtime.h>


@implementation JAPanoramaScreen (Animation)

/**
 *  四分屏标识位
 */
- (void)setFourscreen:(BOOL)object {
    objc_setAssociatedObject(self, @selector(fourscreen), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)fourscreen {
    return [objc_getAssociatedObject(self, @selector(fourscreen)) boolValue];
}

/**
 *  动画展开标识位
 *
 */
- (void)setVideoIsUnfold:(BOOL)object {
    objc_setAssociatedObject(self, @selector(videoIsUnfold), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)videoIsUnfold {
    return [objc_getAssociatedObject(self, @selector(videoIsUnfold)) boolValue];
}

/**
 *  巡航标志
 *
 */
- (void)setPatrol:(BOOL)object {
    objc_setAssociatedObject(self, @selector(patrol), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)patrol {
    return [objc_getAssociatedObject(self, @selector(patrol)) boolValue];
}

- (void)foldAnimatedEnd {
    self.videoIsUnfold = NO;
}
- (void)unFoldAnimatedEnd {
     self.videoIsUnfold = YES;
}

/**
 *  清除状态记录
 *
 */
- (void)clearFourModelRecord{
    self.fourscreen = NO;
    self.videoIsUnfold = NO;
}

/**
 * 双击手势
 *
 */
- (void)onDoubleTapGestureActived:(UITapGestureRecognizer *)doubletap{
    [self stopAllanimation];
    //四分屏
    if (self.displayMode == JAScreenDisplayModeFour) {
        self.fourscreen = YES;
        //获取四分屏点击的区域
        NSInteger index = [self doubleTapEArea:doubletap];
        JACoordinate position = [self getCoordinate:JAPanoramaScreenAnimationTypePosition Texture:NO ScreenIndex:index];
        JACoordinate rotate = [self getCoordinate:JAPanoramaScreenAnimationTypeRotate Texture:NO ScreenIndex:index];
        //切换为鱼眼模式
        self.displayMode = JAScreenDisplayModeHemisphere;
        //转换到对应的位置
        [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:position TextureTransform:NO Step:1 Duration:0 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:1];
        [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:rotate TextureTransform:NO Step:1 Duration:0 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:1];
        return;
    }else{
        //标识位未清空，切换为四分屏模式
        if (self.fourscreen) {
            self.displayMode = JAScreenDisplayModeFour;
        }
    }
    
    //半球，圆柱双击（启动展开或者合拢动画）
    if (!self.videoIsUnfold) {
        [self StartAnimationSinkInWithPatrol];
    }else{
        [self StartAnimationBuoyWithPatrol];
    }
}


/**
 启动沉入动画 (只针对半球模式、圆柱模式)
 */
- (void)StartAnimationSinkInWithPatrol{
    [self cleanAnimation];
    switch (self.displayMode) {
        case JAScreenDisplayModeHemisphere:
        {
            //半球
            if (self.fixMode == JADeviceFixModeWall) {
                //壁挂
                JACoordinate coordinate = [self getCoordinate:JAPanoramaScreenAnimationTypePosition Texture:NO ScreenIndex:0];
                coordinate.z = 2;
                [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:coordinate TextureTransform:NO Step:100 Duration:500 isRepeat:NO Inertia:YES ScreenIndex:0 Flag: kHemisphereUnfoldAnimatedTag];
                [self unFoldAnimatedEnd];
                NSLog(@"动画------》壁挂");
            }else if (self.fixMode == JADeviceFixModeCeil) {
                //吊顶
                JACoordinate coordinate = { 0, 0, 3};
                [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:coordinate TextureTransform:NO Step:50 Duration:0 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:1];
                JACoordinate roate = [self getCoordinate:JAPanoramaScreenAnimationTypeRotate Texture:NO ScreenIndex:0];

                JACoordinate vec = {45, 0,(roate.z + 90)};
                [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:vec TextureTransform:NO Step:50 Duration:0 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:kHemisphereUnfoldAnimatedTag];
                [self unFoldAnimatedEnd];
                NSLog(@"动画------》吊顶");
            }
            
        }
            break;
        case JAScreenDisplayModeCylinder: {
            //圆柱
            JACoordinate vec = {6,1,1};
            [self startAnimation:JAPanoramaScreenAnimationTypeScale Coordinate:vec TextureTransform:YES Step:100 /3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:1];
            JACoordinate vec1 = {0,0,0};
            [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:vec1 TextureTransform:NO Step:100 /3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:1];
            JACoordinate vec2 = {1.5,1.5,1.5};
            [self startAnimation:JAPanoramaScreenAnimationTypeScale Coordinate:vec2 TextureTransform:NO Step:100 /3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:kHemisphereUnfoldAnimatedTag];
            [self unFoldAnimatedEnd];
            NSLog(@"动画------》圆柱");
        }
            break;
        case JAScreenDisplayModeNormal: {
                [self _nromalScreenDoubleTapAnimated];
                NSLog(@"动画------》一般模式");
            }
            break;
        default:
            break;
    }
}

/**
 启动还原动画 (只针对半球模式、圆柱模式)
 */
- (void)StartAnimationBuoyWithPatrol {
    [self cleanAnimation];
    switch (self.displayMode) {
        case JAScreenDisplayModeHemisphere:
        {   //壁挂或者倒挂

            if (self.fixMode == JADeviceFixModeWall) {
                JACoordinate coordinate = { 0, 0, 0};
                [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:coordinate TextureTransform:NO Step:100 Duration:500 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:1];
                [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:coordinate TextureTransform:NO Step:30 Duration:250 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:kHemispherefoldAnimatedTag];
                [self foldAnimatedEnd];
                NSLog(@"动画还原------》壁挂");
                
            }else if (self.fixMode & JADeviceFixModeCeil){
                JACoordinate coordinate = { 0, 0, 0};
                [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:coordinate TextureTransform:NO Step:30 Duration:250 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:1];
                JACoordinate roate = [self getCoordinate:JAPanoramaScreenAnimationTypeRotate Texture:NO ScreenIndex:0];
                JACoordinate vec = {0, 0,(roate.z - 90)};
                [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:vec TextureTransform:NO Step:30 Duration:250 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:1];
                JACoordinate sec = {1,1,1};
                [self startAnimation:JAPanoramaScreenAnimationTypeScale Coordinate:sec TextureTransform:NO Step:30 Duration:250 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:kHemispherefoldAnimatedTag];
                [self foldAnimatedEnd];
                NSLog(@"动画还原------》吊顶");
            }
        }
            break;
        case JAScreenDisplayModeCylinder: {
            JACoordinate vec = {1,1,1};
            [self startAnimation:JAPanoramaScreenAnimationTypeScale Coordinate:vec TextureTransform:YES Step:100 / 3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:1];
            JACoordinate vec1 = {30,180,0};
            [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:vec1 TextureTransform:NO Step:100 / 3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:1];
            JACoordinate vec2 = {1,1,1};
            [self startAnimation:JAPanoramaScreenAnimationTypeScale Coordinate:vec2 TextureTransform:NO Step:100 / 3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:kHemispherefoldAnimatedTag];
            [self foldAnimatedEnd];
            NSLog(@"动画还原------》圆柱");
        }
            break;
        case JAScreenDisplayModeNormal: {
            [self _nromalScreenDoubleTapAnimated];
            NSLog(@"动画还原------》一般模式");
        }
            break;
        default:
            break;
    }
}
- (void)_nromalScreenDoubleTapAnimated
{
    JACoordinate coordinate = [self getCoordinate:JAPanoramaScreenAnimationTypeScale Texture:YES ScreenIndex:0];
    if (coordinate.x < 1.1)//放大
    {
        coordinate.x = 3;
        coordinate.y = 3;
        coordinate.z = 3;
    }
    else//还原
    {
        coordinate.x = 1;
        coordinate.y = 1;
        coordinate.z = 1;
    }
    
    //JACoordinate vec2 = {1.5,1.5,1.5};
    [self startAnimation:JAPanoramaScreenAnimationTypeScale Coordinate:coordinate TextureTransform:YES Step:100 /3 Duration:100 isRepeat:0 Inertia:YES ScreenIndex:0 Flag:kHemisphereUnfoldAnimatedTag];
    [self unFoldAnimatedEnd];
}
/**
 *  自动巡航
 *
 */
- (void)playerAutoCruise:(BOOL)patrol{
    self.patrol = patrol;
    if (patrol == NO) {
        return;
    }
//    if (self.patrol) {
        if (self.videoIsUnfold == NO) {
            if (self.displayMode == JAScreenDisplayModeHemisphere || self.displayMode == JAScreenDisplayModeCylinder) {
                self.displayMode = self.displayMode;
                [self StartAnimationSinkInWithPatrol];
                return;
            }
        }
//    }
    switch (self.displayMode) {
        case JAScreenDisplayModeHemisphere:
        {
            if (self.videoIsUnfold) {
              [self cruiseHemisphere];
            }
            
        }
            break;
        case JAScreenDisplayModeCylinder:
        {
            [self cruiseCylinder];
        }
            break;
        case JAScreenDisplayModeUpdown:
        {
            [self cruiseUpdown];
        }
            break;
        case JAScreenDisplayModeFour:
        {
            [self cruiseFour];
        }
            break;
        case JAScreenDisplayModePanorama:
        {
               [self cruiseCylinder];
        }
            
            break;
        case JAScreenDisplayModeExpand:
        {
            
        }
            break;
            
            
        default:
            break;
    }
    
    
}

- (void)cruiseHemisphere{
    //    if (self.device.deviceType & VRDeviceTypeWall || self.device.deviceType & VRDeviceTypeWeil) {
    if (self.fixMode == JADeviceFixModeCeil) {
        JACoordinate coord = [self getCoordinate:JAPanoramaScreenAnimationTypeRotate Texture:NO ScreenIndex:0];
        // coord.x + 0.05 20
        JACoordinate roate = {coord.x, 0, coord.z + 360};
        [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:roate TextureTransform:NO Step:10000 Duration:0 isRepeat:NO Inertia:NO ScreenIndex:0 Flag:kCruiseAnimatedTag];
    }else if (self.fixMode == JADeviceFixModeWall) {
        JACoordinate coord = [self getCoordinate:JAPanoramaScreenAnimationTypeRotate Texture:NO ScreenIndex:0];
        static BOOL isRight = NO;
        
        if (coord.y < -30) {
            isRight = YES;
        }
        if (coord.y > 30) {
            isRight = NO;
        }
        float y = isRight ? (coord.y + 1) : (coord.y - 1);
        JACoordinate vec = {coord.x , y, coord.z};
        [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:vec TextureTransform:NO Step:20 Duration:500 isRepeat:NO Inertia:YES ScreenIndex:0 Flag:kCruiseAnimatedTag];
        
    }
    //    }
}



- (void)cruiseCylinder{
    JACoordinate position = [self getCoordinate:JAPanoramaScreenAnimationTypePosition Texture:YES ScreenIndex:0];
    JACoordinate vec = {position.x-0.02,position.y,position.z};
    [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:vec TextureTransform:YES Step:20 Duration:500 isRepeat:NO Inertia:NO ScreenIndex:0 Flag:kCruiseAnimatedTag];
}

- (void)cruiseUpdown{
    for (int i = 0; i < 2; i++) {
        JACoordinate position = [self getCoordinate:JAPanoramaScreenAnimationTypePosition Texture:YES ScreenIndex:i];
        JACoordinate vec = {position.x-0.02,position.y,position.z};
        [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:vec TextureTransform:YES Step:20 Duration:500 isRepeat:NO Inertia:NO ScreenIndex:i Flag:i == 0 ? kCruiseAnimatedTag : 1];
    }
}

- (void)cruiseFour{
    for (int i = 0; i < 4; i++) {
        JACoordinate position = [self getCoordinate:JAPanoramaScreenAnimationTypeRotate Texture:NO ScreenIndex:i];
        JACoordinate vec = {60, 0, position.z+360};
        [self startAnimation:JAPanoramaScreenAnimationTypeRotate Coordinate:vec TextureTransform:NO Step:10000 Duration:0 isRepeat:false Inertia:NO ScreenIndex:i Flag:i == 0 ? kCruiseAnimatedTag : 1];
    }
}


- (void)cruisePanorama{
    JACoordinate position = [self getCoordinate:JAPanoramaScreenAnimationTypePosition Texture:YES ScreenIndex:0];
    JACoordinate vec = {position.x + 0.5, position.y, position.z};
    [self startAnimation:JAPanoramaScreenAnimationTypePosition Coordinate:vec TextureTransform:YES Step:100 Duration:500 isRepeat:NO Inertia:NO ScreenIndex:0 Flag:kTag];
}


- (NSInteger)doubleTapEArea:(UITapGestureRecognizer *)doubletap {
    UIView *superview = doubletap.view;
    CGFloat width = CGRectGetWidth(superview.frame);
    CGFloat height = CGRectGetHeight(superview.frame);
    CGPoint point = [doubletap locationInView:superview];
    if (point.x < width / 2) {
        if (point.y < height / 2) {
            //
            return 2;
        }else{
            //
            return 0;
        }
    }else{
        if (point.y < height / 2) {
            //
            return 3;
        }else{
            //
            return 1;
        }
    }
    
}
- (void)stopAllanimation {
    self.patrol = NO;
    if (self.displayMode == JAScreenDisplayModeFour) {
        for (int i = 0; i < 4; i++) {
            [self cleanAnimation:i];
        }
    }else{
        [self cleanAnimation];
    }
}

- (void)dealloc {
    NSLog(@"dealloc------>%@",NSStringFromClass([self class]));
    
}

@end
