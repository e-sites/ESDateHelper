# ESDateHelper

[![Build](https://travis-ci.org/e-sites/ESDateHelper.svg)](https://travis-ci.org/e-sites/ESDateHelper)
[![Coverage Status](https://coveralls.io/repos/e-sites/ESDateHelper/badge.svg?branch=master&service=github&cacheBuster=123)](https://coveralls.io/github/e-sites/ESDateHelper?branch=master)
[![Platform](https://cocoapod-badges.herokuapp.com/p/ESDateHelper/badge.png)](http://cocoadocs.org/docsets/ESDateHelper)
[![Version](https://cocoapod-badges.herokuapp.com/v/ESDateHelper/badge.png)](http://cocoadocs.org/docsets/ESDateHelper)

Helper category for making the usage of NSDates easier

## Class methods
```objective-c
+ (BOOL)is24HourNotation;
+ (BOOL)isTimeInPast:(nonnull NSString *)time;
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

- (nonnull NSDate *)dateByAddingComponents:(NSDateComponentsBlock)block;
- (nonnull NSDate *)dateBySettingComponents:(NSDateComponentsBlock)block;

- (nonnull NSDate *)dateByAddingHours:(NSInteger)hours;
- (nonnull NSDate *)dateBySettingHours:(NSInteger)hours;

- (nonnull NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (nonnull NSDate *)dateBySettingMinutes:(NSInteger)minutes;

- (nonnull NSDate *)dateByAddingSeconds:(NSInteger)seconds;
- (nonnull NSDate *)dateBySettingSeconds:(NSInteger)seconds;

- (nonnull NSDate *)dateByAddingWeeks:(NSInteger)weeks;
- (nonnull NSDate *)dateBySettingWeeks:(NSInteger)weeks;

- (nonnull NSDate *)dateByAddingDays:(NSInteger)days;
- (nonnull NSDate *)dateBySettingDays:(NSInteger)days;

- (nonnull NSDate *)dateBySettingWeekDay:(NSInteger)weekday;

- (nonnull NSDate *)dateByAddingMonths:(NSInteger)months;
- (nonnull NSDate *)dateBySettingMonths:(NSInteger)months;

- (nonnull NSDate *)dateByAddingYears:(NSInteger)years;
- (nonnull NSDate *)dateBySettingYears:(NSInteger)years;

- (nonnull NSDate *)dateByAddingQuarters:(NSInteger)quarters;
- (nonnull NSDate *)dateBySettingQuarters:(NSInteger)quarters;

- (nonnull NSDate *)dateByAddingEras:(NSInteger)eras;
- (nonnull NSDate *)dateBySettingEras:(NSInteger)eras;

- (nonnull NSDate *)dateAtBeginningOfDay;

- (NSInteger)secondsFromDate:(nonnull NSDate *)date;
- (NSInteger)minutesFromDate:(nonnull NSDate *)date;
- (NSInteger)hoursFromDate:(nonnull NSDate *)date;
- (NSInteger)daysFromDate:(nonnull NSDate *)date;
- (NSInteger)weeksFromDate:(nonnull NSDate *)date;

- (BOOL)isBetweenDates:(nullable NSDate *)beginDate andDate:(nullable NSDate *)endDate;
```

# ESDateRange class

## Class methods

```objective-c

+ (nonnull instancetype)infiniteRange;
+ (nonnull instancetype)rangeFromDate:(nullable NSDate *)from toDate:(nullable NSDate *)to;
+ (nonnull instancetype)rangeFromDate:(nullable NSDate *)date;
+ (nonnull instancetype)rangeToDate:(nullable NSDate *)date;
```

## Instance methods

```objective-c
- (nonnull instancetype)initWithFromDate:(nullable NSDate *)fromDate toDate:(nullable NSDate *)toDate;
- (nonnull instancetype)initWithFromDate:(nullable NSDate *)fromDate;
- (nonnull instancetype)initWithToDate:(nullable NSDate *)toDate;

- (BOOL)containsDate:(nonnull NSDate *)date;

- (void)shiftWithSeconds:(NSInteger)seconds;
- (void)shiftWithMinutes:(NSInteger)minutes;
- (void)shiftWithHours:(NSInteger)hours;
- (void)shiftWithDays:(NSInteger)days;
- (void)shiftWithWeeks:(NSInteger)weeks;
- (void)shiftWithMonths:(NSInteger)months;
- (void)shiftWithYears:(NSInteger)years;
- (void)shiftWithEras:(NSInteger)eras;
- (void)shiftWithComponents:(nonnull NSDateComponentsBlock)componentsBlock;
```

## Properties

```objective-c
@property (nullable, nonatomic, strong) NSDate *fromDate;
@property (nullable, nonatomic, strong) NSDate *toDate;
```