//
//  MBProgressHUD+Add.h
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
/**
 *  单例方法显示一个纯文字HUD，1秒后消失
 */
+ (void)SHowHUD:(NSString *)HUDStr view:(UIView *)ISView;
/**
 *  错误提示
 *
 *  提示内容
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;
/**
 *  操作成功提示
 *
 *   提示内容
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
/**
 * 加载一个Loading
 */
+(void)ShowLoadingHUD :(NSString *)HUDStr addView:(UIView *)IsView;
@end
