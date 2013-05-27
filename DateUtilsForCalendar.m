//
//  DateUtilsForCalendar.m
//  calendar
//
//  Created by Black Black on 5/22/13.
//  Copyright (c) 2013 blackXblack. All rights reserved.
//

#import "DateUtilsForCalendar.h"

@implementation DateUtilsForCalendar

+ (NSDate *)getDateByYMD:(NSCalendar *)calendar year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

+ (NSDate *)getDateByDayOffset:(NSCalendar *)calendar date:(NSDate *)date dayOffset:(NSInteger)dayOffset {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:dayOffset];
    return [calendar dateByAddingComponents:components toDate:date options:0];
}

+ (NSDate *)getDateByWeekOffset:(NSCalendar *)calendar date:(NSDate *)date weekOffset:(NSInteger)weekOffset {
    NSDateComponents *originComponents = [[NSDateComponents alloc] init];
    [originComponents setWeek:weekOffset];
    return [calendar dateByAddingComponents:originComponents toDate:date options:0];
}

+ (NSDate *)getDateByMonthOffset:(NSCalendar *)calendar date:(NSDate *)date monthOffset:(NSInteger)monthOffset {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:monthOffset];
    return [calendar dateByAddingComponents:components toDate:date options:0];
}

+ (NSInteger)getLengthOfWeekInMonth:(NSCalendar *)calendar month:(NSInteger)month year:(NSInteger)year {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    
    NSRange range = [calendar rangeOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:[calendar dateFromComponents:components]];
    return range.length;
}

+ (NSInteger)getWeekCountsOf2Dates:(NSCalendar *)calendar fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    NSDateComponents *components = [calendar components:(NSWeekCalendarUnit) fromDate:fromDate toDate:toDate options:0];
    return [components week] + 1;
}

+ (NSString *)dateToStrByFormat:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (Boolean)ifInSameMonth:(NSDate *)dateA dateB:(NSDate *)dateB calendar:(NSCalendar *)calendar {
    NSDateComponents *compA = [calendar components:(NSMonthCalendarUnit) fromDate:dateA];
    NSDateComponents *compB = [calendar components:(NSMonthCalendarUnit) fromDate:dateB];
    if ([compA month] == [compB month]) {
        return YES;
    }
    return NO;
}

+ (NSDictionary *)getDateArgs:(NSCalendar *)calendar date:(NSDate *)date {
    NSDateComponents *comp = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit) fromDate:date];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"year", @"month", @"week", @"weekday", @"day", nil] forKeys:[NSArray arrayWithObjects:[NSNumber numberWithInteger:1], [NSNumber numberWithInteger:1], [NSNumber numberWithInteger:1], [NSNumber numberWithInteger:1], [NSNumber numberWithInteger:1], nil]];
    
    [dict setObject:[NSNumber numberWithInteger:[comp year]] forKey:@"year"];
    [dict setObject:[NSNumber numberWithInteger:[comp month]] forKey:@"month"];
    [dict setObject:[NSNumber numberWithInteger:[comp week]] forKey:@"week"];
    [dict setObject:[NSNumber numberWithInteger:[comp weekday]] forKey:@"weekday"];
    [dict setObject:[NSNumber numberWithInteger:[comp day]] forKey:@"day"];
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

+ (NSInteger)getWeekOrderOfMonth:(NSCalendar *)calendar date:(NSDate *)date {
    NSDictionary *dateDict = [self getDateArgs:calendar date:date];
    NSDate *firstDate = [self getDateByYMD:calendar year:[[dateDict objectForKey:@"year"] integerValue] month:[[dateDict objectForKey:@"month"] integerValue] day:1];
    return [self getWeekCountsOf2Dates:calendar fromDate:firstDate toDate:date];
}

+ (NSInteger)getFirstWeekOrderOfMonth:(NSCalendar *)calendar date:(NSDate *)date {
    NSDictionary *dateDict = [self getDateArgs:calendar date:date];
    NSDate *firstDate = [self getDateByYMD:calendar year:[[dateDict objectForKey:@"year"] integerValue] month:[[dateDict objectForKey:@"month"] integerValue] day:1];
    NSDictionary *firstDict = [self getDateArgs:calendar date:firstDate];
    return [[firstDict objectForKey:@"week"] integerValue];
}

@end
