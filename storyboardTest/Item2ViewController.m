//
//  Item2ViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-4-23.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "Item2ViewController.h"

@interface Item2ViewController ()

@property(nonatomic,strong) NSMutableArray *blocks;

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

-(IBAction)blockTest3:(id)sender
{
    //解决内存泄露的办法
    __weak Item2ViewController *weakSelf = self;
    _blocks = [[NSMutableArray alloc] initWithCapacity:5];
    [_blocks addObject:^{
       // [self blockTest3Operation];//这里在block里引用self 会出现一个强指针周期问题(由于Array 是强指针，而block里也引用的强指针，如果有任何一个离开了当前的堆内存，则会导致内存泄露)
       //解决内存泄露的办法
        [weakSelf blockTest3Operation];
    }];

}

#pragma --blockTestForQueue block的多线程用法
-(IBAction)blockTestForQueue:(id)sender
{
//    [self asyncQueue];//异步
    [self syncQueue];//同步
}

-(void)asyncQueue
{
    //把block放到队列里去执行
    dispatch_queue_t blockQueue =  dispatch_queue_create("block_queue_test", NULL);
    //异步
    dispatch_async(blockQueue, ^(void){
        NSLog(@"the block_queue block gone----");
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //把这块要执行的代码块放到主线程里去执行，一般用于在非主线程的block块里没法执行的代码放到主线程
            self.blockLabel.text = @"main_queue";
            NSLog(@"the main queue gone---");
        });
        NSLog(@"the block_queue block finish----");
    });
    NSLog(@"blockTestForQueue gone---");
}

-(void)syncQueue
{
    //把block放到队列里去执行
    dispatch_queue_t blockQueue =  dispatch_queue_create("block_queue_test", NULL);
    dispatch_async(blockQueue, ^(void){
        NSLog(@"the block_queue block gone----");
        //同步
        dispatch_sync(dispatch_get_main_queue(), ^(void){
            //把这块要执行的代码块放到主线程里去执行，一般用于在非主线程的block块里没法执行的代码放到主线程
            self.blockLabel.text = @"main_queue";
            NSLog(@"the main queue gone---");
        });
        NSLog(@"the block_queue block finish----");
    });
    NSLog(@"blockTestForQueue gone---");
}

-(void)blockTest3Operation
{
    NSLog(@"blockTest3Operation");
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
