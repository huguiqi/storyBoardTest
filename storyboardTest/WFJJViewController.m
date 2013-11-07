//
//  WFJJViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/5/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "WFJJViewController.h"

@interface WFJJViewController ()

@end

@implementation WFJJViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.962 alpha:1.000];
    self.navigationItem.hidesBackButton = YES;
}


- (void)viewWillAppear:(BOOL)animated
{
   
    ((JJNavigationViewController *)self.navigationController).backDelegate = self;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [UMAnalyticManager monitorQuitViewPage:self.trackedViewName];
    [((JJNavigationViewController *)self.navigationController) restoreRightBarButton];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)showIndicatorView
{
    if (self.loadingIndicatorView == nil)
    {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        self.loadingIndicatorView = [board instantiateViewControllerWithIdentifier:@"LoadingIndicatorViewController"];
        [self.loadingIndicatorView.view setCenter:CGPointMake(self.view.center.x, 190)];
        [self.loadingIndicatorView startAnimating];
    }
    self.view.userInteractionEnabled = NO;
    [self.view addSubview:self.loadingIndicatorView.view];
}

- (void)hideIndicatorView
{
    self.view.userInteractionEnabled = YES;
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    [self.loadingIndicatorView stopAnimating];
    [self.loadingIndicatorView.view removeFromSuperview];
    self.loadingIndicatorView = nil;
}

- (void)downloadData
{
    
}

- (void)backHome:(id)sender
{
    [((JJNavigationViewController *)self.navigationController) restoreRightBarButton];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)backToController:(Class)className
{
    NSArray *viewControlelrs = self.navigationController.viewControllers;
    for (JJViewController *jjvc in viewControlelrs) {
        if ([jjvc isKindOfClass:className]) {
            
            [self.navigationController popToViewController:jjvc animated:YES];
            break;
        }
    }
}

- (void)parser:(GDataXMLParser *)parser DidFailedParseWithMsg:(NSString *)msg errCode:(NSInteger)code
{
    [self hideIndicatorView];
    if(code == -1 || code == 10000)
    {   [self showAlertMessageWithOkCancelButton:kNetworkProblemAlertMessage title:nil tag:0 delegate:self];    }
    else
    {   [self showAlertMessageWithOkButton:msg title:nil tag:0 delegate:nil];   }
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
