//
//  HTTPTool.m
//  RDProjectNew
//
//  Created by realdata on 16/3/18.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "HTTPTool.h"
#import "AFNetworking.h"
#import "RDCourseType.h"
#import "RDCourseInfo.h"
#import "RDCourseSearch.h"



static HTTPTool* HTTP;

@implementation HTTPTool
+(instancetype)sharedHTTP
{
    if (!HTTP) {
        HTTP = [[HTTPTool alloc]init];
    }
    return HTTP;
}

+(void)registWithEmail:(NSString *)email code:(NSString *)code success:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString* urlStr = [NSString stringWithFormat:@"%@%@",basePath,@"ios/api?M=user&A=registerByEmailStepOne"];
    
    NSDictionary* params = @{@"register_email":email,@"verify_code":code};
    
    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic = responseObject;
        
        if ([[dic valueForKey:@"msg"] isEqualToString:@"success"]) {
            success(responseObject);
        }else{
            failed(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(@{@"msg":error});
    }];
    
}

+(void)loginWithEmail:(NSString *)username Password:(NSString *)password success:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSString* url = [basePath stringByAppendingString:@"ios/api?M=user&A=login"];
    NSDictionary* param = @{@"username" : username, @"password" : password};
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic = responseObject;
        
        if ([[dic valueForKey:@"msg"] isEqualToString:@"success"]) {
            success(responseObject);
        }else{
            failed(responseObject);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(@{@"msg":error});
    }];
}

+(void)logoutWithEmailsuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed
{
    NSString* urlStr = [basePath stringByAppendingString:@"ios/api?M=user&A=logout"];
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
        [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failed(error.userInfo);
        }];
}

+(void)testCookiessuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed
{
    NSString* urlStr = [basePath stringByAppendingString:@"ios/api?M=test&A=token"];
       AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failed(error.userInfo);
    }];
    
}
+(void)chargeUserInfoSuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))faild
{
    NSString* urlStr = [NSString stringWithFormat:@"%@%@",basePath,@"ios/api?M=user&A=getUserInfo"];
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        faild(error.userInfo);
    }];
}

+(void)chargeUserInfoExtraSuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))faild
{
    NSString* urlStr = [NSString stringWithFormat:@"%@%@",basePath,@"ios/api?M=userinfo&A=getUserInfoInfo"];
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        faild(error.userInfo);
    }];

}

+(void)chargeCourseTypeSuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed
{
    NSString* urlStr = [NSString stringWithFormat:@"%@%@",basePath,@"ios/api?M=course&A=getCourseType"];
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

+(void)chargeCourseInfo:(NSInteger)courseTypeId Success:(void (^)(NSDictionary *))success failed:(void (^)(NSDictionary *))failed
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSString* courseId = [NSString stringWithFormat:@"ios/api?M=course&A=showOneCourse&id=%ld",(long)courseTypeId];
    NSString* urlStr = [NSString stringWithFormat:@"%@%@",basePath,courseId];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

+(void)searchCourseWithName:(NSString *)name andKeywords:(NSString *)keywords andAbstract:(NSString *)abstract andContent:(NSString *)content andType_ID:(NSNumber *)typeID andPrice:(NSNumber *)price andSubscribe:(NSNumber *)subscribe andDatetime:(NSNumber *)datetime andPositive:(NSNumber *)positive andNegative:(NSNumber *)negative andStart:(NSNumber *)start success:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager ];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",basePath,@"ios/api?M=course&A=listCourse"];
    NSDictionary *param = @{@"course_name" : name,@"course_keyword":keywords,@"course_abstract":abstract,@"course_content":content,@"courseType_ID":typeID,@"course_price":price,@"course_subscribe":subscribe,@"course_datetime":datetime,@"course_positive":positive,@"course_negative":negative,@"start":start};
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:urlStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

+(void)changeUserInfoExtraWithKey:(NSString *)key_arr andValue:(NSString *)value_arr success:(void (^)(NSDictionary *))success failed:(void (^)(NSDictionary *))failed
{
    NSString* urlStr = [basePath stringByAppendingString:@"ios/api?M=userinfo&A=setUserInfoInfo"];
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary* param = @{@"key_arr" : key_arr, @"value_arr" : value_arr};
    [manager POST:urlStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error.userInfo);
    }];
   }

@end
