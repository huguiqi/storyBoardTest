//
//  FloatViewObj.h
//  JinJiangTravelPlus
//
//  Created by 胡 桂祁 on 11/11/13.
//  Copyright (c) 2013 JinJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FloatViewObj : NSObject

typedef enum {
    PayTypeList = 0,
    NightNums
} FloatViewCode;

@property(nonatomic,assign) FloatViewCode code;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSString *selectNum;

-(id)initFloatObj:(FloatViewCode) code title:(NSString *)title  desc:(NSString *)desc selectNum:(NSString *)selectNum;

@end
