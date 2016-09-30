//
//  YXQCustomAnimationController.h
//  YXQ
//
//  Created by 袁野 on 16/9/23.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,YXQAnimationType){
    YXQAnimationTypePresnet = 0,
    YXQAnimationTypeDismiss
    
};

@interface YXQCustomAnimationController : NSObject<UIViewControllerAnimatedTransitioning>

+(instancetype)custiomAnimationControllerWithType:(YXQAnimationType)type andFrame:(CGRect)frame iconImg:(UIImage *)img;
-(instancetype)initCustiomAnimationControllerWithType:(YXQAnimationType)type andFrame:(CGRect)frame iconImg:(UIImage *)img;

@end
