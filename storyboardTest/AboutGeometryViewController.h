//
//  AboutGeometryViewController.h
//  storyboardTest
//
//  Created by huguiqi on 13-5-29.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutGeometryViewController : UIViewController

-(IBAction)testCGRect:(id)sender;

-(IBAction)testTransform:(id)sender;

@property(nonatomic,weak) IBOutlet UIView *testView;

@end
