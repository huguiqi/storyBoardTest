//
//  AccountEntity.h
//  storyboardTest
//
//  Created by huguiqi on 14-9-6.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginEntity.h"

@interface AccountEntity : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) LoginEntity *loginEntity;

@end
