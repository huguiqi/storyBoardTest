//
//  WFScrollDemo2ViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/13/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFScrollDemo2ViewController.h"

@interface WFScrollDemo2ViewController ()

@end

@implementation WFScrollDemo2ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.scrollView.contentSize = CGSizeMake(150*2, 80);

}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
   
//    if (scrollView.contentOffset.y <-64.00f) {
//        self.scrollView.frame = CGRectMake(scrollFrame.origin.x, scrollFrame.origin.y - scrollView.contentOffset.y, scrollFrame.size.width, scrollFrame.size.height + scrollView.contentOffset.y);
//    }
    
//}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint contentOffset = scrollView.contentOffset;
    NSLog(@"ContentOffset  x is  %f,yis %f",contentOffset.x,contentOffset.y);
    CGRect bounts = scrollView.bounds;
    [self.pageControl setCurrentPage:contentOffset.x/bounts.size.width];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
