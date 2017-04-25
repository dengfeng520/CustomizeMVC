//
//  PublicViewModel.m
//  AbertDemo
//
//  Created by rp.wang on 2017/4/25.
//  Copyright © 2017年 兰州北科维拓科技股份有限公司. All rights reserved.
//

#import "PublicViewModel.h"

@implementation PublicViewModel

+(PublicViewModel *)sharedInstance
{
    static PublicViewModel * viewModel;
    static dispatch_once_t viewModeleronce;
    dispatch_once(&viewModeleronce, ^{
        viewModel = [[PublicViewModel alloc] init];
    });
    return viewModel;
}

- (BOOL) checkNullString:(NSString *)checkString
{
    BOOL isNullString = YES;
    if (checkString && ![checkString isKindOfClass:[NSNull class]] &&![checkString isEqualToString:@"<null>"] && ![checkString isEqualToString:@"(null)"] && ![checkString isEqualToString:@""])
    {
        isNullString = NO;
    }
    return isNullString;
}

- (BOOL) checkIsChineseString:(NSString *)checkString
{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:checkString];
}

- (BOOL)isValidatePhoneNumber:(NSString *)strPhone
{
    NSString *regex = @"^((13[0-9])|(147)|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:strPhone];
    if (!isMatch) {
        return NO;
    }
    return YES;
}

@end
