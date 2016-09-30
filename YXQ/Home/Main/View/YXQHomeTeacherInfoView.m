//
//  YXQHomeTeacherInfoView.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQHomeTeacherInfoView.h"
#import <Masonry.h>
#import "UIView+Frame.h"
#import "AutoButtonByDK.h"

@interface YXQHomeTeacherInfoView()
@property (weak,nonatomic) UIButton *iconNameBtn;
@property (weak,nonatomic) UIView *onlineLeaveBtn;
@property (weak,nonatomic) UIView *callForTeacherBtn;
@property (copy,nonatomic) actionBlock iconNameBlock;
@property (copy,nonatomic) actionBlock askForLeaveBlock;
@property (copy,nonatomic) actionBlock callTeacherBlock;
@end

@implementation YXQHomeTeacherInfoView


-(void)setInfoModel:(YXQHomeTeacherInfoModel *)infoModel{
    //数据写死在本地
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *leftIcon = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftIcon setTitle:@"头像" forState:(UIControlStateNormal)];
    [leftIcon setImage:_iconImg forState:(UIControlStateNormal)];
    leftIcon.backgroundColor = kBlueColor;
    leftIcon.layer.cornerRadius = (self.bounds.size.height-20)/2;
    leftIcon.layer.masksToBounds = YES;
//    leftIcon.frame = CGRectMake(5, 5, KSelfHeight-10,KSelfHeight-10 );
    [self addSubview:leftIcon];
    self.iconNameBtn = leftIcon;
    
    UILabel *teacherName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftIcon.frame)+5, 5, 150, 30 )];
    teacherName.text = @"老王八";
//    teacherName.frame = CGRectMake(5+leftIcon.bounds.size.width+5, 10, KSelfWidth*1/6.0, leftIcon.bounds.size.height*0.33);
    teacherName.font = [UIFont systemFontOfSize:12];
    [self addSubview:teacherName];
    
    UILabel *phoneNum = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftIcon.frame)+5, CGRectGetMaxY(teacherName.frame)+5, 150, 20)];
//    phoneNum.frame = CGRectMake(5+leftIcon.bounds.size.width+5, 15+teacherName.bounds.size.height, KSelfWidth*1/6.0*2, leftIcon.bounds.size.height*0.33);
    phoneNum.text = @"10086234233";
    phoneNum.font = [UIFont systemFontOfSize:12];
    phoneNum.textColor = kRGB(17/256.0, 166/256.0, 154/256.0);
    [self addSubview:phoneNum];
    
    UILabel *teacher = [[UILabel alloc]init];
    teacher.text = @"班主任";
    teacher.font = [UIFont systemFontOfSize:10];
    teacher.textColor = kGrayColor;
//    teacher.frame = CGRectMake(CGRectGetMaxX(teacherName.frame)+1, 10,  KSelfWidth*1/6.0, leftIcon.bounds.size.height*0.33);
    [self addSubview:teacher];
    
    

    
    
    
    UIImage *leaveImg =[UIImage imageNamed:@"请假-圆"] ;
    AutoButtonByDK *leaveBtn =[[AutoButtonByDK alloc]initWithImage:leaveImg and:@"在线请假" complete:^(UIView *sender) {
        
    }];
    
    [self addSubview:leaveBtn];
    self.onlineLeaveBtn = leaveBtn;
    

    
    
    
    UIImage *callImg = [UIImage imageNamed:@"联系"];
    AutoButtonByDK *callBtn =[[AutoButtonByDK alloc]initWithImage:callImg and:@"联系老师" complete:^(UIView *sender) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:phoneNum.text]];
        
        
    }];
    
    [self addSubview:callBtn];
    self.callForTeacherBtn = callBtn;
    
    
    
    
    //约束
    //头像
    WeakSelf(weakself);
    [leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakself).offset(8);
        make.bottom.equalTo(weakself).offset(-10);
        make.width.equalTo(leftIcon.mas_height);
    }];
    
    
    
    //姓名
    [teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftIcon).offset(10);
        make.left.equalTo(leftIcon.mas_right).offset(10);
        make.height.equalTo(leftIcon).multipliedBy(0.33);
        make.width.equalTo(weakself).multipliedBy(1/6.0);
    }];
    
    //电话
    [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(teacherName.mas_bottom).offset(5);
        make.width.equalTo(teacherName).multipliedBy(2.1);
        make.left.equalTo(leftIcon.mas_right).offset(10);
        make.bottom.equalTo(leftIcon).offset(-5);
    }];
    
    //班主任
    [teacher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(teacherName).offset(3);
        make.left.equalTo(teacherName.mas_right).offset(-10);
        make.bottom.equalTo(teacherName);
        make.width.equalTo(teacherName);
        
    }];
    
    //请假
    [leaveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself).offset(10);
        make.bottom.equalTo(weakself).offset(-10);
        make.width.equalTo(leaveBtn.mas_height).multipliedBy(1.1);
        make.right.equalTo(weakself).multipliedBy(0.78);
    }];
    
    //联系老师
    [callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself).offset(10);
        make.bottom.equalTo(weakself).offset(-10);
        make.width.equalTo(leaveBtn.mas_height).multipliedBy(1.1);
        make.right.equalTo(weakself).offset(-15);
    }];
    [self layoutIfNeeded];
    
}


-(void)hanleEventForNameIconTaped:(UIControlEvents)event withAction:(actionBlock)block{
    _iconNameBlock = block;
    [self.iconNameBtn addTarget:self action:@selector(dealBlock) forControlEvents:event];
}

-(void)dealBlock{
    if (self.iconNameBlock) {
        self.iconNameBlock();
    }
}

//-(void)hanleEventForOnlineLeaveTaped:(UIControlEvents)event withAction:(actionBlock)block{
//    _askForLeaveBlock = block;
//    [self.onlineLeaveBtn addTarget:self action:@selector(handleLeaveBlock) forControlEvents:event];
//}

//-(void)handleLeaveBlock{
//    if (self.askForLeaveBlock) {
//        self.askForLeaveBlock();
//    }
//}



@end
