//
//  tebonProxy.m
//  tztMobileApp_dbsc_HS
//
//  Created by 德邦 on 2019/7/26.
//  Copyright © 2019 ZZTZT. All rights reserved.
//

#import "tebonProxy.h"

@implementation tebonProxy

// 发送给target
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
// 给target注册一个方法签名
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

@end
