//
//  ConfigWaitor.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "ConfigWaitor.h"

// 运行环境 key
static NSString *const kEnviTypeKey = @"kEnviTypeKey";

@implementation ConfigWaitor

// 单例
SINGLETON(ConfigWaitor)

+ (ConfigWaitor *)singletonConfigWaitor {
    
    return [self shared];
}

- (EnviType)enviType {
    
    return [[NSUserDefaults.standardUserDefaults objectForKey:kEnviTypeKey] integerValue];
}

- (void)setEnviType:(EnviType)enviType {
    
    [NSUserDefaults.standardUserDefaults setObject:@(enviType) forKey:kEnviTypeKey];
}

@end
