//
//  ContentView.h
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RectView.h"

/* 识别手势View */

@protocol ContentVieDelegate<NSObject>

- (void)selectedWithNum:(NSString *)str;

@end

@interface ContentView : UIView

@property (nonatomic,weak) id<ContentVieDelegate> delegate;

@end
