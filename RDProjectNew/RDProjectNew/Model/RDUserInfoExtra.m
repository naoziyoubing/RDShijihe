//
//  RDUserInfoExtra.m
//  RDProjectNew
//
//  Created by realdata on 16/4/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDUserInfoExtra.h"

@implementation RDUserInfoExtra
+(id)parseWithJSON:(NSDictionary *)dic
{
    return [[self alloc]initWithJson:dic];
}
-(id)initWithJson:(NSDictionary *)dic{
    if (self = [super init]) {
        self.code = dic[@"code"];
        self.data = dic[@"data"];
        self.msg = dic[@"msg"];
        self.userIdentifyId = dic[@"data"][@"userIdentifyId"];
        self.userCity = dic[@"data"][@"userCity"];
        self.userCredentialNum = dic[@"data"][@"userCredentialNum"];
        self.userHobby = dic[@"data"][@"userHobby"];
        self.userIdentifyDriver = dic[@"data"][@"userIdentifyDriver"];
        self.weiboUid = dic[@"data"][@"weiboUid"];
        self.userRealname = dic[@"data"][@"userRealname"];
        self.userDriverAuth = dic[@"data"][@"userDriverAuth"];
        self.userIdAuth = dic[@"data"][@"userIdAuth"];
        self.qqUid = dic[@"data"][@"qqUid"];
           NSInteger birth = [dic[@"data"][@"userBirth"][@"time"] integerValue];
        NSTimeInterval time = birth / 1000 + 28800;
        NSDate* birthDate = [NSDate dateWithTimeIntervalSince1970:time];
        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd  HH:mm:ss"];
        
        self.userBirthday = [formatter stringFromDate:birthDate];
        self.userCountry = dic[@"data"][@"userCountry"];
        self.userProvince = dic[@"data"][@"userProvince"];
        self.userId = [dic[@"data"][@"userId"] integerValue];
        self.userSex = dic[@"data"][@"userSex"];
        self.weixinUid = dic[@"data"][@"weixinUid"];
        self.userSignature = dic[@"data"][@"userSignature"];
        self.userJob = dic[@"data"][@"userJob"];
        
        
   }
    return self;
}
@end
