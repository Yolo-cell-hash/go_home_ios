//
//  JAPreviewBaseViewController.h
//  eseecloud
//
//  Created by gxl on 2019/5/17.
//  Copyright © 2019 juanvision. All rights reserved.
//

#import "JAViewController.h"
#import "JAMultivideosPlayer.h"
#import "JARecordItem.h"
#import "JATimeSlider.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JAPreviewBaseViewControllerDelegate <NSObject>
- (void)willPreviewPopBackWithEseeID:(NSString *)eseeID;
@end

typedef void(^PlayBackRecordListBlock)(NSMutableArray *records, BOOL end);

@interface JAPreviewBaseViewController : JAViewController

//sdk 传值使用
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, assign) NSInteger channelCount;//通道数,目前只支持4路
@property (nonatomic, copy) NSString *deviceID;//设备ID
@property (nonatomic, copy) NSString *deviceIP;//IP
@property (nonatomic, copy) NSString *devicePort;//Port
@property (nonatomic, copy) NSString *deviceUser;//用户名
@property (nonatomic, copy) NSString *devicePassword;//密码
//readonly
@property (nonatomic, assign) DeviceChannelType showScreenPlayerType;
/**用于设备设置的对象*/
//@property (nonatomic, strong) JADeviceSettingsUtil *settingsUtil;
/**当前播放通道*/
@property (nonatomic, assign) NSInteger channel;

@property (nonatomic, assign) JAConnectorStream currentStream;

///是否需要提供UI YES：九安UI NO：自定义 (默认NO)
@property (nonatomic, assign) BOOL juanUI;
///当前播放器（注意：JAPreviewSingleViewController：screenView 为 [JAPanoramaScreen class]. JAPreviewMultipleViewController：[JAMultivideosPlayer class]）
@property (nonatomic, strong) UIView *screenView;
@property (nonatomic, copy) PlayBackRecordListBlock recordListBlock;
//时间偏移
@property (nonatomic, assign) NSTimeInterval deviceTimeOffset;

//sdk api
/**
 截图结果, 点击截图按钮会触发
 
 @param channel 通道号
 @param image 截到的图片对象
 @param compltion 回调结果Block
 */
- (void)screenShotWithChannel:(NSInteger)channel
                        Image:(UIImage *)image
                    Compltion:(void(^)(BOOL success))compltion;

/**
 录像, 点击开始录像按钮时会触发.
 
 @param channel 通道号
 @return 录像保存路径
 */
- (NSString *)startRecordWithChannel:(NSInteger)channel;

/**
 录像结果, 点击结束录像按钮时会触发.
 
 @param compltion 回调结果Block
 */
- (void)stopRecordWithCompletion:(void(^)(BOOL success))compltion;

/**
 获取录像的第一帧图片（可用于做略缩图显示）
 image :获取到的图片
 channel : 那个通道的图片
 */
- (void)getVideoFirstImage:(UIImage *)image WithChannel:(NSInteger)channel;

/**
 回放接口，可传时间和通道号
 time : 开始播放时间戳
 channel : 通道号
 */
- (void)playbackWithStartTime:(NSInteger)time Channel:(NSInteger)channel;


/**
 去向设备设置页面
 */
- (void)toSetDevice;

/**
 返回预览和回放时的时间戳
 */
- (NSInteger)getTimeForPlayingVideo;


/**
 回调回下载好的视频路径
 */
typedef void(^JAVideoBackupBlock)(NSArray *filePaths);
@property (nonatomic, copy) JAVideoBackupBlock downLoadResultHandle;


#pragma mark ---- 自定义播放器请使用以下sdk
/// 单击
/// @param tap tap description
- (void)singleTap:(UITapGestureRecognizer *)tap;

///打开对讲
- (void)openTalk;
/// 语音对讲结果
- (BOOL)callResust;
/// 按住说话 （只有在 callResust 结果成功才可以按住说话）
/// @param talk talk description：YES：开始说话 NO：停止说话
- (void)doTalk:(BOOL)talk;

/// 停止对讲
- (void)stopTalk;

/// 连接失败
- (void)connectFailed;
/// 连接通道满
- (void)connectFullStream;
/// 密码错误
- (void)connectPWDWrong;

///打开关闭码流(1、正常情况下不用，加载失败情况下可以使用--传YES 2、断开连接：NO)
- (void)openVideoStream:(BOOL)open;

/// 截图路径  description return:NSString.length > 0 success， nil：失败
- (NSString *)screenShot;

/// 开始/结束录像
/// @param start start description：YES开始 NO：停止
- (BOOL)startRecord:(BOOL)start;
/// 录像文件path
- (NSString *)recordPathWithChannel:(NSInteger)channel;

/// 云台控制
/// @param direction 执行上下左右:停止的时候需执行JAConnectorPTZTypeSTOP
- (void)doConsoleDirection:(JAConnectorPTZType)direction;

/// 获取回放录像
- (void)doSearchRcordWithDate:(NSDate *)date;
/// 回放录像列表
/// @param succcessBlock records 单次返回录像array end 设备分多次返回录像 end = yes，返回完毕
- (void)getPlaybackRecordsListSuccess:(void(^)(NSMutableArray<JARecordParagraph *> *records, BOOL end))succcessBlock;

/// 回放录像播放 （需关闭直播码流openVideoStream：NO，回到直播需要重新打开直播码流）
/// @param timestamp 时间戳
- (void)remoteRecordPlayWithTime:(NSInteger)timestamp;

/// 停止播放回放录像
- (void)stopPlayRemoteRecord;
///静音
- (void)do_mute:(BOOL)mute;
///网速
@property (nonatomic, strong) NSString *netSpeed;
/// 开始巡航 (需要设备支持) YES:成功
- (BOOL)JANewPreViewCruisebegin;
/// 结束巡航
- (BOOL)JANewPreViewCruiseClose;

/// 清晰度 窗口切换 全屏 竖屏
/// @param isHD 高清
- (void)doResolution:(BOOL)isHD;

///窗口切换：（此方法仅在多屏设备使用）
- (void)doSplitScreen:(JAMultivideosPlayerSplit)split;

///全屏(YES:全屏 NO:竖屏)
- (void)doFullScreen:(BOOL)fullScreen;

//获取速度等级
- (void)getSpeedDegreeSuccess:(void(^)(BOOL result,NSInteger level))succcessBlock;
//设置速度等级(高中低：0，1，2)
- (void)doSetCloudDesktopSpeedDegree:(NSInteger)level;

//获取有录像日期
- (void)getRecordDatesCompletionHandle:(void(^)(NSArray *array))completionBlock;

@end

NS_ASSUME_NONNULL_END
