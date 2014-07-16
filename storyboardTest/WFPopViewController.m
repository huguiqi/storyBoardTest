//
//  WFPopViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 7/16/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import "WFPopViewController.h"

@interface WFPopViewController ()

@end

@implementation WFPopViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.regulaView.frame = CGRectOffset(self.regulaView.frame, 0, 640);
    
//    CALayer *subLayer = [CALayer layer];
//    subLayer.backgroundColor = [UIColor whiteColor].CGColor;
//    subLayer.shadowOffset = CGSizeMake(0, 1);
//    subLayer.shadowRadius = 5.0;
//    subLayer.shadowColor = [UIColor blackColor].CGColor;
//    subLayer.shadowOpacity = 0.8;
//    subLayer.frame = CGRectMake(0, 0, 280, 370);
//    subLayer.cornerRadius = 10;
//    subLayer.borderWidth = 0;
//    [self.regulaView.layer addSublayer:subLayer];
    
    [self.regulaView.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.regulaView.layer setShadowOffset:CGSizeMake(0, 1)];
    [self.regulaView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.regulaView.layer setShadowOpacity:0.8];
    [self.regulaView.layer setCornerRadius:10];
    [self.regulaView.layer setBorderWidth:0];
}

-(void)showItemView
{
    [UIView animateWithDuration:0.3 animations:^(void){
        self.regulaView.frame = CGRectOffset(self.regulaView.frame, 0, -640);
    } completion:^(BOOL isFinished){
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
