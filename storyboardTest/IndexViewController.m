//
//  IndexViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-6-4.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "IndexViewController.h"
#import "MacAddress.h"
#import "UserDefaultHelper.h"

#define PLUS(x,y)      x+y

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

-(IBAction)testUserDefault:(id)sender
{
    static const NSInteger N_ENTRIES = 26;
    NSDictionary *asciiDict;
    NSString *keyArray[N_ENTRIES];
    NSNumber *valueArray[N_ENTRIES];
    NSInteger i;
    
    for (i = 0; i < N_ENTRIES; i++) {
        
        char charValue = 'a' + i;
        NSString *cstr = [NSString stringWithFormat:@"a%i",i ];
        keyArray[i] = cstr;
        valueArray[i] = [NSNumber numberWithChar:charValue];
    }
    
    asciiDict = [NSDictionary dictionaryWithObjects:(id *)valueArray
                                            forKeys:(id *)keyArray count:N_ENTRIES];
    [UserDefaultHelper writeToCache:[asciiDict mutableCopy] key:@"myDefaultTest"];
    
    NSMutableDictionary *testDefaultDict = [UserDefaultHelper readFromCache:@"myDefaultTest"];
    NSLog(@"----a0 is %@",[testDefaultDict objectForKey:@"a0"]);
    
}




-(WFBookingViewController *)bookingViewController
{
    if (!_bookingViewController) {
        _bookingViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"WFBookingViewController"];
    }
    return _bookingViewController;
}

-(IBAction)onTapTest:(id)sender{
    NSLog(@"UILabel 本身不支持手势，如果要加的话，必须设置它的userInteractionEnabled=YES ");
    
    [self performSegueWithIdentifier:SUGUE_INDEX_TO_SEARCH sender:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
