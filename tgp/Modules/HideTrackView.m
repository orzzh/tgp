//
//  HideTrackView.m
//  HKAdmin
//
//  Created by 张子豪 on 2017/10/30.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "HideTrackView.h"
#import "GesManager.h"


@implementation HideTrackView
{
    UISwitch *sw;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}



- (void)createUI{
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    lbl.text = @"隐藏轨迹";
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textColor =[UIColor grayColor];
    //        [lbl sizeToFit];
    [self addSubview:lbl];
  
    sw = [[UISwitch alloc]initWithFrame:CGRectMake(lbl.frame.size.width, 0, 100, 30)];
    [sw sizeToFit];
    sw.on = NO;
    [self addSubview:sw];
    [sw addTarget:self action:@selector(chanage) forControlEvents:UIControlEventTouchUpInside];
    
    [self sizeToFit];
    
    [self relodGesHideTrack];

}

- (void)relodGesHideTrack{
    
    //检测本地开关
    sw.on = [GesManager getGesHidenOpen];
    
}


- (void)chanage{
    
    [GesManager setGesHidenOpen:sw.on];
    
}


@end
