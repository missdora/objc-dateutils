//
//  DateUtilsForCalendar.h
//  calendar
//
//  Created by Black Black on 5/22/13.
//  Copyright (c) 2013 blackXblack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtilsForCalendar : NSObject

/* 根据月份间隔获取新的时间 */
+ (NSDate *)getDateByMonthOffset:(NSCalendar *)calendar date:(NSDate *)date monthOffset:(NSInteger)monthOffset;

/* 根据天数间隔获取新的时间 */
+ (NSDate *)getDateByDayOffset:(NSCalendar *)calendar date:(NSDate *)date dayOffset:(NSInteger)dayOffset;

/* 根据周数间隔获取新的时间 */
+ (NSDate *)getDateByWeekOffset:(NSCalendar *)calendar date:(NSDate *)date weekOffset:(NSInteger)weekOffset;

/* 返回指定月的周数 */
+ (NSInteger)getLengthOfWeekInMonth:(NSCalendar *)calendar month:(NSInteger)month year:(NSInteger)year;

/* 计算两个时间相差的week数 */
+ (NSInteger)getWeekCountsOf2Dates:(NSCalendar *)calendar fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;


/* 根据年月日新建日期类 */
+ (NSDate *)getDateByYMD:(NSCalendar *)calendar year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/* 将日期类转换为日期字符串 */
+ (NSString *)dateToStrByFormat:(NSDate *)date format:(NSString *)format;

/* 对比两个日期是否在同一个月中 */
+ (Boolean)ifInSameMonth:(NSDate *)dateA dateB:(NSDate *)dateB calendar:(NSCalendar *)calendar;

/* 获取NSDate类型变量的日期 */
+ (NSDictionary *)getDateArgs:(NSCalendar *)calendar date:(NSDate *)date;

/* 计算日期在所在月的周序号 */
+ (NSInteger)getWeekOrderOfMonth:(NSCalendar *)calendar date:(NSDate *)date;

/* 计算日期所在的某个月的第一周的周序号 */
+ (NSInteger)getFirstWeekOrderOfMonth:(NSCalendar *)calendar date:(NSDate *)date;


@end
