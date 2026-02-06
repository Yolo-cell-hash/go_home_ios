//
// Created by Chan Jason on 2017/7/19.
// Copyright (c) 2017 LiHong. All rights reserved.
//

#import "JAScreen.h"
typedef void(^JACloudUrlBlock)(NSString *response);
@class JAPanoramaScreen;
@protocol JAPanoramaScreenDelegate <NSObject>

@optional
- (void)JAPanoramaScreen:(JAPanoramaScreen *)panoramaScreen AnimatedEndWithFlag:(int)flag;
- (void)JAPanoramaScreen:(JAPanoramaScreen *)panoramaScreen FilePlayerCurrentTime:(NSInteger)currentTime Duration:(NSInteger)duration;
- (void)JAPanoramaScreen:(JAPanoramaScreen *)panoramaScreen CloudRecCaptureSuccess:(BOOL)result;
- (void)JAPanoramaScreen:(JAPanoramaScreen *)panoramaScreen FileDownLoadCurrentDuration:(NSInteger)currentDuration TotalDuration:(NSInteger)totalDuration;
- (void)OnCloudThumbnailRequestStartWithPanoramaScreen:(JAPanoramaScreen *)panoramaScreen StartTime:(NSInteger)startTime;
- (void)OnCloudThumbnailRequestComplete:(int)result Message:(const char*) msg PanoramaScreen:(JAPanoramaScreen *)panoramaScreen StartTime:(NSInteger)startTime;
- (void)OnCloudThumbnailRequestDataWithSize:(int)bufferSize Buffer:(const char *)buffer PanoramaScreen:(JAPanoramaScreen *)panoramaScreen StartTime:(NSInteger)startTime;
- (void)OnCloudHasRecordArray:(NSArray *)array PanoramaScreen:(JAPanoramaScreen *)panoramaScreen StartTime:(NSInteger)startTime;
//JAPanoramaScreen 当前视频流frameSize
- (void)JAPanoramaScreen:(JAPanoramaScreen *)panoramaScreen FrameSize:(NSUInteger)frameSize Width:(NSUInteger)width Height:(NSUInteger)height PixelFormat:(JAPixelFrameFormat)pixelFormat Timestamp:(NSUInteger)timestamp Index:(NSUInteger)index;
@end

@interface JAPanoramaScreen : JAScreen

@property (nonatomic, assign) id<JAPanoramaScreenDelegate> panoramaDelegate;

- (BOOL)FilePlayerCheckM3u8data:(NSString *)m3u8Data DataSize:(int)datasize;
    
//获取上次调用本接口后到当前所统计的云存录像播放流量
- (int)GetCloudRecPlayDatatraffic;
- (BOOL)FilePlayerStartWithPath:(NSString *)filePath IsImage:(bool)isImage IsFishEye:(bool)isFishEye Duration:(NSInteger)duration;
- (void)filePlayerPause;
- (void)filePlayerResume;
- (void)filePlayerStop;
- (void)filePlayerSeek:(int)time;
//云存截图
- (void)captureCloudRec:(NSString *)filePath;
//云存本地录像
- (void)recordCloudRecStartWithPath:(NSString *)path;
- (void)recordCloudRecStop;
//--- 云存下载 ---
- (BOOL)recordCloudDownLoadWithPath:(NSString *)filePath SavePath:(NSString *)savePath Duration:(NSInteger)duration;
- (void)recordCloudDownLoadStop;
//-- 云存缩略图下载 ---
- (void)RequestCloudThumbnailWithHostName:(NSString *)hostName BucketName:(NSString *)bucketName Subject:(NSString *)subject AccessKeyId:(NSString *)accessKeyId SecretAccessKey:(NSString *)secretAccessKey SecurityToken:(NSString *)securityToken authRegion:(NSString *)authRegion Type:(int)type StartTime:(NSInteger)startTime;
//--- 云存录像日期 ---
- (void)RequestListBucket:(NSString *)hostName BucketName:(NSString *)bucketName Prefix:(NSString *)prefix AccessKeyId:(NSString *)accessKeyId SecretAccessKey:(NSString *)secretAccessKey SecurityToken:(NSString *)securityToken authRegion:(NSString *)authRegion Marker:(NSString *)marker Delimiter:(NSString *)delimiter Timeout:(NSInteger)timeout StartTime:(NSInteger)startTime;
//--- 云存m3u8获取 ---
- (void)RequestCloudM3u8:(NSString *)hostName BucketName:(NSString *)bucketName subject:(NSString *)subject AccessKeyId:(NSString *)accessKeyId SecretAccessKey:(NSString *)secretAccessKey SecurityToken:(NSString *)securityToken authRegion:(NSString *)authRegion Completion:(JACloudUrlBlock)completion;

////缩小 放大
- (void)setNormalScreenPZTSpeed:(CGFloat)speed Add:(BOOL)isAdd;

- (CGSize)videoSize;

@end
