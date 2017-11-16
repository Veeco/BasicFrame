//
//  NetCheckWaitor.h
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetCheckWaitor : NSObject

/**
 开启网络检测
 */
+ (void)startNetCheck;

/**
 判断联网状态

 @return 是否联网
 */
+ (BOOL)isConnected;

@end
