//
//  JADeviceStatusRequestAPI.h
//  eseecloud
//
//  Created by haidong on 22/03/2018.
//  Copyright © 2018 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JARequestFailure)(NSError *error);
typedef void(^JARequestSuccess)(id response,NSError *error);

@interface JADeviceStatusRequestAPI : NSObject


- (void)checkDeviceVersionParam:(NSArray *)param success:(JARequestSuccess)success failure:(JARequestFailure)failure;

@end
