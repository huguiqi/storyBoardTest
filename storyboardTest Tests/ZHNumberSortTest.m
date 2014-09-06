//
//  ZHNumberSortTest.m
//  storyboardTest
//
//  Created by huguiqi on 14-8-24.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import <XCTest/XCTest.h>


static NSArray *zhNums;
static NSArray *enNums;
static NSDictionary *matchRegDict;

@interface ZHNumberSortTest : XCTestCase

@property (nonatomic,strong) NSArray *metros;

@end



@implementation ZHNumberSortTest

@synthesize metros;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    zhNums = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",nil];
    enNums = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    matchRegDict = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"一",@         "2",@"二",@"3",@"三",@"4",@"四",@"5",@"五",@"6",@"六",@"7",@"七",@"8",@"八",@"9",@"九",@"10",@"十", nil];
    metros = [NSArray arrayWithObjects:@"上海地铁十二号线",@"上海地铁八号线",@"上海地铁三号线",@"上海地铁五号线",@"上海地铁一号线",@"上海地铁七号线",@"上海地铁二号线",@"上海地铁四号线",@"上海地铁六号线",@"上海地铁十三号线",@"上海地铁十一号线",@"上海地铁十号线",@"上海地铁九号线", nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSMutableArray *sortMetros = [metros mutableCopy];
    [sortMetros replaceObjectAtIndex:12 withObject:@"aa"];
//    [sortMetros insertObject:@"aa" atIndex:12];
    for(int index = 0;index< [metros count];index ++){
        NSString *metroName = metros[index];
        NSInteger indexZhNum = [self indexZhNumsMatch:metroName];
        [sortMetros replaceObjectAtIndex:indexZhNum withObject:metros[index]];
//        [sortMetros insertObject:metros[index] atIndex:indexZhNum];
    }
    
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    
    XCTAssertEqual(@"上海地铁一号线", sortMetros[0], @"排序失败");
}

-(NSInteger)indexZhNumsMatch:(NSString *)zhNum
{
    NSString *indexStr = @"";
    for(NSString *key in [matchRegDict allKeys]){
        if([zhNum rangeOfString:key].length !=0){
            NSString *matchValue = [matchRegDict objectForKey:key];
            if ([matchValue isEqualToString:@"10"]) {
                matchValue = @"1";
            }
            indexStr = [matchValue stringByAppendingString:indexStr];
        }
    }
    
    return [indexStr integerValue];
}

@end
