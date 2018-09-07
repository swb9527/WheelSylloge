//
//  SwbACE_PagerViewListVC.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/22.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbACE_PagerViewListVC.h"

@interface SwbACE_PagerViewListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation SwbACE_PagerViewListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"半糖效果";
    [self mainUI];
}

- (void)mainUI
{
    [self addTableViewWithHeaderRefresh:YES FooterRefresh:NO];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
}


- (NSArray *)datasource
{
    if (!_datasource) {
        _datasource = @[@{@"VCName":@"PagerViewCenterRefreshVC",@"title":@"悬浮样式--下拉刷新在中间"}];
    }
    return _datasource;
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
