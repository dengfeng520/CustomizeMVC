//
//  ViewController.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/24.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "ViewController.h"
#import "UIView+XMGExtension.h"
#define UIColorWithRGBA(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
@interface ViewController ()
/**
 *  顶部的所有标签
 */
@property (weak, nonatomic) UIView *titlesView;
/** 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedButton;
/**
 *  标签栏底部的红色指示器
 */
@property (weak, nonatomic) UIView *indicatorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupTitlesView];
}
-(void)setupTitlesView{
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.7];
    titlesView.width = self.view.width;
    titlesView.height = 35;
    titlesView.y = 64;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = UIColorWithRGBA(55, 166, 51, 1);
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    // 内部的子标签
    NSArray *titles = @[@"第一个", @"第二个", @"第三个", @"第四个"];
    NSArray *imgArr = @[@"1",@"2",@"3",@"4"];
    NSArray *selectedImgArr = @[@"s1",@"s2",@"s3",@"s4"];
    CGFloat width = titlesView.width / titles.count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i<titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:UIColorWithRGBA(55, 166, 51, 1) forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImgArr[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        // 默认点击了第一个按钮
        if (i == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
    self.indicatorView.width = self.selectedButton.width;
    
    [titlesView addSubview:indicatorView];
}
-(void)titleClick:(UIButton *)button{
    
    //修改按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.width;
        self.indicatorView.centerX = button.centerX;
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
