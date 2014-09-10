//
//  AccountForm.h
//  storyboardTest
//
//  Created by huguiqi on 14-2-17.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountEntity.h"

@interface AccountForm : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *password;
@property(nonatomic,copy) NSNumber *age;
@property(nonatomic,copy) NSNumber *gender;
@property(nonatomic,copy) NSString *desc;

-(AccountEntity *)buildEntity;

@end
