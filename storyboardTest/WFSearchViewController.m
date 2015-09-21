//
//  WFSearchViewController.m
//  storyboardTest
//
//  Created by sam on 15/8/25.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import "WFSearchViewController.h"
#import "WFSearchResultViewController.h"

@interface WFSearchViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>

@end

@implementation WFSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSMutableArray *listData =
            [[NSMutableArray alloc] initWithObjects:@"上海", @"北京", @"深圳", @"长沙", @"昆明", @"厦门", @"南京", nil];
    self.listData = listData;
    self.searchController = [[WFSearchResultViewController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchController.listData = [listData mutableCopy];
    self.searchBar.text = @"上海";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleIdentityStr = @"default value";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentityStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleIdentityStr];
    }
    NSInteger row = [indexPath row];
    cell.textLabel.text = self.listData[row];
    return cell;
}




@end
