//
//  WZZEndlessLoopScrollView.h
//  WZZEndlessScrollView
//
//  Created by 王召洲 on 16/9/6.
//  Copyright © 2016年 wyzc. All rights reserved.
//

// 实现无限滚动的一种思路：局限性：1没有对外公开滚动方向，2滚动子视图的大小跟父视图一样大；
//两个对外接口
//分类私有
#import <UIKit/UIKit.h>
@class WZZEndlessLoopScrollView;
@protocol WZZEndlessLoopScrollViewDelegate <NSObject>

@required

-(NSInteger)numberOfContentViewsInLoopScrollView:(WZZEndlessLoopScrollView *)loopView;
-(UIView*)loopScrollView:(WZZEndlessLoopScrollView*)loopView contentViewForIndex:(NSInteger)index;
@optional

-(void)loopScrollView:(WZZEndlessLoopScrollView*)loopView currentContentViewAtindex:(NSInteger)index;

-(void)loopScrollView:(WZZEndlessLoopScrollView *)loopView DidSelectedContentViewAtIndex:(NSInteger)index;
@end

#import <UIKit/UIKit.h>

@interface WZZEndlessLoopScrollView : UIView
@property (weak,nonatomic) id <WZZEndlessLoopScrollViewDelegate> loopDelegate;
// durarion <= 0 不会自动滚动
-(instancetype)initWithFrame:(CGRect)frame animationScrollDuration:(NSTimeInterval)duration;
//-(void)reloadData; 可以不公开
@end



