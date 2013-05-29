//
//  AboutGeometryViewController.m
//  storyboardTest
//
//  Created by huguiqi on 13-5-29.
//  Copyright (c) 2013年 huguiqi. All rights reserved.
//

#import "AboutGeometryViewController.h"

@interface AboutGeometryViewController ()

@end

@implementation AboutGeometryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)testCGRect:(id)sender{
    //1,几何形状决定了屏幕上每个视图的大小，位置以及方向
    //2，每个视图使用frame定义其边界，轮廓，位置，宽度，高度，如果是用storyboard来定义其frame，则还包括自适应信息
    //3,frmae 包括CGPoint和CGSize,位置(原点位置)和大小
    //4,视图也使用transform属性设置方向和所应用的几何变形，框架和变形共同决定了视图的几何特征
    UIButton *button = (UIButton *)sender;
    //NSStringFromCGRect 此函数用来将CGRect的参数转成字符串形式，如果想将字符串形式还原为CGRect,则可用 CGRectFromString 函数
    NSLog(@"CGRect is %@",NSStringFromCGRect(button.frame));
    
    //5,CGRectInset 函数可以以源矩形的中心为中心，创建一个更大或较小的矩形(正数表示等比变小，负数表示等比变大)
    _testView.frame = CGRectInset(_testView.frame, 2, -2);
    NSLog(@"_testView CGRect is %@",NSStringFromCGRect(_testView.frame));
    //6,CGRectIntersection(<#CGRect r1#>, <#CGRect r2#>) 判断两个矩形结构是否相交，一般用此函数判断两个矩形是滞重叠
    if(!CGRectIntersectsRect(button.frame, _testView.frame)){
           NSLog(@"CGRectIntersection result is false");
    }
    //7,CGRectZero 矩形常量

}

#pragma --UIView.transform about
-(IBAction)testTransform:(id)sender{
    //1,iphone支持仿射变换(affine transformation)
    //todo
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
