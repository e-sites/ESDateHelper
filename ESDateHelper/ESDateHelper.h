//
//  ESDateHelper.h
//  iOS.Library
//
//  Created by Bas van Kuijck on 16-04-14.
//
//

#ifndef ESDATEHELPER_IMPORT_HEADER
#define ESDATEHELPER_IMPORT_HEADER

#import <Foundation/Foundation.h>
#import "NSDate+ESDateHelper.h"
#import "ESDateRange.h"

@interface ESDateHelper : NSObject
+ (BOOL)is24HourNotation;
+ (BOOL)isTimeInPast:(NSString *)time;
@end

#endif