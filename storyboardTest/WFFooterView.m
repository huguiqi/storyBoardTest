//
// Created by 胡 桂祁 on 1/23/14.
// Copyright (c) 2014 huguiqi. All rights reserved.
//

#import "WFFooterView.h"


@implementation WFFooterView {



}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicator.frame = CGRectMake(60, 25, 20, 20);
        [indicator startAnimating];
        [self addSubview:indicator];
    }

    return self;
}

@end