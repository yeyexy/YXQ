//
//  YXQMessageCenterCell.h
//  YXQ
//
//  Created by 袁野 on 16/9/29.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXQMessageCenterCell : UITableViewCell
@property(strong, nonatomic)UIImage *img;
@property(copy,nonatomic)NSString *title;
@property(copy,nonatomic)NSString *contents;
@property(copy,nonatomic)NSString *date;

-(void)setLeftImage:(NSString *)leftImg angTitle:(NSString *)title andContent:(NSString *)content date:(NSString *)date;
@end
