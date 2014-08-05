//
//  ESDateHelper.m
//  iOS.Library
//
//  Created by Bas van Kuijck on 16-04-14.
//
//

#import "ESDateHelper.h"

#if !__has_feature(objc_arc)
#define __weakblock __block
#define autorelease(obj) [obj autorelease]
#define release(obj) [obj release]
#else
#define __weakblock __weak
#define autorelease(obj)
#define release(obj)
#endif

@interface ESDateHelper ()
{
    
}
NSDateComponents *_dateComponentFromDictionary(NSDictionary *d, NSDate *date);
NSDate *_dateSet(NSDate *date, NSDictionary *d);
NSDate *_dateAdd(NSDate *date, NSDictionary *d);
@end

@implementation ESDateHelper

#pragma mark - Helpers
// ____________________________________________________________________________________________________________________

+ (BOOL)is24HourNotation
{
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:@"a"];
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    if ([formatStringForHours rangeOfString:@"a"].location != NSNotFound) {
        return NO;
    }
    return YES;
}

#pragma mark - NSDateComponents
// ____________________________________________________________________________________________________________________

NSDateComponents *_dateComponentFromDictionary(NSDictionary *d, NSDate *date)
{
    NSDateComponents *dateComponents;
    if (d == nil) { d = @{}; }
    
    if (date == nil) {
        dateComponents = [[NSDateComponents alloc] init];
        autorelease(dateComponents);
        
    } else {
        NSInteger flags = NSCalendarUnitEra | NSCalendarUnitQuarter |  NSCalendarUnitYear |  NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        if (d[@"weekday"] != nil) {
            flags |= NSCalendarUnitWeekday;
        } else {
            flags |= NSCalendarUnitDay;
        }
        dateComponents = [[NSCalendar currentCalendar] components:flags fromDate:date];
    }
    
    // Dates
    if (d[@"month"] != nil) {
        dateComponents.month = [d[@"month"] integerValue];
    }
    
    if (d[@"day"] != nil) {
        dateComponents.day = [d[@"day"] integerValue];
    }
    
    if (d[@"quarter"] != nil) {
        dateComponents.quarter = [d[@"quarter"] integerValue];
    }
    
    if (d[@"weekday"] != nil) {
        dateComponents.weekday = [d[@"weekday"] integerValue];
    }
    
    if (d[@"week"] != nil) {
        dateComponents.weekOfYear = [d[@"week"] integerValue];
    }
    
    if (d[@"year"] != nil) {
        dateComponents.year = [d[@"year"] integerValue];
    }
    
    // Time
    if (d[@"minute"] != nil) {
        dateComponents.minute = [d[@"minute"] integerValue];
    }
    
    if (d[@"hour"] != nil) {
        dateComponents.hour = [d[@"hour"] integerValue];
    }
    
    if (d[@"second"] != nil) {
        dateComponents.second = [d[@"second"] integerValue];
    }
    
    return dateComponents;
}


