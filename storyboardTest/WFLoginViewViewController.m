//
//  WFLoginViewViewController.m
//  WolfShow
//
//  Created by huguiqi on 12-10-28.
//  Copyright (c) 2012年 huguiqi. All rights reserved.
//


#import "WFLoginViewViewController.h"
#import "WFCityListViewController.h"
#import "WFBarItemViewController.h"
#import "DeviceInfo.h"


@interface WFLoginViewViewController ()

@end

@implementation WFLoginViewViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UISwipeGestureRecognizer *tapGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGR.direction = UISwipeGestureRecognizerDirectionRight;
//        tapGR.delegate = self.cityListViewController;
    self.cityListViewController.cityDelegate = self;
    [self.cityListViewController.view addGestureRecognizer:tapGR];
    
    }


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)noticePushBarController:(WFBarItemViewController *)barItemController{
    [self.navigationController pushViewController:barItemController animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(WFCityListViewController *) cityListViewController{
    if (!_cityListViewController) {
        _cityListViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"CityListViewController"];
        _cityListViewController.view.frame = CGRectMake(0, 0, 285, 460);
        ;
        self.conditionView = [[UIView alloc] initWithFrame:CGRectMake(320, 0.0, 285.0, 460.0)];
        [self.conditionView addSubview:self.cityListViewController.view];
        [self.view addSubview:self.conditionView];
    }
    return _cityListViewController;
}

- (IBAction)showCityListView:(id)sender {
    [UIView beginAnimations:@"showCityList" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.conditionView.frame = CGRectMake(35.0, 0.0, 285.0, 460.0);
    [UIView commitAnimations];
}

- (void)handleTap:(UISwipeGestureRecognizer *)swipeRecognizer {
    [UIView beginAnimations:@"showCityList" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.conditionView.frame = CGRectMake(320.0, 0.0, 285.0, 460.0);
    [UIView commitAnimations];
}


-(IBAction)toBarItemView:(id)sender{
    
    WFBarItemViewController *barItemViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"BarItemViewController"];
    [self.navigationController pushViewController:barItemViewController animated:YES];
}


-(IBAction)showNavigationBar:(id)sender
{
    if(self.navigationController.navigationBarHidden == YES){
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    
}

-(IBAction)toBookIng:(id)sender
{
    //做个通用登陆控件，通过重构将block调用封装进控件
//    [self.loginViewWidgt showLoginView:^(BOOL isFinised){
//        [self performSegueWithIdentifier:SUGUE_LIST_TO_BOOKING sender:nil];
//    }];
    [self.loginViewWidgt check:self segueTo:SUGUE_LIST_TO_BOOKING];
}

-(WFLoginWidgetViewController *)loginViewWidgt
{
    if (!_loginViewWidgt) {
        _loginViewWidgt = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"WFLoginWidgetViewController"];
        [_loginViewWidgt loadView];
        [_loginViewWidgt viewDidLoad];
    }
    return _loginViewWidgt;
}







@end
