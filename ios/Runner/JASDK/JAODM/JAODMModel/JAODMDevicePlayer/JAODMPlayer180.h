//
//  JAODMPlayer180.h
//  eseecloud
//
//  Created by Wynton on 2018/10/17.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAODMPlayerInstallMode.h"
#import "JAODMPlayerEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface JAODMPlayer180 : NSObject

@property (nonatomic, strong) JAODMPlayerInstallMode *installMode;
@property (nonatomic, assign) NSInteger defaultInstallMode;
@property (nonatomic, assign) JAODMPlayerAbility ability;

@end

NS_ASSUME_NONNULL_END
