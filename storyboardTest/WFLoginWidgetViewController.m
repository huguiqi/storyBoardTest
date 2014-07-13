//
//  WFLoginWidgetViewController.m
//  storyboardTest
//
//  Created by huguiqi on 14-7-13.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import "WFLoginWidgetViewController.h"
#import "AccountForm.h"
#import "DeviceInfo.h"


#define TAG_LOGINVIEW   102

@interface WFLoginWidgetViewController ()
{
    BOOL isHidden;
    UIColor *keyboardColor;
}

@property(nonatomic,strong) AccountForm *accountForm;



@end

@implementation WFLoginWidgetViewController


@synthesize userNameField;
@synthesize passwordFiled;
@synthesize ageFiled;
@synthesize switchON;
@synthesize switchOFF;
@synthesize buttonOK;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //a way of  custom keyboardWindow
    passwordFiled.delegate = self;
    keyboardColor = [DeviceInfo systemVersion]<7.0?[UIColor colorWithRed:0.3725 green:0.4000 blue:0.4510 alpha:1]:[UIColor whiteColor];
    
    //Listening for and Reacting to Notifications
    //    self.loginForm = [[WFLoginForm alloc] init];
    self.loginForm = [WFLoginForm new];
    _accountForm = [[AccountForm alloc] init];
    
    [_loginForm addObserver:_accountForm
                 forKeyPath:@"userName"
                    options:(NSKeyValueObservingOptionNew)
                    context:NULL];
    
    self.view.frame = CGRectOffset(self.view.frame, -320, 0);
    
}

//buttonOk event
- (IBAction)postNotification:(id)sender {
    
    //    //发送通知给监听器告诉它值已改变，监听器便会重新设置新的form值(此场景只使用彼此没有互相引用的情况下，不在同一块的对象代码互相通信)
    //    NSNotification *notification =
    //    [NSNotification
    //     notificationWithName:kSetLoginFormNotification
    //     object:nil
    //     userInfo:@{kSetUserNameKey : self.userNameField.text,
    //                kSetPasswordKey : self.passwordFiled.text,
    //                kSetAgeKey : self.ageFiled.text}];
    //
    //    [[NSNotificationCenter defaultCenter] postNotification:notification];
    //
    //    NSLog(@"the userName is %@,and password is %@, age is %i", self.loginForm.userName, self.loginForm.password,self.loginForm.age);
    
    @try{
        [_loginForm setUserName:self.userNameField.text];
        _loginForm.password = self.passwordFiled.text;
        //        _loginForm.age = [self.ageFiled.text integerValue];
    }
    @catch(NSException *exception) {
        NSLog(@"exception:%@", exception);
    }
    @finally {
        
    }
    
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
    [self willChangeValueForKey:@"@ageFeild.text"];
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


-(IBAction)closeLoginView:(id)sender{
    [self closeLoginViewHandller:NO];
}

-(IBAction)clickLogin:(id)sender
{
    //request netWork to login
    [self closeLoginViewHandller:YES];
}

-(void)closeLoginViewHandller:(BOOL) callBack
{
    if (callBack) {
        [UIView animateWithDuration:0.5 animations:^(void){
            self.view.frame = CGRectOffset(self.view.frame, -320, 0);
        } completion:self.callback];
    }else{
        [UIView animateWithDuration:0.5 animations:^(void){
            self.view.frame = CGRectOffset(self.view.frame, -320, 0);
        } completion:^(BOOL isFinished){
            [self removeLoginWidgetFromWindow];
        }];
    }
}


-(void)showLoginView:(void(^)(BOOL isFinished))callback
{
    [[TheAppDelegate window] addSubview:self.view];
    [UIView animateWithDuration:0.5 animations:^(void){
        self.view.frame = CGRectOffset(self.view.frame, 320, 0);
    } completion:^(BOOL isFinished){
        self.callback = callback;
    }];
}


-(void)removeLoginWidgetFromWindow
{
    for(UIView *view in [[TheAppDelegate window] subviews]){
        if (TAG_LOGINVIEW == view.tag) {
            [view removeFromSuperview];
            break;
        }
    }
}

-(void)check:(WFJJViewController *)from segueTo:(NSString *)segue{

    if(NO){
        [from performSegueWithIdentifier:segue sender:nil];
    }else{
        //^(BOOL isFinished){}与^(BOOL isFinished)callback{}写法都可以
        [self showLoginView:^(BOOL isFinished){
            [self removeLoginWidgetFromWindow];
            [from performSegueWithIdentifier:segue sender:nil];
        }];
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self performSelector:@selector(addDoneButtonToKeyboard) withObject:nil afterDelay:0.1];
}

#pragma keyboard custom
- (void)addDoneButtonToKeyboard {
    // create custom button
	UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.tag=8;
	doneButton.frame = CGRectMake(0, 0, 106, 53);
	doneButton.adjustsImageWhenHighlighted = NO;
	[doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [doneButton setImage:nimg forState:UIControlStateNormal];
    //    [doneButton setImage:himg forState:UIControlStateHighlighted];
    
	[doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [doneButton addTarget:self action:@selector(doneDown:) forControlEvents:UIControlEventTouchDown];
    
	// locate keyboard view
    int cnt=[[UIApplication sharedApplication] windows].count;
	UIWindow* keyboardWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:cnt-1];
    doneButton.frame = CGRectMake(0, keyboardWindow.frame.size.height-53, 106, 53);
    [keyboardWindow addSubview:doneButton];
    
    NSLog(@"keyboard:%@ %@ %@",NSStringFromCGRect(keyboardWindow.frame),NSStringFromCGRect(doneButton.frame),keyboardWindow.subviews);
}


-(void)resetDoneDownBg:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [button setBackgroundColor:[UIColor clearColor]];
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [self removeButtonFromKeyboard];
}

- (void) done:(id)sender
{
    [passwordFiled resignFirstResponder];
}

-(void)doneDown:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [button setBackgroundColor:keyboardColor];
    [self performSelector:@selector(resetDoneDownBg:) withObject:button afterDelay:0.5];
}

- (void)removeButtonFromKeyboard {
    // locate keyboard view
    int cnt=[[UIApplication sharedApplication] windows].count;
	UIWindow* keyboardWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:cnt-1];
    [[keyboardWindow viewWithTag:8] removeFromSuperview];
}

-(void)dealloc
{
    [_loginForm removeObserver:_accountForm forKeyPath:@"userName"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
