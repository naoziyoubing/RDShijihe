//
//  RDUserInfoExtra.h
//  RDProjectNew
//
//  Created by realdata on 16/4/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDUserInfoExtra : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *code;

@property(nonatomic, strong) NSDictionary *data;
+(id)parseWithJSON:(NSDictionary *)dic;

@property (nonatomic, copy) NSString *weixinUid;

@property (nonatomic, copy) NSString *userSignature;

@property (nonatomic, copy) NSString *userIdentifyDriver;

@property (nonatomic, assign) BOOL userDriverAuth;

@property (nonatomic, copy) NSString *userCountry;

@property (nonatomic, copy) NSString *userJob;

@property (nonatomic, copy) NSString *userProvince;

@property (nonatomic, copy) NSString *userIdentifyId;

@property (nonatomic, assign) BOOL userIdAuth;

@property (nonatomic, copy) NSString *userCredentialNum;

@property (nonatomic, strong) NSString *userHobby;

@property (nonatomic, copy) NSString *userCity;

@property (nonatomic, copy) NSString *weiboUid;

@property (nonatomic, copy) NSString *userRealname;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *qqUid;

@property (nonatomic, copy) NSString *userSex;

@property (nonatomic, assign) NSInteger date;

@property (nonatomic, assign) long long time;

@property (nonatomic, assign) NSInteger day;

@property (nonatomic, assign) NSInteger hours;

@property (nonatomic, assign) NSInteger month;

@property (nonatomic, assign) NSInteger nanos;

@property (nonatomic, assign) NSInteger seconds;

@property (nonatomic, assign) NSInteger year;

@property (nonatomic, assign) NSInteger minutes;

@property (nonatomic, assign) NSInteger timezoneOffset;

@property (nonatomic,strong) NSString *userBirthday;

@end

