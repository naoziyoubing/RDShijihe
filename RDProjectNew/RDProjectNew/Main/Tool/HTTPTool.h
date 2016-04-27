//
//  HTTPTool.h
//  RDProjectNew
//
//  Created by realdata on 16/3/18.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

static NSString* basePath = kBasePath;
@interface HTTPTool : NSObject

+(instancetype)sharedHTTP;

/**
 *  用户注册接口
 *
 *  @param email   注册用户邮箱
 *  @param code    验证码
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+(void)registWithEmail:(NSString *)email code:(NSString *)code success:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed;

/**
 * 用户登录接口
 *
 * @param username 用户名
 * @param password 密码
 * @param success 成功回调
 * @param failed 失败回调
 */
+(void)loginWithEmail : (NSString *)username Password : (NSString *)password success:(void(^)(NSDictionary *dic))success failed:(void(^)(NSDictionary* dic))failed;

/**
 *  用户注销接口
 *
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+(void)logoutWithEmailsuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed;

/**
 *  测试缓存接口
 *
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+(void)testCookiessuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed;

/**
 *  获取用户信息接口
 *
 *  @param success 成功回调
 *  @param faild   失败回调
 */
+(void)chargeUserInfoSuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))faild;

/**
 *  获取用户额外信息
 *
 *  @param success 成功回调
 *  @param faild   失败回调
 */
+(void)chargeUserInfoExtraSuccess:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))faild;

/**
 *  获取课程种类接口
 *
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+(void)chargeCourseTypeSuccess:(void(^)(NSDictionary *dic))success failed:(void(^)(NSDictionary *dic))failed;

/**
 *  获取课程信息接口
 *
 *  @param courseTypeId 课程编号
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+(void)chargeCourseInfo:(NSInteger)courseTypeId Success:(void(^)(NSDictionary *dic))success failed:(void(^)(NSDictionary *dic))failed;


//+(void)searchCourseSuccess:(void(^)(NSDictionary *dic))success failed:(void(^)(NSDictionary *dic))failed;
/**
 *  课程搜索接口
 *
 *  @param name      名称
 *  @param keywords  关键字
 *  @param abstract  摘要
 *  @param content   内容
 *  @param typeID    种类
 *  @param price     定价排序 0不限制 1递减 -1递增 下同
 *  @param subscribe 订阅人数
 *  @param datetime  发布时间
 *  @param positive  赞数量
 *  @param negative  踩数量
 *  @param start    起始页数
 *  @param failed    成功回调
 *  @param failed    失败回调
 */
+(void)searchCourseWithName:(NSString *)name andKeywords:(NSString *)keywords andAbstract:(NSString *)abstract andContent:(NSString *)content andType_ID:(NSNumber *)typeID andPrice:(NSNumber *)price andSubscribe:(NSNumber *)subscribe andDatetime:(NSNumber *)datetime andPositive:(NSNumber *)positive andNegative:(NSNumber *)negative andStart:(NSNumber *)start success:(void (^)(NSDictionary *dic))success failed:(void (^)(NSDictionary *dic))failed;

/**
 *  修改用户信息
 *
 *  @param key_arr   关键字,字符串
 *  @param value_arr 修改后的值,字符串
 *  @param success   成功回调
 *  @param failed    失败回调
 */
+(void)changeUserInfoExtraWithKey:(NSString *)key_arr andValue:(NSString *)value_arr success:(void(^)(NSDictionary *dic))success failed:(void(^)(NSDictionary *dic))failed;
@end
