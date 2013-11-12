//
//  FloatViewObj.m
//  JinJiangTravelPlus
//
//  Created by 胡 桂祁 on 11/11/13.
//  Copyright (c) 2013 JinJiang. All rights reserved.
//

#import "FloatViewObj.h"

@implementation FloatViewObj


-(id)initFloatObj:(FloatViewCode) code title:(NSString *)title  desc:(NSString *)desc selectNum:(NSString *)selectNum
{
    self = [super init];
    
    self.code = code;
    self.title = title;
    self.desc = desc;
    self.selectNum = selectNum;
    
    return self;
}
@end
