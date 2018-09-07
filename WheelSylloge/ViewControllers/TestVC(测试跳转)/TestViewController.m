//
//  TestViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/18.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "TestViewController.h"
#import "Test2ViewController.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"test跳转";
    self.view.backgroundColor = UIColor.whiteColor;
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    btn.backgroundColor = UIColor.purpleColor;
//    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 365, 200, 200)];
//    btn1.backgroundColor = UIColor.purpleColor;
//    [btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn1];
//
//    self.statusBarStyle = UIStatusBarStyleLightContent;
    
    
    
    [self addTableViewWithHeaderRefresh:YES FooterRefresh:YES];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    
    
}
- (void)btnClicked
{
    TestViewController *vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)btn1Clicked
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Test2ViewController *vc = [[Test2ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
