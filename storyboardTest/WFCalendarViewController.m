//
//  WFCalendarViewController.m
//  storyboardTest
//
//  Created by huguiqi on 15/1/26.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import "WFCalendarViewController.h"
#import "TSQTAViewController.h"


@interface WFCalendarViewController ()

@end

@implementation WFCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)clickCheckInDate:(id)sender{
    
//    TSQTAViewController *gregorian = [[TSQTAViewController alloc] init];
    TSQTAViewController *gregorian = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"TSQTAViewController"];
    
    
    NSTimeInterval oneDay = 24*60*60;
    
    //默认
    NSDate *calendarStartDate =  [[NSDate date] dateByAddingTimeInterval:-10*oneDay];
    NSDate *calendarEndDate = [[NSDate date] dateByAddingTimeInterval:30*3*oneDay];
    gregorian.calendarStartDate = calendarStartDate;
    gregorian.calendarEndDate = calendarEndDate;
    gregorian.checkInDate = [NSDate date];
    gregorian.checkOutDate = calendarEndDate;
    gregorian.closeCalendar = ^(void){
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:gregorian animated:YES completion:nil];
}


-(IBAction)clickCheckOutDate:(id)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
