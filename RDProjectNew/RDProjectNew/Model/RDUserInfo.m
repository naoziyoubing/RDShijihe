//
//  RDUserInfo.m
//  RDProject
//
//  Created by realdata on 16/3/17.
//  Copyright © 2016年 Pucka06. All rights reserved.
//

#import "RDUserInfo.h"

@implementation RDUserInfo
+(id)parseWithJson:(NSDictionary *)dic
{
    return [[self alloc]initWithJson:dic];
}

-(id)initWithJson:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.accountBalance = [dic[@"data"][@"accountBalance"] integerValue];
        self.accountEnable = dic[@"data"][@"accountEnable"];
        self.accountMail = dic[@"data"][@"accountMail"];
        self.accountAvailablePoint = [dic[@"data"][@"accountAvailablePoint"] integerValue];
        self.accountPsw = dic[@"data"][@"accountPsw"];
        self.creditlevelId = [dic[@"data"][@"creditlevelId"] integerValue];
        self.accountName = dic[@"data"][@"accountName"];
        self.nanos = [dic[@"data"][@"accountRegisterTime"][@"nanos"] integerValue];
        self.time = [dic[@"data"][@"accountRegisterTime"][@"time"] integerValue];
        self.minutes = [dic[@"data"][@"accountRegisterTime"][@"minutes"] integerValue];
        self.seconds = [dic[@"data"][@"accountRegisterTime"][@"seconds"] integerValue];
        self.hours = [dic[@"data"][@"accountRegisterTime"][@"hours"] integerValue];
        self.month = [dic[@"data"][@"accountRegisterTime"][@"month"] integerValue];
        self.year = [dic[@"data"][@"accountRegisterTime"][@"year"] integerValue];
        self.timezoneOffset = [dic[@"data"][@"accountRegisterTime"][@"timezoneOffset"] integerValue];
        self.day = [dic[@"data"][@"accountRegisterTime"][@"day"] integerValue];
        self.date = [dic[@"data"][@"accountRegisterTime"][@"date"] integerValue];
        self.userId = [dic[@"data"][@"userId"] integerValue];
        
        self.lastNanos = [dic[@"data"][@"accountLastLogTime"][@"nanos"] integerValue];
        self.lastTime = [dic[@"data"][@"accountLastLogTime"][@"time"] integerValue];
        self.lastMinutes = [dic[@"data"][@"accountLastLogTime"][@"minutes"] integerValue];
        self.lastSeconds = [dic[@"data"][@"accountLastLogTime"][@"seconds"] integerValue];
        self.lastHours = [dic[@"data"][@"accountLastLogTime"][@"hours"] integerValue];
        self.lastMonth = [dic[@"data"][@"accountLastLogTime"][@"month"] integerValue];
        self.lastYear = [dic[@"data"][@"accountLastLogTime"][@"year"] integerValue];
        self.lastTimezoneOffset = [dic[@"data"][@"accountLastLogTime"][@"timezoneOffset"] integerValue];
        self.lastDay = [dic[@"data"][@"accountLastLogTime"][@"day"] integerValue];
        self.lastDate = [dic[@"data"][@"accountLastLogTime"][@"date"] integerValue];
    }
    return self;
}
@end