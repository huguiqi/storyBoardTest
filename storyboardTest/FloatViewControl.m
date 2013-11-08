//
//  FloatViewControl.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/8/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "FloatViewControl.h"

@implementation FloatViewControl


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(IBAction)floatViewClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    CGRect btnFrame = btn.frame;
    NSLog(@"btnFrame:%f-%f-%f-%f",btnFrame.origin.x,btnFrame.origin.y,btnFrame.size.width,btnFrame.size.height);
    if (self.tag == 0) {
        [UIView beginAnimations:@"floatEffectHidden1" context:nil];
        [UIView setAnimationDuration:0.5];
        self.hidden = NO;
        self.alpha = 0.5;
        self.frame = CGRectMake(btnFrame.origin.x - 30, btnFrame.origin.y + btnFrame.size.height, self.frame.size.width, 0);
        self.alpha = 0.8;
        self.alpha = 1.0;
        self.frame = CGRectMake(btnFrame.origin.x - 30, btnFrame.origin.y + btnFrame.size.height, self.frame.size.width, 120);
        [UIView commitAnimations];
        self.tag = 1000;
    }else{
        [UIView beginAnimations:@"floatEffectShow1" context:nil];
        [UIView setAnimationDuration:0.5];
        self.alpha = 1.0;
        self.frame = CGRectMake(50, 161, 181, 120);
        self.frame = CGRectMake(50, 161, 181, 0);
        self.alpha = 0.8;
        self.alpha = 0.1;
        [UIView commitAnimations];
        self.tag = 0;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    const unsigned int row = [indexPath row];
    const unsigned int oldRow = [self.lastIndexPath row];
    
    static NSString *cellIdentifier = @"FloatViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"支付%i",indexPath.row];
    
     cell.accessoryType = (row == oldRow && self.lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell= [tableView cellForRowAtIndexPath:indexPath];
    
    const unsigned int newRow = [indexPath row];
    const unsigned int oldRow = (self.lastIndexPath != nil) ? [self.lastIndexPath row] : -1;
    if (newRow != oldRow)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        self.lastIndexPath = indexPath;
    }

    [self.floatViewDelegate selectRow:cell.textLabel.text];
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
