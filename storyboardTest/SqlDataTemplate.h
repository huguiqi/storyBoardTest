//
//  SqlDataTemplate.h
//  storyboardTest
//
//  Created by huguiqi on 14-9-6.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountForm.h"

@interface SqlDataTemplate : NSObject


-(BOOL)insert:(id)model;
-(BOOL)save:(AccountForm *)form;
-(BOOL)update:(id)model;

-(NSObject *)select:(id)model;

-(NSArray *)loadAccountList;

@end
