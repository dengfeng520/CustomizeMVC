//
//  MyTabBar.m
//  AbertDemo
//
//  Created by rp.wang on 2017/10/30.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "MyTabBar.h"

@implementation MyTabBar

#pragma mark - Override Methods
- (void)setFrame:(CGRect)frame
{
    if (self.superview &&CGRectGetMaxY(self.superview.bounds) !=CGRectGetMaxY(frame)) {
        frame.origin.y =CGRectGetHeight(self.superview.bounds) -CGRectGetHeight(frame);
    }
    [super setFrame:frame];
}

#pragma mark - Initial Methods
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.translucent =false;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


@end
