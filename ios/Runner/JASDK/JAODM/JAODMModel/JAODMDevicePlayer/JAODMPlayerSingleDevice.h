//
//  JAODMPlayerSingleDevice.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerPanoramaDevice.h"
#import "JAODMPlayerGeneralDevice.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerSingleDevice : NSObject

@property (nonatomic, strong) JAODMPlayerPanoramaDevice *panoramaDevice;
@property (nonatomic, strong) JAODMPlayerGeneralDevice *generalDevice;

@end

NS_ASSUME_NONNULL_END
