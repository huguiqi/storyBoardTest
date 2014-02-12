//
//  WFAppDelegate.m
//  storyboardTest
//
//  Created by huguiqi on 12-11-11.
//  Copyright (c) 2012年 huguiqi. All rights reserved.
//

#import "WFAppDelegate.h"
#import "Constant.h"
#import "UMSocial.h"
#import "MobClick.h"

@interface WFAppDelegate ()

@property (nonatomic, unsafe_unretained) UIBackgroundTaskIdentifier backgroundTaskIdentifier;

@property (nonatomic, strong) NSTimer *myTimer;

@end

@implementation WFAppDelegate


- (BOOL) isMultitaskingSupported{
    BOOL result = NO;
    if ([[UIDevice currentDevice]
         respondsToSelector:@selector(isMultitaskingSupported)]){
        result = [[UIDevice currentDevice] isMultitaskingSupported];
    }
    return result;
}

- (void) timerMethod:(NSTimer *)paramSender{
    NSTimeInterval backgroundTimeRemaining = [[UIApplication sharedApplication] backgroundTimeRemaining];
    if (backgroundTimeRemaining == DBL_MAX){
        NSLog(@"Background Time Remaining = Undetermined");
    }else{
        NSLog(@"Background Time Remaining = %.02f Seconds",
              backgroundTimeRemaining);
    }
}

- (void) endBackgroundTask{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    __weak WFAppDelegate *weakSelf = self;
    dispatch_async(mainQueue, ^(void) {
        WFAppDelegate *strongSelf = weakSelf;
        if (strongSelf != nil){
            [strongSelf.myTimer invalidate];
            [[UIApplication sharedApplication]
            endBackgroundTask:self.backgroundTaskIdentifier];
            strongSelf.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    } });
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //打开调试log的开关
    [UMSocialData openLog:YES];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:kUMAppkey];
    
    //设置微信AppId
    [UMSocialConfig setWXAppId:@"wxd9a39c7122aa6516" url:nil];
    //打开Qzone的SSO开关
    [UMSocialConfig setSupportQzoneSSO:YES importClasses:@[[QQApiInterface class],[TencentOAuth class]]];
    //设置手机QQ的AppId，指定你的分享url，若传nil，将使用友盟的网址
    [UMSocialConfig setQQAppId:@"100424468" url:nil importClasses:@[[QQApiInterface class],[TencentOAuth class]]];
    //打开新浪微博的SSO开关
    [UMSocialConfig setSupportSinaSSO:YES];
    
    //使用友盟统计
    [MobClick startWithAppkey:kUMAppkey];
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    /* Time and timezone settings */
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:8.0];
    notification.timeZone = [[NSCalendar currentCalendar] timeZone];
    notification.alertBody =
    NSLocalizedString(@"A new item is downloaded.", nil);
    /* Action settings */
    notification.hasAction = YES;
    notification.alertAction = NSLocalizedString(@"View", nil);
    notification.soundName = UILocalNotificationDefaultSoundName;
    /* Badge settings */
    notification.applicationIconBadgeNumber =
    [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    /* Additional information, user info */
    notification.userInfo = @{@"Key 1" : @"Value 1",
                              @"Key 2" : @"Value 2"};
    /* Schedule the notification */
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"didBackgroud....");
    
    if ([self isMultitaskingSupported] == NO){
        return;
    }
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(timerMethod:) userInfo:nil
                                    repeats:YES];
    self.backgroundTaskIdentifier = [application beginBackgroundTaskWithExpirationHandler:^(void) {
        [self endBackgroundTask];
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"WillEnterForeground....");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"DidBecomeActive....");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"WillTerminate....");
}

@end
