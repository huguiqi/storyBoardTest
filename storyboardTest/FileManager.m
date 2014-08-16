//
//  FileManager.m
//  JinJiangTravalPlus
//
//  Created by 胡 桂祁 on 11/8/12.
//  Copyright (c) 2012 Leon. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

+ (NSString *)filePath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+ (NSString *)fileCachesPath:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+(NSString *)fileResourcePathForUnitTest:(Class)aClass name:(NSString *)fileName type:(NSString *)type
{
     NSString *filePath = [[NSBundle bundleForClass:aClass] pathForResource:fileName ofType:type];
    return filePath;
}

+ (NSString *)fileResourcePath:(NSString *)fileName type:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    return filePath;
}
@end
