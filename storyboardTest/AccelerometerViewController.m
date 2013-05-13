//
//  AccelerometerViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 5/6/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "AccelerometerViewController.h"
#import "AccelerometerFilter.h"

@interface AccelerometerViewController ()

@property(nonatomic,strong) LowpassFilter *accelerFilter;

@end

@implementation AccelerometerViewController


@synthesize accelerFilter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!accelerFilter) {
        accelerFilter = [[LowpassFilter alloc]  initWithSampleRate:kUpdateFrequency cutoffFrequency:5.0];
    }
    
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / kUpdateFrequency];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
    
 
}

// UIAccelerometerDelegate method, called when the device accelerates.
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	// Update the accelerometer graph view
		[accelerFilter addAcceleration:acceleration];
    NSLog(@"filter x,y,z is %f,%f,%f",accelerFilter.x,accelerFilter.y,accelerFilter.z);
    if (accelerFilter.x>0.8f) {
        NSLog(@"aaaaaaaaaaaa");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"摇妹妹" delegate:nil cancelButtonTitle:@"要了" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
