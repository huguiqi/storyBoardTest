//
//  ShakeViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 5/8/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "ShakeViewController.h"

@interface ShakeViewController ()

@end

@implementation ShakeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
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
		// User was shaking the device. Post a notification named "shake".
//		[[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:self];
        AudioServicesPlaySystemSound(soundID);
	}
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
//    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionRepeat animations:^{
//        //        ((FADViewController *)self.sourceViewController).view.alpha = 0.0;
//        [UIView setAnimationRepeatCount:10];
//        //        i = -i;
//        ((FADViewController *)self.sourceViewController).yellowButton.layer.transform = CATransform3DRotate(transformRotated, M_PI * 0.04, 0, 0, 1);
//    }completion:^(BOOL isFinished){
//        
//    }];
//   
//    
//    CATransform3D transformRotated = CATransform3DRotate(yellowTransform, M_PI * -0.02, 0, 0, 1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
