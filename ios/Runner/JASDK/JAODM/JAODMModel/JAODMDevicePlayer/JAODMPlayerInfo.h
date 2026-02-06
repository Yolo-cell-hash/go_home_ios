//
//  JAODMPlayerInfo.h
//  eseecloud
//
//  Created by Wynton on 2018/10/16.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerDeviceOption.h"
#import "JAODMPlayerColor.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerInfo : NSObject

@property (nonatomic, strong) JAODMPlayerDeviceOption *deviceOption;
@property (nonatomic, strong) JAODMPlayerColor *color;
@property (nonatomic, assign) BOOL isLoadingLastPicture;
@property (nonatomic, assign) NSInteger interface;

- (void)setup;

@end

NS_ASSUME_NONNULL_END
