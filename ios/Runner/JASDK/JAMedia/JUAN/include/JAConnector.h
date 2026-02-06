//
//  JAConnector.h
//  iOS
//
//  OC接口层
//
//  Created by Wynton on 2017/8/31.
//  Copyright © 2017年 LiHong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JAConnectorPTZType) {
    JAConnectorPTZTypeUP = 0,         /** 上 */
    JAConnectorPTZTypeDOWN,           /** 下 */
    JAConnectorPTZTypeLEFT,           /** 左 */
    JAConnectorPTZTypeRIGHT,          /** 右 */
    JAConnectorPTZTypeAUTOPAN = 8,    /** 自动巡航 */
    JAConnectorPTZTypeOPEN,           /** */
    JAConnectorPTZTypeCLOSE,          /** */
    JAConnectorPTZTypeIN,             /** */
    JAConnectorPTZTypeOUT,            /** */
    JAConnectorPTZTypeFAR,            /** */
    JAConnectorPTZTypeNEAR,           /** */
    JAConnectorPTZTypeSTOP,           /** 停止云台控制 */
    JAConnectorPTZTypePresetSet = 28, /** 设置预置点 */
    JAConnectorPTZTypePresetClear,    /** 删除预置点 */
    JAConnectorPTZTypePresetGoTo,     /** 前往预置点 */
    JAConnectorPTZTypeSelfCheck = 116 //云台自检116，p2p对应命令为16，在库里面（JAP2PConnector2.cpp）
    //对于大于100的命令会减100，再发送，防止与老p2p云台命令冲突
    
};

typedef NS_ENUM(NSInteger, JAConnectorStatus)  {
    JAConnectorStatusCippConnectFull  = -200, /// 芯中芯连接通道满
    JAConnectorStatusError             = -1, /// Connector非法时，所有操作都会返回这个  Invalid connector
    JAConnectorStatusConnecting        = 0,  /// 正在连接    connecting
    JAConnectorStatusConnected         = 1,  /// 连接成功    connect success
    JAConnectorStatusConnectFailed     = 2,  /// 连接失败    connect failed
    JAConnectorStatusLogining          = 3,  /// 正在登录设备  login
    JAConnectorStatusLogined           = 4,  /// 登录完成        login complete
    JAConnectorStatusLoginFailed       = 5,  /// 登录失败        login failed
    JAConnectorStatusReady             = 6,  /// 与设备连接已准备完毕，可以打开码流了  connection ready, stream can be opened
    JAConnectorStatusOpenVideoFailed   = 7,  /// 打开设备码流失败    open stream failed
    JAConnectorStatusDisconnected      = 8,  /// 连接断开        disconnected
    JAConnectorStatusClosed            = 9,  /// 连接被关闭       connection has been closed
    JAConnectorStatusAuthoFailed       = 10, /// 用户名密码验证失败   Auth failed
    JAConnectorStatusTimeOut           = 11, /// 连接超时        connection time out
    JAConnectorStatusUserActiveClose   = 12, /// 连接被主动关闭     user active closing connection
    JAConnectorStatusOpenVideo         = 13, /// 执行打开码流操作    open stream
    JAConnectorStatusCloseVideo        = 14, /// 执行关闭码流操作    close stream
    JAConnectorStatusOFFLINE           = 15, /// 离线              off line
    JAConnectorStatusBackUpEnd         = 1014, //录像备份结束
};

typedef NS_ENUM(NSUInteger, JAConnectorStream) {
    JAConnectorStreamHD,        /// high definition
    JAConnectorStreamSD,        /// standard definition
    JAConnectorStreamSE,        /// special definition
};

typedef NS_ENUM(NSInteger, JAConnectorDeviceMode) {
    JAConnectorDeviceModeWall = 0,
    JAConnectorDeviceModeCeil,
    JAConnectorDeviceModeTable,
    JAConnectorDeviceModeNone,
    JAConnectorDeviceModeP720
};

typedef NS_ENUM(NSInteger, JAConnectorBufferMode) {
    JAConnectorBufferModeNone     = -1,
    JAConnectorBufferModeFluency  = 0,
    JAConnectorBufferModeRealTime = 1,
};

