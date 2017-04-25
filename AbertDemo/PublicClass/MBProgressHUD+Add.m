//
//  MBProgressHUD+Add.m
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//


#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)


+ (void)SHowHUD:(NSString *)HUDStr view:(UIView *)ISView
{
    if (ISView == nil) ISView = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:ISView animated:YES];
    hud.label.text = HUDStr;
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.2];
}


+ (void)showError:(NSString *)error toView:(UIView *)view
{
    [self ShowErrorSucessView:@"error" :error :view];
}

+(void)ShowErrorSucessView :(NSString *)ErrStrImg :(NSString *)ErrCode :(UIView *)ISView
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:ISView animated:YES];
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:ErrStrImg] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.label.text = NSLocalizedString(ErrCode, @"HUD done title");
    
    [hud hideAnimated:YES afterDelay:1.2];

}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self ShowErrorSucessView:@"success" :success :view];
}

+(void)ShowLoadingHUD :(NSString *)HUDStr addView:(UIView *)IsView
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:IsView animated:YES];
    // Set the annular determinate mode to show task progress.
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = NSLocalizedString(HUDStr, @"HUD loading title");
  
}
@end
