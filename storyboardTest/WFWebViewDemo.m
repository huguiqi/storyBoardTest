//
//  WFWebViewDemo.m
//  storyboardTest
//
//  Created by huguiqi on 13-3-14.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "WFWebViewDemo.h"

@interface WFWebViewDemo ()

@end

@implementation WFWebViewDemo

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id)initWithUrl:(NSString *) urlStr
{
    self = [super init];
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    self.url = urlStr;
    return self;
}

-(void)loadRequest
{

        NSURL *URL = [NSURL URLWithString:[self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLCacheStorageAllowedInMemoryOnly timeoutInterval:10];
        [self.webView loadRequest:request];
        self.view = self.webView;
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = theTitle;
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"====webViewDidStartLoad====");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = theTitle;
    
    NSString *theURL=[webView stringByEvaluatingJavaScriptFromString:@"document.URL"];
    NSLog(@"--------callBackUrl:%@",theURL);
    
}



- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{


}


@end
