//
//  GidSliderViewController.m
//  storyboardTest
//
//  Created by sam on 15/9/21.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import "GidSliderViewController.h"

@interface GidSliderViewController ()

//-(IBAction)sliderDragBegin:(id)sender;

@end

@implementation GidSliderViewController

//{
//    double currentSlideValue;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImage *thumbImage = [UIImage imageNamed:@"外卖"];
//    [self.slider setThumbImage:thumbImage forState:UIControlStateHighlighted];
//    [self.slider setThumbImage:thumbImage forState:UIControlStateNormal];

}


//-(IBAction)sliderDragBegin:(id)sender{
//    if (self.slider.value >=5.0f && currentSlideValue < self.slider.value) {
//        [UIView animateWithDuration:0.8 animations:^(void){
//            UIImage *thumbImage = [UIImage imageNamed:@"货物"];
//            [self.slider setThumbImage:thumbImage forState:UIControlStateHighlighted];
//            [self.slider setThumbImage:thumbImage forState:UIControlStateNormal];
//            [self.slider setValue:10.0f animated:YES];
//        } completion:^(BOOL isFinish){
//           currentSlideValue = self.slider.value;
//        }];
//    }
//}
//
//-(IBAction)sliderDragEnd:(id)sender{
//
//    if (self.slider.value<= 5.0f) {
//        [UIView animateWithDuration:0.8 animations:^(void){
//            UIImage *thumbImage = [UIImage imageNamed:@"外卖"];
//            [self.slider setThumbImage:thumbImage forState:UIControlStateHighlighted];
//            [self.slider setThumbImage:thumbImage forState:UIControlStateNormal];
//            [self.slider setValue:0.0f animated:YES];
//        } completion:^(BOOL isFinish){
//            currentSlideValue = self.slider.value;
//        }];
//    }else if (self.slider.value> 5.0f &&self.slider.value < currentSlideValue) {
//        [UIView animateWithDuration:0.8 animations:^(void){
//            UIImage *thumbImage = [UIImage imageNamed:@"货物"];
//            [self.slider setThumbImage:thumbImage forState:UIControlStateHighlighted];
//            [self.slider setThumbImage:thumbImage forState:UIControlStateNormal];
//            [self.slider setValue:10.0f animated:YES];
//        } completion:^(BOOL isFinish){
//            currentSlideValue = self.slider.value;
//        }];
//    }
//}


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
