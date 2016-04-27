//
//  RDLoginViewController.m
//  RDProjectNew
//
//  Created by realdata on 16/3/18.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDLoginViewController.h"
#import "Masonry.h"
#import <CommonCrypto/CommonDigest.h>
#import "RDRegistViewController.h"
#import "RDForgetAndResetPasswordViewController.h"
#import "HTTPTool.h"
#import "RDMainTabBarController.h"
#import "LabelAdder.h"

@interface RDLoginViewController ()
@property (weak,nonatomic) UITextField* nameTF;
@property (weak,nonatomic) UITextField* passTF;
@end


@implementation RDLoginViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setNav];
    [self setMain];
}

-(void) setNav
{
    
}

-(void) setMain
{
#pragma mark- --- 创建"职事"标签
    self.view.backgroundColor = kCOLORWITHRGB(244, 247, 252);
    //self.view.backgroundColor = [UIColor lightGrayColor];
    UILabel* label = [[UILabel alloc]init];
    label.text = @"职事";
    label.textColor = kCOLORWITHRGB(84, 145, 254);
    label.font = [UIFont systemFontOfSize:45];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
#pragma mark- --- 添加用户名输入框
    UITextField* nameFd = [[UITextField alloc]init];
    self.nameTF = nameFd;
    nameFd.backgroundColor = kCOLORWITHRGB(202 , 213, 221);
    //    nameFd.background = [UIImage imageNamed:];
    nameFd.placeholder = @"请输入邮箱 / 手机号";
    [self.view addSubview:nameFd];
    [nameFd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(label.mas_bottom).offset(60);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 添加密码输入框
    UITextField* passwordFd = [[UITextField alloc]init];
    self.passTF = passwordFd;
    passwordFd.backgroundColor = kCOLORWITHRGB(202 , 213, 221);
    passwordFd.placeholder = @"请输入密码";
    passwordFd.secureTextEntry = YES;
    passwordFd.clearsOnBeginEditing = YES;
    [self.view addSubview:passwordFd];
    [passwordFd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(nameFd.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 添加登录按钮
    UIButton* loginBtn = [[UIButton alloc]init];
    [loginBtn setBackgroundColor:kCOLORWITHRGB(13, 118, 250)];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(passwordFd.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 添加忘记密码按钮
    UIButton* forgetPsdBtn = [[UIButton alloc]init];
    [forgetPsdBtn setBackgroundColor:kCOLORWITHRGB(213, 220, 238)];
    forgetPsdBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [forgetPsdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPsdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetPsdBtn addTarget:self action:@selector(clickForgetPstBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPsdBtn];
    [forgetPsdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-5);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 创建注册按钮
    UIButton* regestBtn = [[UIButton alloc]init];
    [regestBtn setBackgroundColor:kCOLORWITHRGB(33 , 205, 187)];
    regestBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [regestBtn setTitle:@"用户注册" forState:UIControlStateNormal];
    [regestBtn addTarget:self action:@selector(clickRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regestBtn];
    [regestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_centerX).offset(5);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 创建测试按钮
    UIButton* testBtn = [[UIButton alloc]init];
    [testBtn setBackgroundColor:kCOLORWITHRGB(33 , 205, 187)];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [testBtn setTitle:@"用户测试" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(clickTestBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    [testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(regestBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
}

typedef enum {
    TypeAspeding = -1,
    TypeNormal,
    TypeDespending,
} Type;

-(void)clickTestBtn
{
    [HTTPTool loginWithEmail:@"jj" Password:@"jj" success:^(NSDictionary *dic) {
        [HTTPTool searchCourseWithName:@"" andKeywords:@"" andAbstract:@"" andContent:@"" andType_ID:@(TypeAspeding) andPrice:@(TypeAspeding) andSubscribe:@(TypeAspeding) andDatetime:@(TypeAspeding) andPositive:@(TypeAspeding) andNegative:@(TypeAspeding) andStart:@1 success:^(NSDictionary *dic) {
            NSLog(@"%@",dic);
        } failed:^(NSDictionary *dic) {
            
        }];

    } failed:^(NSDictionary *dic) {
        
    }];

}

#pragma mark- --- 点击登录按钮
-(void)clickLoginBtn
{
//    NSString* name = self.nameTF.text;
//    NSString* password = [self.class md5:self.passTF.text] ;
//        if (name.length == 0 || password.length == 0) {
//            LabelAdder* label = [[LabelAdder alloc]init];
//            UILabel* noticeLabel = [label labelNoticeAdder:@"请填写完整" andMode:NO];
//            NSLog(@"验证码用户名为空");
//            [self.view addSubview:noticeLabel];
//            [label labelLayout:noticeLabel];
//        }else{
            [HTTPTool loginWithEmail:@"jj" Password:@"jj" success:^(NSDictionary *dic) {
                NSLog(@"%@",dic);
                RDMainTabBarController* vc = [[RDMainTabBarController alloc] init];
                    [self.navigationController pushViewController:vc animated:YES];

            } failed:^(NSDictionary *dic) {
    
}];
//        }
}



#pragma mark- --- 点击忘记密码按钮
-(void)clickForgetPstBtn
{
    RDForgetAndResetPasswordViewController* vc = [[RDForgetAndResetPasswordViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark- --- 点击注册按钮
-(void)clickRegistBtn{
    RDRegistViewController* vc = [[RDRegistViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- ---判断用户输入的用户名是否是邮箱或者手机
- (BOOL) isEmail: (NSString *) emailAddress {
    NSString *regex = kEMAILADDRESS;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF  MATCHES %@", regex];
    
    return [emailTest evaluateWithObject:emailAddress];
}

- (BOOL) isPhoneNumber: (NSString* ) phoneNo
{
    NSString* regex = kPHONENUMBER;
    NSPredicate *phoneNoText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [phoneNoText evaluateWithObject:phoneNo];
}

+ (NSString *) md5:(NSString *)str
{
    NSString* newStr = [NSString stringWithFormat:@"^A^%@",str];
    const char *cStr = [newStr UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    NSString* haxiStr = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                         result[0], result[1], result[2], result[3],
                         result[4], result[5], result[6], result[7],
                         result[8], result[9], result[10], result[11],
                         result[12], result[13], result[14], result[15]
                         ];
    NSString* md5Str = [haxiStr lowercaseString];
    return md5Str;
    
}


@end
