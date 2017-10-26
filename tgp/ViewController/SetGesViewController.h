//
//  SetGesViewController.h
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "GesBaseViewController.h"

@protocol SetGesDelegate<NSObject>

- (void)getGesPass:(NSString *)pass;

@end

@interface SetGesViewController : GesBaseViewController

@property (nonatomic,weak)id<SetGesDelegate> delegate;

@end
