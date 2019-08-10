//
//  ViewController.m
//  TableViewCellEditDemo
//
//  Created by 尾灯 on 2018/11/12.
//  Copyright © 2018 尾灯. All rights reserved.
//

#import "ViewController.h"
#import "FirstWayViewController.h"
#import "SecondWayViewController.h"
#import "ThridWayViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[@"系统方式实现删除、插入、移动",@"侧滑cell右侧系统方式实现多个按钮", @"侧滑cell右侧自定义实现多个按钮"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        FirstWayViewController *firstWayVC = [[FirstWayViewController alloc] init];
        [self.navigationController pushViewController:firstWayVC animated:YES];
    }else if(indexPath.row == 1){
        SecondWayViewController *secondWayVC = [[SecondWayViewController alloc] init];
        [self.navigationController pushViewController:secondWayVC animated:YES];
    }else{
        ThridWayViewController *thridWayVC = [[ThridWayViewController alloc] init];
        [self.navigationController pushViewController:thridWayVC animated:YES];
    }
}

@end
