//
//  WFWebViewDemo.h
//  storyboardTest
//
//  Created by huguiqi on 13-3-14.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFWebViewDemo : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,copy) NSString *url;

-(IBAction)openBaiduWebView;

-(id)initWithUrl:(NSString *) urlStr;
-(void)loadRequest;

@end
