//
//  JADeviceStatus.h
//  JAJUANKit
//
//  Created by KingJames23 on 2019/5/7.
//  Copyright © 2019 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JADeviceStatus : NSObject

//请求设备状态 在线/离线
- (void)requestDeviceStatusWithEseeID:(NSString *)eseeID Completion:(void(^)(BOOL online))completion;

@end

NS_ASSUME_NONNULL_END
