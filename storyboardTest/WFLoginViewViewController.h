//
//  WFLoginViewViewController.h
//  WolfShow
//
//  Created by huguiqi on 12-10-28.
//  Copyright (c) 2012年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFCityListViewController.h"

@interface WFLoginViewViewController : UIViewController <CityListViewDelegate>
{
    CGPoint startLocation;
}

@property(nonatomic,retain) IBOutlet UITextField *userNameField;

@property(nonatomic,retain) IBOutlet UITextField *passwordFiled;

@property(nonatomic,retain) IBOutlet UITextField *ageFiled;

@property(nonatomic,retain) IBOutlet UISwitch *switchON;

@property(nonatomic,retain) IBOutlet UISwitch *switchOFF;

@property(nonatomic,retain) IBOutlet UIButton *buttonOK;

@property(nonatomic,retain) IBOutlet UIView *conditionView;

@property(nonatomic, strong) WFCityListViewController *cityListViewController;


-(IBAction)clickSomething:(id)sender;

-(IBAction)textFieldDoneEditing:(id)sender;

-(IBAction)backgroupTap:(id)sender;

-(IBAction)slideAgeChange:(id)sender;

-(IBAction)turnSwitchEvent:(id)sender;

-(IBAction)toggleController:(id)sender;

-(IBAction)toBarItemView:(id)sender;

  
@end
