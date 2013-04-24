//
//  Item1ViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-4-6.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "Item1ViewController.h"
#import "FileManager.h"

@interface Item1ViewController ()

@end

@implementation Item1ViewController

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

-(IBAction)openBaiduWebView
{
    [self.webViewController loadRequest];
    [self.navigationController pushViewController:self.webViewController animated:YES];
}

-(IBAction)writeCacheToFile
{
    NSLog(@"----writePassUrl To File......");
    NSString* path = [FileManager fileCachesPath:[NSString stringWithFormat: @"%@.passUrl",@"aaa"]];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSString *tempUrl = [url absoluteString];
//    NSString *tempUrl = [[NSString alloc] initWithString:[url absoluteString]];
    NSDictionary *sourceDict = [NSDictionary dictionaryWithObject:tempUrl forKey:@"aaa"];
    BOOL res = [sourceDict writeToFile:path atomically:YES];
    if (res == YES) {
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *temUrl = [dict objectForKey:@"aaa"];
    NSURL *passUrl = [[NSURL alloc] initWithString:temUrl];
    NSLog(@"passUrl is %@",passUrl);
}


-(WFWebViewDemo *) webViewController
{
    if (!_webViewController) {
        NSString *httpBodyString;
        httpBodyString = @"http://en.wikipedia.org/wiki/Friday_(Rebecca_Black_song)";
        _webViewController = [[WFWebViewDemo alloc] initWithUrl:httpBodyString];
        [_webViewController viewDidLoad];
    }

    return _webViewController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
