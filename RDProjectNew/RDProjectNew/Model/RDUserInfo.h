//
//  RDUserInfo.h
//  RDProject
//
//  Created by realdata on 16/3/17.
//  Copyright © 2016年 Pucka06. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RDAccountLastLogTimeObj,RDAccountRegisterTimeObj;
@interface RDUserInfo : NSObject
@property (nonatomic, assign) NSInteger accountBalance;//用户现金余额
@property (nonatomic, strong) NSString *accountMail;//账号邮箱
@property (nonatomic, assign) NSInteger accountAvailablePoint;//账号积分
@property (nonatomic, strong) NSString *accountPsw;//账号密码
@property (nonatomic, assign) NSInteger creditlevelId;//信用等级
@property (nonatomic, strong) NSString *accountName;//账号名称
@property (nonatomic, assign) NSInteger accountConsumedPoint;//已经消费的积分
@property (nonatomic, assign) NSInteger userId;//用户的id
@property (nonatomic, strong) NSString *accountIp;//注册时候的ip
@property (nonatomic, strong) NSString *accountMobile;//手机号
@property (nonatomic, assign) BOOL accountEnable;//账户是否可用
@property (nonatomic, assign) NSInteger nanos;
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, assign) NSInteger hours;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger timezoneOffset;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger date;

@property (nonatomic, assign) NSInteger lastNanos;
@property (nonatomic, assign) NSInteger lastTime;
@property (nonatomic, assign) NSInteger lastMinutes;
@property (nonatomic, assign) NSInteger lastSeconds;
@property (nonatomic, assign) NSInteger lastHours;
@property (nonatomic, assign) NSInteger lastMonth;
@property (nonatomic, assign) NSInteger lastYear;
@property (nonatomic, assign) NSInteger lastTimezoneOffset;
@property (nonatomic, assign) NSInteger lastDay;
@property (nonatomic, assign) NSInteger lastDate;
+(id)parseWithJson:(NSDictionary *)dic;
@end
//现在做修改测试。话说你这代码看的不累吗？
//