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



@end
