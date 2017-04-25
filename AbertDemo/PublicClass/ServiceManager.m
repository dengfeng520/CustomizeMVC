//
//  ServiceManager.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "ServiceManager.h"
#import "MBProgressHUD+Add.h"

@implementation ServiceManager

// 获取使用实例
+ (ServiceManager *)sharedInstance
{
    static ServiceManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[super alloc] init];
    });
    return sharedInstance;
}
- (void)  postRequestforLogin:(NSString *) path
          parameters:(NSDictionary *)parameters
          superClass:(UIView *)superClassview
             success:(void (^)(NSDictionary *dataObject))success
             invalid:(void (^)(NSString *invalidObject))invalidStr
             failure:(void (^)(int resultDict))failure
             errcode:(void (^)(int errcodeStr))errcodedata
         notInternet:(void (^)(int Internet))InternetCode
{
       [MBProgressHUD ShowLoadingHUD:@"Loading..." addView:superClassview];
         if ([CheckNetwork isExistenceNetwork])
         {
             AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
             
             manager.responseSerializer = [AFHTTPResponseSerializer serializer];
             
             [manager POST:path parameters:parameters progress:^(NSProgress *Noll){
                 
             } success:^(NSURLSessionDataTask *task, id responseObject){
                 [MBProgressHUD hideHUDForView:superClassview animated:YES];
                 
                 NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                 
                 NSString *status = [NSString stringWithFormat:@"%@",[obj valueForKey:@"code"]];
                 if([status isEqualToString:@"0"])
                 {
                     if(success)
                     {
                         success(obj);
                     }
                 }else
                 {
                     if(invalidStr)
                     {
                         invalidStr([NSString stringWithFormat:@"%@",[obj valueForKey:@"msg"]]);
                     }
                 }
             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                 [MBProgressHUD hideHUDForView:superClassview animated:YES];
                 if(failure)
                 {
                     failure((int)error.code);
                 }
             }];
         }else
         {
             [MBProgressHUD hideHUDForView:superClassview animated:YES];
             if(InternetCode)
             {
                 InternetCode(WKNertworkNotConnectInternet);
             }
         }

   
}
@end
