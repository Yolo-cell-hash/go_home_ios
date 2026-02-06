//
//  JANetWorking.h
//  JAJUANKit
//
//  Created by zhangyanli on 2021/9/2.
//  Copyright © 2021 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JANetWorking : NSObject
///  get请求
+ (void)getURL:(NSString *)url Params:(id)params completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;
/// post请求
+ (void)postURL:(NSString *)url Params:(id)params completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
