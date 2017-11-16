//
//  ConfigWaitor.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import <Foundation/Foundation.h>

// 运行环境
typedef NS_ENUM(NSUInteger, EnviType) {
    EnviTypeDebug = 1, // 调试
    EnviTypeRelease // 发布
};

@interface ConfigWaitor : NSObject

/** 单例 */
@property (class, nonnull, nonatomic, readonly) __kindof ConfigWaitor *singletonConfigWaitor;

/** 运行环境 */
@property (assign, nonatomic) EnviType enviType;

@end
