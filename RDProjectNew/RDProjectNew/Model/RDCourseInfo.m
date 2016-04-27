//
//  RDCourseInfo.m
//  Prase
//
//  Created by realdata on 16/3/22.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDCourseInfo.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation RDCourseInfo

+(id)parseWithJson:(NSDictionary *)dic
{
    return [[self alloc] initWithJson:dic];
}

-(id)initWithJson:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.code = dic[@"code"];
        self.msg = dic[@"msg"];
        NSString* base64Str =dic[@"data"][@"course_content"];
        NSData* base64decode = [[NSData alloc]initWithBase64EncodedString:base64Str options:0];
        NSString* base64decodeStr = [[NSString alloc]initWithData:base64decode encoding:NSUTF8StringEncoding];
        NSLog(@"%@",base64decodeStr);
        self.course_content = base64decodeStr;
        self.coursePrice = [dic[@"data"][@"course"][@"coursePrice"] integerValue];
        self.courseNegative = [dic[@"data"][@"course"][@"courseNegative"] integerValue];
        self.courseTypeId = [dic[@"data"][@"course"][@"courseTypeId"] integerValue];
        self.courseDatetime = dic[@"data"][@"course"][@"courseDatetime"];
        self.courseSubscribe = [dic[@"data"][@"course"][@"courseSubscribe"] integerValue];
        self.courseId = [dic[@"data"][@"course"][@"courseId"] integerValue];
        self.coursePositive = [dic[@"data"][@"course"][@"coursePositive"] integerValue];
        self.courseAbstract = dic[@"data"][@"course"][@"courseAbstract"];
        self.courseName = dic[@"data"][@"course"][@"courseName"];
        self.courseKeyword = dic[@"data"][@"course"][@"courseKeyword"];
        self.isBuy = dic[@"data"][@"isBuy"];
    }
    return self;
}


@end


