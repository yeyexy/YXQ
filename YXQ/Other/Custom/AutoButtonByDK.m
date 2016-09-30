//
//  AutoButtonByDK.m
//  自定义按钮
//
//  Created by 袁野 on 16/9/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "AutoButtonByDK.h"

@interface AutoButtonByDK ()
@property(copy)ActionBlock copyBlock;

@property(strong, nonatomic,readonly)UIImageView *imageView;
@property (weak,nonatomic,readonly) UILabel *titleLabel;
@property(strong, nonatomic)UIColor *hilighteColor;
@property(assign, nonatomic)CGFloat FontsWithImageScale;


@end

@implementation AutoButtonByDK

-(instancetype)initWithImage:(UIImage *)image and:(NSString *)title complete:(ActionBlock)block{
    if (self = [super init]) {
        
        NSLog(@"%@",block);
        NSLog(@"%@",_copyBlock);
        _copyBlock = block;
        
        UIImageView *IV = [[UIImageView alloc]initWithImage:image];
        
        _imageView = IV;
        [self addSubview:IV];
        
        UILabel *label = [[UILabel alloc]init];
        
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        _titleLabel = label;
        [self addSubview:label];
        
        NSLog(@"%@",_copyBlock);
        return self;
    }
    return nil;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
   
    [self layoutIfNeeded];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    WeakSelf(weakself);
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself).offset(2);
        make.centerX.equalTo(weakself.mas_centerX);
        make.bottom.equalTo(weakself).multipliedBy(0.5);
        make.width.equalTo(_imageView.mas_height).multipliedBy(1.05);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakself);
        make.top.equalTo(_imageView.mas_bottom);
        make.bottom.equalTo(weakself);
    }];
//    CGRect superframe = self.frame;
    
//    self.imageView.frame = CGRectMake(superframe.size.width*0.5-superframe.size.height*0.35,superframe.size.height*0.1 , superframe.size.height*0.7, superframe.size.height*0.7);
//    self.titleLabel.frame = CGRectMake(0, superframe.size.height*0.8, superframe.size.width, superframe.size.height*0.3);
//    NSLog(@"self.fr  %@",NSStringFromCGRect(self.frame));
//    self.FontsWithImageScale = 0.5;
////
////    /// 开始干活了
////    CGRect superframe = self.frame;
////    /// (W - w ) / 2 (H - h) /2 ---> x,y
////    
////    CGFloat W1 = superframe.size.width* _FontsWithImageScale;
////    CGFloat H1 = superframe.size.width*_FontsWithImageScale;
////    self.imageView.frame = CGRectMake((superframe.size.width - W1) / 2, 0, W1 , H1);
////    
//    CGFloat H = superframe.size.width * (1-_FontsWithImageScale);
////    self.titleLabel.frame = CGRectMake(0,CGRectGetMaxY(self.imageView.frame),
////                                       superframe.size.width,
////                                       H);
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 2;
 
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了");
    
    NSLog(@"block --> %@",_copyBlock);
    
    if (_copyBlock) {
        
        _copyBlock(self);
    }
}
@end
