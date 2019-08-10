//
//  FirstWayViewController.m
//  TableViewCellEditDemo
//
//  Created by 尾灯 on 2019/8/10.
//  Copyright © 2019 尾灯. All rights reserved.
//

#import "FirstWayViewController.h"

@interface FirstWayViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, assign) NSInteger isInsertOrDelete;//标记是插入还是删除 1 插入、2 删除、 0 None

@end

@implementation FirstWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeAction)];
     UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertAction)];
    self.navigationItem.rightBarButtonItems = @[deleteItem, addItem];

     [self.view addSubview:self.tableView];
}

#pragma mark -Event
//删除
- (void)removeAction
{
    self.isInsertOrDelete = 2;
    //设置编辑状态
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

//插入
- (void)insertAction
{
    self.isInsertOrDelete = 1;
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.datas[indexPath.row]];
    return cell;
}

//提交编辑样式
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除
        [self.datas removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }else if (editingStyle == UITableViewCellEditingStyleInsert){
        //添加
        [self.datas insertObject:@"我是新插入的Cell" atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }else{

    }
}

//实现这个代理方法,当cell处于编辑状态下的话，便可以实现cell的移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

}

#pragma mark -UITableViewDelegate
//获取编辑的样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isInsertOrDelete == 1) {
        return UITableViewCellEditingStyleInsert ;
    }else if(self.isInsertOrDelete == 2){
        return UITableViewCellEditingStyleDelete;
    }else{
        return UITableViewCellEditingStyleNone;
    }
//    return UITableViewCellEditingStyleNone;
}

//更改按钮的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

//处于编辑状态下，cell是否缩进 编辑样式是UITableViewCellEditingStyleNone才有效
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark -lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
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

}

@end
