//
//  HTTPHelper.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import "HTTPHelper.h"
#import "AFNetworking.h"
#import "NetHintMacro.h"

@implementation HTTPHelper

// 全局AF管理者
static AFHTTPSessionManager *instanceManager;

/**
 获取全局AF管理者

 @return 全局AF管理者
 */
+ (AFHTTPSessionManager *)manager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instanceManager = [AFHTTPSessionManager manager];
        instanceManager.requestSerializer.timeoutInterval = 30; // 超时
    });
    return instanceManager;
}

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)getWithURLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(void (^_Nullable)(id _Nullable responseObject))success failure:(void (^_Nullable)(NSError *_Nonnull error))failure {
    
    [self.manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !success ?: success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 超时提示
        [self timeoutHint];
        !failure ?: failure(error);
    }];
}

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)postWithURLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(void (^_Nullable)(id _Nonnull responseObject))success failure:(void (^_Nullable)(NSError *_Nonnull error))failure {
    
    [self.manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        !success ?: success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        // 超时提示
        [self timeoutHint];
        !failure ?: failure(error);
    }];
}

/**
 超时提示
 */
+ (void)timeoutHint {
    
    [SVProgressHUD showErrorWithStatus:kTimeoutHint];
}

@end
