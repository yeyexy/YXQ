//
//  YXQHomeClassNotyView.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXQHomeClassNotyView.h"
#import <Masonry.h>

@interface YXQHomeClassNotyView()
{
    UIImageView *notyImgV;
    UILabel *titleLabel;
    UILabel *contentLabel;
    UILabel *dateLabel;
    UILabel *replyLabel;
    UIImageView *replyImgV;
    NSMutableDictionary *modelDic;
}

@property(strong, nonatomic)NSMutableDictionary *deadeModel;
@end
@implementation YXQHomeClassNotyView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    notyImgV = [[UIImageView alloc]init];
    [self addSubview:notyImgV];
    titleLabel = [[UILabel alloc]init];
    [self addSubview:titleLabel];
    contentLabel = [[UILabel alloc]init];
    [self addSubview:contentLabel];
    dateLabel = [[UILabel alloc]init];
    [self addSubview:dateLabel];
    replyLabel = [[UILabel alloc]init];
    [self addSubview: replyLabel];
    replyImgV = [[UIImageView alloc]init];
    [self addSubview:replyImgV];

}

- (void)setModel:(YXQHomeClassNotyModel *)model{
    _model = model;
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
    
    //先把数据写死
    if (!modelDic) {
        modelDic = [NSMutableDictionary dictionary];
    }
    modelDic[@"title"] = @"请各位家长注意,学校决定在明天过后不收学费!";
    modelDic[@"content"] = @"应国家要求以后读书都不收学费,不得在外补课,所有高校考试全部不考,你想读哪个学校就读哪个学校,完全跟着感觉走,你信还是不信,不管你信不信反正我信了";
    modelDic[@"date"] = @"2000-1-1";
    modelDic[@"replyCount"] = @"100";

    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints{
    [super updateConstraints];
    
    //左侧img
    
    UIImage *img = [UIImage imageNamed:@"班级"];
    notyImgV.image = img;
    //    notyImgV.frame = CGRectMake(5, 5, 60, 60);
    
    
    //标题
    titleLabel.text = modelDic[@"title"];
    titleLabel.font = [UIFont systemFontOfSize:14 ];
    
    //通知内容
    
    NSString *str = modelDic[@"content"];
    if (str.length >25) {
        str = [str substringWithRange:NSMakeRange(0, 25)];
        str = [str stringByAppendingString:@"..."];
    }
    contentLabel.text = str;
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.font = [UIFont systemFontOfSize:12 ];
    contentLabel.textColor = kDarkGrayColor;
    
    //日期
    
    dateLabel.text = modelDic[@"date"];
    dateLabel.font = [UIFont systemFontOfSize:10 ];
    dateLabel.textColor = kGrayColor;
    
    //评论数
    
    replyLabel.text = modelDic[@"replyCount"];
    replyLabel.font = [UIFont systemFontOfSize:10 ];
    replyLabel.textColor = kGrayColor;
    
    
    //评论图片
    UIImage *reImg = [UIImage imageNamed:@"main-评论"];
    replyImgV.image = reImg;
}

//布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    
#if 1
    //左侧图片
    WeakSelf(weakself);
    [notyImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).offset(10);
        make.left.equalTo(weakself.mas_left).offset(10);
        make.bottom.equalTo(weakself.mas_bottom).offset(-10);
        
        make.width.equalTo(notyImgV.mas_height);
        
    }];
    //标题
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(notyImgV.mas_right).offset(10);
        make.top.equalTo(notyImgV.mas_top);
        make.height.equalTo(notyImgV.mas_height).multipliedBy(0.3);
        make.width.equalTo(weakself.mas_width).multipliedBy(0.6);
        
    }];
    
    //通知内容约束
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(notyImgV.mas_right).offset(10);
        make.right.equalTo(weakself.mas_right).offset(-5);
        make.top.equalTo(titleLabel.mas_bottom).offset(0);
        //        make.height.equalTo(notyImgV.mas_height).multipliedBy(0.8);
        make.bottom.equalTo(weakself.mas_bottom);
        
    }];
    
    //日期约束
    
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(1);
        make.right.equalTo(weakself.mas_right);
        make.top.equalTo(titleLabel.mas_top);
        make.height.equalTo(titleLabel.mas_height).multipliedBy(0.8);
        
    }];
    
    //评论约束
    [replyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).offset(-10);
        make.bottom.equalTo(weakself.mas_bottom).offset(-10);
        make.width.equalTo(@20);
        make.height.equalTo(@10);
    }];
    
    //评论图片约束
    [replyImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(replyLabel.mas_left).offset(0);
        make.bottom.equalTo(weakself.mas_bottom).offset(-10);
        make.width.height.equalTo(@10);
    }];
    
    
#endif
}

-(void)dealloc{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
