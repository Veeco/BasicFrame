//
//  NetCheckWaitor.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 ChenXi. All rights reserved.
//

#import "NetCheckWaitor.h"
#import <AFNetworking.h>
#import "NetHintMacro.h"

@interface NetCheckWaitor ()

{
    // 是否联网
    BOOL _connected;
    // 上一次是否为Wifi网络
    BOOL _wasWifi;
}

@end

@implementation NetCheckWaitor

// 单例
Singleton(NetCheckWaitor)

/**
 开启网络检测
 */
+ (void)startNetCheck {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 初始化, 以防 Wifi 进入造成多余提示
        [self shared]->_wasWifi = YES;
        
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            switch (status) {
                    
                case AFNetworkReachabilityStatusNotReachable: // 无网络
                    
                    [self shared]->_connected = NO;
                    [self shared]->_wasWifi = NO;
                    
                    [SVProgressHUD showErrorWithStatus:kNoHint];
                    
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机网络
                    
                    [self shared]->_connected = YES;
                    [self shared]->_wasWifi = NO;
                    
                    [SVProgressHUD showInfoWithStatus:kWwanHint];
                    
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi: // Wifi
                    
                    [self shared]->_connected = YES;
                    
                    if (![self shared]->_wasWifi) {
                        
                        [SVProgressHUD showInfoWithStatus:kWifiHint];
                        [self shared]->_wasWifi = YES;
                    }
                    break;
                    
                default:
                    break;
            }
        }];
        [manager startMonitoring];
    });
}

/**
 判断联网状态
 
 @return 是否联网
 */
+ (BOOL)isConnected {
    
    return [self shared]->_connected;
}

@end
