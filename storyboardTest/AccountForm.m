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

@end
