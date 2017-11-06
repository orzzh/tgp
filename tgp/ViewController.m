//
//  ViewController.m
//  tgp
//
//  Created by 张子豪 on 2017/10/24.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "ViewController.h"
#import "VerifyViewController.h"
#import "SetGesViewController.h"
#import "DragRect.h"


@interface ViewController ()<SetGesDelegate,VerifyGesDelegate>

@property (nonatomic,strong) SetGesViewController *setGesVc;
@property (nonatomic,strong) VerifyViewController *verifyVC;
@property (nonatomic,strong) NSMutableArray *RectAry;
@property (nonatomic,strong) NSMutableString *PassStr;

@property (nonatomic,strong)NSString *GesPass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *ar = @[@"验证密码",@"设置密码",@"重置密码"];
    for (int i = 0; i<2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.tag = i;
        [btn setTitle:ar[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 100, 30);
        btn.center = CGPointMake(self.view.center.x, 200+i*60);
        [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
}



- (void)btn:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
        {
            if (self.GesPass.length == 0) {
                NSLog(@"请先设置密码");
                return;
            }
            NSLog(@"验证密码");
            self.verifyVC = [[VerifyViewController alloc]init];
            self.verifyVC.delegate = self;
            [self presentViewController:self.verifyVC animated:YES completion:nil];
        }
            break;
        case 1:
        {
            NSLog(@"设置密码");
            self.setGesVc = [[SetGesViewController alloc]init];
            self.setGesVc.delegate = self;
            UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:self.setGesVc];
            [self presentViewController:nv animated:YES completion:nil];
        }
            break;
        case 2:
        {
            NSLog(@"重置密码");
            SetGesViewController *vc = [[SetGesViewController alloc]init];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
    
}


#pragma mark - 验证手势密码回调

- (void)verifyGesPass:(NSString *)pass{
    if (self.GesPass && self.GesPass.length != 0) {
        
        if ([self.GesPass isEqualToString:pass]) {
            //
            NSLog(@"手势密码正确 %@",pass);
            [self.verifyVC isSuccessGesPass:YES];
        }else{
            NSLog(@"手势密码错误");
            [self.verifyVC isSuccessGesPass:NO];
        }
    }
}


#pragma mark - 设置手势密码成功回调
- (void)getGesPass:(NSString *)pass{
    
    NSLog(@"手势密码设置成狗 %@",pass);
    self.GesPass = [NSString stringWithFormat:@"%@",pass];
    
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
