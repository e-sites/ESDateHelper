//
//  ESDateHelperTests.m
//  ESDateHelperTests
//
//  Created by Bas van Kuijck on 10-03-15.
//  Copyright (c) 2015 e-sites. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ESDateHelper.h"

@interface ESDateHelperTests : XCTestCase
{
    NSDate *date;
    NSDateFormatter *fm;
}
@end

@implementation ESDateHelperTests

- (void)setUp {
    [super setUp];
    fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    date = [fm dateFromString:@"2014-05-09 15:10:05"];
}

- (void)tearDown {
    [super tearDown];
}


#pragma mark - ESDateHelper
// ____________________________________________________________________________________________________________________


- (void)testAll
{
    ESDateRange *r = [ESDateRange rangeFromDate:[NSDate dateWithTimeIntervalSinceNow:-100]];
    NSLog(@"in range? %zd", [r containsDate:[NSDate dateWithTimeIntervalSinceNow:-110]]);
}

- (void)test24HourNotation
{
    [ESDateHelper is24HourNotation];
}

- (void)testLeapYear
{
    XCTAssert(![NSDate isLeapYear:2014], @"2014 is not a leap year");
    XCTAssert([NSDate isLeapYear:2016], @"2016 is a leap year");
}

- (void)testTimeInPast
{
    NSInteger hours = [[NSDate date] hour];
    NSInteger minutes = [[NSDate date] minute];
    NSInteger seconds = [[NSDate date] second];
    seconds--;
    if (seconds == -1) {
        seconds = 59;
        minutes--;
        if (minutes == -1) {
            minutes = 59;
            hours--;
            if (hours == -1) {
                return;
            }
        }
    }
    NSString *str = [NSString stringWithFormat:@"%02zd:%02zd:%02zd", hours, minutes, seconds];
    XCTAssert([ESDateHelper isTimeInPast:str], @"Time should be in past: %@", str);
}

- (void)testDateRange
{
    NSDate *now = [NSDate date];
    ESDateRange *r = [ESDateRange rangeFromDate:[NSDate dateWithTimeIntervalSinceNow:-100]];
    XCTAssert([r containsDate:now], @"Date range %@ should contain date %@", r, now);
    
    
    r = [ESDateRange rangeFromDate:[NSDate dateWithTimeIntervalSinceNow:-100] toDate:[NSDate dateWithTimeIntervalSinceNow:100]];
    XCTAssert([r containsDate:now], @"Date range %@ should contain date %@", r, now);
    
    
    r = [ESDateRange rangeToDate:[NSDate dateWithTimeIntervalSinceNow:100]];
    XCTAssert([r containsDate:now], @"Date range %@ should contain date %@", r, now);
    
    
    r = [ESDateRange infiniteRange];
    XCTAssert([r containsDate:now], @"Date range %@ should contain date %@", r, now);
}

- (void)testShiftDateRange
{
    NSDate *from = [NSDate dateWithTimeIntervalSinceNow:-100];
    NSDate *to = [NSDate dateWithTimeIntervalSinceNow:100];
    ESDateRange *r = [ESDateRange rangeFromDate:from toDate:to];
    NSInteger hours = 1;
    NSInteger days = 3;
    NSInteger seconds = 2;
    [r shiftWithComponents:^(NSDateComponents *comp) {
        comp.hour = hours;
        comp.second = seconds;
        comp.day = days;
    }];
    NSInteger dif = (24 * 60 * 60 * days) + (60 * 60 * hours) + seconds;
    NSInteger difTo = [r.fromDate secondsFromDate:from];
    NSInteger difFrom = [r.toDate secondsFromDate:to];
    XCTAssert(difTo == dif && difFrom == dif, @"Difference should be %zd (is %zd)", dif, difTo);
}

