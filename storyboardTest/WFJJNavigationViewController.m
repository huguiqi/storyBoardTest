//
//  WFJJViewViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/5/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFJJNavigationViewController.h"
#import "DeviceInfo.h"

@interface WFJJNavigationViewController ()

@end

@implementation WFJJNavigationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    if ([DeviceInfo systemVersion]<7.0f) {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg.png"]];
    }else{
        [self setNeedsStatusBarAppearanceUpdate];
    }
    [self generateLeftBtn:@"hotel-topbar-back.png"];
    [self addLeftBarButton];
    [self generateRightBtn:@"hotel-topbar-phone.png"];
    [self addRightBarButton];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)addLeftBarButton
{
    [self.navigationBar addSubview:self.leftBtn];
}

-(void)generateLeftBtn :(NSString *) imageName
{
    //add left back button
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    [backButton addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0, 0, 48, 44);
    backButton.tag = 100;
    self.leftBtn = backButton;
}

-(void)generateRightBtn:(NSString *)imageName
{
    UIButton* telphoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [telphoneBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [telphoneBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [telphoneBtn setShowsTouchWhenHighlighted:YES];
    [telphoneBtn addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    telphoneBtn.frame = CGRectMake(270, 0, 40, 44);
    [telphoneBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    telphoneBtn.tag = 101;
    self.rightBtn = telphoneBtn;
}

- (void)addRightBarButton
{
    [self.navigationBar addSubview:self.rightBtn];
}

-(void)addCustomRightBarButton: (id)target imageName:(NSString *)imageName selector:(SEL)action{
    [self.rightBtn setImage:nil forState:UIControlStateNormal || UIControlStateHighlighted ];
    [self.rightBtn setTitle:nil forState:UIControlStateNormal];
    [self.rightBtn setTitle:nil forState:UIControlStateHighlighted];
    [self.rightBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [self.rightBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [self.rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

-(void)addCustomLeftBarButton: (id)target imageName:(NSString *)imageName selector:(SEL)action
{
    [self.leftBtn setImage:nil forState:UIControlStateNormal || UIControlStateHighlighted ];
    [self.leftBtn setTitle:nil forState:UIControlStateNormal];
    [self.leftBtn setTitle:nil forState:UIControlStateHighlighted];
    [self.leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [self.leftBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [self.leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

-(void)addTitleRightBarButton:(id)target selector:(SEL)action title:(NSString *) title
{
    [self.rightBtn setImage:nil forState:UIControlStateNormal];
    [self.rightBtn setImage:nil forState:UIControlStateHighlighted];
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    [self.rightBtn setTitle:title forState:UIControlStateHighlighted];
    [self.rightBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
    self.rightBtn.frame = CGRectMake(260, 0, 50, 44);
    [self.rightBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [self.rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

-(void)restoreRightBarButton
{
    [self.rightBtn setImage:nil forState:UIControlStateNormal || UIControlStateHighlighted ];
    [self.rightBtn setTitle:nil forState:UIControlStateNormal || UIControlStateHighlighted];
    [self.rightBtn setImage:[UIImage imageNamed:@"hotel-topbar-phone.png"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"hotel-topbar-phone.png"] forState:UIControlStateHighlighted];
    self.rightBtn.frame = CGRectMake(270, 0, 40, 44);
    [self.rightBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.rightBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [self.rightBtn addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backHome:(id)sender
{
    [self restoreRightBarButton];
    [self.backDelegate back];
}

- (void)call
{
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"电话预订" delegate:self cancelButtonTitle:@"取消"
                                        destructiveButtonTitle:nil otherButtonTitles:@"1010-1666", nil];
    [menu setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [menu setAlpha:1.0f];
    [menu showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
