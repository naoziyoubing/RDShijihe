//
//  LabelAdder.m
//  RDProject
//
//  Created by tarena on 16/3/5.
//  Copyright © 2016年 Pucka06. All rights reserved.
//

#import "LabelAdder.h"
#import "Masonry.h"

@implementation LabelAdder
-(UILabel *)labelNoticeAdder:(NSString *)notice andMode:(BOOL)x
{
    UILabel *label = [[UILabel alloc] init];
    label.text = notice;
    label.backgroundColor = x ? kCOLORWITHRGB(53, 195, 174) : kCOLORWITHRGB(242, 69, 78);
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(60);
//        make.right.mas_equalTo(-60);
//        make.top.mas_equalTo(60);
//        make.height.mas_equalTo(20);
//    }];
    
    return label;
}

-(void)labelLayout : (UILabel *)label
{
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];

}

@end
