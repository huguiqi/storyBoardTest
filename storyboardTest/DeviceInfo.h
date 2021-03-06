//
//  DeviceInfo.h
//  JinJiangHotel
//
//  Created by Rong Hao on 13-8-13.
//  Copyright (c) 2013年 jinjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject

+ (int) appVersion;
+ (NSString *)platformName;
+ (double)currentMemoryUsage;
+ (NSString *)getVendorID;
+ (double) systemVersion;
@end
