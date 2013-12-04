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
    [super viewDidLoad];
    self.weatherView.layer.borderWidth = 1.5;
    self.weatherView.layer.borderColor = [[UIColor colorWithRed:81.0/255.0 green:162.0/255.0 blue:238.0/255.0 alpha:1.0] CGColor];
    self.weatherView.layer.cornerRadius=5;
    
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
