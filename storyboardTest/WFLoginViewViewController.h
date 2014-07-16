//
//  WFLoginViewViewController.h
//  WolfShow
//
//  Created by huguiqi on 12-10-28.
//  Copyright (c) 2012年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFCityListViewController.h"
#import "WFLoginWidgetViewController.h"
#import "WFJJViewController.h"
#import "WFPopViewController.h"

@interface WFLoginViewViewController : WFJJViewController <CityListViewDelegate>
{
    CGPoint startLocation;
}

@property(nonatomic,retain) IBOutlet UIView *conditionView;

@property(nonatomic, strong) WFCityListViewController *cityListViewController;

@property (nonatomic,strong) WFLoginWidgetViewController *loginViewWidgt;

@property (nonatomic,strong) WFPopViewController *popViewController;



-(IBAction)toBarItemView:(id)sender;

-(IBAction)showNavigationBar:(id)sender;

  
@end
