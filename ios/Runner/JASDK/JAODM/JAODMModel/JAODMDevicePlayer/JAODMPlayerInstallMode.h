//
//  JAODMPlayerInstallMode.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerInstallModeInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerInstallMode : NSObject

@property (nonatomic, strong) JAODMPlayerInstallModeInfo *ceil;
@property (nonatomic, strong) JAODMPlayerInstallModeInfo *wall;

@end

NS_ASSUME_NONNULL_END
