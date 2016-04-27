//
//  RDCourseSearch.h
//  Prase
//
//  Created by realdata on 16/3/23.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDCourseSearch : NSObject

+(id)parseWithJson:(NSDictionary *)dic;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, assign) NSInteger total;

+(NSArray *)courseSearchParse:(NSDictionary *)dic;
@end

@interface RDCourseSearchList : NSObject
+(id)parseWithJson:(NSDictionary *)dic;



@property (nonatomic, copy) NSString *courseAbstract;

@property (nonatomic, copy) NSString *courseName;

@property (nonatomic, copy) NSString *courseKeyword;

@property (nonatomic, assign) NSInteger courseNegative;

@property (nonatomic, assign) NSInteger courseId;

@property (nonatomic, assign) NSInteger coursePrice;

@property (nonatomic, assign) NSInteger coursePositive;

@property (nonatomic, assign) NSInteger courseSubscribe;

@property (nonatomic, copy) NSString *courseDatetime;

@property (nonatomic, assign) NSInteger courseTypeId;

@end

