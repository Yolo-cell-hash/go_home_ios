//
//  JAVideoPlayer.h
//  eseecloud
//
//  Created by Mr.Z on 2018/3/19.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JANormalScreen.h"
#import "JAPanoramaScreen.h"
#import "JAConnector.h"


@interface JAVideoPlayer : UIView
@property (nonatomic, strong,readonly) JANormalScreen *video;
@property (nonatomic, strong, readonly) UILabel *tipsLabel;
//@property (nonatomic, assign) BOOL isPannorma;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) BOOL zoom;
@property (nonatomic, assign) BOOL selected;                    /** 是否被选中 */
@property (nonatomic, assign) BOOL isRecording;       /** 是否处于录像状态 */
@property (nonatomic, assign) NSUInteger bitrate;               /** 码流状态 0:子码流 | 1:主码流 */
@property (nonatomic, assign) JAConnectorStatus status;
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong) UIImage *lastImage; //在加载时显示上一次t播放的最后一贴图片
@property (nonatomic, assign) BOOL isBatterLow; //是否电量过低，默认NO 有这个字段不代表就是电池机设备
@property (nonatomic, assign) BOOL isSingleMode; //单屏模式下，隐藏电量过低的提示（在另一个地方有提示）
@property (nonatomic, assign) BOOL isCalling;       /** 是否处于对讲状态 */
@property (nonatomic, assign) BOOL isVertcal;

- (instancetype)initWithFrame:(CGRect)frame ConnectionManager:(JAConnector *)connectionManager;

@end
