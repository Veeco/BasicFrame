//
//  NetCheckWaitor.m
//  PuChi
//
//  Created by Veeco on 2017/11/15.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "NetCheckWaitor.h"
#import "NetHintConst.h"

@interface NetCheckWaitor ()

{
    // 联网状态
    AFNetworkReachabilityStatus _connectStatus;
}

/** 代理 */
@property (nullable, nonatomic, strong) NSHashTable<NSObject<NetCheckWaitorDelegate> *> *delegates;

@end

@implementation NetCheckWaitor

#pragma mark - <Lazy>

- (NSHashTable *)delegates {
    if (!_delegates) {
        
        self.delegates = [NSHashTable weakObjectsHashTable];
    }
    return _delegates;
}

#pragma mark - <Normal>

// 单例
SINGLETON(NetCheckWaitor)

/**
 开启网络检测
 */
+ (void)startNetCheck {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 初始化, 以防 Wifi 进入造成多余提示
        [self shared]->_connectStatus = AFNetworkReachabilityStatusReachableViaWiFi;
        
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            switch (status) {
                    
                case AFNetworkReachabilityStatusNotReachable: // 无网络
                    
                    [SVProgressHUD showErrorWithStatus:NetHintConstNoHint];
                    
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机网络
                    
                    [SVProgressHUD showInfoWithStatus:NetHintConstWWANHint];
                    
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
                    
                    if ([self shared]->_connectStatus != AFNetworkReachabilityStatusReachableViaWiFi) {
                        
                        [SVProgressHUD showInfoWithStatus:NetHintConstWiFiHint];
                    }
                    break;
                    
                default:
                    break;
            }
            [self shared]->_connectStatus = status;
            
            // 回调
            for (id<NetCheckWaitorDelegate> delegate in [self shared].delegates) {
                
                if ([delegate respondsToSelector:@selector(netDidChangeToStatus:withWaitor:)]) {
                    [delegate netDidChangeToStatus:status withWaitor:[self shared]];
                }
            }
        }];
        [manager startMonitoring];
    });
}

/**
 获取联网状态
 
 @return 联网状态
 */
+ (AFNetworkReachabilityStatus)getConnectStatus {
    
    return [self shared]->_connectStatus;
}

/**
 添加代理
 
 @param delegate 代理
 */
+ (void)addDelegate:(nonnull NSObject<NetCheckWaitorDelegate> *)delegate {
    
    [[self shared].delegates addObject:delegate];
}

/**
 移除代理
 
 @param delegate 代理
 */
+ (void)removeDelegate:(nonnull NSObject<NetCheckWaitorDelegate> *)delegate {
    
    [[self shared].delegates removeObject:delegate];
}

@end
