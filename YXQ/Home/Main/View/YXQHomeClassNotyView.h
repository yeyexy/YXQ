//
//  YXQHomeClassNotyView.h
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXQHomeClassNotyModel.h"

@interface YXQHomeClassNotyView : UIView

@property(strong, nonatomic)YXQHomeClassNotyModel *model;


- (void)setModel:(YXQHomeClassNotyModel *)model;
@end
