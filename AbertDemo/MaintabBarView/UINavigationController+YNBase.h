//
//  UINavigationController+YNBase.h
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (YNBase)
@property (strong, nonatomic) UIImage *shadowImage;
-(void)setNavigationBarBottomLineHide:(BOOL)isHide;
@end
