//
//  AccountListView.m
//  storyboardTest
//
//  Created by huguiqi on 14-9-10.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import "AccountListView.h"
#import "AccountCell.h"
#import "AccountEntity.h"

@implementation AccountListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.accountArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"AccountCell";
    AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[AccountCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSInteger currentRow = indexPath.row;
    AccountEntity *entity = [self.accountArray objectAtIndex:currentRow];
    cell.nameLabel.text = entity.userName;
    cell.passwordLabel.text = entity.password;
    cell.ageLabel.text = [NSString stringWithFormat:@"%@",entity.age];
    cell.genderLabel.text = currentRow%2==0? @"男":@"女";
    NSLog(@"logingName:%@",entity.loginEntity.loginName);
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
