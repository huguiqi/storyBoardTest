//
//  WFScrollDemo2ViewController.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/13/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFJJViewController.h"

@interface WFScrollDemo2ViewController : WFJJViewController<UIScrollViewDelegate>

@property(nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic,weak) IBOutlet UIPageControl *pageControl;

@end
