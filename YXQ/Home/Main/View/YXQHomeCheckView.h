//
//  YXQHomeCheckView.h
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXQHomeCheckingModel.h"

@interface YXQHomeCheckView : UIView
@property(strong, nonatomic)YXQHomeCheckingModel *checkModel;

-(void)setCheckModel:(YXQHomeCheckingModel *)checkModel;

@end
