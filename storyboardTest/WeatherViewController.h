//
//  WeatherViewController.h
//  storyboardTest
//
//  Created by huguiqi on 13-12-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFJJViewController.h"
#import "WeatherWidgetViewController.h"

@interface WeatherViewController : WFJJViewController

@property(nonatomic,strong) WeatherWidgetViewController *weatherWidgetViewController;

@end
