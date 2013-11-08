//
//  FloatViewControl.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/8/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FloatViewDelegate <NSObject>

-(void)selectRow:(NSString *)text;

@end

@interface FloatViewControl : UIControl<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak) id<FloatViewDelegate> floatViewDelegate;

@property (nonatomic,strong) NSIndexPath *lastIndexPath;


-(IBAction)floatViewClick:(id)sender;

@end
