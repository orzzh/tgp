//
//  SetHeadView.m
//  tgp
//
//  Created by 张子豪 on 2017/10/26.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "SetHeadView.h"
#import "Define.h"
@interface SetHeadView()
{
    CGFloat w;
    
}
@property (nonatomic,strong)NSMutableArray *viewAry;
@property (nonatomic,strong)NSMutableArray *subViewAry;

@end

@implementation SetHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        w = frame.size.height;
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    CGFloat space = w/20;
    CGFloat weight = 0.3*w;
    
    for (int i = 0; i<9; i++) {
        CGFloat x = (space+weight)*(i%3);
        CGFloat y = (space+weight)*(i/3);
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(x, y, weight, weight)];
        v.layer.borderColor = RECT_HEADVIEWCOLOR.CGColor;
        v.layer.borderWidth = 1;
        v.layer.cornerRadius = weight/2;
        v.tag = i+1;
        [self addSubview:v];
        [self.viewAry addObject:v];
        
        UIView *c = [[UIView alloc]initWithFrame:CGRectMake(0, 0, weight/2, weight/2)];
        c.layer.cornerRadius = weight/4;
        c.center = CGPointMake(weight/2, weight/2);
        c.backgroundColor = RECT_COLORSELECT;
        c.hidden = YES;
        [v addSubview:c];
        [self.subViewAry addObject:c];
    }
    
}

- (void)refreshWithString:(NSString *)str{
    NSMutableString *_str = [[NSMutableString alloc]initWithString:str];
    for (int i = 0; i<_str.length; i++) {
        NSString *s = [_str substringWithRange:NSMakeRange(i, 1)];
        for (int j = 0; j<self.viewAry.count; j++) {
            UIView *v = [self.viewAry objectAtIndex:j];
            if (v.tag  == [s integerValue]) {
                UIView *c = [self.subViewAry objectAtIndex:j];
                c.hidden = NO;
                dispatch_async(dispatch_get_main_queue(), ^{
                    v.layer.borderColor = RECT_COLORSELECT.CGColor;
                });
            }
        }
    }
}

- (void)defult{
    for (int j = 0; j<self.viewAry.count; j++) {
        UIView *v = [self.viewAry objectAtIndex:j];
        UIView *c = [self.subViewAry objectAtIndex:j];
        c.hidden = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            v.layer.borderColor = RECT_HEADVIEWCOLOR.CGColor;
        });
    }
}

- (NSMutableArray*)viewAry{
    
    if (!_viewAry) {
        _viewAry = [[NSMutableArray alloc]init];
    }
    return _viewAry;
}

- (NSMutableArray *)subViewAry{
    if (!_subViewAry) {
        _subViewAry = [[NSMutableArray alloc]init];
    }
    return _subViewAry;
}

@end
