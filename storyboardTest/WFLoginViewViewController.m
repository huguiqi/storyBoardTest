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

-(void)noticePushBarController:(WFBarItemViewController *)barItemController{
    [self.navigationController pushViewController:barItemController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@synthesize userNameField;
@synthesize passwordFiled;
@synthesize ageFiled;
@synthesize switchON;
@synthesize switchOFF;
@synthesize buttonOK;

- (IBAction)clickSomething:(id)sender {

    NSString *userName = [userNameField text];
    NSString *password = [passwordFiled text];
    NSLog(@"the userName is %@,and password is %@", userName, password);
}


- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}


- (IBAction)backgroupTap:(id)sender {
    //在非第一响应者的控件上调用第一响应者方法是绝对安全的
    [userNameField resignFirstResponder];
    [passwordFiled resignFirstResponder];
}

- (IBAction)slideAgeChange:(id)sender {
    //将响应者对象赋给定义的变量值
    UISlider *slider = (UISlider *) sender;
    int ageSender = (int) [slider value];
    int age = ageSender + 1;
    if (age > 100) {
        age = 100;
    }
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", age];
    ageFiled.text = newText;
}

- (IBAction)turnSwitchEvent:(id)sender {

    [self.navigationController popToViewController:self animated:YES];


}

- (IBAction)toggleController:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        switchON.hidden = NO;
        switchOFF.hidden = YES;
        buttonOK.hidden = NO;
    } else {
        switchON.hidden = YES;
        switchOFF.hidden = NO;
        buttonOK.hidden = YES;
    }

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



@end
