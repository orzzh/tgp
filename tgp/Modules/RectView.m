//
//  RectView.m
//  tgp
//
//  Created by 张子豪 on 2017/10/24.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "RectView.h"
#import "GesManager.h"
@implementation RectView
{
    UIView *interview;
    UIView *radius;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = RECT_RADIUS;
        self.backgroundColor = RECT_BACKGROUND;
        self.isSelected = NO;
        
        radius = [[UIView alloc]initWithFrame:CGRectMake(-5, -5, RECT_WEIGHT+10, RECT_WEIGHT+10)];
        radius.layer.cornerRadius = RECT_RADIUS+5;
        radius.backgroundColor = RECT_BACKGROUND;
        radius.layer.borderWidth = RECT_BORDER;
        radius.layer.borderColor = RECT_COLORDONE.CGColor;
        [self addSubview:radius];
        
        interview = [[UIView alloc]initWithFrame:CGRectMake(RECT_WEIGHT/4, RECT_WEIGHT/4, RECT_WEIGHT/2, RECT_WEIGHT/2)];
        interview.layer.cornerRadius = RECT_WEIGHT/4;
        interview.hidden = YES;
        [self addSubview:interview];
    }
    return self;
}


- (void)defauftRect{

    if (_isSelected) {
        interview.hidden = YES;
        radius.layer.borderColor = RECT_COLORDONE.CGColor;
        _isSelected = !_isSelected;
    }
}

- (void)selectRect{
   
    if (!_isSelected && ![GesManager getGesHidenOpen]) {
        interview.hidden = NO;
        interview.backgroundColor = RECT_COLORSELECT;
        radius.layer.borderColor = RECT_COLORSELECT.CGColor;
    }
    _isSelected = !_isSelected;

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
