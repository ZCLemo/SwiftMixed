//
//  UIView+TebonFrame.m
//  IFlyTestDemo
//
//  Created by 赵琛 on 2019/4/3.
//  Copyright © 2019 赵琛. All rights reserved.
//

#import "UIView+TebonFrame.h"

@implementation UIView (TebonFrame)

#pragma mark --属性getter方法
-(CGFloat)tebon_x
{
    return self.frame.origin.x;
}
-(CGFloat)tebon_y
{
    return self.frame.origin.y;
}
-(CGFloat)tebon_w
{
    return self.frame.size.width;
}
-(CGFloat)tebon_h
{
    return self.frame.size.height;
}

#pragma mark --属性setter方法
- (void)setTebon_x:(CGFloat)tebon_x
{
    CGRect frame = self.frame;
    frame.origin.x = tebon_x;
    self.frame = frame;
}
- (void)setTebon_y:(CGFloat)tebon_y
{
    CGRect frame = self.frame;
    frame.origin.y = tebon_y;
    self.frame = frame;
}
-(void)setTebon_w:(CGFloat)tebon_w
{
    CGRect frame = self.frame;
    frame.size.width = tebon_w;
    self.frame = frame;
}
-(void)setTebon_h:(CGFloat)tebon_h
{
    CGRect frame = self.frame;
    frame.size.height = tebon_h;
    self.frame = frame;
}

@end
