//
//  NSDate+JA.h
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(JA)

- (NSString *)ja_stringFormat:(NSString *)formatString;
- (NSDate *)ja_dateOfDayBegin;
- (NSDate *)ja_dateOfDayEnd;
- (NSDate *)ja_localDate;

+ (NSDate *)ja_localDate;
+ (NSTimeInterval)ja_localTime;
- (NSDate *)ja_dateofNextDate;


/**
 该日期的起始时间 00:00:00，返回的日期为本地时间的起始时间

 @return 本地时间的起始时间
 */
- (NSDate *)ja_dayStartDate;
/**
 该日期的结束时间 11:59:59，返回的日期为本地时间的结束时间
 
 @return 本地时间的结束时间
 */
- (NSDate *)ja_dayEndDate;
/**
 该日期的结第二天该时间，返回的日期为本地时间的第二天当前时间
 
 @return 本地时间的第二天当前时间
 */
- (NSDate *)ja_nextDayDate;
/**
 该日期到当前时间有多少天数
 
 @return 该日期到当前时间有多少天数
 */
- (NSInteger)ja_daysFromNow;
/**
 当前系统时间是否二十小时制
 
 @return 当前系统时间是否二十小时制
 */
+ (BOOL)ja_is24HourFormat;

/**
 将NSSting型日期转为NSDate型日期

 @param strDate NSSting型日期
 @param format NSSting型日期格式
 @return NSDate型日期
 */
+ (NSDate *)dateWithString:(NSString* )strDate Format:(NSString *)format;

///  将NSSting型日期转为NSDate型日期 （UTC）
/// @param timeStr timeStr description
/// @param format formatterStr description
+ (NSDate *)utc_dateWithString:(NSString *)timeStr Format:(NSString *)format;
/**
 将NSDate型日期转为NSSting型日期
 
 @param date NSDate型日期
 @param format NSSting型日期格式
 @return NSString型日期
 */
+ (NSString *)stringWithDate:(NSDate* )date Format:(NSString *)format;
///将NSDate型日期转为NSSting型日期(UTC)
+ (NSString *)utc_stringWithDate:(NSDate *)date Format:(NSString *)format;
/**
 将NSTimeInterval型日期转为NSSting型日期

 @param timeInterval NSTimeInterval型日期
 @param format NSSting型日期格式
 @return NSString型日期
 */
+ (NSString *)stringWithTimeInterval:(NSTimeInterval )timeInterval Format:(NSString *)format;

// 判断是否是同一天
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2;

/// 时间string转为时间戳
/// @param formatterStr 显示时间格式
/// @param timeStr 时间string
+ (NSTimeInterval)timeIntervalWithFormatterString:(NSString *)formatterStr TimeString:(NSString *)timeStr;

///  将NSTimeInterval型日期转为NSSting型日期
/// @param timeInterval timeInterval description
/// @param timeZone timeZone @"" 就是系统时区
/// @param format format NSSting型日期格式 @"YYYY-MM-dd HH:mm:ss"
+ (NSString *)StringWithTimeInterval:(NSTimeInterval )timeInterval TimeZone:(NSString *)timeZone Format:(NSString *)format;

/**
 返回两个时间相差几天
 @param startTime 开始时间
 @param endTime 结束时间
 */
+ (NSInteger)getDifferentDateWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;


/// 获取当天0时0分0秒的时间戳(秒)
+ (NSString *)getTodayBeginTimestamp;


/// 获取时间对应的星期字符串
- (NSString*)getWeekdayString;


/// 获取当前时间戳(以秒为单位)
+ (NSString *)getNowTimeTimestamp;

/// 当天开始时间。注意：其它当天开始时间写法会导致部分地区（eg：爱尔兰，英国等） 12/24小时切换 [fmt dateFromString:dateStr] = nil; 如果用这个获取的时间后续还需要格式化时间，时间转换等，请使用此方法的NSDateFormatter 写法。
- (NSDate *)ja_DateCurrentDayBegin;

///nsdate 转 nsstring （举例上个方法 ja_DateCurrentDayBegin）
- (NSString *)ja_stringWithDate:(NSDate *)date withDateFormatter:(NSString *)fmt;

@end
