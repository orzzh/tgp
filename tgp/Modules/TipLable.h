//
//  TipLable.h
//  tgp
//
//  Created by 张子豪 on 2017/10/26.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipLable : UILabel

/* 默认提示文字 */
- (void)setDefaultWithNSString:(NSString *)str;

/* 错误提示文字 */
- (void)setFaildWithNSString:(NSString *)str;




@end
