//
//  Item2ViewController.h
//  storyboardTest
//
//  Created by huguiqi on 13-4-23.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Item2ViewController : UIViewController

-(IBAction)blockTest1:(id)sender;

-(IBAction)blockTest2:(id)sender;

-(IBAction)blockTest3:(id)sender;

-(IBAction)blockTestForQueue:(id)sender;

@property(nonatomic,retain)IBOutlet UILabel *blockLabel;

@end
