//
//  VerifyViewController.h
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "GesBaseViewController.h"

@protocol VerifyGesDelegate<NSObject>

- (void)verifyGesPass:(NSString *)pass;

@end

@interface VerifyViewController : GesBaseViewController

@property (nonatomic,strong)UILabel *userAcc;// 用户帐号

@property (nonatomic,strong)UIImageView *icon; //   头像

@property (nonatomic,weak)id<VerifyGesDelegate> delegate;

- (void)isSuccessGesPass:(BOOL)able; //yes 是正确密码

@end
