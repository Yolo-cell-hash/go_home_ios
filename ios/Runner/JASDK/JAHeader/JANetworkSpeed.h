//
//  JANetworkSpeed.h
//  iOS
//
//  Created by Chan Jason on 2017/7/1.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

///**
// *  @{@"received":@"100kB/s"}
// */
//FOUNDATION_EXTERN NSString *const kNetworkReceivedSpeedNotification;
//
///**
// *  @{@"send":@"100kB/s"}
// */
//FOUNDATION_EXTERN NSString *const kNetworkSendSpeedNotification;

/**
 *  @{@"received":@"100kB/s",
    @"sent":@"100kB/s",
    @"total":@"100KB/s"
    }
 */
FOUNDATION_EXTERN NSString *const JANetworkSpeedNotification;

@interface JANetworkSpeed : NSObject

@property (nonatomic, copy, readonly) NSString * receivedNetworkSpeed;

@property (nonatomic, copy, readonly) NSString * sendNetworkSpeed;

@property (nonatomic, assign, readonly) NSUInteger receivedNetworkSpeedValue;

@property (nonatomic, assign, readonly) NSUInteger sendNetworkSpeedValue;

@property (nonatomic, assign, readonly) NSUInteger netSpeed;

@property (nonatomic, assign, readonly) NSInteger total;

@property (nonatomic, assign, getter=isCounting) BOOL counting;


+ (instancetype)sharedNetworkSpeed;

- (void)startMonitoringNetworkSpeed;

- (void)stopMonitoringNetworkSpeed;

- (void)startCounting;

- (void)stopCounting;

@end
