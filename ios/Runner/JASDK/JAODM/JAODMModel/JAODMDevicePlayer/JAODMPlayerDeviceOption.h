//
//  JAODMPlayerDeviceOption.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerSingleDevice.h"
#import "JAODMPlayerNVR.h"
#import "JAODMPlayerGateway.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerDeviceOption : NSObject
@property (nonatomic, strong) JAODMPlayerSingleDevice *singleDevice;
@property (nonatomic, strong) JAODMPlayerNVR *nvr;
@property (nonatomic, strong) JAODMPlayerGateway *gateway;

@end

NS_ASSUME_NONNULL_END
