//
//  YXQCustomAnimationController.m
//  YXQ
//
//  Created by 袁野 on 16/9/23.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQCustomAnimationController.h"
#import <Masonry.h>

@interface YXQCustomAnimationController()
{
    YXQAnimationType privateType;
    CGRect iconFrame;
    UIImage *_img;
    UIImageView *imgV;
}

@end
@implementation YXQCustomAnimationController


-(instancetype)initCustiomAnimationControllerWithType:(YXQAnimationType)type andFrame:(CGRect)frame iconImg:(UIImage *)img{
    self = [super init];
    if (self) {
        privateType = type;
        iconFrame = frame;
        _img = img;
    }
    return self;
    
}

+(instancetype)custiomAnimationControllerWithType:(YXQAnimationType)type andFrame:(CGRect)frame iconImg:(UIImage *)img{
    
    return [[self alloc]initCustiomAnimationControllerWithType:type andFrame:frame iconImg:img];
}

//入场出场动画时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return privateType == YXQAnimationTypePresnet ? 0.5 : 0.3;
}

//会把动画上下文传入方法
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (privateType) {
        case YXQAnimationTypePresnet:
            [self performPresentAnimationWithContext:transitionContext];
            break;
        case YXQAnimationTypeDismiss:
            [self performDismissAnimationWithContext:transitionContext];
            break;
        default:
            break;
    }
}

//入场动画
-(void)performPresentAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    //获取过渡上下文管理的两个控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contentView = [transitionContext containerView];//视图容器
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    tempView.tag = 1;
    fromVC.view.hidden = YES;
    [contentView addSubview:tempView];
    [contentView addSubview:toVC.view];
    
    //toVC.view 的起始坐标
    toVC.view.frame = iconFrame;

    //前面是获取参数,现在是动画开始

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //toVC.view 的终点坐标
        toVC.view.frame = CGRectMake(0, (kScreenHeight-kScreenWidth)*0.5, kScreenWidth, kScreenWidth);
        
//        imgV.frame = toVC.view.bounds;
        tempView.transform = CGAffineTransformMakeScale(0.9, 0.95);
        tempView.alpha = 0.5;
    } completion:^(BOOL finished) {
        //告诉上下文我的动画完成了
        [transitionContext completeTransition:YES];
    }];
    
}

//出场动画
-(void)performDismissAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    //获取过渡上下文管理的两个控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contentView = [transitionContext containerView];
    UIView *tempView = [contentView viewWithTag:1];
    
    //动画开始
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.frame = iconFrame;
        
        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        toVC.view.hidden = NO;
        [tempView removeFromSuperview];
    }];
}
















@end
