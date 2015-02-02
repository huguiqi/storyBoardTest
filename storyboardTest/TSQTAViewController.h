//
//  TSQTAViewController.h
//  TimesSquare
//
//  Created by Jim Puls on 12/5/12.
//  Licensed to Square, Inc. under one or more contributor license agreements.
//  See the LICENSE file distributed with this work for the terms under
//  which Square, Inc. licenses this file to you.

#import <UIKit/UIKit.h>
#import "TimesSquare.h"
#import "WFJJViewController.h"

typedef  void (^CloseCalendarBlock) (void);

@interface TSQTAViewController : WFJJViewController<TSQCalendarViewDelegate>

@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDate *checkInDate;
@property (nonatomic, strong) NSDate *checkOutDate;
@property (nonatomic) BOOL isChoose;
@property (nonatomic,strong)NSDate *calendarStartDate;
@property (nonatomic,strong)NSDate *calendarEndDate;

@property (nonatomic,copy) CloseCalendarBlock closeCalendar;

@end
