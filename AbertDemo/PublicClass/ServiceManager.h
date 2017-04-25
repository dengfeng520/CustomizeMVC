//
//  ServiceManager.h
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CheckNetwork.h"

@interface ServiceManager : NSObject
/// 获取使用实例
+ (instancetype )sharedInstance;
/**
 * PostURL  请求地址
 * parameters  给服务器传参
 * superClassview 显示的View
 * success  请求成功后返回的数据
 * failure  请求失败后返回的信息
 * errcodedata AFN异常返回的数据
 * notInternet  设备没有联网
 */
- (void) postRequestforLogin:(NSString *) path
          parameters:(NSDictionary *)parameters
          superClass:(UIView *)superClassview
             success:(void (^)(NSDictionary *dataObject))success
             invalid:(void (^)(NSString *invalidObject))invalidStr
             failure:(void (^)(int resultDict))failure
             errcode:(void (^)(int errcodeStr))errcodedata
         notInternet:(void (^)(int Internet))InternetCode;
@end