typedef NS_ENUM(NSUInteger, JAConnectorOSDFormatType) {
    JAConnectorOSDFormatTypeYYYYMMDDHHmmss,
    JAConnectorOSDFormatTypeMMDDYYYYHHmmss,
    JAConnectorOSDFormatTypeDDMMYYYYHHmmss,
};
///对讲发送音频格式
typedef NS_ENUM(NSUInteger, JASendAudioPacketType) {
    JASendAudioPacketTypeG711A,        /// G711A
    JASendAudioPacketTypePCM,        /// PCM
};

extern NSString *const kJAConnectorStatusChangaedNotification;

@class JAConnector,JARecordItem,JAFishEyeParam;
@protocol JAConnectorDelegate <NSObject>

- (void)JAConnector:(JAConnector *)connecter StatusChanged:(JAConnectorStatus)status Index:(NSInteger)index;
- (void)JAConnector:(JAConnector *)connecter PlayingTimeChanged:(NSInteger)time recordTime:(NSInteger)recordTime Index:(NSInteger)index;///recordTime正在录像时间时长
- (void)JAConnector:(JAConnector *)connecter FindDeviceMode:(JAConnectorDeviceMode)mode Index:(NSInteger)index;
- (void)JAConnector:(JAConnector *)connecter ReceiveVconData:(NSData *)data Index:(NSInteger)index;
- (void)JAConnector:(JAConnector *)connecter ReceiveRecords:(NSArray<JARecordItem *> *)records IsTheend:(BOOL)isEnd;
- (void)JAConnector:(JAConnector *)connecter BackupDuration:(NSInteger)duration Progress:(NSInteger)progress;
- (void)JAConnector:(JAConnector *)connecter OpenChannel:(NSInteger)err Channel:(NSInteger)channel;
- (void)JAConnector:(JAConnector *)connecter ReceiveRecordAudioData:(NSData *)data; //录音回调
- (void)JAConnector:(JAConnector *)connecter speakCallResponse:(BOOL)isSuccess; //Call反馈
- (void)JAConnector:(JAConnector *)connecter speakHangupResponse:(BOOL)isSuccess; //Hangup反馈
- (void)JAConnector:(JAConnector *)connecter ReceiveCallAudioData:(NSData *)data; //对讲数据
- (void)JAConnector:(JAConnector *)connecter ReceiveDisconnectStatus:(NSInteger)status; //连接断开回调
- (void)JAConnector:(JAConnector *)connecter onPZTControlCallback:(NSInteger)status;//pzt控制结果 //status 0 success.
- (void)JAConnector:(JAConnector *)connecter onP2PSendDataCallback:(NSInteger)status;//status 0 success.
///回放是否停止成功
- (void)JAConnector:(JAConnector *)connecter OnPlaybackStopResultCallback:(int)status;//status 0 success.
@end

@protocol JAConnectordataSource <NSObject>

- (void)JAConnector:(JAConnector *)connecter ReceiveVideo:(void *)frame size:(NSUInteger)frameSize width:(NSUInteger)width height:(NSUInteger)height type:(NSUInteger)type timestamp:(NSUInteger)timestamp index:(NSUInteger)index;

- (void)JAConnector:(JAConnector *)connecter ReceiveAudio:(void *)frame size:(NSUInteger)frameSize sampleRate:(NSUInteger)sampleRate channelCount:(NSUInteger)channelCount bitrate:(NSUInteger)bitrate type:(NSUInteger)type index:(NSUInteger)index;

- (void)JAConnector:(JAConnector *)connecter ReceiveOSDData:(NSData *)data Utctime:(NSUInteger)utctime;
//多通道设备区分不同通道时间
- (void)JAConnector:(JAConnector *)connecter ReceiveOSDData:(NSData *)data Utctime:(NSUInteger)utctime Index:(NSInteger)index;

- (void)JAConnector:(JAConnector *)connecter ReceiveFishEyeParams:(NSArray<JAFishEyeParam *> *)param DistortionData:(NSData *)distortionData;

