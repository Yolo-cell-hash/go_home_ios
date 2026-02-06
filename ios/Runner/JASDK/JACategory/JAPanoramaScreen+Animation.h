//
//  JAPanoramaScreen+Animation.h
//  VRCam
//
//  Created by Mr.Z on 2017/9/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "JAPanoramaScreen.h"
#define kHemisphereUnfoldAnimatedTag 10   //展开
#define kHemispherefoldAnimatedTag 20     //合拢
#define kCruiseAnimatedTag 100            //巡航
#define kTag 300
@interface JAPanoramaScreen (Animation)

/**
 *  鱼眼未展开
 */
- (void)foldAnimatedEnd;

/**
 *  鱼眼展开
 */
- (void)unFoldAnimatedEnd;

/**
 *  清除四分屏记录\放大缩小记录
 */
- (void)clearFourModelRecord;

/**
 *  双击手势
 */
- (void)onDoubleTapGestureActived:(UITapGestureRecognizer *)doubletap;

/**
 自动巡航
 */
- (void)playerAutoCruise:(BOOL)patrol;

/**
 启动沉入动画 (只针对半球模式、圆柱模式)
 */
- (void)StartAnimationSinkInWithPatrol;


/**
 启动还原动画 (只针对半球模式、圆柱模式)
 */
- (void)StartAnimationBuoyWithPatrol;

- (void)stopAllanimation;

@end
