//
//  VerifyViewController.m
//  tgp
//
//  Created by 张子豪 on 2017/10/25.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "VerifyViewController.h"
#import "Define.h"
@interface VerifyViewController ()<HideTrackDelegate>
{
    UIButton *cencel;
}


@end

@implementation VerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)addUI{
   
    CGFloat w = RECT_WEIGHT*3 + 40+ RECT_RADIUS_SPACE *2;
    cencel = [UIButton buttonWithType:UIButtonTypeSystem];
    cencel.frame = CGRectMake(self.gesView.frame.origin.x+w/2+50,self.view.center.y+60+w/2,0, 40);
    [cencel setTitle:@"返回密码登陆" forState:UIControlStateNormal];
    [cencel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cencel sizeToFit];
    [cencel addTarget:self action:@selector(cencel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cencel];
    
    
    [self.view addSubview:self.icon];
    [self.view addSubview:self.userAcc];
    [self.view addSubview:self.hideView];
}


- (void)cencel{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)nextRequest{
    
    self.tipText.text = @"";
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(verifyGesPass:)]) {
        [self.delegate verifyGesPass:self.passStr];
    }
}

- (void)isSuccessGesPass:(BOOL)able{
    if (able) {
        
        [self dismissViewControllerAnimated:YES completion:nil];

    }else{
        [self.tipText setFaildWithNSString: @"手势密码错误"];
    }
}


- (UILabel *)userAcc{
    if (!_userAcc) {
        _userAcc = [[UILabel alloc]initWithFrame:CGRectMake(0, self.icon.frame.origin.y+self.icon.frame.size.height, S_WIDTH, 30)];
        _userAcc.font = [UIFont systemFontOfSize:16];
        _userAcc.textColor = [UIColor grayColor];
        _userAcc.textAlignment = 1;
        _userAcc.text = @"136****8332";
    }
    return _userAcc;
}

- (UIImageView *)icon{
    if (!_icon) {
        CGFloat w = RECT_WEIGHT*3 + 40+ RECT_RADIUS_SPACE *2;
        CGFloat y = self.view.center.y-w/2-50;
        CGFloat h = 70;
        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(0 , 0, h, h)];
        _icon.center = CGPointMake(self.view.center.x, y);
        _icon.backgroundColor = [UIColor grayColor];
        _icon.layer.cornerRadius = h/2;
    }
    return _icon;
}

- (HideTrackView *)hideView{
    if (!_hideView) {
        CGFloat w = RECT_WEIGHT*3 + 40+ RECT_RADIUS_SPACE *2;
        _hideView = [[HideTrackView alloc]initWithFrame:CGRectMake(S_WIDTH-cencel.frame.origin.x-cencel.frame.size.width, self.view.center.y+60+w/2, 100, 40)];
        _hideView.delegate = self;
    }
    return _hideView;
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
