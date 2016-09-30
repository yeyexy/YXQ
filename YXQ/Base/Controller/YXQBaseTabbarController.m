//
//  YXQBaseTabbarController.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQBaseTabbarController.h"
#import "YXQBaseNavigationController.h"
#import "YXQHomeMainController.h"
#import "YXQMyChildrenController.h"
#import "YXQPcenterMainController.h"


@interface YXQBaseTabbarController ()

@end

@implementation YXQBaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加子视图
    [self addChildControllerWithClassName:@"YXQHomeMainController" itemImage:@"icon_tab_home" title:@"首页"];
    [self addChildControllerWithClassName:@"YXQMyChildrenController" itemImage:@"icon_tab_person" title:@"我的孩子"];
    [self addChildControllerWithClassName:@"YXQPcenterMainController" itemImage:@"icon_tab_me" title:@"个人中心"];
    //2.请求数据
    

}

- (void)addChildControllerWithClassName:(NSString *)className
                     itemImage:(NSString *)itemImage
                         title:(NSString *)title{
    UIViewController *vc = [[NSClassFromString(className) alloc]init];
    YXQBaseNavigationController *nav = [[YXQBaseNavigationController alloc]initWithRootViewController:vc];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:itemImage];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_press",itemImage]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:nav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
