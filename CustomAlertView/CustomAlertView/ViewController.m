//
//  ViewController.m
//  CustomAlertView
//
//  Created by 张宁浩 on 16/4/13.
//  Copyright © 2016年 张宁浩. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()<CustomAlertViewDelegate>
@property (nonatomic, strong) CustomAlertView * customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor orangeColor]];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"弹窗" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void) buttonAction:(UIButton * )sender {
    _customView  = [[CustomAlertView alloc] initWithTitle:@"《笑傲江湖》" andMessage:@"东方不败抱着自己杀死的任夫" andCancelButtonTitle:@"不好看不看了" andOtherButttonTitlesArr:@[@"真牛逼我去看"] andDelegate:self];
    [_customView showInView:self.view];
}

-(void)customAlertViewButtonsAction:(NSInteger)buttonAtg {
    NSLog(@"我点击了 %ld", (long)buttonAtg);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
