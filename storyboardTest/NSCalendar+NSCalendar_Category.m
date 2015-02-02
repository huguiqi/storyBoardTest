//
//  NSCalendar+NSCalendar_Category.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 4/27/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "NSCalendar+NSCalendar_Category.h"

@implementation NSCalendar (NSCalendar_Category)


-(NSInteger) daysFromDate:(NSDate *) startDate toDate:(NSDate *) endDate {
    
    NSCalendarUnit units=NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *comp1=[self components:units fromDate:startDate];
    NSDateComponents *comp2=[self components:units fromDate:endDate];
    
    [comp1 setHour:12];
    [comp2 setHour:12];
    
    NSDate *date1=[self dateFromComponents: comp1];
    NSDate *date2=[self dateFromComponents: comp2];
    
    return [[self components:NSDayCalendarUnit fromDate:date1 toDate:date2 options:0] day];
}

-(NSDateComponents *)compareDateComponents:(NSInteger)day{
    NSDate *tempDate = [[NSDate date] dateByAddingTimeInterval:60 * 60 * 24 * day];
    NSDateComponents *compareDateComponents = [self components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:tempDate];
    return compareDateComponents;
}

@end
