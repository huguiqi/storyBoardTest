//
//  CustomeSugue.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 5/20/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "CustomeSugue.h"
#import <QuartzCore/QuartzCore.h>
#import "IndexViewController.h"

@implementation CustomeSugue

- (void)perform
{
//    CATransition* transition = [CATransition animation];
//    transition.duration = 0.8;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromBottom;
//    [[self.sourceViewController navigationController].view.layer addAnimation:transition forKey:nil];
//    [[self.sourceViewController view] addSubview:[self.destinationViewController view]];
    
    
    IndexViewController *indexViewController = (IndexViewController *)self.sourceViewController;
    
    UIView *sourceView = indexViewController.topView;
    UIView *destinationView = [self.destinationViewController view];
    sourceView.frame = CGRectMake(0, -460, 320, 550);
    [sourceView addSubview:destinationView];
    
    [UIView animateWithDuration:0.8
                          delay:0.0
                        options:UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         sourceView.frame = CGRectMake(0, 0, 320, 550);
                     }
                     completion:^(BOOL finish){
                          [[self.sourceViewController navigationController] pushViewController:self.destinationViewController animated:NO];
                     }];





}

@end
