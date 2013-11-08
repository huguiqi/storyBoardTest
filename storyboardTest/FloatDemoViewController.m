//
//  FloatDemoViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/7/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "FloatDemoViewController.h"

@interface FloatDemoViewController ()

@end

@implementation FloatDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.floatView.floatViewDelegate = self;
	// Do any additional setup after loading the view.
}

-(IBAction)floatEffect1:(id)sender
{
//    [UIView animateWithDuration:0.1 animations:^(void){
//        
//    }];
//    [self.floatView floatViewClick:self.floatEffectBtn1];
//    if (self.floatView.tag == 0) {
//        [UIView beginAnimations:@"floatEffectHidden1" context:nil];
//        [UIView setAnimationDuration:0.5];
//        self.floatView.hidden = NO;
//        self.floatView.alpha = 0.5;
//        self.floatView.frame = CGRectMake(50, 161, 181, 0);
//        self.floatView.alpha = 0.8;
//        self.floatView.alpha = 1.0;
//        self.floatView.frame = CGRectMake(50, 161, 181, 120);
//        [UIView commitAnimations];
//        self.floatView.tag = 1000;
//    }else{
//        [UIView beginAnimations:@"floatEffectShow1" context:nil];
//        [UIView setAnimationDuration:0.5];
//        self.floatView.alpha = 1.0;
//        self.floatView.frame = CGRectMake(50, 161, 181, 120);
//        self.floatView.frame = CGRectMake(50, 161, 181, 0);
//        self.floatView.alpha = 0.8;
//        self.floatView.alpha = 0.1;
//        [UIView commitAnimations];
//        self.floatView.tag = 0;
//    }
    
}

-(void)selectRow:(NSString *)text
{
    NSLog(@"您选择的是:%@",text);
    [self.floatView floatViewClick:self.floatEffectBtn1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
