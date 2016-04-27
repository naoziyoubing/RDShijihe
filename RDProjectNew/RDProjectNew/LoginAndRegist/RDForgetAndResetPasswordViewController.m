//
//  RDForgetAndResetPasswordViewController.m
//  RDProjectNew
//
//  Created by realdata on 16/3/18.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDForgetAndResetPasswordViewController.h"
#import "Masonry.h"
#import "HTTPTool.h"

@interface RDForgetAndResetPasswordViewController ()
@property (nonatomic,strong) UIButton* codeBtn;
@end

@implementation RDForgetAndResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setMain];
}

-(void) setNav{
    self.navigationController.title = @"忘记密码";
}

-(void) setMain{
    self.view.backgroundColor = kCOLORWITHRGB(240, 246, 252);
    // self.view.backgroundColor = [UIColor lightGrayColor];
    
#pragma mark- --- 添加用户名输入框
    UITextField* nameFd = [[UITextField alloc]init];
    nameFd.backgroundColor = kCOLORWITHRGB(202 , 213, 221);
    nameFd.placeholder = @"手机号 / 邮箱";
    [self.view addSubview:nameFd];
    [nameFd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    
#pragma mark- --- 添加验证码输入框
    UITextField* codeFd = [[UITextField alloc]init];
    codeFd.backgroundColor = kCOLORWITHRGB(202 , 213, 221);
    codeFd.placeholder = @"验证码";
    [self.view addSubview:codeFd];
    [codeFd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-170);
        make.top.mas_equalTo(nameFd.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 添加验证码图片按钮
    UIButton* codeBtn = [[UIButton alloc] init];
    self.codeBtn = codeBtn;
    [codeBtn addTarget:self action:@selector(changeCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeBtn];
    [codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(codeFd.mas_right).offset(10);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(nameFd.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    [self setCodeBtnImage];
    
#pragma mark- --- 添加重新输入密码输入框
    UITextField* resetPsdTF = [[UITextField alloc]init];
    resetPsdTF.backgroundColor = kCOLORWITHRGB(202 , 213, 221);
    resetPsdTF.secureTextEntry = YES;
    resetPsdTF.clearsOnBeginEditing = YES;
    resetPsdTF.placeholder = @"新密码       密码由6 - 20位字符组成,区分大小写";
    [resetPsdTF setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    resetPsdTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:resetPsdTF];
    [resetPsdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(codeBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
#pragma mark- --- 添加重置按钮
    UIButton* resetButton = [[UIButton alloc]init];
    [resetButton setTitle:@"重置密码" forState:normal];
    [resetButton setBackgroundColor: kCOLORWITHRGB(50, 100, 250)];
    [resetButton addTarget:self action:@selector(resetPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
    [resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(resetPsdTF.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
}

-(void)resetPassword
{
    
}
-(void)changeCode:(UIButton *)button
{
    [self setCodeBtnImage];
    
}

-(void)setCodeBtnImage
{
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:[basePath stringByAppendingString:@"image/security_image"]]];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage* image = [UIImage imageWithData:data];
            [self.codeBtn setBackgroundImage:image forState:UIControlStateNormal];
        });
    }];
    [task resume];
}


@end
