//
//  WFScrollViewDemo.h
//  storyboardTest
//
//  Created by huguiqi on 13-4-6.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFScrollViewDemo : UIViewController<UIScrollViewDelegate>

@property (nonatomic,weak) IBOutlet UIImageView *imageView;
@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;

@end
