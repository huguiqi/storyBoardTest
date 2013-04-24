//
//  WFScrollViewDemo.m
//  storyboardTest
//
//  Created by huguiqi on 13-4-6.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "WFScrollViewDemo.h"

@interface WFScrollViewDemo ()

@end

@implementation WFScrollViewDemo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.scrollView.contentSize = CGSizeMake(320, 600);//滑动范围
//    self.scrollView.contentSize = self.view.bounds.size;滑动范围和view大小一致就没能滑动
    self.scrollView.minimumZoomScale = 0.5;//最小缩放值
    self.scrollView.maximumZoomScale = 2.0;//最大缩放值
    [self.scrollView setZoomScale:0.5 animated:YES];//每次缩放量为0.5个点
    [self.scrollView zoomToRect:CGRectMake(0, 5, 50, 50) animated:YES];//缩放的距形区域
    self.scrollView.delegate = self;
    UIImage *image = [UIImage imageNamed:@"IMG_1142.JPG"];
    [self.imageView setImage:image];
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
