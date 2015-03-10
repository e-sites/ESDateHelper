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
    str = [str componentsSeparatedByString:@" Midd"][0];
    XCTAssertTrue([str isEqualToString:expectedDateValue], @"Date is '%@', expected '%@'", str, expectedDateValue);
}

@end
