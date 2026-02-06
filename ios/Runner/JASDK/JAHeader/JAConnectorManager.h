//
//  JAConnectorManager.h
//  eseecloud
//
//  Created by Mr.Z on 2018/3/16.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "JAConnector.h"

typedef void(^JADeviceVconBlock)(NSDictionary *response);
typedef void(^JADeivceRecordsBlock)(NSArray *records, BOOL isEnd);
typedef void(^JADeviceBackupInfoBlock)(NSInteger progress, NSInteger duration);
@interface JAConnectorManager : JAConnector

/**
 *  发送协议
 *  message    发送协议内容
 *  completion 收到设备回复
 */
- (void)vconSendMessage:(NSString *)message Completion:(JADeviceVconBlock)completion;

/**
 *  搜索录像   搜索录像最多只能搜索一天内的录像，不能跨天搜索录像
 *  startTime  开始时间
 *  endTime  结束时间
 *  channel  通道
 *  index    index
 *  completion  搜索到的所有录像段
 */
- (void)searchRecordWithStartTime:(NSInteger)startTime
                          EndTime:(NSInteger)endTime
                          channel:(NSInteger)channel
                            index:(NSInteger)index
                       Completino:(JADeivceRecordsBlock)completion;
/** 废弃
 *  搜索有录像的日期   建议搜索1年
 *  startTime  开始时间
 *  endTime  结束时间
 *  channel  通道
 *  index    index
 *  completion  搜索到的所有录像段
 */
- (void)searchRecordDateWithStartTime:(NSInteger)startTime
                              EndTime:(NSInteger)endTime
                              channel:(NSInteger)channel
                                index:(NSInteger)index
                           Completino:(JADeivceRecordsBlock)completion;

- (void)startBackupWithFilePath:(NSString *)filePath StartTime:(NSInteger)startTime EndTime:(NSInteger)endTime Channel:(NSInteger)channel TimeOffset:(NSInteger)timeOffset Index:(NSInteger)index ProgressBlock:(JADeviceBackupInfoBlock)progressBlock;

@end
