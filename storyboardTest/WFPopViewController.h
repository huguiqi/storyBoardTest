//
//  WFPopViewController.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 7/16/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFPopViewController : UIViewController

@property (nonatomic,weak) IBOutlet UIView *regulaView;

@property (nonatomic,weak) IBOutlet UITextView *textView;


-(void)showItemView;

@end
