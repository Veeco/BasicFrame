//
//  ConfigManager.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "ConfigManager.h"

@interface ConfigManager () <NSCopying, NSMutableCopying>

@end

// 运行环境 key
static NSString *const kEnviTypeKey = @"EnviType";

@implementation ConfigManager

// 单例
+ (__kindof ConfigManager *)sharedSingleton {

    return [[self alloc] init];
}

+ (__kindof ConfigManager *)allocWithZone:(struct _NSZone *)zone {
    
    static ConfigManager *kSharedSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kSharedSingleton = [super allocWithZone:zone];
    });
    return kSharedSingleton;
}

- (id)copyWithZone:(NSZone *)zone {
    
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    
    return self;
}

- (EnviType)enviType {
    
    NSNumber *typeN = [NSUserDefaults.standardUserDefaults objectForKey:kEnviTypeKey];
    
#if DEBUG
    if (!typeN) {
        typeN = @(EnviTypeDevelop);
    }
#else
    typeN = @(EnviTypeDistribute);
#endif
    
    return [typeN integerValue];
}

- (void)setEnviType:(EnviType)enviType {
    
    [NSUserDefaults.standardUserDefaults setObject:@(enviType) forKey:kEnviTypeKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

@end
