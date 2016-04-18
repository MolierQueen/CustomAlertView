//
//  ViewController.m
//  CustomAlertView
//
//  Created by 张宁浩 on 16/4/13.
//  Copyright © 2016年 张宁浩. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()
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
    _customView  = [[CustomAlertView alloc] initWithTitle:@"《笑傲江湖》"
                                                                       andMessage:@"天下风云出我辈 \n一入江湖岁月催 \n皇图霸业谈笑中 \n不胜人生一场醉 \n提剑跨骑挥鬼雨 \n白骨如山鸟惊飞 \n尘事如潮人如水 \n只叹江湖几人回"
                                                        andCancelButtonTitle:@"不感兴趣"
                                                andOtherButttonTitlesArr:@[@"我去看看"]];
    [_customView setBackGroundImage:[UIImage imageNamed:@"beijing"]];
    [_customView showInView:self.view withBlock:^(NSInteger buttonTag) {
        NSLog(@"%ld", (long)buttonTag);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
