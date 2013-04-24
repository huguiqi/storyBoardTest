//
//  WFCityListViewController.h
//  WolfShow
//
//  Created by huguiqi on 12-11-5.
//  Copyright (c) 2012年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFBarItemViewController.h"

@protocol CityListViewDelegate <NSObject>

-(void)noticePushBarController:(WFBarItemViewController *) barItemController;

@end

@interface WFCityListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,retain) NSArray *cityList;
@property(nonatomic,retain) NSArray *keys;

@property (nonatomic, retain) IBOutlet UITableView *cityTableView;

@property(nonatomic) id<CityListViewDelegate> cityDelegate;



@end
