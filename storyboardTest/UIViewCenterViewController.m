//
//  UIViewCenterViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-6-18.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "UIViewCenterViewController.h"
#import "UIView-ViewFrameGeometry.h"

#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
@interface UIViewCenterViewController ()

@end

@implementation UIViewCenterViewController
{
	NSTimer *timer;
}

- (void) move: (NSTimer *) aTimer
{
    //viewWithTag:999这个方法搜索返回与当前view有相同的tag值为999的其它的所有view
	[[self.view viewWithTag:999]  moveToRandomLocationInSuperviewAnimated: NO];
}

- (void) start: (id) sender
{
	timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(move:) userInfo:nil repeats:YES];
	[self move:nil];
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Stop", @selector(stop:));
}

- (void) stop: (id) sender
{
	[timer invalidate];
	timer = nil;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Start", @selector(start:));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Start", @selector(start:));
	
	UIView *outerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 240.0f, 240.0f)];
	outerView.center = CGPointMake(160.0f, 140.0f);
	outerView.backgroundColor = [UIColor lightGrayColor];
	outerView.tag = 998;
	[self.view addSubview:outerView];
	
	UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];
	innerView.backgroundColor = COOKBOOK_PURPLE_COLOR;
	innerView.tag = 999;
	[outerView addSubview:innerView];
}



-(IBAction)testCenter:(id)sender{
    UIButton *button = (UIButton *)sender;
    //视图通过改变中心点的属性来变更位置，以下为获取这个按钮的中心点
    NSLog(@"button center.x %f,center.y %f",CGRectGetCenter(button.frame).x,CGRectGetCenter(button.frame).y);

    button.frame =CGRectMoveToCenter(button.frame,     CGPointMake(200, 150));
//    [button setOrigin:CGPointMake(200, 150)];
    [button setBottom:200];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
