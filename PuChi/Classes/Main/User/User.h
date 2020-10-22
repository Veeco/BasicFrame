//
//  User.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MySelf User.myself // 自己

@interface User : NSObject

@property (class, nonnull, nonatomic) __kindof User *myself;

/** ID */
@property (nullable, nonatomic, copy) NSString *ID;
/** 昵称 */
@property (nullable, nonatomic, copy) NSString *nickName;
/** 头像 */
@property (nullable, nonatomic, copy) NSURL *icon;
/** 后台sessionID */
@property (nullable, nonatomic, copy) NSString *sessionID;

@end
