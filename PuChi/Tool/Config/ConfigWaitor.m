//
//  ConfigWaitor.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import "ConfigWaitor.h"

#define kEnviTypeKey @"kEnviTypeKey" // 运行环境 key

@interface ConfigWaitor ()
    
{
    // 运行环境
    EnviType _enviType;
}

@end

@implementation ConfigWaitor

// 单例
SINGLETON(ConfigWaitor)

+ (ConfigWaitor *)singletonConfigWaitor {
    
    return [self shared];
}

- (EnviType)enviType {
    
    if (!self->_enviType) {
        
        self->_enviType = [[NSUserDefaults.standardUserDefaults objectForKey:kEnviTypeKey] integerValue];
        
        // 第一次运行时默认为发布环境
        if (!self->_enviType) {
            
            self->_enviType = EnviTypeRelease;
        }
    }
    return self->_enviType;
}

- (void)setEnviType:(EnviType)enviType {
    
    self->_enviType = enviType;
    [NSUserDefaults.standardUserDefaults setObject:@(enviType) forKey:kEnviTypeKey];
}

@end
