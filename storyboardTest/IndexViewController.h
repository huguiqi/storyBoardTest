//
//  IndexViewController.h
//  storyboardTest
//
//  Created by huguiqi on 13-6-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFLoginViewViewController.h"
#import "WFJJViewController.h"
#import "WFBookingViewController.h"

@interface IndexViewController : WFJJViewController

@property(nonatomic,weak) IBOutlet UIView *topView;

@property (nonatomic,strong) WFBookingViewController *bookingViewController;

-(IBAction)toBookIng:(id)sender;


@end
