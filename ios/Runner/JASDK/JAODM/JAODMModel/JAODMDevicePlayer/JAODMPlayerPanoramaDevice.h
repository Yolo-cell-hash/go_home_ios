//
//  JAODMPlayerPanoramaDevice.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayer180.h"
#import "JAODMPlayer360.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerPanoramaDevice : NSObject

@property (nonatomic, strong) JAODMPlayer180 *dev180;
@property (nonatomic, strong) JAODMPlayer360 *dev360;

@end

NS_ASSUME_NONNULL_END
