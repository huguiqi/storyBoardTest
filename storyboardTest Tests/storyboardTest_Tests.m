//
//  storyboardTest_Tests.m
//  storyboardTest Tests
//
//  Created by huguiqi on 14-8-16.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManager.h"

@interface storyboardTest_Tests : XCTestCase

@property(nonatomic,strong) NSMutableDictionary *businessDict;
@property (nonatomic,copy) NSString *businessPath;

@end

@implementation storyboardTest_Tests

@synthesize businessDict;
@synthesize businessPath;

- (void)setUp
{
    [super setUp];
    
    businessPath = [FileManager fileResourcePath:@"BusinessTest" type:@"plist"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:businessPath];
    if(!dict){
        dict = [NSMutableDictionary dictionary];
    }
    self.businessDict = dict;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJSONConvertDictForBusiness
{
    
    NSString *jsonPath = [FileManager fileResourcePath:@"BusinessTest" type:@"geojson"];
    
    NSError *error;
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    NSData *returnData = [parseJason dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&error];
    
    NSDictionary *dataDict = [dict objectForKey:@"data"];
    NSDictionary *businessBeansDict = [dataDict objectForKey:@"businessBeans"];
    
    [businessDict setValue:businessBeansDict forKey:@"business"];
    
    [businessDict writeToFile:businessPath atomically:YES];
    NSLog(@"returnData class:%@",businessDict);
    
    if(error){
        NSLog(@"error:%@",error);
    }
    
    NSLog(@"landMarkPath:%@",businessPath);
    
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

-(void)testJSONConvertDictForMetros
{
//    NSString *jsonPath = [FileManager fileResourcePath:@"Metros" type:@"geojson"];
    NSString *jsonPath = [FileManager fileResourcePathForUnitTest:self.class name:@"Metros" type:@"geojson"];
    NSError *error;
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    NSData *returnData = [parseJason dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&error];
    
    NSDictionary *dataDict = [dict objectForKey:@"data"];
    NSDictionary *businessBeansDict = [dataDict objectForKey:@"businessBeans"];
    
    [businessDict setValue:businessBeansDict forKey:@"metros"];
    
    [businessDict writeToFile:businessPath atomically:YES];
    NSLog(@"returnData class:%@",businessDict);
    
    if(error){
        NSLog(@"error:%@",error);
    }
    
    NSLog(@"landMarkPath:%@",businessPath);
}

-(void)testJSONConvertBean
{
    
}

@end
