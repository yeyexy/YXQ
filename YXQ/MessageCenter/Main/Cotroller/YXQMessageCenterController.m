//
//  YXQMessageTableViewController.m
//  YXQ
//
//  Created by 袁野 on 16/9/29.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YXQMessageCenterController.h"
#import "YXQMessageCenterCell.h"
#import <MJRefresh.h>

@interface YXQMessageCenterController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)UITableView *messageCenter;
@property(strong, nonatomic)NSArray *messageDic;


@end

@implementation YXQMessageCenterController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = nil;
    
    _messageCenter = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:(UITableViewStylePlain)];
    _messageCenter.delegate = self;
    _messageCenter.dataSource = self;
    _messageCenter.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_messageCenter registerClass:[YXQMessageCenterCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_messageCenter];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //数据处理
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"message.plist" ofType:nil];
    _messageDic = [NSArray arrayWithContentsOfFile:filePath];
    [_messageDic enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@",obj);
    }];
    
    //下拉刷新
    self.messageCenter.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_messageCenter.mj_header endRefreshing];
        });
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _messageDic.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXQMessageCenterCell *cell = [[YXQMessageCenterCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSMutableDictionary *dic = _messageDic[indexPath.row];
    [cell setLeftImage:dic[@"title"] angTitle:dic[@"title"] andContent:dic[@"content"] date:dic[@"date"]];
    
    
    return cell;;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
