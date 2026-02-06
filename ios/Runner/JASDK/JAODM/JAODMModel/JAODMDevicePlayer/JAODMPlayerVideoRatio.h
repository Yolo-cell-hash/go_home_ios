//
//  JAODMPlayerVideoRatio.h
//  eseecloud
//
//  Created by gxl on 2018/11/12.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JAODMPlayerVideoRatio : NSObject
@property (nonatomic, assign) BOOL enable;//是否支持
@property (nonatomic, strong) NSString *defaultRatio; //默认比例 16:9
@property(nonatomic, strong) NSArray *ratioOptions;
@end
