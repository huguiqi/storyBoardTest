//
//  HotelAnnotation.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 8/26/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "HotelAnnotation.h"

@implementation HotelAnnotation

- (CLLocationCoordinate2D)coordinate;
{
    return self.thieCoordinate;
}


- (NSString *)title
{
    return self.place;
}

// optional
- (NSString *)subtitle
{
    return self.place;
}


@end
