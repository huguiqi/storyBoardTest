//
//  WFSearchResultViewController.h
//  storyboardTest
//
//  Created by sam on 15/8/25.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFSearchResultViewController : NSObject<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic, strong) NSMutableArray *listData;

- (instancetype)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController;
@end
