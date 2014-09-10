//
//  AccountListView.h
//  storyboardTest
//
//  Created by huguiqi on 14-9-10.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountListView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *accountTable;

@property (nonatomic,strong) NSArray *accountArray;

@end
