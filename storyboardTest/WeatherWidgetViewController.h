//
//  WeatherWidgetViewController.h
//  storyboardTest
//
//  Created by huguiqi on 13-12-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherWidgetViewController : UIViewController

@property(nonatomic,weak) IBOutlet UIButton *weatherStatusBtn;
@property(nonatomic,weak) IBOutlet UIControl *weatherView;
@property(nonatomic,weak) IBOutlet UISwipeGestureRecognizer *swipeGesture;


-(IBAction)showWeatherDetail:(id)sender;

-(IBAction)testGesture:(id)sender;

@end
