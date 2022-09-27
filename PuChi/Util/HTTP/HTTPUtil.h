//
//  HTTPUtil.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPUtil : NSObject

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)getWithURLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(void (^_Nullable)(id _Nullable responseObject))success failure:(void (^_Nullable)(NSError *_Nonnull error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)postWithURLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(void (^_Nullable)(id _Nonnull responseObject))success failure:(void (^_Nullable)(NSError *_Nonnull error))failure;

@end
