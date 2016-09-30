//
//  YXQHomeMainController.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQHomeMainController.h"
#import "YXQHomeClassNotyView.h"
#import "WZZEndlessLoopScrollView.h"
#import "YXQHomeTeacherInfoView.h"
#import "YXQShowIconViewController.h"
#import "YXQHomeCheckView.h"

@interface YXQHomeMainController ()<WZZEndlessLoopScrollViewDelegate>
@property (weak,nonatomic) UIScrollView *homeScrollView;
@end

@implementation YXQHomeMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGB(243/255.0, 249/255.0, 246/255.0);
    [self configHomeItem];//配置导航栏
    [self configSubViews];//配置子视图
    
}

-(void)configSubViews{
#if 1
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTopBarHeight)];
    [self.view addSubview:sc];
    self.homeScrollView = sc;
#endif
    //1通知View
    WZZEndlessLoopScrollView *classNotyView = [[WZZEndlessLoopScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)animationScrollDuration:2];
    classNotyView.loopDelegate = self;
    [self.homeScrollView addSubview:classNotyView];
    //2老师信息View
    YXQHomeTeacherInfoView *infoView = [[YXQHomeTeacherInfoView alloc]initWithFrame:CGRectMake(0, classNotyView.bounds.size.height+5, kScreenWidth, 65)];
    infoView.iconImg = [UIImage imageNamed:@"2"];
    [self.homeScrollView addSubview:infoView];
    [infoView setInfoModel:nil];
    WeakSelf(weakself);
    [infoView hanleEventForNameIconTaped:(UIControlEventTouchUpInside) withAction:^{
        YXQShowIconViewController *showIcon = [[YXQShowIconViewController alloc]initWithIconFrame:CGRectMake(0, 130, 60, 60) iconImg:infoView.iconImg];
        [weakself presentViewController:showIcon animated:YES completion:nil];
    }];
    
    //3打卡记录
    YXQHomeCheckView *checkView = [[YXQHomeCheckView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(infoView	.frame)+5, kScreenWidth, 185)];
    [sc addSubview:checkView];
    
    
    
    
}

-(NSInteger)numberOfContentViewsInLoopScrollView:(WZZEndlessLoopScrollView *)loopView{
    return 3;
}

-(UIView *)loopScrollView:(WZZEndlessLoopScrollView *)loopView contentViewForIndex:(NSInteger)index{

    YXQHomeClassNotyView *notyView = [[YXQHomeClassNotyView alloc]initWithFrame:loopView.bounds];
    notyView.model = nil;
    
    notyView.backgroundColor = [UIColor whiteColor];
    [notyView setModel:nil];
    return notyView;
}

-(void)configHomeItem{
    self.navigationItem.title = @"悦学圈";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
