//
//  YXQMessageCenterCell.m
//  YXQ
//
//  Created by 袁野 on 16/9/29.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQMessageCenterCell.h"
#import <Masonry.h>

@interface YXQMessageCenterCell()
{
    UIImageView *imgV;
    UILabel *titleLabel;
    UILabel *contentLabel;
    UILabel *dateLabel;
    UIButton *btn;
}

@end
@implementation YXQMessageCenterCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    imgV = [[UIImageView alloc]init];
    imgV.image = _img;
    
    
    titleLabel = [[UILabel alloc]init];
    
    
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    contentLabel = [[UILabel alloc]init];
    
    
    contentLabel.font = [UIFont systemFontOfSize:11];
    
    dateLabel = [[UILabel alloc]init];
    
    
    dateLabel.font = [UIFont systemFontOfSize:8];
    
    [self.contentView addSubview:imgV];
    [self.contentView addSubview:titleLabel];
    [self.contentView addSubview:contentLabel];
    [self.contentView addSubview:dateLabel];
}

-(void)setLeftImage:(NSString *)leftImg angTitle:(NSString *)title andContent:(NSString *)content date:(NSString *)date{
    imgV.image = [UIImage imageNamed:leftImg];
    titleLabel.text = title;
    contentLabel.text = content;
    dateLabel.text = date;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    WeakSelf(weakself);
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakself.contentView).offset(10);
        make.bottom.equalTo(weakself.contentView).offset(-10);
        make.width.equalTo(imgV.mas_height);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgV.mas_top).offset(0);
        make.left.equalTo(imgV.mas_right).offset(5);
        make.bottom.equalTo(weakself.contentView).multipliedBy(0.5);
        make.width.equalTo(@100);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
         make.left.equalTo(imgV.mas_right).offset(5);
        make.right.equalTo(weakself.contentView).offset(-30);
        make.bottom.equalTo(weakself.contentView).offset(-10);
    }];
//
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_top).offset(0);
        make.right.equalTo(weakself.contentView).offset(0);
        make.bottom.equalTo(weakself.contentView).multipliedBy(0.3);
        make.width.equalTo(weakself.contentView).multipliedBy(0.3);
    }];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
