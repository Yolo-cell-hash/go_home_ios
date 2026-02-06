//
//  JAODMPlayerGeneralDevice.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerEnum.h"
#import "JAODMPlayerVideoRatio.h"
NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerGeneralDevice : NSObject
@property (nonatomic, assign) JAODMPlayerAbility ability;
@property (nonatomic, strong) JAODMPlayerVideoRatio *videoRatio;
@end

NS_ASSUME_NONNULL_END
