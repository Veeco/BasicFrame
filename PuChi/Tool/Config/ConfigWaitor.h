//
//  ConfigWaitor.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

// 运行环境
typedef NS_ENUM(NSUInteger, EnviType) {
    EnviTypeDistribute, // 发布
    EnviTypeDevelop // 调试
};

// 登录状态
typedef NS_ENUM(NSUInteger, LoginStatus) {
    LoginStatusNo, // 未登录
    LoginStatusIng, // 登录中
    LoginStatusYes // 已登录
};

@interface ConfigWaitor : NSObject

/** 单例 */
@property (class, nonnull, nonatomic, readonly) __kindof ConfigWaitor *sharedSingleton;

/** 运行环境 */
@property (assign, nonatomic) EnviType enviType;
/** 登录状态 */
@property (assign, nonatomic) LoginStatus loginStatus;

@end
