//
//  SetGesViewController.m
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "SetGesViewController.h"
#import "SetHeadView.h"
@interface SetGesViewController ()

@property (nonatomic,strong)NSString *firstNun;
@property (nonatomic,strong)NSString *SecontNun;
@property (nonatomic,assign)BOOL isFirstSet;//第一次输入密码
@property (nonatomic,strong)SetHeadView *headView;
@end
@implementation SetGesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isFirstSet = YES;
}

- (void)addUI{
    
    [self.tipText setDefaultWithNSString: @"请设置手势密码"];
   
    [self.view addSubview:self.headView];
    
}



- (void)nextRequest{
    
    if (self.isFirstSet) {
        self.firstNun = [NSString stringWithFormat:@"%@",self.passStr];
        self.isFirstSet = NO;
        [self.headView refreshWithString:self.firstNun];
        [self.tipText setDefaultWithNSString:@"请确认手势密码"];
//        NSLog(@"one %@",self.firstNun);
    }else{
        
        if ([self.passStr isEqualToString:self.firstNun]) {
            
            self.tipText.text = @"";
//            NSLog(@"two %@",self.passStr);
//            NSLog(@"两次手势相同 退出");

            //储存手势密码
            if (self.delegate && [self.delegate respondsToSelector:@selector(getGesPass:)]) {
                [self.delegate getGesPass:self.firstNun];
            }
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];

        }else{
            
            [self.tipText setFaildWithNSString: @"两次手势不同,请重新设置"];
            [self.headView defult];
            self.isFirstSet = YES;
//            NSLog(@"两次手势不同 重新设置");
//            NSLog(@"two %@",self.passStr);

        }
        
    }
}


- (SetHeadView *)headView{
    if (!_headView) {
        CGFloat w = RECT_WEIGHT*3 + 40+ RECT_RADIUS_SPACE *2;
        CGFloat y = self.view.center.y-w/2-50;
        self.headView = [[SetHeadView alloc]initWithFrame:CGRectMake(0 , 0, 60, 60)];
        self.headView.center = CGPointMake(self.view.center.x, y+20);
    }
    return _headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
