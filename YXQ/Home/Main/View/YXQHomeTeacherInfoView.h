//
//  YXQHomeTeacherInfoView.h
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXQHomeTeacherInfoModel.h"

typedef void (^actionBlock)();
@interface YXQHomeTeacherInfoView : UIView
@property(strong, nonatomic)YXQHomeTeacherInfoModel *infoModel;
@property(copy,nonatomic)UIImage *iconImg;
-(void)hanleEventForNameIconTaped:(UIControlEvents)event withAction:(actionBlock)block;

@end
