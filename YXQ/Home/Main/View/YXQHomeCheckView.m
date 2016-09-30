//
//  YXQHomeCheckView.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQHomeCheckView.h"
#import "Masonry.h"
#import "customCheckShow.h"

@interface YXQHomeCheckView ()
{
    UIImageView *iconV;
    UILabel *nameLabel;
    UIImageView *checkZ;
    UIImageView *checkY;
    UILabel *labelZ;
    UILabel *labelY;
    UILabel *line1;
    customCheckShow *checkShow1;
    customCheckShow *checkShow2;
    UILabel *line2;
    UIButton *moreBtn;
    
}
@end

@implementation YXQHomeCheckView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.backgroundColor = kWhiteColor;
    
    //姓名图标
    iconV = [[UIImageView alloc]init];
    UIImage *iconImg = [UIImage imageNamed:@"icon_figure"];
    iconV.image = iconImg;
    [self addSubview:iconV];
    
    //姓名.今日打卡
    nameLabel = [[UILabel alloc]init];
    NSString *name = @"王小丫";
    nameLabel.text = [NSString stringWithFormat:@"%@今日打卡",name];
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    //打卡正常/异常图例
    UIImage *imgZ = [UIImage imageNamed:@"icon_small_normal"];
    UIImage *imgY = [UIImage imageNamed:@"icon_small_abnormal"];
    checkZ = [[UIImageView alloc]init];
    checkY = [[UIImageView alloc]init];
    checkZ.image = imgZ;
    checkY.image = imgY;
    [self addSubview:checkZ];
    [self addSubview:checkY];
    
    //打卡正常/异常文字
    labelZ = [[UILabel alloc]init];
    labelZ.font = [UIFont systemFontOfSize:10];
    labelZ.text = @"打卡正常";
    [self addSubview:labelZ];
    
    //打卡正常/异常文字
    labelY = [[UILabel alloc]init];
    labelY.font = [UIFont systemFontOfSize:10];
    labelY.text = @"打卡异常";
    [self addSubview:labelY];
    
    //分割线1
    line1 = [[UILabel alloc]init];
    line1.backgroundColor = kRGB(239/255.0, 240/255.0, 241/255.0);
    [self addSubview:line1];
    
    //打卡数据1
    NSArray *arr = @[@1,@"15:30",@"迟到"];
    NSNumber *num = arr[0];
    int i = [num intValue];
    checkShow1 = [[customCheckShow alloc]initWithState:i time:arr[1] iflate:arr[2]];
    
    [self addSubview:checkShow1];
    
    //分割线2
    line2 = [[UILabel alloc]init];
    line2.backgroundColor = kRGB(239/255.0, 240/255.0, 241/255.0);
    [self addSubview:line2];
    
    //打卡数据2
    NSArray *arr1 = @[@0,@"12:30",@""];
    NSNumber *num1 = arr1[0];
    int j = [num1 intValue];
    checkShow2 = [[customCheckShow alloc]initWithState:j time:arr1[1] iflate:arr1[2]];
    
    [self addSubview:checkShow2];
    
    //更多数据
    moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [moreBtn setTitle:@"更多打卡记录" forState:(UIControlStateNormal)];
    moreBtn.backgroundColor= kRGB(243/255.0, 251/255.0, 253/255.0);
    UILabel *line_1 = [[UILabel alloc]init];
    line_1.backgroundColor = kRGB(239/255.0, 240/255.0, 241/255.0);
    [self addSubview:line_1];
}

-(void)setCheckModel:(YXQHomeCheckingModel *)checkModel{
    
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    WeakSelf(weakself);
    [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakself).offset(10);
        make.bottom.equalTo(weakself).multipliedBy(0.15);
        make.width.equalTo(iconV.mas_height).multipliedBy(1.3);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself).offset(10);
        make.bottom.equalTo(iconV);
        make.left.equalTo(iconV.mas_right).offset(2);
    }];
    
    [checkY mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(nameLabel).offset(2);
        make.right.equalTo(weakself).multipliedBy(0.6);
        make.centerY.equalTo(iconV);
        make.width.equalTo(checkY.mas_height);
    }];
    

    [checkZ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel).offset(2);
        make.right.equalTo(weakself).multipliedBy(0.8);
        make.centerY.equalTo(iconV);
        make.width.equalTo(checkZ.mas_height);
    }];
    
    [labelY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(checkY);
        make.left.equalTo(checkY.mas_right).offset(2);
        make.bottom.equalTo(checkY);
        make.right.equalTo(checkZ.mas_left).offset(-5);
    }];
    
    [labelZ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(checkZ);
        make.left.equalTo(checkZ.mas_right).offset(2);
        make.bottom.equalTo(checkZ);

    }];

    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(10);
        make.height.equalTo(@1);
        make.width.equalTo(weakself);
    }];

    //第二排
    [checkShow1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.height.equalTo(weakself).multipliedBy(0.25);
        make.width.equalTo(weakself);
    }];

    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(checkShow1.mas_bottom);
        make.height.equalTo(@1);
        make.width.equalTo(weakself).multipliedBy(0.9);
        make.centerX.equalTo(weakself);
    }];

    [checkShow2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.mas_bottom);
        make.height.equalTo(weakself).multipliedBy(0.25);
        make.width.equalTo(weakself);
    }];
    
}









@end