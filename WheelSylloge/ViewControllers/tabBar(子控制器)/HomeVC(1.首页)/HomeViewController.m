//
//  HomeViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/17.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"首页";
    
    [self mainUI];
}


- (void)mainUI
{
    [self addTableViewWithHeaderRefresh:YES FooterRefresh:NO];
    self.baseTableView.frame = CGRectMake(0, TopHeight, SCREEN_WIDTH, SCREEN_HEIGHT-TopHeight-TabBarHeight);
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
}

- (void)downLoadRefresh
{
    [self.baseTableView reloadData];
}


#pragma mark- ============ UITableView Delegate && Datasource ==============
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
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
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"home_cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    NSDictionary *dic = self.datasource[indexPath.row];
    NSMutableAttributedString *titleStr = [ToolUtil markString:[NSString stringWithFormat:@"%ld.",indexPath.row + 1]
                                                     color:[UIColor orangeColor]
                                                      font:[UIFont fontWithName:@"Marker Felt" size:16]];
    //设置中文倾斜
    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(5 * (CGFloat)M_PI / 180), 1, 0, 0);//设置反射。倾斜角度。
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:14].fontName matrix:matrix];//取得系统字符并设置反射。
    UIFont *font = [UIFont fontWithDescriptor :desc size :16];
    [titleStr appendAttributedString: [ToolUtil markString:[NSString stringWithFormat:@"  %@",[dic objectForKey:@"title"]]
                                                 color:[UIColor grayColor]
                                                  font:font]];
    cell.textLabel.attributedText = titleStr;
    cell.detailTextLabel.text = [dic objectForKey:@"VCName"];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = indexPath.row %2 ==0?color_white:colorRGBA(248, 248, 248, 1);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.datasource[indexPath.row];
    NSString *VCName = [dic objectForKey:@"VCName"];
    Class class = NSClassFromString(VCName);
    BaseViewController *vc = [[class alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tabBarItemSelected
{
    [super tabBarItemSelected];
    NSLog(@"单击了%@",self);
}

- (void)selectTabbarItemDoubleTapped
{
    [super selectTabbarItemDoubleTapped];
    NSLog(@"双击了%@",self);
}




- (NSArray *)datasource
{
    if (!_datasource) {
        _datasource = @[@{@"VCName":@"SwbACE_PagerViewListVC",@"title":@"PagerView半糖效果"}];
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
