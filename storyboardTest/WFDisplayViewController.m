//
//  WFDisplayViewController.m
//  storyboardTest
//
//  Created by sam on 15/8/26.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import "WFDisplayViewController.h"

@interface WFDisplayViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic,weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray *listData;

@property (nonatomic,strong) UISearchDisplayController *searchController;


@end

@implementation WFDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *listData =
    [[NSMutableArray alloc] initWithObjects:@"上海", @"北京", @"深圳", @"长沙", @"昆明", @"厦门", @"南京", nil];
    self.listData = listData;
    self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchController.delegate = self;
    self.searchController.searchResultsDelegate = self;
    self.searchController.searchResultsDataSource = self;
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

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    //过滤数据
    NSMutableArray *filterArray = [NSMutableArray arrayWithArray:[_listData filteredArrayUsingPredicate:preicate]];
    if (self.listData!= nil) {
        [self.listData removeAllObjects];
    }
    self.listData= filterArray;
    //刷新表格
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
