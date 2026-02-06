//
//  JACamera.h
//  JA_Item
//
//  Created by Mr.Z on 2018/1/11.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JACamera : NSObject
@property (nonatomic,   copy) NSString *camera_id; //摄像机id
@property (nonatomic,   copy) NSString *name;   //昵称
@property (nonatomic,   copy) NSString *remark;
@property (nonatomic, assign) NSInteger channel; //通道
@property (nonatomic,   copy) NSString *device_id;
@property (nonatomic,   copy) NSString *eseeid;
@property (nonatomic,   copy) NSString *connectStr;
@property (nonatomic,   copy) NSString *verifyStr;
@property (nonatomic, assign) NSInteger devType; //0:默认无效值；1:单通道设备；2：gateway;3:nvr

/** 云存相关属性 **/
@property (nonatomic,   copy) NSString *cloud_id;
@property (nonatomic, assign) NSInteger endtime;//云存结束时间/unix timestamp
@property (nonatomic, assign) NSInteger cloud_status;//云存状态 
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
