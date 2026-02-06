//
//  JADeviceDetailMSG.h
//  JA_Item
//
//  Created by Mr.Z on 2018/1/11.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JATimeInfo,Week,LedPwm,Speciality,VRChannelInfo;
@interface JADeviceDetailMSG : NSObject
//version
@property (nonatomic,   copy) NSString *version;
@property (nonatomic,   copy) NSString *mode;
@property (nonatomic,   copy) NSString *serial;
@property (nonatomic, assign) NSInteger scene;
@property (nonatomic, strong) Speciality *speciality;
@property (nonatomic, strong) JATimeInfo *zone;

-(instancetype)initWithJSONString:(NSString *)json;
@end

@interface Week : NSObject
@property (nonatomic,   copy) NSString *Type;
@property (nonatomic, assign) NSInteger Month;
@property (nonatomic, assign) NSInteger Week;
@property (nonatomic, assign) NSInteger Weekday;
@property (nonatomic, assign) NSInteger Hour;
@property (nonatomic, assign) NSInteger Minute;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

@interface JATimeInfo : NSObject
@property (nonatomic, strong) NSNumber *timeZone;
@property (nonatomic, strong) NSNumber *daylightSavingTime;
@property (nonatomic, assign) BOOL daylightEnable;
@property (nonatomic, assign) NSInteger daylightOffset;
@property (nonatomic, strong) NSArray <Week *> *daylightWeek;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

@interface Speciality : NSObject
@property (nonatomic, strong) NSString *battery;
@property (nonatomic, assign) BOOL ptz;
@property (nonatomic, strong) LedPwm *ledPwm;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

@interface LedPwm : NSObject
@property (nonatomic, assign) NSNumber *project;
@property (nonatomic, assign) NSInteger ledChannelCount;
@property (nonatomic, assign) BOOL ledSwitch;
@property (nonatomic, strong) NSArray <VRChannelInfo *> *ledChannalInfo;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

@interface VRChannelInfo : NSObject 

@property (nonatomic, assign) double type;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) double channel;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end



