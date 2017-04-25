//
//  CheckNetwork.m
//  Property
//
//  Created by rp.wang on 2017/1/5.
//  Copyright © 2017年 rp.wang. All rights reserved.
//  网络异常处理类，基于AFNetworkReachabilityManager类或者 apple 官方提供的Reachability类

#import "CheckNetwork.h"



@implementation CheckNetwork

+ (BOOL)isExistenceNetwork
{
    return [HttpManager sharedManager].isOnline;
}

@end
