//
//  BaseViewController.h
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckNetwork.h"
#import "NetworkError.h"

@interface BaseViewController : UIViewController

/**
 *  自定义提示框,类似Android的toast
 *  也可以使用第三方，如SVProgressHUD或MBProgressHUD
 *  by rp.wang
 */
- (void)warningLable:(NSString *)str;

@end
