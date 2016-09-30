//
//  YXQShowIconViewController.m
//  YXQ
//
//  Created by 袁野 on 16/9/23.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQShowIconViewController.h"
#import "YXQCustomAnimationController.h"

@interface YXQShowIconViewController ()<UIViewControllerTransitioningDelegate>
{
    CGRect privateFrame;
    UIImage *_img;
    UIImageView *imgV;
}
@end

@implementation YXQShowIconViewController

- (instancetype)initWithIconFrame:(CGRect)iconframe iconImg:(UIImage *)img
{
    self = [super init];
    if (self) {
        
        //使用自定义转场动画
        privateFrame = iconframe;
        self.modalPresentationStyle = UIModalPresentationCustom;
        //必须提供自定义转场动画
        self.transitioningDelegate = self;//代理提供转场动画
        _img = img;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = kGrayColor;
    imgV = [[UIImageView alloc]init];
    imgV.image = _img;
    NSLog(@"%@",_img);
    [self.view addSubview:imgV];
    
    [self.view addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew) context:nil];
    // Do any additional setup after loading the view.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    imgV.frame = self.view.bounds;
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
}

-(void)dealloc{
    [self.view removeObserver:self forKeyPath:@"frame"];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [YXQCustomAnimationController custiomAnimationControllerWithType:YXQAnimationTypeDismiss andFrame:privateFrame iconImg:_img];//提供转场消失动画
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    
    return [YXQCustomAnimationController custiomAnimationControllerWithType:YXQAnimationTypePresnet andFrame:privateFrame iconImg:_img];//提供转场入场动画
}

////rootview的大小
//-(CGSize)preferredContentSize{
//    return CGSizeMake(kScreenWidth, kScreenHeight);
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
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
