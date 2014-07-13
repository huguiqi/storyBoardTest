//
//  WFLoginWidgetViewController.h
//  storyboardTest
//
//  Created by huguiqi on 14-7-13.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFLoginForm.h"
#import "WFJJViewController.h"

@interface WFLoginWidgetViewController :WFJJViewController<UITextFieldDelegate>

@property (nonatomic,strong) IBOutlet UIControl *loginMainView;

@property(nonatomic,retain) IBOutlet UITextField *userNameField;

@property(nonatomic,retain) IBOutlet UITextField *passwordFiled;

@property(nonatomic,retain) IBOutlet UITextField *ageFiled;

@property(nonatomic,retain) IBOutlet UISwitch *switchON;

@property(nonatomic,retain) IBOutlet UISwitch *switchOFF;

@property(nonatomic,strong) WFLoginForm *loginForm;

@property(nonatomic,retain) IBOutlet UIButton *buttonOK;

@property(nonatomic,strong) void(^callback) (BOOL isFinished);


-(void)showLoginView:(void (^)(BOOL isFinished))callback;

-(void)check:(WFJJViewController *)from segueTo:(NSString *)segue;

@end
