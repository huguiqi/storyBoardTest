//
//  FloatDemoViewController.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/7/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFJJViewController.h"
#import "FloatViewControl.h"

@interface FloatDemoViewController : WFJJViewController<FloatViewDelegate>

@property(nonatomic,weak) IBOutlet FloatViewControl *floatView;
@property(nonatomic,weak) IBOutlet UIButton *floatEffectBtn1;
@end
