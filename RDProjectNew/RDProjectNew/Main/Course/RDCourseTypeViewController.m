//
//  RDCourseTypeViewController.m
//  RDProjectNew
//
//  Created by realdata on 16/4/22.
//  Copyright © 2016年 realdata. All rights reserved.
//

#import "RDCourseTypeViewController.h"
#import "HTTPTool.h"
#import "RDCourseType.h"
#import "Masonry.h"
#import "RDCourseInfo.h"

@interface RDCourseTypeViewController ()
@property (nonatomic,strong) RDCourseType* courseType;
@property (nonatomic,strong) UITextField* courseIdTF;
@end

@implementation RDCourseTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMain];
    [self setNav];
}

-(void)setNav
{
    self.navigationItem.title = @"课程种类";
}
-(void)setMain
{
    [self getCourseType];
    [self setCourseInfoView];
}
-(void)setCourseInfoView
{
    self.courseIdTF = [[UITextField alloc]init];
    self.courseIdTF.placeholder = @"请输入课程ID";
    [self.view addSubview:self.courseIdTF];
    [self.courseIdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.left.mas_equalTo(self.view.mas_centerX).offset(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(25);
    }];
    UIButton *courseIdInfoBtn = [[UIButton alloc]init];
    courseIdInfoBtn.backgroundColor = [UIColor purpleColor];
    [courseIdInfoBtn setTitle:@"查询" forState:UIControlStateNormal];
    [courseIdInfoBtn addTarget:self action:@selector(getCourseInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:courseIdInfoBtn];
    [courseIdInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(self.view.mas_centerX).offset(0);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-60);
        make.height.mas_equalTo(25);
    }];
}
-(void)getCourseInfo
{
    [HTTPTool chargeCourseInfo:[self.courseIdTF.text integerValue] Success:^(NSDictionary *dic) {
        [self addCourseInfoLabel:dic];
    } failed:^(NSDictionary *dic) {
        
    }];
}
-(void)addCourseInfoLabel:(NSDictionary *)dic
{
    UILabel* courseInfoLabel = [[UILabel alloc] init];
    RDCourseInfo *courseInfo = [RDCourseInfo parseWithJson:dic];
    courseInfoLabel.numberOfLines = 0;
    courseInfoLabel.text = [NSString stringWithFormat:@"课程内容:%@\n课程价格:%ld\n课程摘要:%@\n",courseInfo.course_content,(long)courseInfo.coursePrice,courseInfo.courseAbstract];
    courseInfoLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:courseInfoLabel];
    [courseInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_centerX).offset(0);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(-120);

    }];
    
}
-(void)getCourseType{
    [HTTPTool chargeCourseTypeSuccess:^(NSDictionary *dic) {
        [self addCourseType:dic];
    } failed:^(NSDictionary *dic) {
        
    }];
}
-(void)addCourseType:(NSDictionary *)dic
{

    UILabel* courseTypeLabel = [[UILabel alloc] init];
    courseTypeLabel.numberOfLines = 0;
    NSArray* courseTypeArray = [RDCourseType courseType:dic];
    NSString* str = [[NSString alloc]init];
    for (RDCourseTypeData* data in courseTypeArray) {
        str = [str stringByAppendingFormat:@"课程ID:%ld;课程名称:%@",(long)data.courseTypeId,data.courseTypeName];
    }
    courseTypeLabel.text = str;
    courseTypeLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:courseTypeLabel];
    [courseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.view.mas_centerX).offset(0);
        make.bottom.mas_equalTo(-120);
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
