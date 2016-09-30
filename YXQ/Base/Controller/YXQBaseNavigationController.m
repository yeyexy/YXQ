//
//  YXQBaseNavigationController.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQBaseNavigationController.h"

@interface YXQBaseNavigationController ()

@end

@implementation YXQBaseNavigationController
//初始化类对象调用的方法
+ (void)initialize{
    [[UINavigationBar appearance]setBarTintColor:kIconBlue];
    [[UINavigationBar appearance]setTranslucent:NO];
    NSMutableDictionary *colordic = [NSMutableDictionary dictionary];
    colordic[NSForegroundColorAttributeName] = kFontColorWhite;
    colordic[NSFontAttributeName] = kFontSize(25);
    
    [[UINavigationBar appearance]setTitleTextAttributes:colordic];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count> 0) {
        UIButton *backbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        UIImage *img = [UIImage imageNamed:@"back"];
        [backbtn setImage:img forState:(UIControlStateNormal)];
        backbtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backbtn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:(UIControlEventTouchUpInside)];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backbtn];
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    [super pushViewController:viewController animated:animated];
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
