//
//  User.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import "User.h"

@implementation User

// 单例
SINGLETON(User)

+ (User *)singletonUser {

    return [self shared];
}

+ (void)setSingletonUser:(__kindof User *)singletonUser {
    
    [self shared].ID = singletonUser.ID;
    [self shared].nickName = singletonUser.nickName;
    [self shared].icon = singletonUser.icon;
}

@end
