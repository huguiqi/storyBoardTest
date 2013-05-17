//
//  ShakeViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 5/8/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "ShakeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ShakeViewController ()

@end

@implementation ShakeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    NSLog(@"view height:%f",self.view.frame.size.height);
	// Do any additional setup after loading the view

}

- (BOOL)canBecomeFirstResponder
{
    return YES;

}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion == UIEventSubtypeMotionShake )
	{
         NSLog(@"I am shake !!!");
        [[self navigationController] setNavigationBarHidden:YES animated:YES];
        NSLog(@"hidden view height:%f",self.view.frame.size.height);
		// User was shaking the device. Post a notification named "shake".
//		[[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:self];
        AudioServicesPlaySystemSound(soundID);
        
        CATransform3D yellowTransform =self.button.layer.transform;
        
        CATransform3D transformRotated = CATransform3DRotate(yellowTransform, M_PI * -0.02, 0, 0, 1);
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionRepeat animations:^{
                        
                [UIView setAnimationRepeatCount:10];
        //        //        i = -i;
                self.button.layer.transform = CATransform3DRotate(transformRotated, M_PI * 0.04, 0, 0, 1);
            }completion:^(BOOL isFinished){
                self.button.layer.transform = yellowTransform;
                [[self navigationController] setNavigationBarHidden:NO animated:YES];
            }];
        
        
            
	}
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
