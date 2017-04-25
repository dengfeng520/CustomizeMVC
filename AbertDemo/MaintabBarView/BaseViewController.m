//
//  BaseViewController.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //处理子控件中含有scrollView有时会莫名产生20的偏移问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置背景颜色
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem.title = @"";
}


- (void)warningLable:(NSString *)str
{
   int theLabelWith = [str boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(DEF_SCREEN_WIDTH/2-theLabelWith/2-5, DEF_SCREEN_HEIGHT/2-30, theLabelWith+10, 60)];
    label.text = str;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.backgroundColor = UIColorFromRGB(0xd1d0c5);
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    [self.view addSubview:label];
    
    
    //动画效果，1.2秒后消失
    [UIView animateWithDuration:1.2f animations:^{
        
        label.alpha = 0;
    } completion:^(BOOL finished) {
        
        [label removeFromSuperview];
        
    }];
}


@end
