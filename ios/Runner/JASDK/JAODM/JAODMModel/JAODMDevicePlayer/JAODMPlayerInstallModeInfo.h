//
//  JAODMPlayerInstallModeInfo.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerPatrol.h"
#import "JAODMPlayerEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayerInstallModeInfo : NSObject

@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) JADOMDisplayMode displayMode;
@property (nonatomic, assign) JADOMDisplayMode defaultDisplayMode;
@property (nonatomic, strong) JAODMPlayerPatrol *patrol;
@end

NS_ASSUME_NONNULL_END
