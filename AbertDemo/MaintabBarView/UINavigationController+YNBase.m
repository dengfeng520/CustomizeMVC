//
//  UINavigationController+YNBase.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "UINavigationController+YNBase.h"

@implementation UINavigationController (YNBase)
@dynamic shadowImage;
- (UIStatusBarStyle)preferredStatusBarStyle{
    UIViewController *viewController = self.viewControllers.lastObject;
    return [viewController preferredStatusBarStyle];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setBarTintColor:UIColorFromRGB(0xFF8799)];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

-(void)setNavigationBarBottomLineHide:(BOOL)isHide
{
    if (isHide) {
        self.navigationBar.shadowImage = [[UIImage alloc] init];
    }else
    {
        self.navigationBar.shadowImage = nil;
    }
    
}
@end
