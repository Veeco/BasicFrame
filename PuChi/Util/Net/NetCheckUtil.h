//
//  NetCheckUtil.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@class NetCheckUtil;

@protocol NetCheckUtilDelegate <NSObject>

@optional

/**
 网络状态变更回调

 @param status 网络状态
 @param waitor 自身
 */
- (void)netDidChangeToStatus:(AFNetworkReachabilityStatus)status withWaitor:(nonnull __kindof NetCheckUtil *)waitor;

@end

@interface NetCheckUtil : NSObject

/**
 开启网络检测
 */
+ (void)startNetCheck;

/**
 获取联网状态

 @return 联网状态
 */
+ (AFNetworkReachabilityStatus)getConnectStatus;

/**
 添加代理
 
 @param delegate 代理
 */
+ (void)addDelegate:(nonnull NSObject<NetCheckUtilDelegate> *)delegate;

/**
 移除代理
 
 @param delegate 代理
 */
+ (void)removeDelegate:(nonnull NSObject<NetCheckUtilDelegate> *)delegate;

@end
