//
//  UIViewCurlUpOrDownViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-6-30.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "UIViewCurlUpOrDownViewController.h"

#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]


@interface UIViewCurlUpOrDownViewController ()

@end

@implementation UIViewCurlUpOrDownViewController



- (void) animationFinished: (id) sender
{
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Curl", @selector(curl:));
}
#pragma mark---翻页效果
- (void) curl: (id) sender
{
	// hide the button
	self.navigationItem.rightBarButtonItem = nil;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
	
	UIView *whiteBackdrop = [self.view viewWithTag:100];
    
	// Choose up or down curl
	if ([(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex])
		[UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:whiteBackdrop cache:YES];
	else
		[UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView:whiteBackdrop cache:YES];
    //检测999tag在whiteBackdrop这个视图中在内存中的索引位置
	NSInteger purple = [[whiteBackdrop subviews] indexOfObject:[whiteBackdrop viewWithTag:999]];
	NSInteger maroon = [[whiteBackdrop subviews] indexOfObject:[whiteBackdrop viewWithTag:998]];
    //互换两个视图索引在赞中的位置
	[whiteBackdrop exchangeSubviewAtIndex:purple withSubviewAtIndex:maroon];
    
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
	[UIView commitAnimations];
}

- (void) viewDidLoad
{
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Curl", @selector(curl:));
    
	// Set up the segmented control for picking the animation direction
	UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:[@"Down Up" componentsSeparatedByString:@" "]];
	seg.selectedSegmentIndex = 0;
	seg.segmentedControlStyle = UISegmentedControlStyleBar;
	self.navigationItem.titleView = seg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
