//
//  ChooesTableVC.m
//  test
//
//  Created by carisok on 15/10/13.
//  Copyright © 2015年 QJM. All rights reserved.
//

#import "ChooesTableVC.h"

#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define headViewHeigth 64

@interface ChooesTableVC ()

@end

@implementation ChooesTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArr = [NSMutableArray array];
    deleteArr = [NSMutableArray array];
    
    for (int i = 0; i < 30; i++) {
        
        NSString *str = [NSString stringWithFormat:@"是否删除第 %d 行", i];
        [dataArr addObject:str];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-headViewHeigth) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsSelectionDuringEditing = YES; //编辑状态下可以选中
    [self.view addSubview:self.tableView];
    
    // 编辑
    editBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [editBtn.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [editBtn setBackgroundColor:[UIColor colorWithRed:86/255.0 green:181/255.0 blue:131/255.0 alpha:1.0]];
    [editBtn addTarget:self action:@selector(deleteReplyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setTitleView:editBtn];
    
    // 删除
    UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deleteBtn.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [deleteBtn setBackgroundColor:[UIColor colorWithRed:86/255.0 green:181/255.0 blue:131/255.0 alpha:1.0]];
    [deleteBtn addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:deleteBtn]];
}

// 编辑
- (void)deleteReplyButtonClick:(UIButton *)sender
{
    isEdit = !isEdit;
    if (isEdit) {
        [self.tableView setEditing:YES animated:YES];
        [editBtn setTitle:@"完成" forState:UIControlStateNormal];
        
    }else{
        [self.tableView setEditing:NO animated:YES];
        [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [deleteArr removeAllObjects];
    }
}

// 删除
- (void)deleteButtonClick:(UIButton *)sender {
    
    if (deleteArr.count) {
        [dataArr removeObjectsInArray:deleteArr];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
        UIView *selectionView = [[UIView alloc]init];
        selectionView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
        cell.selectedBackgroundView = selectionView;
    }
    
//    cell.textLabel.text = [NSString stringWithFormat:@"当前是第 %ld 行", (long)indexPath.row];
    
    cell.textLabel.text = [dataArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:( UITableView *)tableView editingStyleForRowAtIndexPath:( NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (isEdit) {
        NSString *str = [dataArr objectAtIndex:indexPath.row];
        [deleteArr addObject:str];
    }
}


@end
