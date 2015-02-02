//
//  TSQTAViewController.m
//  TimesSquare
//
//  Created by Jim Puls on 12/5/12.
//  Licensed to Square, Inc. under one or more contributor license agreements.
//  See the LICENSE file distributed with this work for the terms under
//  which Square, Inc. licenses this file to you.

#import "TSQTAViewController.h"
#import "TSQTACalendarRowCell.h"


@interface TSQTAViewController ()

@property (nonatomic, retain) NSTimer *timer;

@end


@interface TSQCalendarView (AccessingPrivateStuff)

@property (nonatomic, readonly) UITableView *tableView;

@end


@implementation TSQTAViewController

- (void)loadView;
{
    TSQCalendarView *calendarView = [[TSQCalendarView alloc] init];
    calendarView.delegate = self;
    calendarView.calendar = self.calendar;
    calendarView.rowCellClass = [TSQTACalendarRowCell class];
//    calendarView.firstDate = [NSDate dateWithTimeIntervalSinceNow:-60 * 60 * 24 * 1];
    calendarView.firstDate = self.calendarStartDate;
//    calendarView.lastDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 5];
    calendarView.lastDate = self.calendarEndDate;
//    calendarView.backgroundColor = [UIColor colorWithRed:0.84f green:0.85f blue:0.86f alpha:1.0f];
    calendarView.startDate = self.checkInDate;
    calendarView.endDate = self.checkOutDate;
    calendarView.isChoosingStart = YES;
    
    calendarView.backgroundColor = [UIColor clearColor];
    calendarView.pagingEnabled = YES;
    CGFloat onePixel = 1.0f / [UIScreen mainScreen].scale;
    calendarView.contentInset = UIEdgeInsetsMake(0.0f, onePixel, 0.0f, onePixel);
    self.view = calendarView;

    self.view.backgroundColor = [UIColor yellowColor];
    
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    self.calendar.locale = [NSLocale localeWithLocaleIdentifier:NSChineseCalendar];

}

- (void)setCalendar:(NSCalendar *)calendar;
{
    _calendar = calendar;
    
    self.navigationItem.title = calendar.calendarIdentifier;
    self.tabBarItem.title = calendar.calendarIdentifier;
}

- (void)viewDidLayoutSubviews;
{
  // Set the calendar view to show today date on start
  [(TSQCalendarView *)self.view scrollToDate:[NSDate date] animated:NO];
}

- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
    
    // Uncomment this to test scrolling performance of your custom drawing
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(scroll) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated;
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scroll;
{
    static BOOL atTop = YES;
    TSQCalendarView *calendarView = (TSQCalendarView *)self.view;
    UITableView *tableView = calendarView.tableView;
    
    [tableView setContentOffset:CGPointMake(0.f, atTop ? 10000.f : 0.f) animated:YES];
    atTop = !atTop;
}


-(void)calendarView:(TSQCalendarView *)calendarView didSelectDate:(NSDate *)date{

    NSDateFormatter *dateFormate = [NSDateFormatter new];
    dateFormate.dateFormat = @"yyyy-M-d";
    
    NSString *startDateString = [dateFormate stringFromDate:date];
//    NSString *backDateString = [dateFormate stringFromDate:calendarView.backFlyDate];
    self.closeCalendar();
    NSLog(@"data:%@",startDateString);
}


@end
