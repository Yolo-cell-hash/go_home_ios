//
//  JAConnectorNOPrelinkPool.h
//  eseecloud
//
//  Created by Mr.Z on 2018/4/11.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAConnectorManager.h"

@interface JAConnectorNOPrelinkPool : NSObject

+ (instancetype)pool;

- (JAConnectorManager *)getConnectorManagerWithConnectString:(NSString *)connectStr;

@end
