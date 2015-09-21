//
//  WFSearchViewController.h
//  storyboardTest
//
//  Created by sam on 15/8/25.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WFCityListViewController.h"

@class WFSearchResultViewController;

@interface WFSearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listData;

@property (nonatomic,strong) WFSearchResultViewController *searchController;

@end
