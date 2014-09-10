//
//  AccountCell.m
//  storyboardTest
//
//  Created by huguiqi on 14-9-10.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import "AccountCell.h"

@implementation AccountCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
