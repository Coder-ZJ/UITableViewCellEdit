//
//  ThridWayViewController.m
//  TableViewCellEditDemo
//
//  Created by 尾灯 on 2019/8/10.
//  Copyright © 2019 尾灯. All rights reserved.
//

#import "ThridWayViewController.h"

@interface ThridWayViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ThridWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

/*
 //自定义有图片按钮
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.datas removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }];

    UITableViewRowAction *addAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"插入" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.datas insertObject:@"我是新插入的Cell" atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }];
    addAction.backgroundColor = [UIColor greenColor];
    return @[deleteAction,addAction];
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UIView *subview in tableView.subviews) {
        if ([NSStringFromClass([subview class]) isEqualToString:@"UISwipeActionPullView"]) {
            if ([NSStringFromClass([subview.subviews[0] class]) isEqualToString:@"UISwipeActionStandardButton"]) {
                UIButton *collectBtn = subview.subviews[0];
                collectBtn.backgroundColor = [UIColor greenColor];
                [collectBtn setImage:[UIImage imageNamed:@"collect_icon"] forState:UIControlStateNormal];
                [collectBtn setTitle:@"插入" forState:UIControlStateNormal];

                UIButton *deleteBtn = subview.subviews[1];
                [deleteBtn setImage:[UIImage imageNamed:@"delete_icon"] forState:UIControlStateNormal];
                [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
            }
        }
    }
}
*/
#pragma mark -UITableViewDelegate
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"收藏" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {

    }];
    action.image = [UIImage imageNamed:@"collect_icon"];
    action.backgroundColor = [UIColor greenColor];
    return [UISwipeActionsConfiguration configurationWithActions:@[action]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

#pragma mark -lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
- (NSMutableArray *)datas
{
    if (!_datas) {
        NSArray *array = @[@"第 1 个Cell",@"第 2 个Cell",@"第 3 个Cell",@"第 4 个Cell",@"第 5 个Cell"];
        _datas = [[NSMutableArray alloc] initWithArray:array];
    }
    return _datas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
