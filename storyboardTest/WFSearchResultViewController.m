//
//  WFSearchResultViewController.m
//  storyboardTest
//
//  Created by sam on 15/8/25.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import "WFSearchResultViewController.h"

@interface WFSearchResultViewController ()

@property (nonatomic,strong) UISearchDisplayController *displayController;

@end

@implementation WFSearchResultViewController


- (instancetype)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.displayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:viewController];
        self.displayController.searchResultsTableView.dataSource = self;
        self.displayController.searchResultsTableView.delegate = self;
        self.displayController.delegate = self;
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleIdentityStr = @"default value";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentityStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleIdentityStr];
    }
    NSInteger row = [indexPath row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-1", self.listData[row]];
    return cell;
}



- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {

    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    //过滤数据
    NSMutableArray *filterArray = [NSMutableArray arrayWithArray:[_listData filteredArrayUsingPredicate:preicate]];
    if (self.listData!= nil) {
        [self.listData removeAllObjects];
    }
    self.listData= filterArray;
    //刷新表格
    return YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
