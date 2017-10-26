//
//  GesBaseViewController.h
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentView.h"
#import "TipLable.h"
@interface GesBaseViewController : UIViewController

@property (nonatomic,strong)ContentView *gesView;
@property (nonatomic,strong)TipLable *tipText;
@property (nonatomic,strong)NSString *passStr; //手势密码

- (void)nextRequest;

@end
