//
//  User.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "User.h"

@implementation User

// 单例
static User *kInstance;

+ (User *)singletonUser {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        kInstance = [self new];
    });
    return kInstance;
}

+ (void)setSingletonUser:(__kindof User *)singletonUser {
    
    [self singletonUser];
    
    kInstance.ID = singletonUser.ID;
    kInstance.nickName = singletonUser.nickName;
    kInstance.icon = singletonUser.icon;
}

@end
