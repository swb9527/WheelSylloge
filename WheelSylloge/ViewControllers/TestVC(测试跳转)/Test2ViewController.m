//
//  Test2ViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/22.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation Test2ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.interactivePopEnabled = NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.interactivePopEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"2";
    [self addRightNavItemWithTitle:@"分享" target:self action:@selector(rightBtnClicked)];
    [self addTableViewWithHeaderRefresh:NO FooterRefresh:NO];
    self.refreshToolUtil.headerType = RefreshHeaderTypeGif;
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    @WeakObj(self);
    [self.refreshToolUtil dropDownRefresh:^{
        @StrongObj(self);
        [self downLoadRefresh];
    }];
    
    [self.refreshToolUtil dropUpRefresh:^{
        @StrongObj(self);
        [self upLoadRefresh];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.05;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.05;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"我是cell%d",(int)indexPath.row];
    return cell;
}

- (void)downLoadRefresh
{
    [super downLoadRefresh];
    NSLog(@"子类下拉刷新");
}
- (void)upLoadRefresh
{
    [super upLoadRefresh];
    NSLog(@"子类下拉刷新");
}

- (void)backBtnClicked
{
    self.interactivePopEnabled = YES;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)rightBtnClicked
{
    self.interactivePopEnabled = YES;
    [VCToolUtil popToViewController:@"HomeViewController"];
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
