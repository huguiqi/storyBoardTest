//
//  Item2ViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-4-23.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "Item2ViewController.h"

@interface Item2ViewController ()

@end

@implementation Item2ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)blockTest1:(id)sender{
    NSLog(@"block是代码块，可以有返回值，在一个函数的参数里可以声明一个block,以下划线代替");
    NSNumber *secret = [NSNumber numberWithDouble:38.88];
    [self addUnaryOperation:@"formatDouble" witchExecutesBlock:^(double operand){
        return operand = [secret doubleValue];
    }];
}

-(IBAction)blockTest2:(id)sender
{
    NSLog(@"定义一个block的type");
    //typedef 返回值 (^blockName)(参数)
    typedef double (^unary_operation_t)(double op);
    unary_operation_t square;
    //用法
    square = ^(double op){
        return op * op;
    };
    double squareOfFive = square(5.0);
    NSLog(@"squareOfFive is %f",squareOfFive);
}

-(void)addUnaryOperation:(NSString*) operation witchExecutesBlock:_opBlock
{
    //目前来说，打印_opBlock出来的是一个block对象，想取出block里返回的值，则需要设定一个block类型的方式
    NSLog(@"addUnaryOperation is %@,operand is %@",operation,_opBlock);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
