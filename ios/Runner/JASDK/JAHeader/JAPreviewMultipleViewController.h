//
//  JAPreviewMultipleViewController.h
//  eseecloud
//
//  Created by gxl on 2019/5/17.
//  Copyright © 2019 juanvision. All rights reserved.
//

#import "JAPreviewBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAPreviewMultipleViewController : JAPreviewBaseViewController

@property (nonatomic, strong) JAMultivideosPlayer *screen;

/// 视频第一帧
/// @param players players description
/// @param currentPlayer currentPlayer description
/// @param firstFrame firstFrame description
- (void)videoPlayers:(JAMultivideosPlayer *)players currentPlayer:(JAVideoPlayer *)currentPlayer firstFrame:(BOOL)firstFrame;

/// 返回当前视频时间戳
/// @param time 时间戳
/// @param players multivideosPlayer description
/// @param index 当前视频通道下标
-(void)getCurentTimeStmp:(NSInteger)time videoPlayers:(JAMultivideosPlayer *)players Index:(NSInteger)index;
/// 连接状态变化
/// @param players multivideosPlayer description
/// @param status 参考 JAConnectorStatus
/// @param videoPlayer videoPlayer description
- (void)videoPlayers:(JAMultivideosPlayer *)players StatusChagned:(JAConnectorStatus)status Player:(JAVideoPlayer *)videoPlayer;

/// 多通道切换通道
/// @param players multivideosPlayer description
/// @param videoPlayers videoPlayers array
- (void)pageChangedWithPlayers:(JAMultivideosPlayer *)players playersArray:(NSMutableArray<JAVideoPlayer *> *)videoPlayers;

/// 多通道屏幕分屏变化
/// @param players multivideosPlayer description
/// @param videoPlayers videoPlayers description
- (void)splitModeChangedWithVideoPlayers:(JAMultivideosPlayer *)players OnScreenVideoPlayerArray:(NSMutableArray<JAVideoPlayer *> *)videoPlayers;

/// 多通道选择单个通道
/// @param players multivideosPlayer description
/// @param videoPlayer videoPlayer description
- (void)indexChangedWithPlayers:(JAMultivideosPlayer *)players SelectedVideoPlayer:(JAVideoPlayer *)videoPlayer;

///下载TF卡录像
- (void)downloadTfRecords;
@end

NS_ASSUME_NONNULL_END
