//
//  EseeSDK.h
//  iOS
//
//  Created by Wynton on 2017/9/4.
//  Copyright © 2017年 LiHong. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol EseeSDKDelegate <NSObject>

- (void)EseeSDKP2PExportLog:(NSString *)log;

@end

@interface EseeSDK : NSObject

@property (nonatomic, assign) id<EseeSDKDelegate> delegate;

+ (EseeSDK *)sdk;
- (void)initWithAppBundle:(NSString *)appBundle;
- (void)destroy;

@end
