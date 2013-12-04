//
//  WeatherViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-12-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view addSubview:self.weatherWidgetViewController.weatherView];
}

#pragma --mark-weatherWidgetViewController
-(WeatherWidgetViewController *)weatherWidgetViewController
{
    if (!_weatherWidgetViewController) {
        _weatherWidgetViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"WeatherWidgetViewController"];
        [_weatherWidgetViewController loadView];
        [_weatherWidgetViewController viewDidLoad];
    }
    return _weatherWidgetViewController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
