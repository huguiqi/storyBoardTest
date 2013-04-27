//
//  Item1ViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-4-6.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "Item1ViewController.h"
#import "FileManager.h"
#import "NSCalendar+NSCalendar_Category.h"


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
    [self initBackToIndexBtn];
}

-(void)initBackToIndexBtn
{
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    if (self.backToHomeBtn && self.backToHomeBtn.superview)
    {   [self.backToHomeBtn removeFromSuperview];
        [self.navigationItem setRightBarButtonItem:nil];
    }
    self.backToHomeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 30)];
    [self.backToHomeBtn setBackgroundImage:[UIImage imageNamed:@"topbar_btn.png"] forState:UIControlStateNormal];
    self.backToHomeBtn.titleLabel.text = @"确定";

    self.backToHomeBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.backToHomeBtn addTarget:self action:@selector(backToIndex) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backToHomeBtn];
    NSLog(@"aaaaaa%@",self.navigationItem.rightBarButtonItem);
}

-(IBAction)openBaiduWebView
{
    [self.webViewController loadRequest];
    [self.navigationController pushViewController:self.webViewController animated:YES];
}

-(void)backToIndex
{
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma --比较日期的天数，支持不同年代的天数返回
-(IBAction)compareDateDays:(id)sender
{
    NSString *testDateStr = [NSString stringWithFormat:@"2013-04-01"];
    NSString *testDateStr2 = [NSString stringWithFormat:@"2013-04-3"];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [df dateFromString:testDateStr];
    NSDate *endDate = [df dateFromString:testDateStr2];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger days = [gregorian daysFromDate:startDate toDate:endDate];

//    NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
//    
//    NSDateComponents *components = [gregorian components:unitFlags fromDate:startDate toDate:endDate options:0];
//    
//    NSInteger months = [components month];
//    NSInteger days = [components day];
    
    NSLog(@"---days is %i",days);
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