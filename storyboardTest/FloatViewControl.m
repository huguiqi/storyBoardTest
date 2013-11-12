//
//  FloatViewControl.m
//  JinJiangTravalPlus
//
//  Created by 胡 桂祁 on 11/8/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "FloatViewControl.h"
#import "FloatViewObj.h"

@implementation FloatViewControl


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(NSMutableArray *)elems
{
    if (!_elems) {
        _elems = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _elems;
}

-(IBAction)floatViewClick:(id)sender
{
    UIView *btn = (UIView *)sender;
    CGRect btnFrame = btn.frame;
    NSLog(@"btnFrame:%f-%f-%f-%f",btnFrame.origin.x,btnFrame.origin.y,btnFrame.size.width,btnFrame.size.height);
    if (self.tag == 0) {
        [UIView beginAnimations:@"floatEffectHidden1" context:nil];
        [UIView setAnimationDuration:0.5];
        self.hidden = NO;
        self.alpha = 0.5;
//        btnFrame.origin.x + self.frame.size.width/3
        self.frame = CGRectMake(self.frame.origin.x, (btnFrame.origin.y<1?10 + btnFrame.size.height:btnFrame.origin.y), self.frame.size.width, 0);
        self.alpha = 0.8;
        self.alpha = 1.0;
        self.frame = CGRectMake(self.frame.origin.x, (btnFrame.origin.y<1?10 + btnFrame.size.height:btnFrame.origin.y), self.frame.size.width, 120);
        [UIView commitAnimations];
        self.tag = 1000;
    }else{
        [UIView beginAnimations:@"floatEffectShow1" context:nil];
        [UIView setAnimationDuration:0.5];
        self.alpha = 1.0;
        self.frame = CGRectMake(self.frame.origin.x, (btnFrame.origin.y<1?10 + btnFrame.size.height:btnFrame.origin.y), self.frame.size.width, 120);
        self.frame = CGRectMake(self.frame.origin.x, (btnFrame.origin.y<1?10 + btnFrame.size.height:btnFrame.origin.y), self.frame.size.width, 0);
        self.alpha = 0.8;
        self.alpha = 0.1;
        [UIView commitAnimations];
        self.tag = 0;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_elems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    const unsigned int row = [indexPath row];
    const unsigned int oldRow = [self.lastIndexPath row];
    
    static NSString *cellIdentifier = @"FloatViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //cell背景色
    cell.backgroundColor = [UIColor clearColor];
    FloatViewObj *floatViewObj = [_elems objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",floatViewObj.title];
    
     cell.accessoryType = (row == oldRow && self.lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    FloatViewObj *floatViewObj = [_elems objectAtIndex:newRow];
    [self.floatViewDelegate selectRow:floatViewObj];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 5;
    self.tableView.layer.cornerRadius = 5;
    self.tableView.layer.shadowColor = [[UIColor yellowColor] CGColor];
    self.tableView.backgroundColor = [UIColor blueColor];
    self.tableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dashed_detail.png"]];
}


@end
