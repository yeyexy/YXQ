//
//  AutoButtonByDK.h
//  自定义按钮
//
//  Created by 袁野 on 16/9/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(UIView *sender);
@interface AutoButtonByDK : UIView

-(instancetype)initWithImage:(UIImage *)image and:(NSString *)title complete:(ActionBlock)block;

@end
