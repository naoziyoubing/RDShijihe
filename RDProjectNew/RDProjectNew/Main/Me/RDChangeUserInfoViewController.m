//
//  RDChangeUserInfoViewController.m
//  RDProjectNew
//
//  Created by realdata on 16/4/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDChangeUserInfoViewController.h"
#import "Masonry.h"
#import "HTTPTool.h"
#import "RDPersonalViewController.h"

@interface RDChangeUserInfoViewController ()
@property (nonatomic,strong) UITextField *userCountry;
@property (nonatomic,strong) UITextField *userProvince;
@property (nonatomic,strong) UITextField *userCity;
@property (nonatomic,strong) UITextField *userSex;
@property (nonatomic,strong) UITextField *userHobby;
@property (nonatomic,strong) UITextField *userRealname;
@property (nonatomic,strong) UITextField *userSignature;
@property (nonatomic,strong) UITextField *userJob;
@property (nonatomic,strong) UITextField *userBirth;
@property (nonatomic,strong) NSString* key_arr;
@property (nonatomic,strong) NSString* value_arr;
@end

@implementation RDChangeUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMain];
}

-(void)setMain
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton* enterAndBack = [[UIButton alloc]init];
    enterAndBack.backgroundColor = [UIColor greenColor];
    [enterAndBack setTitle:@"确认" forState:UIControlStateNormal];
    [enterAndBack addTarget:self action:@selector(enterAndBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterAndBack];
    [enterAndBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-100);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    
    UITextField* userCountry = [[UITextField alloc] init];
    self.userCountry = userCountry;
    userCountry.placeholder = @"国籍";
    userCountry.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userCountry];
    [userCountry mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userProvince = [[UITextField alloc] init];
    self.userProvince = userProvince;
    userProvince.placeholder = @"省份";
    userProvince.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userProvince];
    [userProvince mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userCountry.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userCity = [[UITextField alloc] init];
    self.userCity = userCity;
    userCity.placeholder = @"城市";
    userCity.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userCity];
    [userCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userProvince.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userSex = [[UITextField alloc] init];
    self.userSex = userSex;
    userSex.placeholder = @"性别";
    userSex.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userSex];
    [userSex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userCity.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userHobby = [[UITextField alloc] init];
    self.userHobby = userHobby;
    userHobby.placeholder = @"兴趣爱好";
    userHobby.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userHobby];
    [userHobby mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userSex.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userRealname = [[UITextField alloc] init];
    self.userRealname = userRealname;
    userRealname.placeholder = @"真实姓名";
    userRealname.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userRealname];
    [userRealname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userHobby.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userSignatrue = [[UITextField alloc] init];
    self.userSignature = userSignatrue;
    userSignatrue.placeholder = @"签名";
    userSignatrue.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userSignatrue];
    [userSignatrue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userRealname.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UITextField* userJob = [[UITextField alloc] init];
    self.userJob = userJob;
    userJob.placeholder = @"职业";
    userJob.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:userJob];
    [userJob mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userSignatrue.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
}

-(void)enterAndBack
{
    if (self.userCountry.text.length != 0 &&
       self.userProvince.text.length != 0 &&
       self.userCity.text.length != 0 &&
       self.userSex.text.length != 0 &&
       self.userHobby.text.length !=0 &&
       self.userRealname.text.length !=0 &&
       self.userSignature.text.length != 0&&
       self.userJob.text.length != 0&&
       self.userBirth.text.length != 0) {
     
    }else {
        if (self.userCountry.text.length != 0) {
            NSString* keyArr = [[NSString alloc]init];
            NSString* valueArr = [[NSString alloc]init];

        keyArr = @"userCountry";
        valueArr = [NSString stringWithFormat:@"%@",self.userCountry.text];
            self.key_arr = keyArr;
            self.value_arr = valueArr;
        
    }
    if (self.userProvince.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userProvince";
        valueArr = [NSString stringWithFormat:@"%@",self.userProvince.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
    if (self.userCity.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userCity";
        valueArr = [NSString stringWithFormat:@"%@",self.userCity.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
    if (self.userSex.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userSex";
        valueArr = [NSString stringWithFormat:@"%@",self.userSex.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
    if (self.userHobby.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userHobby";
        valueArr = [NSString stringWithFormat:@"%@",self.userHobby.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
    if (self.userRealname.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userRealname";
        valueArr = [NSString stringWithFormat:@"%@",self.userRealname.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
    if (self.userSignature.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userSignature";
        valueArr = [NSString stringWithFormat:@"%@",self.userSignature.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
    if (self.userJob.text.length != 0) {
        NSString* keyArr = [[NSString alloc]init];
        NSString* valueArr = [[NSString alloc]init];
        keyArr = @"userJob";
        valueArr = [NSString stringWithFormat:@"%@",self.userJob.text];
        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
    }
//    if (self.userBirth.text.length != 0) {
//        NSString* keyArr = [[NSString alloc]init];
//        NSString* valueArr = [[NSString alloc]init];
//        keyArr = @"userBirth";
//        valueArr = [NSString stringWithFormat:@"%@",self.userBirth.text];
//        self.key_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.key_arr,keyArr];
//        self.value_arr = [NSString stringWithFormat:@"%@_-_-_%@",self.value_arr,valueArr];
//    }
        NSLog(@"%@\n%@",self.key_arr,self.value_arr);
        [HTTPTool changeUserInfoExtraWithKey:self.key_arr andValue:self.value_arr success:^(NSDictionary *dic) {
 
            [self.navigationController popViewControllerAnimated:YES];
            self.key_arr = nil;
            self.value_arr = nil;
            NSLog(@"%@\n%@",self.key_arr,self.value_arr);
        } failed:^(NSDictionary *dic) {
            
        }];
    }

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
