//
//  TestViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/18.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"test跳转";
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    btn.backgroundColor = UIColor.purpleColor;
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 365, 200, 200)];
    btn1.backgroundColor = UIColor.purpleColor;
    [btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
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
