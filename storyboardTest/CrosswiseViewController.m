//
//  CrosswiseViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-6-24.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "CrosswiseViewController.h"
//#import "UIView-ViewFrameGeometry.h"

#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

@interface CrosswiseViewController ()

@property(nonatomic,strong) UIView *contextView;

@end

@implementation CrosswiseViewController

#pragma mark --淡出
- (void) fadeOut: (id) sender
{
    //UIGraphicsGetCurrentContext 此方法会返回当前视图堆栈顶部的图形上下文(graphics context),使用最新sdk开发时，保证传递nil参数给UIView beginAnimations 不会报错
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
	[[self.view viewWithTag:999] setAlpha:0.0f];
	[UIView commitAnimations];
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Fade In", @selector(fadeIn:));
}

#pragma mark --淡入
- (void) fadeIn: (id) sender
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
	[[self.view viewWithTag:999] setAlpha:1.0f];
	[UIView commitAnimations];
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Fade Out", @selector(fadeOut:));
}

- (void) viewDidLoad
{
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Fade Out", @selector(fadeOut:));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
