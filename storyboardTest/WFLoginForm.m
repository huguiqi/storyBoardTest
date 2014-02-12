//
//  WFLoginForm.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 2/12/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import "WFLoginForm.h"



@implementation WFLoginForm

-(instancetype)init{
    
    self = [super init];
    if (self != nil){
        //监听注册的SetLoginFormNotification通知
         NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(handleSetLoginFormNotification:) name:kSetLoginFormNotification
                     object:nil];
        }
         return self;
}
         
         
-(void)handleSetLoginFormNotification:(NSNotification *)paramNotification
{
    self.userName = [paramNotification.userInfo valueForKey:kSetUserNameKey];
    self.password = paramNotification.userInfo[kSetPasswordKey];
    self.age = [paramNotification.userInfo[kSetAgeKey] integerValue];
}

-(void)dealloc
{
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
