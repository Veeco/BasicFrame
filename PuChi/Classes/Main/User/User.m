//
//  User.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "User.h"

@implementation User

static User *kInstance;

+ (User *)myself {
    if (!kInstance) {
     
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            kInstance = [User new];
        });
    }
    return kInstance;
}

+ (void)setMyself:(__kindof User *)myself {
        
    kInstance = myself;
}

@end
