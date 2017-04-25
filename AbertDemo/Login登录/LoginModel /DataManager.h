//
//  DataManager.h
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *KeyUserId = @"userId";
static NSString *KeyUserPassWord = @"userPassWord";

@interface DataManager : NSObject

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userPassword;

/// 获取使用实例
+ (instancetype )sharedInstance;

/// 初始化Manager
- (void) initManager;

/// 清空用户
- (void) clearUserDefaults;

///保存用户信息
- (void) saveUserInfo;

///设置用户信息
- (void) setUserInfoWithDic:(NSDictionary *)userInfo;

///是否登录
- (BOOL) isLogin;
#pragma mark - Tools Function

/// 沙盒路径
+ (NSString *)getDocumentPath;
/// 获取目录
+ (NSString *)getDocumentWithName:(NSString *)name;
@end
