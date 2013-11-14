//
//  WFScrollViewDemo.h
//  storyboardTest
//
//  Created by huguiqi on 13-4-6.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFJJViewController.h"

@interface WFScrollViewDemo : WFJJViewController<UIScrollViewDelegate>

@property (nonatomic,weak) IBOutlet UIImageView *imageView;
@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;

@end
