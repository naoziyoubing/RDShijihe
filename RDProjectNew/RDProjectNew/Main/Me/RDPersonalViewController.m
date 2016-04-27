//
//  RDPersonalViewController.m
//  RDProjectNew
//
//  Created by realdata on 16/4/21.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDPersonalViewController.h"
#import "HTTPTool.h"
#import "Masonry.h"
#import "RDUserInfoExtra.h"
#import "RDChangeUserInfoViewController.h"
#import "RDUserInfo.h"

@interface RDPersonalViewController ()
@property (nonatomic,strong)RDUserInfoExtra *userInfoExtra;
@property(nonatomic,strong) UILabel* label;
@end

@implementation RDPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMain];
    [self addPersonInfo];
}

-(void)setMain
{
        [HTTPTool chargeUserInfoSuccess:^(NSDictionary *dic) {
            [HTTPTool chargeUserInfoExtraSuccess:^(NSDictionary *dic) {
                RDUserInfoExtra* userInfo = [RDUserInfoExtra parseWithJSON:dic];
                self.userInfoExtra = userInfo;
                [self addPersonInfo];
                [self addChangeInfoButton];
            } failed:^(NSDictionary *dic) {
                // NSLog(@"failed%@",dic);
            }];

        UILabel* label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor yellowColor];
        label.text = [NSString stringWithFormat:@"%@",dic];
        label.numberOfLines = 0;
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(self.view.mas_centerX).offset(0);
            make.top.mas_equalTo(50);
            make.bottom.mas_equalTo(-100);
        }];
    } failed:^(NSDictionary *dic) {
        
    }];

}

-(void)addPersonInfo
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UILabel* label = [[UILabel alloc]init];
        self.label = label;
        label.text = [NSString stringWithFormat:@"所在城市:%@\n兴趣爱好:%@\n绑定微博信息:%@\n真实姓名:%@\n用户国籍:%@\n用户省份:%@\n用户性别:%@\n用户签名:%@\n用户职业:%@,生日:%@",self.userInfoExtra.userCity,self.userInfoExtra.userHobby,self.userInfoExtra.weiboUid,self.userInfoExtra.userRealname,self.userInfoExtra.userCountry,self.userInfoExtra.userProvince,self.userInfoExtra.userSex,self.userInfoExtra.userSignature,self.userInfoExtra.userJob,self.userInfoExtra.userBirthday];
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(self.view.mas_centerX).offset(0);
            make.top.mas_equalTo(50);
            make.bottom.mas_equalTo(-100);
        }];
    });

    
}

-(void)addChangeInfoButton
{
    UIButton* changeButton = [[UIButton alloc]init];
    changeButton.backgroundColor = [UIColor greenColor];
    [changeButton setTitle:@"修改信息" forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changeInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-60);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
}

-(void)changeInfo
{
    RDChangeUserInfoViewController* changeUserInfo = [[RDChangeUserInfoViewController alloc]init];
    [self.navigationController pushViewController:changeUserInfo animated:YES];
}
@end
