//
//  WFTableViewDemo1.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 1/23/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import "WFTableViewDemo1.h"

@interface WFTableViewDemo1 ()

@property(nonatomic, strong) NSArray *array;

@end

@implementation WFTableViewDemo1


- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [[NSArray alloc]
            initWithObjects:@"小黑", @"小白", @"小花", @"小二",@"aaa",@"cca",@"bbb",@"aaa",@"cca",@"bbb", nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"tableCellDemo1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    NSUInteger index = [indexPath row];
    [cell.textLabel setText:_array[index]];
    if(indexPath.row >5){
//        [tableView.tableFooterView addSubview:<#(UIView *)view#>];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
