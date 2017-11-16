//
//  User.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MySelf User.singletonUser // 自己

@interface User : NSObject

/** 单例 */
@property (class, nonnull, nonatomic) __kindof User *singletonUser;

/** ID */
@property (nullable, nonatomic, copy) NSString *ID;
/** 昵称 */
@property (nullable, nonatomic, copy) NSString *nickName;
/** 头像 */
@property (nullable, nonatomic, copy) NSString *icon;

@end
