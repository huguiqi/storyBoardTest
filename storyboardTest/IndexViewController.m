//
//  IndexViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-6-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "IndexViewController.h"
#import "MacAddress.h"

@interface IndexViewController ()

-(IBAction)testMacAddress:sender;

@end

@implementation IndexViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)testMacAddress:sender
{
    NSLog(@"current macAddress:%@",[MacAddress currentAddress]);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"current address %@",[MacAddress currentAddress] ] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
