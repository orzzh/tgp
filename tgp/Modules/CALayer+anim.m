//
//  CALayer+anim.m
//  tgp
//
//  Created by 张子豪 on 2017/10/26.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "CALayer+anim.h"

@implementation CALayer (anim)

- (void)shake{

    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    anima.duration = 0.3f;
    anima.removedOnCompletion = YES;
    anima.repeatCount = 2;
    CGFloat s = 3;
    anima.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    [self addAnimation:anima forKey:@"shake"];
}

@end
