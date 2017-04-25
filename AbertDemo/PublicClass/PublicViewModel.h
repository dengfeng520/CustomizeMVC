//
//  PublicViewModel.h
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicViewModel : NSObject

/**
 *  初始化，单例模式
 */
+(PublicViewModel *)sharedInstance;
/**
 * 判断是否为空
 */
- (BOOL) checkNullString:(NSString *)checkString;
/**
 * 判断是否为中文
 */
- (BOOL) checkIsChineseString:(NSString *)checkString;
/**
 * 判断是否为合格电话号码
 */
- (BOOL)isValidatePhoneNumber:(NSString *)strPhone;

@end
