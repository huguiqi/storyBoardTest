//
//  WeatherWidgetViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-12-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "WeatherWidgetViewController.h"


#define MIN_TAG 100
#define MAX_TAG 101

@interface WeatherWidgetViewController ()


@end

@implementation WeatherWidgetViewController


- (void)viewDidLoad
{
//    self.weatherView.frame = CGRectMake(0, 26, 43, 55);
    [super viewDidLoad];
//    [self.weatherView setAutoresizesSubviews:YES];
}

-(IBAction)showWeatherDetail:(id)sender
{
    UIButton *btn = (UIButton *) sender;
    NSNumber *weatherFrameWidth = [NSNumber numberWithFloat:btn.tag==MIN_TAG?39.0:294.0];
    btn.tag = btn.tag==MIN_TAG?MAX_TAG:MIN_TAG;
    [UIView animateWithDuration:0.4 animations:^{
        self.weatherView.frame = CGRectMake(self.weatherView.frame.origin.x, self.weatherView.frame.origin.y, [weatherFrameWidth floatValue], self.weatherView.frame.size.height);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
