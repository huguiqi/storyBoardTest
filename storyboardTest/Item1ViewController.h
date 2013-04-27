//
//  Item1ViewController.h
//  storyboardTest
//
//  Created by huguiqi on 13-4-6.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFWebViewDemo.h"

@interface Item1ViewController : UIViewController

@property(nonatomic,strong) WFWebViewDemo *webViewController;

@property(nonatomic,strong) UIButton *backToHomeBtn;

-(IBAction)openBaiduWebView;
-(IBAction)writeCacheToFile;

@end
