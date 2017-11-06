//
//  ContentView.m
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "ContentView.h"
#import "GesManager.h"
@interface ContentView()
{
    UIBezierPath *path;
}
@property (nonatomic,assign)CGPoint CurrPoint;
@property (nonatomic,strong)NSMutableArray *RectArt;


@end

@implementation ContentView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        
    }
    return self;
}


- (void)createUI{

    self.backgroundColor = [UIColor clearColor];
    
    for (int i = 0;  i< 9; i++) {
        NSInteger y = (NSInteger) i/3 ;
        RectView *rect = [[RectView alloc]initWithFrame:CGRectMake(20+(i%3)*(RECT_WEIGHT+RECT_RADIUS_SPACE), y*(RECT_WEIGHT+RECT_RADIUS_SPACE)+20, RECT_WEIGHT, RECT_WEIGHT)];
        rect.tag = i+1;
        [self addSubview:rect];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.CurrPoint = point;
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    RectView *rect = [self rectWithPoint:point];
    if (rect && !rect.isSelected) {
        [self.RectArt addObject:rect];
        [rect selectRect];
    }else{
        _CurrPoint = point;
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (RectView *rect in self.subviews) {
        [rect defauftRect];
    }
    //返回数字
    [self mixNum];
    [self.RectArt removeAllObjects];
    [self setNeedsDisplay];
}



- (void)mixNum{
    NSMutableString *str = [[NSMutableString alloc]init];
    for (int i = 0; i< self.RectArt.count; i++) {
        RectView *r = [self.RectArt objectAtIndex:i];
        NSInteger idex = r.tag;
        NSString *s = [NSString stringWithFormat:@"%ld",idex];
        [str appendString:s];
        NSLog(@"s%zd",_RectArt.count);
    }
    NSString *ss = [NSString stringWithFormat:@"%@",str];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedWithNum:)]) {
        [self.delegate selectedWithNum:ss];
    }
}

#pragma mark - 重绘连线
- (void)drawRect:(CGRect)rect{
    if (![GesManager getGesHidenOpen]) {

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    if (self.RectArt.count == 0) {
        return;
    }
    path = [UIBezierPath bezierPath];
    [RECT_COLORSELECT setFill];
    [RECT_COLORSELECT setStroke];
    [RECT_COLORSELECT set];
    CGContextSetLineWidth(ctx, RECT_LINE_WEIGHT);
    path.lineCapStyle = kCGLineCapRound;
    for (int i = 0; i<self.RectArt.count; i++) {
        RectView *rect =[self.RectArt objectAtIndex:i];
        if (i == 0) {
            [path moveToPoint:rect.center];
        }else{
            [path addLineToPoint:rect.center];
        }
    }
    [path addLineToPoint:self.CurrPoint];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    }
}

- (RectView *)rectWithPoint:(CGPoint)point{
    for (RectView *rect in self.subviews) {
        if (CGRectContainsPoint(rect.frame, point)) {
            return  rect;
        }
    }
    return nil;
}










#pragma makr - lazyload

- (NSMutableArray *)RectArt{
    if (_RectArt == nil) {
            _RectArt = [[NSMutableArray alloc]init];
    }
    return _RectArt;
}


@end
