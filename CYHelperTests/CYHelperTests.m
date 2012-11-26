//
//  CYHelperTests.m
//  CYHelperTests
//
//  Created by Lancy on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CYHelperTests.h"
#import "NSData+CYHelper.h"
#import "NSString+CYHelper.h"
#import "NSDictionary+CYHelper.h"

@implementation CYHelperTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.

}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    [self dataHelperTest];
    [self jsonHelperTest];
}

- (void)dataHelperTest
{
    NSString *string = @"The quick brown fox jumps over the lazy dog";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    STAssertEqualObjects([data MD5String], @"9E107D9D372BB6826BD81D3542A419D6", @"NSData + Helper MD5String exception");
    
    string = @"";
    data = [string dataUsingEncoding:NSUTF8StringEncoding];
    STAssertEqualObjects([data MD5String], @"D41D8CD98F00B204E9800998ECF8427E", @"NSData + Helper MD5String exception");

}

- (void)jsonHelperTest
{
    NSDictionary* info = @{
        @"key1" : @"string",
        @"key2" : @[@"1", @"2", @"3"],
        @"key3" : @{
                        @"key4" : @"OK",
                        @"key5" : @"hello"
                }
    };
    NSString *dicToString = [info jsonString];
    NSDictionary *stringToDic = [dicToString jsonObject];
    NSData *dicToData = [info jsonData];
    NSDictionary *dataToDic = [dicToData jsonObject];

    STAssertEqualObjects(info, dataToDic, @"JSON helper exception");
    STAssertEqualObjects(info, stringToDic, @"JSON helper exception");
    STAssertEqualObjects(dataToDic, stringToDic, @"Json helper exception");
    
}

@end
