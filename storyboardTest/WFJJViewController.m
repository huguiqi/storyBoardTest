//
//  WFJJViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/5/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFJJViewController.h"
#import "WFJJNavigationViewController.h"

@interface WFJJViewController ()

@end

@implementation WFJJViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}


- (void)viewWillAppear:(BOOL)animated
{
   
    ((WFJJNavigationViewController *)self.navigationController).backDelegate = self;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{

    [((WFJJNavigationViewController *)self.navigationController) restoreRightBarButton];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



- (void)downloadData
{
    
}

- (void)backHome:(id)sender
{
    [((WFJJNavigationViewController *)self.navigationController) restoreRightBarButton];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)backToController:(Class)className
{
    NSArray *viewControlelrs = self.navigationController.viewControllers;
    for (WFJJViewController *jjvc in viewControlelrs) {
        if ([jjvc isKindOfClass:className]) {
            
            [self.navigationController popToViewController:jjvc animated:YES];
            break;
        }
    }
}



#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag)
    {
        case 0:
        {
            if(buttonIndex == 1)
            {   [self downloadData];    }
            break;
        }
        default:
            break;
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1010-1666"]];
    }
}



@end
