//
//  RDRegistViewController.m
//  RDProjectNew
//
//  Created by realdata on 16/3/18.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDRegistViewController.h"
#import "Masonry.h"
#import "AFNetworking.h"
#import "LabelAdder.h"
#import "HTTPTool.h"

@interface RDRegistViewController ()
@property (nonatomic,weak) UITextField* nameTF;
@property (nonatomic,weak) UITextField* codeTF;
@property (nonatomic,strong) UIButton* codeButton;
@end

@implementation RDRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setMain];
}

#pragma mark- --- 设置导航栏以及注册页面
-(void)setNav
{
    self.navigationItem.title = @"注册";
    
}

-(void)setMain
{
    
    UIColor* bgColor = kCOLORWITHRGB(212, 221, 228);
    CGFloat left_panding = 10;
    
    self.view.backgroundColor = kCOLORWITHRGB(243, 248, 253);
    
    UIView* userNameView = [[UIView alloc] init];
    userNameView.backgroundColor = bgColor;
    [self.view addSubview:userNameView];
    [userNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(50 + 64);
        make.height.mas_equalTo(45);
    }];
    
    UITextField* nameTF = [[UITextField alloc] init];
    self.nameTF = nameTF;
    nameTF.textColor = [UIColor grayColor];
    nameTF.font = [UIFont systemFontOfSize:15];
    [userNameView addSubview:nameTF];
    [nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_panding);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(userNameView);
        make.width.mas_equalTo(userNameView);
    }];
    nameTF.placeholder = @"邮箱/手机号码";
    
    
    UIView* codeView = [[UIView alloc] init];
    codeView.backgroundColor = bgColor;
    [self.view addSubview:codeView];
    
    UITextField* codeTF = [[UITextField alloc] init];
    self.codeTF = codeTF;
    codeTF.textColor = [UIColor grayColor];
    codeTF.font = [UIFont systemFontOfSize:15];
    [codeView addSubview:codeTF];
    codeTF.placeholder = @"验证码";
    
    
    UIButton* codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.codeButton = codeButton;
    [codeButton addTarget:self action:@selector(changeCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
    
    
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_panding);
        make.right.mas_equalTo(codeButton.mas_left).offset(-10);
        make.top.mas_equalTo(userNameView.mas_bottom).offset(10);
        make.height.mas_equalTo(userNameView);
        //        make.width.mas_equalTo(300);
    }];
    [codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_panding);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(codeView);
        make.width.mas_equalTo(codeView);
    }];
    
    [codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-left_panding);
        make.height.mas_equalTo(userNameView);
        make.top.mas_equalTo(codeView);
        make.width.mas_equalTo(80);
        //        make.left.mas_equalTo(codeView.mas_right).offset(10);
    }];
    
    
    //    UIView* passwordView = [[UIView alloc] init];
    //    passwordView.backgroundColor = bgColor;
    //    [self.view addSubview:passwordView];
    //    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(10);
    //        make.right.mas_equalTo(-10);
    //        make.top.mas_equalTo(codeView.mas_bottom).offset(10);
    //        make.height.mas_equalTo(45);
    //    }];
    //
    //    UITextField* passwordTF = [[UITextField alloc] init];
    //    passwordTF.textColor = [UIColor grayColor];
    //    passwordTF.font = [UIFont systemFontOfSize:15];
    //    [passwordView addSubview:passwordTF];
    //    [passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(left_panding);
    //        make.top.mas_equalTo(0);
    //        make.height.mas_equalTo(passwordView);
    //        make.width.mas_equalTo(passwordView);
    //    }];
    //    passwordTF.placeholder = @"密码";
    //
    
    UIButton* registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(registClick) forControlEvents:UIControlEventTouchUpInside];
    [registButton setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:registButton];
    [registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_panding);
        make.right.mas_equalTo(-left_panding);
        make.height.mas_equalTo(userNameView);
        make.top.mas_equalTo(codeView.mas_bottom).offset(10);
    }];
    
    
    //配置验证码按钮
   [self setCodeImage];
    
    
    
}

-(void)changeCode:(UIButton* )button
{
    [self setCodeImage];
}

-(void)setCodeImage
{
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:[basePath stringByAppendingString:@"image/security_image"]]];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage* image = [UIImage imageWithData:data];
            [self.codeButton setBackgroundImage:image forState:UIControlStateNormal];
        });
    }];
    [task resume];
}

#pragma mark- --- 点击注册按钮
-(void)registClick
{
    NSString* name = self.nameTF.text;
    NSString* code = self.codeTF.text;
    
    // 1 如果用户名和验证码为空
    if (name.length == 0 || code.length == 0) {
        LabelAdder* label = [[LabelAdder alloc]init];
        UILabel* noticeLabel = [label labelNoticeAdder:@"请填写完整" andMode:NO];
        [self.view addSubview:noticeLabel];
        [label labelLayout:noticeLabel];
        
    }
    // 2 判断用户名格式
    else if ([self isEmail:name])
    {
        [HTTPTool registWithEmail:name code:code success:^(NSDictionary *dic) {
            
        } failed:^(NSDictionary *dic) {
            
        }];
        LabelAdder* label = [[LabelAdder alloc]init];
        UILabel* noticeLabel = [label labelNoticeAdder:@"验证邮件已发送,请到邮箱内收取" andMode:YES];
        
        [self.view addSubview:noticeLabel];
        [label labelLayout:noticeLabel];
        
    }
    else if ([self isPhoneNumber:name]){
        LabelAdder* label = [[LabelAdder alloc]init];
        UILabel* noticeLabel = [label labelNoticeAdder:@"验证邮件已发送,请查看手机" andMode:YES];
        
        [self.view addSubview:noticeLabel];
        [label labelLayout:noticeLabel];
    }else{
        LabelAdder* label = [[LabelAdder alloc]init];
        UILabel* noticeLabel = [label labelNoticeAdder:@"用户名填写错误" andMode:NO];
        
        [self.view addSubview:noticeLabel];
        [label labelLayout:noticeLabel];

    }
    
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


@end
