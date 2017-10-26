//
//  SetHeadView.h
//  tgp
//
//  Created by 张子豪 on 2017/10/26.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetHeadView : UIView

/* 设置手势缩略图 */
- (void)refreshWithString:(NSString *)str;

/* 恢复默认状态 */
- (void)defult;

@end
