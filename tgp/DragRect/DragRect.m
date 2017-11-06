//
//  DragRect.m
//  tgp
//
//  Created by 张子豪 on 2017/11/2.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "DragRect.h"

@implementation DragRect

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = self.frame.size.width/2;
        self.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
