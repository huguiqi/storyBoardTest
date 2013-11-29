//
//  WFScrollDemo2ViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/13/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFScrollDemo2ViewController.h"

@interface WFScrollDemo2ViewController ()
{
    CGRect scrollFrame;
}

@end

@implementation WFScrollDemo2ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.scrollView.contentSize = CGSizeMake(320, 480);
    scrollFrame = self.scrollView.frame;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
   
//    if (scrollView.contentOffset.y <-64.00f) {
//        self.scrollView.frame = CGRectMake(scrollFrame.origin.x, scrollFrame.origin.y - scrollView.contentOffset.y, scrollFrame.size.width, scrollFrame.size.height + scrollView.contentOffset.y);
//    }
    
//}

//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//     NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
//    
//     self.scrollView.frame = CGRectMake(scrollFrame.origin.x, scrollFrame.origin.y - scrollView.contentOffset.y, scrollFrame.size.width, scrollFrame.size.height);
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