- (void)testDateFormat
{
    NSDate *d = [[NSDate date] dateBySettingComponents:^(NSDateComponents *comp) {
        comp.hour = 12;
        comp.minute = 55;
        comp.second = 16;
        comp.day = 8;
        comp.year = 1983;
        comp.month = 3;
    }];
    
    NSDateFormatter *formatter = [NSDateFormatter dateFormatterWithDateFormat:NSDateFormatterFormatDateHourMinuteSecondFraction timeStyle:NSDateFormatterTimeStyleTime];
    NSString *rd = @"1983-03-08T12:55:16.000";
    XCTAssertEqualObjects([formatter stringFromDate:d], rd);
}

- (void)testESDateHelperYear
{
    NSInteger expectedValue = 2014;
    XCTAssertTrue(date.year == expectedValue, @"Year is '%zd', expected '%zd'", date.year, expectedValue);
}

- (void)testESDateHelperMonth
{
    NSInteger expectedValue = 5;
    XCTAssertTrue(date.month == expectedValue, @"Month is '%zd', expected '%zd'", date.month, expectedValue);
}

- (void)testESDateHelperDay
{
    NSInteger expectedValue = 9;
    XCTAssertTrue(date.day == expectedValue, @"Day is '%zd', expected '%zd'", date.day, expectedValue);
}

- (void)testESDateHelperWeekDay
{
    NSInteger expectedValue = 6;
    XCTAssertTrue(date.weekday == expectedValue, @"Weekday is '%zd', expected '%zd'", date.weekday, expectedValue);
}

- (void)testESDateHelperHour
{
    NSInteger expectedValue = 15;
    XCTAssertTrue(date.hour == expectedValue, @"Hour is '%zd', expected '%zd'", date.hour, expectedValue);
}

- (void)testESDateHelperMinute
{
    NSInteger expectedValue = 10;
    XCTAssertTrue(date.minute == expectedValue, @"Minute is '%zd', expected '%zd'", date.minute, expectedValue);
}

- (void)testESDateHelperSecond
{
    NSInteger expectedValue = 5;
    XCTAssertTrue(date.second == expectedValue, @"Second is '%zd', expected '%zd'", date.second, expectedValue);
}

- (void)testESDateHelperAdding
{
    date = [date dateByAddingSeconds:152];
    NSString *expectedStringValue = @"2014-05-09 15:12:37";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
    
    date = [date dateByAddingMinutes:3];
    expectedStringValue = @"2014-05-09 15:15:37";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
    
    date = [date dateByAddingHours:4];
    expectedStringValue = @"2014-05-09 19:15:37";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
    
    date = [date dateByAddingDays:5];
    expectedStringValue = @"2014-05-14 19:15:37";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
    
    date = [date dateByAddingDays:2];
    expectedStringValue = @"2014-05-16 19:15:37";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
    
    NSInteger expectedValue = 6;
    XCTAssertTrue(date.weekday == expectedValue, @"Weekday is '%zd', expected '%zd'", date.weekday, expectedValue);
}

- (void)testESDateHelperSetWeekday
{
    date = [date dateBySettingWeekDay:3];
    NSString *expectedStringValue = @"2014-05-06 15:10:05";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
}

- (void)testESDateHelperSetDays
{
    date = [date dateBySettingDays:18];
    NSString *expectedStringValue = @"2014-05-18 15:10:05";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
}

- (void)testESDateHelperSetDaysAndMonth
{
    date = [date dateBySettingDays:1];
    NSString* expectedStringValue = @"2014-05-01 15:10:05";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
    
    date = [date dateBySettingMonths:2];
    expectedStringValue = @"2014-02-01 15:10:05";
    XCTAssertTrue([[fm stringFromDate:date] isEqualToString:expectedStringValue], @"Date is '%@', expected '%@'", [fm stringFromDate:date], expectedStringValue);
}

- (void)testESDateHelperLocalization
{
    NSString *str = [date descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"nl_NL"]];
    NSString *expectedDateValue = @"vrijdag 9 mei 2014 15:10:05";
    NSArray *spl = [str componentsSeparatedByString:@" "];
    if (spl.count > 4) {
        str = [@[ spl[0], spl[1], spl[2], spl[3], spl[4] ] componentsJoinedByString:@" "];
    }
    XCTAssertTrue([str isEqualToString:expectedDateValue], @"Date is '%@', expected '%@'", str, expectedDateValue);
}

@end
