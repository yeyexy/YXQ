//
//  customCheckShow.m
//  YXQ
//
//  Created by 袁野 on 16/9/30.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "customCheckShow.h"
@interface customCheckShow()
{
    customCheckType checkType;
    NSString *_time;
    NSString *ifLate;
    
    UIImageView *stateView;
    UILabel *stateLabel;
    UILabel *timeLabel;
    UILabel *lateLabel;
    UIImageView *lateView;
    
    
}

@end
@implementation customCheckShow

- (instancetype)initWithState:(customCheckType)type time:(NSString *)timestr iflate:(NSString *)late
{
    self = [super init];
    if (self) {
        checkType = type;
        _time = timestr;
        ifLate = late;
        [self setupUI];
        
    }
    return self;
}



-(void)setupUI{
    UIImage *imgin = [UIImage imageNamed:@"icon_in_school"];
    UIImage *imgout = [UIImage imageNamed:@"icon_out_school"];
    stateView = [[UIImageView alloc]init];
    stateView.frame = CGRectMake(20, 10, 30, 30);
    switch (checkType) {
        case customCheckTypeComein:
            stateView.image = imgin;
            break;
        case customCheckTypeGohome:
            stateView.image = imgout;
            break;
        default:
            break;
    }
//    stateView.image = imgin;
    [self addSubview:stateView];
    
    stateLabel = [[UILabel alloc]init];
    stateLabel.font = [UIFont systemFontOfSize:11];
    switch (checkType) {
        case customCheckTypeComein:
            stateLabel.text = @"进校";
            break;
        case customCheckTypeGohome:
            stateLabel.text = @"出校";
            break;
        default:
            break;
    }
//    stateLabel.text = @"进校";
    [self addSubview:stateLabel];
    
    timeLabel =[[UILabel alloc]init];
    timeLabel.font = [UIFont systemFontOfSize:11];
    timeLabel.text = _time;
    
    [self addSubview:timeLabel];
    
    lateLabel =[[UILabel alloc]init];
    lateLabel.font = [UIFont systemFontOfSize:10];
    lateLabel.textColor =kRGB(170/255.0, 170/255.0, 170/255.0);
    lateLabel.text = ifLate;
    [self addSubview:lateLabel];
    
    UIImage *lateimg = [UIImage imageNamed:@"icon_small_abnormal"];
    UIImage *lateimg1 = [UIImage imageNamed:@"icon_small_normal"];
    lateView = [[UIImageView alloc]init];
    if ([ifLate isEqual:@"迟到"]) {
        lateView.image = lateimg;
    }else{
        lateView.image = lateimg1;
    }
    [self addSubview:lateView];
    
    

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    WeakSelf(weakself);
    [stateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself).offset(12);
        make.bottom.equalTo(weakself).offset(-12);
        make.left.equalTo(weakself).offset(15);
        make.width.equalTo(stateView.mas_height);

    }];
    
    
    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stateView);
        make.bottom.equalTo(stateView);
        make.left.equalTo(stateView.mas_right).offset(5);
    }];
//
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stateView);
        make.bottom.equalTo(stateView);
        make.left.equalTo(stateLabel.mas_right).offset(5);
    }];
//
    [lateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself).offset(15);
        make.bottom.equalTo(weakself).offset(-15);
        make.right.equalTo(weakself.mas_right).offset(-20);
        make.width.equalTo(lateView.mas_height).multipliedBy(1.1);
    }];
//
    [lateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lateView);
        make.bottom.equalTo(lateView);
        make.right.equalTo(lateView.mas_left).offset(-5);
        make.width.equalTo(weakself).multipliedBy(0.07);
    }];
//
    
    
    
    
    
    
}





















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