- (void)JAConnector:(JAConnector *)connecter SetFishEyeCenter:(float)centerX CenterY:(float)centerY Radius:(float)radius AngleX:(float)angleX AngleY:(float)angleY AngleZ:(float)angleZ Index:(int)index;

- (void)JAConnector:(JAConnector *)connecter GsensorDataX:(double)x Y:(double)y Z:(double)z Ctx:(void *)ctx;




@end

@interface JAConnector : NSObject

@property (nonatomic, assign) id <JAConnectorDelegate> delegate;
@property (nonatomic, assign) id <JAConnectordataSource> dataSource;
//oneNET 对讲成功
@property (nonatomic, assign) BOOL oneNET_startCallSuccess;
@property (nonatomic, assign) JASendAudioPacketType sendAudioType; //默认g711A

//连接
- (void)connectWithConnectString:(NSString *)conncectStting VerifyString:(NSString *)verifyString Index:(NSInteger)index;
- (void)disconnectWithIndex:(NSInteger)index;
- (BOOL)getIsConnectedWithIndex:(NSInteger)index;
//电池机禁止重连
- (void)batteryDeviceDisconnectWithIndex:(NSInteger)index IsSeep:(BOOL)isSleep;

///预览
- (void)openStream:(JAConnectorStream)stream Channel:(NSInteger)channel Index:(NSInteger)index;
- (void)closeStreamWithIndex:(NSInteger)index;

//搜索录像
- (void)searchRecordWithBeginTime:(NSInteger)beginTime EndTime:(NSInteger)endTime Channel:(NSInteger)channel Index:(NSInteger)index;
- (void)searchRecordWithBeginTime:(NSInteger)beginTime EndTime:(NSInteger)endTime Channel:(NSInteger)channel Type:(NSInteger)type RequestID:(NSInteger)requestID Index:(NSInteger)index;

//回放
- (void)playbackStartWithTime:(NSInteger)time Index:(NSInteger)index;
- (void)playbackStartWithTime:(NSInteger)time Channel:(NSInteger)channel Index:(NSInteger)index;
- (void)playbackStopWithIndex:(NSInteger)index;
///tf卡播放暂停
- (void)playbackPauseWithChannel:(NSInteger)channel Index:(NSInteger)index;
///tf卡播放开始
- (void)playbackResumePlayWithChannel:(NSInteger)channel Index:(NSInteger)index;

//虚拟通道
- (void)vconSendMessage:(NSString *)message Index:(NSInteger)index;
- (void)vconSendData:(NSData *)data Channel:(NSInteger)channel Index:(NSInteger)index;

//设置时区
- (void)setTimeZone:(NSInteger)timeZone Index:(NSInteger)index;

- (void)ptzStartWithType:(JAConnectorPTZType)type Channel:(NSInteger)channel Index:(NSInteger)index;
- (void)ptzStartWithType:(JAConnectorPTZType)type Channel:(NSInteger)channel Param:(NSInteger)param Index:(NSInteger)index;
//双参数云台控制调用此接口，比如云台矫正
- (void)ptzStartWithType2Param:(JAConnectorPTZType)type Channel:(NSInteger)channel Param:(NSInteger)param Param2:(NSInteger)param2 Index:(NSInteger)index;

- (void)ptzStopWithChannel:(NSInteger)channel Index:(NSInteger)index;
- (void)ptzStopWithChannel:(NSInteger)channel Param:(NSInteger)param Index:(NSInteger)index;
//双参数云台控制调用此接口
- (void)ptzStopWithChannel2Param:(NSInteger)channel Param:(NSInteger)param Param2:(NSInteger)param2 Index:(NSInteger)index;
//对讲
@property (nonatomic, assign) NSInteger speakIndex;
- (void)speakCallWithChannel:(NSInteger)channel SampleRate:(NSInteger)sampleRate Index:(NSInteger)index;
- (void)speakStart;
- (void)speakHangUpWaitUntilDone:(BOOL)wait;
- (void)speakStop;