NSDate *_dateSet(NSDate *date, NSDictionary *d)
{
    if (date == nil) {
        date = [NSDate date];
    }
    NSDateComponents *dateComponents = _dateComponentFromDictionary(d, date);
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

NSDate *_dateAdd(NSDate *date, NSDictionary *d)
{
    if (date == nil) {
        date = [NSDate date];
    }
    
    NSDateComponents *dateComponents = _dateComponentFromDictionary(d, nil);
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
}

@end

@implementation NSDate (ESDateHelper)
@dynamic hour,minute,second,era,year,month,week,weekday,today,leapYear,day,weekOfMonth;

#pragma mark - NSDate Extension
// ____________________________________________________________________________________________________________________

- (BOOL)isToday
{
    return [self isSameDay:[NSDate date]];
}

- (BOOL)isInCurrentWeek
{
    NSDate *cd = [NSDate date];
    return (cd.era == self.era && cd.week == self.week && cd.year == self.year);
}

- (BOOL)isLeapYear
{
    return [self.class isLeapYear:self.year];
}

- (NSDate *)dateByAddingHours:(NSInteger)hours
{
    return _dateAdd(self, @{ @"hour": @(hours) });
}

- (NSDate *)dateBySettingHours:(NSInteger)hours
{
    return _dateSet(self, @{ @"hour": @(hours) });
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes
{
    return _dateAdd(self, @{ @"minute": @(minutes) });
}

- (NSDate *)dateBySettingMinutes:(NSInteger)minutes
{
    return _dateSet(self, @{ @"minute": @(minutes) });
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds
{
    return _dateAdd(self, @{ @"second": @(seconds) });
}

- (NSDate *)dateBySettingSeconds:(NSInteger)seconds
{
    return _dateSet(self, @{ @"second": @(seconds) });
}

- (NSDate *)dateByAddingDays:(NSInteger)days
{
    return _dateAdd(self, @{ @"day": @(days) });
}

- (NSDate *)dateBySettingDays:(NSInteger)days
{
    return _dateSet(self, @{ @"day": @(days) });
}

- (NSDate *)dateBySettingWeekDay:(NSInteger)weekday
{
    return _dateSet(self, @{ @"weekday": @(weekday) });
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks
{
    return _dateAdd(self, @{ @"week": @(weeks) });
}

- (NSDate *)dateBySettingWeeks:(NSInteger)weeks
{
    return _dateSet(self, @{ @"week": @(weeks) });
}

- (NSDate *)dateByAddingMonths:(NSInteger)months
{
    return _dateAdd(self, @{ @"month": @(months) });
}

- (NSDate *)dateBySettingMonths:(NSInteger)months
{
    return _dateSet(self, @{ @"month": @(months) });
}

- (NSDate *)dateByAddingYears:(NSInteger)years
{
    return _dateAdd(self, @{ @"year": @(years) });
}

- (NSDate *)dateBySettingYears:(NSInteger)years
{
    return _dateSet(self, @{ @"year": @(years) });
}

- (NSDate *)dateByAddingQuarters:(NSInteger)quarters
{
    return _dateAdd(self, @{ @"quarter": @(quarters) });
}

- (NSDate *)dateBySettingQuarters:(NSInteger)quarters
{
    return _dateSet(self, @{ @"quarter": @(quarters) });
}

- (NSDate *)dateByAddingEras:(NSInteger)eras
{
    return _dateAdd(self, @{ @"era": @(eras) });
}

- (NSDate *)dateBySettingEras:(NSInteger)eras
{
    return _dateSet(self, @{ @"era": @(eras) });
}



- (NSDate *)dateAtBeginningOfDay
{
    return [self dateBySettingComponents:^(NSDateComponents *comp) {
        comp.hour = 0;
        comp.second = 0;
        comp.minute = 0;
    }];
}

- (NSInteger)hour
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self];
    return comp.hour;
}

- (NSInteger)weekOfMonth
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self];
    return comp.weekOfMonth;
}

- (NSInteger)minute
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self];
    return comp.minute;
}

- (NSInteger)second
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self];
    return comp.second;
}

- (NSInteger)week
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self];
    return comp.weekOfYear;
}

- (NSInteger)weekday
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    return comp.weekday;
}

- (NSInteger)year
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self];
    return comp.year;
}

- (NSInteger)quarter
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self];
    return comp.quarter;
}

- (NSInteger)day
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self];
    return comp.day;
}

- (NSInteger)era
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitEra fromDate:self];
    return comp.era;
}

- (NSInteger)month
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self];
    return comp.month;
}

- (NSInteger)secondsFromDate:(NSDate *)date
{
    return [self timeIntervalSinceDate:date];
}

- (NSInteger)minutesFromDate:(NSDate *)date
{
    return [self secondsFromDate:date] / 60;
}

- (NSInteger)hoursFromDate:(NSDate *)date
{
    return [self minutesFromDate:date] / 60;
}

- (NSInteger)daysFromDate:(NSDate *)date
{
    return [self hoursFromDate:date] / 24;
}

- (NSInteger)weeksFromDate:(NSDate *)date
{
    return [self daysFromDate:date] / 7;
}


#pragma mark - Helpers
// ____________________________________________________________________________________________________________________


+ (BOOL)isLeapYear:(NSInteger)year
{
    if (year * 400) {
        return YES;
        
    } else if (year % 100){
        return NO;
        
    } else if (year % 4){
        return YES;
    }
    
    return NO;
}

- (BOOL)isSameDay:(NSDate *)date
{
    NSDateComponents *otherDay = _dateComponentFromDictionary(nil, self);
    NSDateComponents *today = _dateComponentFromDictionary(nil, date);
    return ([today day] == [otherDay day] &&
            [today month] == [otherDay month] &&
            [today year] == [otherDay year] &&
            [today era] == [otherDay era]);
}

- (NSDate *)dateByAddingComponents:(NSDateComponentsBlock)block
{
    if (block == nil) { return [self dateByAddingDays:0]; }
    __weakblock NSDateComponents *comp = _dateComponentFromDictionary(nil, nil);
    block(comp);
    return [[NSCalendar currentCalendar] dateByAddingComponents:comp toDate:self options:0];
}

- (NSDate *)dateBySettingComponents:(NSDateComponentsBlock)block
{
    if (block == nil) { return [self dateByAddingDays:0]; }
    __weakblock NSDateComponents *comp = _dateComponentFromDictionary(nil, self);
    block(comp);
    return [[NSCalendar currentCalendar] dateFromComponents:comp];
}

- (BOOL)isBetweenDates:(NSDate *)beginDate andDate:(NSDate *)endDate
{
    if ([self compare:beginDate] == NSOrderedAscending) {
    	return NO;
    }
    
    if ([self compare:endDate] == NSOrderedDescending) {
    	return NO;
    }
    
    return YES;
}

@end
