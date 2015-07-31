# ESDateHelper

[![Build](https://travis-ci.org/e-sites/ESDateHelper.svg)](https://travis-ci.org/e-sites/ESDateHelper)
[![Coverage Status](https://coveralls.io/repos/e-sites/ESDateHelper/badge.svg?branch=master&service=github&cacheBuster=123)](https://coveralls.io/github/e-sites/ESDateHelper?branch=master)
[![Platform](https://cocoapod-badges.herokuapp.com/p/ESDateHelper/badge.png)](http://cocoadocs.org/docsets/ESDateHelper)
[![Version](https://cocoapod-badges.herokuapp.com/v/ESDateHelper/badge.png)](http://cocoadocs.org/docsets/ESDateHelper)

Helper category for making the usage of NSDates easier

## Class methods
```objective-c
+ (BOOL)is24HourNotation;
+ (BOOL)isTimeInPast:(notnull NSString *)time;
```

# NSDate category

## Class methods
```objective-c
+ (BOOL)isLeapYear:(NSInteger)year;
```

## Properties

```objective-c
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger seconds;
@property (nonatomic, readonly) NSInteger week;
@property (nonatomic, readonly) NSInteger weekday;
@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger era;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger quarter;
@property (nonatomic, readonly, getter=isToday) BOOL today;
@property (nonatomic, readonly, getter=isInCurrentWeek) BOOL inCurrentWeek;
@property (nonatomic, readonly, getter=isLeapYear) BOOL leapYear;
```

## Instance methods

```objective-c
- (BOOL)isSameDay:(NSDate *)date;

- (notnull NSDate *)dateByAddingComponents:(NSDateComponentsBlock)block;
- (notnull NSDate *)dateBySettingComponents:(NSDateComponentsBlock)block;

- (notnull NSDate *)dateByAddingHours:(NSInteger)hours;
- (notnull NSDate *)dateBySettingHours:(NSInteger)hours;

- (notnull NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (notnull NSDate *)dateBySettingMinutes:(NSInteger)minutes;

- (notnull NSDate *)dateByAddingSeconds:(NSInteger)seconds;
- (notnull NSDate *)dateBySettingSeconds:(NSInteger)seconds;

- (notnull NSDate *)dateByAddingWeeks:(NSInteger)weeks;
- (notnull NSDate *)dateBySettingWeeks:(NSInteger)weeks;

- (notnull NSDate *)dateByAddingDays:(NSInteger)days;
- (notnull NSDate *)dateBySettingDays:(NSInteger)days;

- (notnull NSDate *)dateBySettingWeekDay:(NSInteger)weekday;

- (notnull NSDate *)dateByAddingMonths:(NSInteger)months;
- (notnull NSDate *)dateBySettingMonths:(NSInteger)months;

- (notnull NSDate *)dateByAddingYears:(NSInteger)years;
- (notnull NSDate *)dateBySettingYears:(NSInteger)years;

- (notnull NSDate *)dateByAddingQuarters:(NSInteger)quarters;
- (notnull NSDate *)dateBySettingQuarters:(NSInteger)quarters;

- (notnull NSDate *)dateByAddingEras:(NSInteger)eras;
- (notnull NSDate *)dateBySettingEras:(NSInteger)eras;

- (notnull NSDate *)dateAtBeginningOfDay;

- (NSInteger)secondsFromDate:(notnull NSDate *)date;
- (NSInteger)minutesFromDate:(notnull NSDate *)date;
- (NSInteger)hoursFromDate:(notnull NSDate *)date;
- (NSInteger)daysFromDate:(notnull NSDate *)date;
- (NSInteger)weeksFromDate:(notnull NSDate *)date;

- (BOOL)isBetweenDates:(nullable NSDate *)beginDate andDate:(nullable NSDate *)endDate;
```

# ESDateRange class

## Class methods

```objective-c

+ (notnull instancetype)infiniteRange;
+ (notnull instancetype)rangeFromDate:(nullable NSDate *)from toDate:(nullable NSDate *)to;
+ (notnull instancetype)rangeFromDate:(nullable NSDate *)date;
+ (notnull instancetype)rangeToDate:(nullable NSDate *)date;
```

## Instance methods

```objective-c
- (notnull instancetype)initWithFromDate:(nullable NSDate *)fromDate toDate:(nullable NSDate *)toDate;
- (notnull instancetype)initWithFromDate:(nullable NSDate *)fromDate;
- (notnull instancetype)initWithToDate:(nullable NSDate *)toDate;

- (BOOL)containsDate:(notnull NSDate *)date;

- (void)shiftWithSeconds:(NSInteger)seconds;
- (void)shiftWithMinutes:(NSInteger)minutes;
- (void)shiftWithHours:(NSInteger)hours;
- (void)shiftWithDays:(NSInteger)days;
- (void)shiftWithWeeks:(NSInteger)weeks;
- (void)shiftWithMonths:(NSInteger)months;
- (void)shiftWithYears:(NSInteger)years;
- (void)shiftWithEras:(NSInteger)eras;
- (void)shiftWithComponents:(notnull NSDateComponentsBlock)componentsBlock;
```

## Properties

```objective-c
@property (nullable, nonatomic, strong) NSDate *fromDate;
@property (nullable, nonatomic, strong) NSDate *toDate;
```