- (void)recordStartWithPath:(NSString *)path Index:(NSInteger)index;
- (void)recordStopWithIndex:(NSInteger)index;

//录音
- (void)recordAudioStart;
- (void)recordAudioStop;

//缓冲模式
- (void)setBufferMode:(JAConnectorBufferMode)bufferMode;
- (JAConnectorBufferMode)getBufferMode;

//录像备份开始
- (void)startBackupWithFilePath:(NSString *)filePath
                      StartTime:(NSInteger)startTime
                        EndTime:(NSInteger)endTime
                        Channel:(NSInteger)channel
                     TimeOffset:(NSInteger)timeOffset
                          Index:(NSInteger)index;
//录像备份停止
- (void)stopBackupWithIndex:(NSInteger)index Channel:(NSInteger)channel;

///开启音频发送通道
- (void)startAudioSend:(NSInteger)channel Index:(NSInteger)index result:(void (^)(BOOL success))result;
///发送音频数据
- (void)sendG711Buffer:(NSData *)buffer;
- (void)sendPCMBuffer:(NSData *)buffer;

#pragma mark - --- 获取状态 ---
- (NSInteger)getChannel:(NSInteger)index;
- (JAConnectorStream)getStream:(NSInteger)index;
- (JAConnectorStatus)getStatus:(NSInteger)index;
- (BOOL)getIsConnected:(NSInteger)index;
- (NSString *)getConnectString:(NSInteger)index;
- (NSString *)getVerifuString:(NSInteger)index;                                
- (BOOL)getIsRecording:(NSInteger)index;
- (BOOL)isP2pDevices:(NSInteger)index;


#pragma mark - --- Fix ---

///切圆, 必须出图了才可以调用
- (void)fishEyeCrop:(BOOL)crop index:(NSUInteger)index;

- (void)cancelAllOperation:(NSUInteger)index;

- (void)setOSDFormatType:(JAConnectorOSDFormatType)type Index:(NSInteger)index;
- (JAConnectorOSDFormatType)getOSDFormatTypeWithIndex:(NSInteger)index;

@end

//可用于继承
@interface JAConnector (Inheritance)

- (void)onVideoBuffer:(void *)frame
                 size:(NSUInteger)frameSize
                width:(NSUInteger)width
               height:(NSUInteger)height
                 type:(NSUInteger)type
            timestamp:(NSUInteger)timestamp
                index:(NSUInteger)index;

- (void)onAudioBuffer:(void *)frame
                 size:(NSUInteger)frameSize
           sampleRate:(NSUInteger)sampleRate
         channelCount:(NSUInteger)channelCount
              bitrate:(NSUInteger)bitrate
                 type:(NSUInteger)type
                index:(NSUInteger)index;

- (void)onGsensorDataX:(double)x Y:(double)y Z:(double)z Ctx:(void *)ctx;
- (void)onOSDBuffer:(NSData *)buffer Utctime:(NSUInteger)utctime;
- (void)onStatus:(JAConnectorStatus)status Index:(NSInteger)index;
- (void)onUpdateTime:(NSInteger)time Index:(NSInteger)index;
- (void)onRecords:(NSArray *)records Index:(NSInteger)index IsTheend:(BOOL)isEnd;
- (void)onFindDeviceMode:(JAConnectorDeviceMode)mode Index:(NSInteger)index;
- (void)onFishEyeParam:(NSArray<JAFishEyeParam *> *)param DistortionData:(NSData *)distortionData;
- (void)onVconData:(NSData *)data Index:(NSInteger)index;
- (void)onBackupInfoWithDuration:(NSInteger)duration Progress:(NSInteger)progress;
- (void)onSetFishEyeCenterX:(float)centerX
                    CenterY:(float)centerY
                     Radius:(float)radius
                     AngleX:(float)angleX
                     AngleY:(float)angleY
                     AngleZ:(float)angleZ
                      Index:(int)index;
- (void)onP2PLogUpload:(const char *)log Size:(size_t)logSzie;
- (void)onOpenChannel:(int)err Channel:(NSInteger)channel;
@end
