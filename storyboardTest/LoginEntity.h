//
//  LoginEntity.h
//  storyboardTest
//
//  Created by huguiqi on 14-9-6.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoginEntity : NSManagedObject

@property (nonatomic, retain) NSString * loginName;
@property (nonatomic, retain) NSDate * lastLoginTime;
@property (nonatomic, retain) NSNumber * flag;

@end
