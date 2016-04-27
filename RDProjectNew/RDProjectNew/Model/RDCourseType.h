//
//  RDCourseType.h
//  Prase
//
//  Created by realdata on 16/3/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RDCourseTypeData;
@interface RDCourseType : NSObject
@property(nonatomic,strong)NSString* msg;
@property(nonatomic,assign)NSString* code;

+(id)parseWithJson:(NSDictionary *)dic;
+(NSArray* )courseType:(NSDictionary *)dic;
@end

@interface RDCourseTypeData : NSObject
@property(nonatomic,assign)NSInteger courseTypeId;
@property(nonatomic,strong)NSString* courseTypeName;

+(id)parseWithJson:(NSDictionary *)dic;
@end