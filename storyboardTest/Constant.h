//
//  Constant.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 10/18/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//


#define RGBCOLOR(R,G,B) [UIColor colorWithRed:(float)R/255.0 green:(float)G/255.0 blue:(float)B/255.0 alpha:1]

#define CGRectHasNav(originX,originY,width,height) [[[UIDevice currentDevice]systemVersion]floatValue]>=7.0? CGRectMake(originX,originY+44+20,width,height):CGRectMake(originX,originY,width,height)

#define CGRectNoNav(originX,originY,width,height)  [[[UIDevice currentDevice]systemVersion]floatValue]>=7.0? CGRectMake(originX,originY+20,width,height):CGRectMake(originX,originY,width,height)

#define ZYViewNavHeight(viewHeight) [[UIScreen mainScreen]bounds].size.height-64-viewHeight

#define kUMAppkey  @"518a09fe56240b42b703acbb"
#define kTrackingId  @"UA-39572739-1"
#define kLogEnable NO

#define SUGUE_LIST_TO_BOOKING       @"fromListToBooking"