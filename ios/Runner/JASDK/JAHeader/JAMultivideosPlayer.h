//
//  JAMultivideosPlayer.h
//  EseeCloud Pro
//
//  Created by Wynton on 2016/10/26.
//  Copyright © 2016年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAVideoPlayer.h"
#import "JAConnectorManager.h"
#import "JADevice.h"

extern NSString *const kJAMultiVideoPlayerFullStreamNotification;
extern NSString *const kJAMultiVideoPlayerConnectFailedNotification;
extern NSString *const kJAMultiVideoPlayerConnectTimeOutNotification;
extern NSString *const kJAMultiVideoPlayerPasswordErrorNotification;


typedef NS_ENUM(NSInteger, JAMultivideosPlayerSplit) {
    JAMultivideosPlayerSplit1,
    JAMultivideosPlayerSplit4,
    JAMultivideosPlayerSplit6,
    JAMultivideosPlayerSplit8,
    JAMultivideosPlayerSplit9,
    JAMultivideosPlayerSplit13,
    JAMultivideosPlayerSplit16
};


typedef NS_ENUM(NSUInteger, JAMultivideosPlayerAnimated) {
    JAMultivideosPlayerAnimatedNone,
    JAMultivideosPlayerAnimatedCube,
    JAMultivideosPlayerAnimatedRippleEffect,
    JAMultivideosPlayerAnimatedFlip,
};


@class ConnectionManager,JAMultivideosPlayer,JAVideoPlayer,ECDevice;
@protocol JAMultivideosPlayerDelegate <NSObject>
@optional
- (void)pageChangedWithJAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer OnScreenVideoPlayers:(NSMutableArray<JAVideoPlayer *> *)videoPlayers;

- (void)splitModeChangedWithJAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer OnScreenVideoPlayers:(NSMutableArray<JAVideoPlayer *> *)videoPlayers;

- (void)selectedIndexChangedWithJAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer SelectedVideoPlayer:(JAVideoPlayer *)videoPlayer;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer Player:(JAVideoPlayer *)videoPlayer PTZType:(JAConnectorPTZType)type;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer VideoPlayerStatusChanged:(JAVideoPlayer *)videoPlayer Status:(JAConnectorStatus)status;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer VideoPlayerPlayedFrame:(JAVideoPlayer *)videoPlayer isFirst:(BOOL)isFirst;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer VideoPlayerTimerChanger:(NSInteger)time Index:(NSInteger)index;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer VideoPlayerSearchRecords:(NSArray *)recrods VideoPlayer:(JAVideoPlayer *)videoPlayer;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer PlaybackCurrentTimeChanged:(NSInteger)currentTime VideoPlayer:(JAVideoPlayer *)videoPlayer;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer TapWithVideoPlayer:(JAVideoPlayer *)videoPlayer;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer ReceiveVconInfo:(NSDictionary *)info Player:(JAVideoPlayer *)videoPlayer;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer StatusChagned:(JAConnectorStatus)status Player:(JAVideoPlayer *)videoPlayer;

- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer speakCallResponse:(BOOL)isSuccess;
- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer onPZTControlCallback:(NSInteger)status;

//sdk
- (void)JAMultivideosPlayer:(JAMultivideosPlayer *)multivideosPlayer sendFirstImage:(UIImage *)image WithChannel:(NSInteger)channel;

@end

@interface JAMultivideosPlayer : UIView


@property (nonatomic, assign) JAMultivideosPlayerSplit currentSplitMode;//当前分屏模式
@property (nonatomic, assign) JAMultivideosPlayerSplit maxSplitMode;//最大分屏模式

@property (nonatomic, assign) NSInteger selectedIndex;//当前选择分屏下标
@property (nonatomic, assign) NSInteger currentPage;//当前页码

@property (nonatomic, assign) BOOL isPlayback;//回放禁用滑动和点击手势
@property (nonatomic, assign) NSInteger playbackCurrentTime;
@property (nonatomic, assign) BOOL bitrateChangeAuto;

@property (nonatomic,assign) id <JAMultivideosPlayerDelegate> delegate;

@property (nonatomic, strong, readonly) JAVideoPlayer *selectedVideo;//当前选中的分屏播放器
@property (nonatomic, strong, readonly) NSMutableArray<JAVideoPlayer *> *videos;//所有视频数组
@property (nonatomic, assign, readonly) NSInteger maxVideosCount;//视频总数
@property (nonatomic, assign, readonly) NSInteger currentSplitVideosCount;//当前分屏数
@property (nonatomic, assign, readonly) NSInteger pageCount;//总页数
@property (nonatomic, strong) JAConnectorManager *connectManager;
@property (nonatomic, strong, readonly) JADevice *device;
@property (nonatomic, assign) BOOL cancelSwip;///< 取消滑动手势

//sdk
@property (nonatomic, copy) NSString *deviceID;
@property (nonatomic, copy) NSString *deviceIP;//IP
@property (nonatomic, copy) NSString *devicePort;//Port
@property (nonatomic, copy) NSString *devieceUser;
@property (nonatomic, copy) NSString *devicePassword;

@property (nonatomic, strong) NSMutableArray *connectedSuccessArray;



@property (nonatomic, assign) NSInteger playbackSearchTime;

@property (nonatomic,   copy) void(^ panornamResolutionHD)(void);


@property (nonatomic, strong) NSMutableArray *openFailChannelArr;
//电池摄像机状态
@property (nonatomic, assign) JABatteryStatusType batteryStatus;

- (instancetype)initWithFrame:(CGRect)frame               
               MaxVdieosCount:(NSInteger)maxVideosCountA
                DefaultSplite:(JAMultivideosPlayerSplit)defaultSplit
                       Device:(JADevice *)device;

- (void)connectAllVideos;

- (void)openAllChannel;

- (void)pauseAllVideo;

- (void)openOnScreenVideo;

- (void)disconnectAllVideos;
- (void)doConnectAllVideos;
- (void)setCurrentPage:(NSInteger)currentPage Animated:(JAMultivideosPlayerAnimated)animated;

- (void)setCurrentSplitMode:(JAMultivideosPlayerSplit)currentSplitMode Animated:(JAMultivideosPlayerAnimated)animated;

- (void)setCurrentSplitOnSplit1Mode:(NSInteger)channel Animated:(JAMultivideosPlayerAnimated)animated;
- (void)_tapAction:(UITapGestureRecognizer *)sender;

@end
