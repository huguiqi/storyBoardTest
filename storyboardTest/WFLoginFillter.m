//
//  WFLoginFillter.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 7/8/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import "WFLoginFillter.h"
#import "WFJJViewController.h"

@implementation WFLoginFillter



-(void)from:(WFJJViewController *)source to:(WFJJViewController *)destination
{
//    if([TheAppDelegate.userInfo checkIsLogin]){
//        [source.navigationController pushViewController:destination animated:YES];
//        return;
//    }
    //todo
    [source.loginViewWidgt showLoginView];
}

@end
