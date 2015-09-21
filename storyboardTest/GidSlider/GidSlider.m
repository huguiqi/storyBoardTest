//
//  GidSlider.m
//  storyboardTest
//
//  Created by sam on 15/9/21.
//  Copyright (c) 2015年 huguiqi. All rights reserved.
//

#import "GidSlider.h"

@implementation GidSlider
{
    double currentSlideValue;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect {
    
    UIImage *thumbImage = [UIImage imageNamed:@"外卖"];
    [self setThumbImage:thumbImage forState:UIControlStateHighlighted];
    [self setThumbImage:thumbImage forState:UIControlStateNormal];
    UIImageView *unSelectImg = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"未选"]];
    [unSelectImg setFrame:CGRectMake(rect.origin.x + rect.size.width, rect.origin.y, 30, 30)];
    [self addSubview:unSelectImg];
    [self addTarget:self action:@selector(sliderDragBegin) forControlEvents:UIControlEventValueChanged];
    
    [self addTarget:self action:@selector(sliderDragEnd) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)sliderDragBegin{
    if (self.value >=5.0f && currentSlideValue < self.value) {
        [UIView animateWithDuration:0.8 animations:^(void){
            UIImage *thumbImage = [UIImage imageNamed:@"货物"];
            [self setThumbImage:thumbImage forState:UIControlStateHighlighted];
            [self setThumbImage:thumbImage forState:UIControlStateNormal];
            [self setValue:10.0f animated:YES];
        } completion:^(BOOL isFinish){
            currentSlideValue = self.value;
        }];
    }
}

-(void)sliderDragEnd{
    
    if (self.value<= 5.0f) {
        [UIView animateWithDuration:0.8 animations:^(void){
            UIImage *thumbImage = [UIImage imageNamed:@"外卖"];
            [self setThumbImage:thumbImage forState:UIControlStateHighlighted];
            [self setThumbImage:thumbImage forState:UIControlStateNormal];
            [self setValue:0.0f animated:YES];
        } completion:^(BOOL isFinish){
            currentSlideValue = self.value;
        }];
    }else if (self.value> 5.0f &&self.value < currentSlideValue) {
        [UIView animateWithDuration:0.8 animations:^(void){
            UIImage *thumbImage = [UIImage imageNamed:@"货物"];
            [self setThumbImage:thumbImage forState:UIControlStateHighlighted];
            [self setThumbImage:thumbImage forState:UIControlStateNormal];
            [self setValue:10.0f animated:YES];
        } completion:^(BOOL isFinish){
            currentSlideValue = self.value;
        }];
    }
}


@end
