//
//  RectView.h
//  tgp
//
//  Created by 张子豪 on 2017/10/24.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
@interface RectView : UIView

@property (nonatomic,assign) BOOL isSelected;

/* 默认状态 */
- (void)defauftRect;

/* 选中状态 */
- (void)selectRect;

@end
