//
//  TipLable.m
//  tgp
//
//  Created by 张子豪 on 2017/10/26.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "TipLable.h"
#import "Define.h"
#import "CALayer+anim.h"
@implementation TipLable

- (void)setDefaultWithNSString:(NSString *)str{
    
    self.hidden = NO;
    self.text = [NSString stringWithFormat:@"%@",str];
    self.textColor = RECT_TIPCOLORNOMOR;
    
}

- (void)setFaildWithNSString:(NSString *)str{
    
    self.hidden = NO;
    self.text = [NSString stringWithFormat:@"%@",str];
    self.textColor = RECT_TIPCOLORFAILD;
    [self.layer shake];
}

@end
