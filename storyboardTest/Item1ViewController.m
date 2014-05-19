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

#define kUMEnable false


@interface Item1ViewController ()

@property(nonatomic) NSMutableArray *cityArray;


@end

@implementation Item1ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initBackToIndexBtn];
    _cityArray = [[NSMutableArray alloc] initWithCapacity:3];
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
    
    NSLog(@"---days is %i",days);
}

-(IBAction)writeToUserDefaults:(id)sender
{
//    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithUser:@"xiaohei"];//one method
    [_cityArray addObject:@"aaaaa"];
    [_cityArray addObject:@"bbbb"];
//    [defaults setObject:cityArray forKey:@"recentThreeCities"];
    [[NSUserDefaults standardUserDefaults] setObject:_cityArray forKey:@"recentThreeCities2"];
    //synchronize Because this method is automatically invoked at periodic intervals, use this method only if you cannot wait for the automatic synchronization (for example, if your application is about to exit) or if you want to update the user defaults to what is on disk even though you have not made any changes.
//    [[NSUserDefaults standardUserDefaults] synchronize];
   
}

-(IBAction)readUserDefaults:(id)sender
{
//    NSUserDefaults *defaults2 = [[NSUserDefaults alloc] init];
    NSArray *array = [[NSUserDefaults standardUserDefaults] arrayForKey:@"recentThreeCities2"];
    NSLog(@"count is %i",[array count]);
//    NSArray *array = [defaults2 arrayForKey:@"recentThreeCities"];
    NSString *countStr =[NSString stringWithFormat:@"array count is %i",[array count]];
    NSLog(@"array count is %i",[array count]);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message: countStr delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma simple reverseArraySort
-(IBAction)rangeArray:(id)sender
{
    NSMutableArray *cityArray = [[NSMutableArray alloc] initWithCapacity:3];
    [cityArray addObject:@"aaaaa"];
    [cityArray addObject:@"bbbb"];
    [cityArray addObject:@"cccc"];
    [cityArray addObject:@"dddd"];
    NSArray *rangeArray = [cityArray subarrayWithRange:NSMakeRange(2, 2)];
   NSEnumerator *enumt = [rangeArray reverseObjectEnumerator];
    NSArray *tempArray = [enumt allObjects];
    NSLog(@"rangeArray count is %i",[rangeArray count]);
        NSLog(@"tempArray count is %i",[tempArray count]);
}

-(IBAction)testDefine:(id)sender{
    if (kUMEnable) {
        NSLog(@"kUmEnable is true");
    }else{
         NSLog(@"kUmEnable is false");
    }
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