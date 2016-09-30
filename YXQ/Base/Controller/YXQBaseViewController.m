//
//  YXQBaseViewController.m
//  YXQ
//
//  Created by 袁野 on 16/9/22.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQBaseViewController.h"
#import "YXQMessageCenterController.h"

@interface YXQBaseViewController ()

@end

@implementation YXQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configBaseVCItem];
}

- (void)configBaseVCItem{
    UIImage *ringImg = [[UIImage imageNamed:@"message"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:ringImg style:(UIBarButtonItemStylePlain) target:self action:@selector(calloutMessageCenter)];
}

-(void)calloutMessageCenter{
    //输出消息中心
    NSLog(@"消息中心出来了");
    YXQMessageCenterController *VC = [[YXQMessageCenterController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
    
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
