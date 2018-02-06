//
//  RootNavViewController.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "RootNavViewController.h"

@interface RootNavViewController ()

@end

@implementation RootNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    self.navigationBar.titleTextAttributes = dict;
    self.navigationBar.translucent = NO;
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationBar.barTintColor = UIColorFromRGB(0xFF8799);
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///重写Push，解决iPhone X跳转时 TabBar上移问题
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}


@end
