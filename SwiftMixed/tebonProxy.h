//
//  tebonProxy.h
//  tztMobileApp_dbsc_HS
//
//  Created by 德邦 on 2019/7/26.
//  Copyright © 2019 ZZTZT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface tebonProxy : NSProxy

@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
