//
//  RDCourseType.m
//  Prase
//
//  Created by realdata on 16/3/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDCourseType.h"

@implementation RDCourseType
+(id)parseWithJson:(NSDictionary *)dic
{
    return [[self alloc]initWithJson:dic];
}

-(id)initWithJson:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.msg = dic[@"msg"];
        self.code = dic[@"code"];
    }
    return self;
}
+(NSArray *)courseType:(NSDictionary *)dic
{
    NSArray* array = dic[@"data"];
    NSMutableArray* courseTypeMutableArray = [NSMutableArray array];
    for (NSDictionary* courseDic in array) {
        RDCourseTypeData* courseTypeData = [RDCourseTypeData parseWithJson:courseDic];
        [courseTypeMutableArray addObject:courseTypeData];
    }
    return [courseTypeMutableArray copy];
}
@end

@implementation RDCourseTypeData

+(id)parseWithJson:(NSDictionary *)dic
{
    return [[self alloc] initWithJson:dic];
}

-(id)initWithJson:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.courseTypeId = [dic[@"courseTypeId"] integerValue];
        self.courseTypeName = dic[@"courseTypeName"];
    }
    return self;
}

@end
