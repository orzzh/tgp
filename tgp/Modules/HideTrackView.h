//
//  HideTrackView.h
//  HKAdmin
//
//  Created by 张子豪 on 2017/10/30.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HideTrackDelegate<NSObject>

- (void)hideTrack:(BOOL)Hide;

@end


@interface HideTrackView : UIView

@property (nonatomic,weak)id<HideTrackDelegate>  delegate;

//页面启动后 刷新手势路线隐藏状态
- (void)relodGesHideTrack;


@end
