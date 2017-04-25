//
//  DataManager.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
// 获取使用实例
+ (instancetype )sharedInstance
{
    static DataManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[super alloc] init];
        [sharedInstance initManager];
    });
    return sharedInstance;
}

// 初始化Manager
- (void) initManager
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //读取用户信息
    self.userId = [userDefaults objectForKey:KeyUserId];
    self.userPassword=[userDefaults stringForKey:KeyUserPassWord];
}

// 清空用户
- (void) clearUserDefaults
{
    self.userPassword = nil;
    self.userId = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:KeyUserId];
        [userDefaults removeObjectForKey:KeyUserPassWord];
        [userDefaults synchronize];
    });
}

//保存用户数据
- (void) saveUserInfo
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.userId forKey:KeyUserId];
        [userDefaults setObject:self.userPassword forKey:KeyUserPassWord];
        [userDefaults synchronize];
    });
}

///设置用户信息
- (void) setUserInfoWithDic:(NSDictionary *)userInfo
{
    [self saveUserInfo];
}

///是否登录
- (BOOL) isLogin
{
    if (self.userId) {
        return YES;
    }
    return NO;
}


#pragma mark - Tools Function

// 沙盒路径
+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    return documents;
}

// 获取目录
+ (NSString *)getDocumentWithName:(NSString *)name
{
    if (name == nil) {
        return nil;
    }
    
    NSString *documents = [DataManager getDocumentPath];
    NSString *database_path = [documents stringByAppendingPathComponent:name];
    NSFileManager *wk_manager = [NSFileManager defaultManager];
    BOOL wk_isExist,wk_isDirectory;
    wk_isExist = [wk_manager fileExistsAtPath:database_path isDirectory:&wk_isDirectory];
    if(wk_isExist == NO || wk_isDirectory == NO)
    {
        [wk_manager createDirectoryAtPath:database_path withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return database_path;
}

@end
