//
//  SwbADC_ViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/17.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_ViewController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "ChatViewController.h"
#import "TimeLineViewController.h"
#import "MineViewController.h"
#import "CenterViewController.h"

@interface SwbADC_ViewController ()<SwbADC_TabBarDelegate>

@end

@implementation SwbADC_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    //创建选项卡数据
    NSArray *vcArrs,*titleArrs,*normalImgNameArrs,*selectImgNameArrs;
    //1.viewControllers
    {
        HomeViewController *homeVC = [[HomeViewController alloc]init];
        BaseNavigationController *homeNav = [[BaseNavigationController alloc]initWithRootViewController:homeVC];
//        homeVC.title = @"首页";
        ChatViewController *chatVC = [[ChatViewController alloc]init];
        BaseNavigationController *chatNav = [[BaseNavigationController alloc]initWithRootViewController:chatVC];
//        chatVC.title = @"聊天";
        TimeLineViewController *timeLineVC = [[TimeLineViewController alloc]init];
        BaseNavigationController *timeLineNav = [[BaseNavigationController alloc]initWithRootViewController:timeLineVC];
//        timeLineVC.title = @"朋友圈";
        MineViewController *mineVC = [[MineViewController alloc]init];
        BaseNavigationController *mineNav = [[BaseNavigationController alloc]initWithRootViewController:mineVC];
//        mineVC.title = @"我的";
        vcArrs = @[homeNav,chatNav,timeLineNav,mineNav];
    }
    //2.titles
    {
        titleArrs = @[@"首页",@"消息",@"发现",@"我的"];
    }
    //3.item未选中时的img
    {
        normalImgNameArrs = @[@"首页-未选中",@"聊天-未选中",@"朋友圈-未选中",@"我的-未选中"];
    }
    //4.item选中时的img
    {
        selectImgNameArrs = @[@"首页-选中",@"聊天",@"朋友圈",@"我的"];
    }
    //5.设置各个tabBarItemConfigModels
    NSMutableArray *itemConfigModels = [[NSMutableArray alloc]init];
    {
        [vcArrs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SwbADC_ItemConfigModel *model = [[SwbADC_ItemConfigModel alloc]init];
            model.itemTitle = titleArrs[idx];
            model.normalImageName = normalImgNameArrs[idx];
            model.selectImageName = selectImgNameArrs[idx];
            model.normalColor = colorFromRGB(0xbfbfbf);
            model.selectColor = colorFromRGB(0x13227a);
            [itemConfigModels addObject:model];
            model.badgeValueType = SWBBadgeValueTypeDot;
        }];
    }
    //6.设置VCs
    // 一定要先设置这一步，然后再进行后边的顺序，因为系统只有在setViewControllers函数后才不会再次创建UIBarButtonItem，以免造成遮挡
    // 大意就是一定要让自定义TabBar遮挡住系统的TabBar
    {
        self.viewControllers = vcArrs;
    }
    //7.初始化创建自定义tabBar,覆盖系统的tabbar
    {
        //7.1 使用重载构造函数方式：
//        self.swbTabBar = [[SwbADC_TabBar alloc]initWithTabBarConfig:itemConfigModels];
        
        //7.2
        self.swbTabBar = [[SwbADC_TabBar alloc]init];
        self.swbTabBar.tabBarConfigModels = itemConfigModels;
        
        //设置委托代理
        self.swbTabBar.delegate = self;
        [self.tabBar addSubview:self.swbTabBar];
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.swbTabBar.frame = self.tabBar.bounds;
    [self.swbTabBar viewDidLayoutItems];
    //清除tabbar上方的线条
//    [self cleanTopLine];
}

- (void)cleanTopLine
{
    UIColor *color = [UIColor clearColor];
    
    CGRect rect = CGRectMake(0, 0, self.tabBar.width, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:img];
}


#pragma mark- ============ tabBar Delegate ==============
- (void)swbADC_TabBar:(SwbADC_TabBar *)tabBar didSelectIndex:(NSInteger)index
{
    [self setSelectedIndex:index];
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    if (self.swbTabBar) {
        self.swbTabBar.selectedIndex = selectedIndex;
    }
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
