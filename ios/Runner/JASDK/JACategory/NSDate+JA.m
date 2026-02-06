//
//  NSDate+JA.m
//  JUANUtil
//
//  Created by Wynton on 2018/3/7.
//  Copyright © 2018年 juanvision. All rights reserved.
//

#import "NSDate+JA.h"

@implementation NSDate(JA)

- (NSString *)ja_stringFormat:(NSString *)formatString
{
    static NSDateFormatter *fmt;
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
        fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    }
    fmt.dateFormat = formatString;
    return [fmt stringFromDate:self];
}

- (NSDate *)ja_dateOfDayBegin
{
    static NSDateFormatter *fmt;
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
        fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    }
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [NSString stringWithFormat:@"%@ 00:00:00",[fmt stringFromDate:self]];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt dateFromString:dateStr];
}

- (NSDate *)ja_dateOfDayEnd
{
    static NSDateFormatter *fmt;
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
        fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    }
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [NSString stringWithFormat:@"%@ 23:59:59",[fmt stringFromDate:self]];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt dateFromString:dateStr];
}


- (NSDate *)ja_dateofNextDate {
    NSDate *start = [self ja_dateOfDayBegin];
    NSDate *next = [start dateByAddingTimeInterval:24*3600];
    return next;
}

- (NSDate *)ja_localDate{
    return [self dateByAddingTimeInterval:[NSTimeZone systemTimeZone].secondsFromGMT];
}

+ (NSDate *)ja_localDate
{
    return [[NSDate date] dateByAddingTimeInterval:[NSTimeZone systemTimeZone].secondsFromGMT];
}

+ (NSTimeInterval)ja_localTime
{
    return [[self ja_localDate] timeIntervalSince1970];
}

+ (NSDate *)dateWithString:(NSString* )strDate Format:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate * date = [formatter dateFromString:strDate];
    return date;
}

+ (NSString *)stringWithDate:(NSDate* )date Format:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString * strDate = [formatter stringFromDate:date];
    return strDate;
}
+ (NSString *)utc_stringWithDate:(NSDate *)date Format:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:format];
    NSString * strDate = [formatter stringFromDate:date];
    return strDate;
}

+ (NSString *)stringWithTimeInterval:(NSTimeInterval )timeInterval Format:(NSString *)format
{
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *strDate = [myDate ja_stringFormat:format];
    return strDate;
}
+ (NSString *)StringWithTimeInterval:(NSTimeInterval )timeInterval TimeZone:(NSString *)timeZone Format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    if (timeZone) {
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:timeZone]];
    }else{
        [formatter setTimeZone:[NSTimeZone localTimeZone]];
    }
    NSString * string = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    return string;
}
- (NSInteger)ja_daysFromNow {
    NSDate *currentDate = [NSDate date];// "UTC"时间
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:currentDate toDate:self options:0];
    return [comps day];
}

+ (BOOL)ja_is24HourFormat {
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    BOOL hasAMPM = containsA.location != NSNotFound;
    return !hasAMPM;
}

// 判断是否是同一天
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone=[NSTimeZone timeZoneWithName:@"UTC"];
    [calendar setTimeZone:timeZone];
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 day] == [comp2 day]) && ([comp1 month] == [comp2 month]) && ([comp1 year] == [comp2 year]));
}

- (NSDate *)ja_dayStartDate {
    static NSDateFormatter *fmt;
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
        fmt.timeZone = [NSTimeZone localTimeZone];
    }
    
    fmt.dateFormat = @"yyyy-MM-dd 00:00:00";
    NSString *dateStr = [fmt stringFromDate:self];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt dateFromString:dateStr];
}

- (NSDate *)ja_dayEndDate {
    static NSDateFormatter *fmt;
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
        fmt.timeZone = [NSTimeZone localTimeZone];
    }
    fmt.dateFormat = @"yyyy-MM-dd 23:59:59";
    NSString *dateStr = [fmt stringFromDate:self];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt dateFromString:dateStr];
}

- (NSDate *)ja_nextDayDate {
    NSDate *start = [self ja_dayStartDate];
    NSDate *next = [start dateByAddingTimeInterval:24*3600];
    return next;
}

/// 时间string转为时间戳
/// @param formatterStr 显示时间格式
/// @param timeStr 时间string
+ (NSTimeInterval)timeIntervalWithFormatterString:(NSString *)formatterStr TimeString:(NSString *)timeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterStr];
    NSDate *date = [formatter dateFromString:timeStr];
    return [date timeIntervalSince1970];
}

///  将NSSting型日期转为NSDate型日期 （UTC）
/// @param timeStr timeStr description
/// @param format formatterStr description
+ (NSDate *)utc_dateWithString:(NSString *)timeStr Format:(NSString *)format
{    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:timeStr];
    return date;
}


/**
 返回两个时间相差几天
 @param startTime 开始时间
 @param endTime 结束时间
 */
+ (NSInteger)getDifferentDateWithStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:startTime.longLongValue];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:endTime.longLongValue];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:startDate  toDate:endDate  options:0];
    return [comps day];
}


/// 获取当天0时0分0秒的时间戳(秒)
+ (NSString *)getTodayBeginTimestamp {
    NSDate *datenow = [[NSDate date] ja_dateOfDayBegin];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}


- (NSString*)getWeekdayString {

    NSArray *weekdays = [NSArray arrayWithObjects:
                         [NSNull null],
                         [NSString person_alarm_selct_time_sun],
                         [NSString person_alarm_selct_time_monday],
                         [NSString person_alarm_selct_time_tuesday],
                         [NSString person_alarm_selct_time_wed],
                         [NSString person_alarm_selct_time_thur],
                         [NSString person_alarm_selct_time_fri],
                         [NSString person_alarm_selct_time_sat], nil];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];

    [calendar setTimeZone: timeZone];

    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;

    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    return [weekdays objectAtIndex:theComponents.weekday];
}

/// 获取当前时间戳(以秒为单位)
+ (NSString *)getNowTimeTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", time];//转为字符型
    return timeString;
}
- (NSDate *)ja_DateCurrentDayBegin {
    
    static NSDateFormatter *fmt;
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
        fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    }
    fmt.dateFormat = @"yyyy-MM-dd 00:00:00";
    NSString *dateStr = [fmt stringFromDate:self];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date =  [fmt dateFromString:dateStr];
    return date;
}

///nsdate 转 nsstring （举例上个方法 ja_DateCurrentDayBegin）
- (NSString *)ja_stringWithDate:(NSDate *)date withDateFormatter:(NSString *)fmt {
    static NSDateFormatter *formatter;
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    }
    [formatter setDateFormat:fmt];
    NSString *strDate = [formatter stringFromDate:date];
    return strDate;
}

@end
