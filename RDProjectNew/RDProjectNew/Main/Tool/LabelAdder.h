//
//  LabelAdder.h
//  RDProject
//
//  Created by tarena on 16/3/5.
//  Copyright © 2016年 Pucka06. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LabelAdder : NSObject

-(UILabel *)labelNoticeAdder:(NSString* )notice andMode : (BOOL)x;

-(void) labelLayout : (UILabel *)label;

@end
