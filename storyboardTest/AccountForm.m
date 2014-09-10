//
//  AccountForm.m
//  storyboardTest
//
//  Created by huguiqi on 14-2-17.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import "AccountForm.h"

@implementation AccountForm


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if ([keyPath isEqual:@"userName"]) {
        
        self.name= [change objectForKey:NSKeyValueChangeNewKey];
    }
}

-(AccountEntity *)buildEntity
{
    AccountEntity *entity = [[AccountEntity alloc] init];
    [entity setUserName:self.name];
    [entity setPassword:self.password];
    [entity setAge:self.age];
    [entity setGender:self.gender];
    return entity;
}

@end
