//
//  RDCourseSearch.m
//  Prase
//
//  Created by realdata on 16/3/23.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDCourseSearch.h"

@implementation RDCourseSearch

+(id)parseWithJson:(NSDictionary *)dic
{
    return [[self alloc]initWithJson:dic];
}

-(id)initWithJson:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.msg = dic[@"msg"];
        self.code = dic[@"code"];
        self.total = [dic[@"data"][@"total"] integerValue];
    }
    return self;
}

+(NSArray *)courseSearchParse:(NSDictionary *)dic
{
    NSArray* dataArray = dic[@"data"][@"course_list"];
    NSMutableArray* courseList = [NSMutableArray array];
    for (NSDictionary *dataDic in dataArray) {
        RDCourseSearchList* list = [RDCourseSearch parseWithJson:dataDic];
        [courseList addObject:list];
    }
    return courseList;
}

@end

@implementation RDCourseSearchList
+(id)parseWithJson:(NSDictionary *)dic
{
    return [[self alloc]initWithJson:dic];
}

-(id)initWithJson:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.coursePrice = [dic[@"coursePrice"] integerValue];
        self.courseNegative = [dic[@"courseNegative"] integerValue];
        self.courseTypeId = [dic[@"courseTypeId"] integerValue];
        self.courseDatetime = dic[@"courseDatetime"];
        self.courseSubscribe = [dic[@"courseSubscribe"] integerValue];
        self.courseTypeId = [dic[@"courseTypeId"] integerValue];
        self.courseAbstract = dic[@"courseAbstract"];
        self.coursePositive = [dic[@"coursePositive"] integerValue];
        self.courseKeyword = dic[@"courseKeyword"];
        self.courseName = dic[@"courseName"];
    }
    return self;
}
@end
