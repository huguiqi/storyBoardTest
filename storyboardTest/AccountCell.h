//
//  AccountCell.h
//  storyboardTest
//
//  Created by huguiqi on 14-9-10.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UILabel *passwordLabel;
@property (nonatomic,weak) IBOutlet UILabel *ageLabel;
@property (nonatomic,weak) IBOutlet UILabel *genderLabel;

@end
