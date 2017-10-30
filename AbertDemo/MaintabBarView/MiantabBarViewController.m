//
//  MiantabBarViewController.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "MiantabBarViewController.h"
#import "RootNavViewController.h"
#import "BaseViewController.h"
#import "UIView+Util.h"
#import "DataManager.h"
#import "MyTabBar.h"

@interface MiantabBarViewController ()

@property (nonatomic, strong) UIButton *centerButton;

@end

@implementation MiantabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    //--------------------------------
    BaseViewController * HomePage =  [[NSClassFromString(@"HomePageViewController") alloc]init];
    BaseViewController * SecondPage = [[NSClassFromString(@"SecondPageViewController") alloc]init];
    BaseViewController * ThridPage = [[NSClassFromString(@"ThridPageViewController") alloc]init];
    BaseViewController * FourPage = [[NSClassFromString(@"FourPageViewController") alloc]init];
    
    
    
    //--------------------------------
    RootNavViewController *HomeNav = [[RootNavViewController alloc]initWithRootViewController:HomePage];
    RootNavViewController * SecondNav = [[RootNavViewController alloc]initWithRootViewController:SecondPage];
    RootNavViewController * ThridNav = [[RootNavViewController alloc]initWithRootViewController:ThridPage];
    RootNavViewController *FourNav = [[RootNavViewController alloc]initWithRootViewController:FourPage];
    
    
    
    //--------------------------------
    self.viewControllers = @[HomeNav,SecondNav,[BaseViewController new],ThridNav,FourNav];
    NSArray *titles = @[@"首页", @"日记", @"", @"问答", @"我的"];
    NSArray *images = @[@"shouye_icon_shouye1", @"shouye_icon_riji1", @"", @"shouye_icon_wenda1", @"shouye_icon_wode1"];
    NSArray *selectImages = @[@"shouye_icon_shouye2", @"shouye_icon_riji2", @"", @"shouye_icon_wenda2", @"shouye_icon_wode2"];
    
    
     //--------------------------------
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
        [item setImage:[[UIImage imageNamed:images[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setSelectedImage:[[UIImage imageNamed:selectImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }];
    [self.tabBar.items[2] setEnabled:NO];
    [self addCenterButtonWithImage:[UIImage imageNamed:@"shouye_icon_tianjia"]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xFFFFFF)} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xFFFFFF)} forState:UIControlStateNormal];
    [self.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"shouye_image_caidan"]];
    [self.tabBar setBarTintColor:UIColorFromRGB(0xFF8799)];
    self.tabBar.shadowImage = [[UIImage alloc] init];
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    self.tabBar.translucent = NO;
    //--------------------------------
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addCenterButtonWithImage:(UIImage *)buttonImage
{
    //--------------------------------
    _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGPoint origin = [self.view convertPoint:self.tabBar.center toView:self.tabBar];
    CGSize buttonSize = CGSizeMake(self.tabBar.frame.size.width / 5, self.tabBar.frame.size.height + 20);
    _centerButton.frame = CGRectMake(origin.x - buttonSize.height/2, origin.y - buttonSize.height/2, buttonSize.height, buttonSize.height);
    [_centerButton setCornerRadius:buttonSize.height/2];
    [_centerButton setBackgroundColor:UIColorFromRGB(0xFF8799)];
    [_centerButton setImage:buttonImage forState:UIControlStateNormal];
    [_centerButton setTitleColor:UIColorFromRGB(0xC1A08B) forState:UIControlStateNormal];
    _centerButton.titleLabel.font=[UIFont systemFontOfSize:6];
    [_centerButton setTitle:@" " forState:UIControlStateNormal];
    //--------------------------------
    CGSize imageSize = _centerButton.imageView.frame.size;
    CGSize titleSize = _centerButton.titleLabel.frame.size;
    CGFloat totalHeight = (imageSize.height + titleSize.height + 6);
    [_centerButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0)];
    [_centerButton setImageEdgeInsets:UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width)];
    [_centerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:_centerButton];
}

- (void)buttonPressed:(id)sender{
    if (![DataManager sharedInstance].isLogin) {
        [self goLoginViewController];
        return;
    }
    
    BaseViewController *CenterView = [[NSClassFromString(@"CenterViewController") alloc]init];
    [self presentViewController:CenterView animated:YES completion:^{
        
    }];
}

-(void)goLoginViewController
{
    BaseViewController *LoginView = [[NSClassFromString(@"XHLoginViewController") alloc]init];
    LoginView.hidesBottomBarWhenPushed = YES;
    UINavigationController *navigationController = (UINavigationController *)self.selectedViewController;
    [navigationController pushViewController:LoginView animated:YES];
}



@end
