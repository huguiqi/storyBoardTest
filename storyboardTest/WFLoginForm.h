//
//  WFLoginForm.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 2/12/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSetLoginFormNotification @"SetLoginFormNotification"
#define kSetUserNameKey @"userName"
#define kSetPasswordKey @"password"
#define kSetAgeKey @"age"

@interface WFLoginForm : NSObject

@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *password;
@property(nonatomic,assign) NSUInteger age;



@end
