//
// Created by Chan Jason on 2017/7/19.
// Copyright (c) 2017 LiHong. All rights reserved.
//

#import "JAScreen.h"

@interface JANormalScreen : JAScreen

@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) NSUInteger index; /**> 调用者设置，单纯用于记录下标 */
@property (nonatomic, assign, readonly) NSUInteger pts; /**> 当前显示图像的时间戳 */
@property (nonatomic, assign) BOOL zoomEnable;

@end
