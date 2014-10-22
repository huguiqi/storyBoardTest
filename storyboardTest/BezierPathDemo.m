//
//  BezierPathDemo.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 10/21/14.
//  Copyright (c) 2014 huguiqi. All rights reserved.
//

#import "BezierPathDemo.h"

@interface BezierPathDemo ()

@end

@implementation BezierPathDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBezierPath *bgPath = [UIBezierPath new];
//    [bgPath moveToPoint:CGPointMake(55, 0)];
    [bgPath addArcWithCenter:CGPointMake(65, 55) radius:55 startAngle:-M_PI_2 endAngle: 3*M_PI_2 clockwise:YES];
    
    CAShapeLayer *bgLayer = [CAShapeLayer new];
    bgLayer.frame = self.view.bounds;
    bgLayer.path = [bgPath CGPath];
    bgLayer.fillColor = [[UIColor redColor] CGColor];
    bgLayer.lineWidth = 0;
    [self.pathView.layer addSublayer:bgLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
