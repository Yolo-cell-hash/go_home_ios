//
//  JAODMPlayerColor.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerColor : NSObject
@property (nonatomic, strong) UIColor *backgoundColor;
@property (nonatomic, strong) UIColor *navBarColor;
@property (nonatomic, strong) UIColor *toolBarColor;
@property (nonatomic, strong) UIColor *videoBorderColor;
@property (nonatomic, strong) UIColor *buttonSelectedColor;
@property (nonatomic, strong) UIColor *timingRecordColor;//时间轴上的定时视频颜色
@property (nonatomic, strong) UIColor *moveRecordColor;//时间轴上的移动视频颜色
@end

NS_ASSUME_NONNULL_END
