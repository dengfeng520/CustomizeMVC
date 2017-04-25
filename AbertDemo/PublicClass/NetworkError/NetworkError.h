//
//  NetworkError.h
//  Property
//
//  Created by rp.wang on 2017/1/5.
//  Copyright © 2017年 rp.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkError : NSObject

+ (NSString *)errorMessageWithCode:(NSInteger)errorCode;

@end
