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
    _customView  = [[CustomAlertView alloc] initWithTitle:@"《笑傲江湖》" andMessage:@"东方不败抱着自己杀死的任夫人到任教主闭关的地方，任我行听到此消息非常的伤心，破门而出抱着的自己夫人，大吼。任我行在气愤的时候，亲自去找五岳剑派，任我行和几大门派都打起来了，任我行连伤几大门派的掌门，最后与左冷禅相斗，使用吸星大法准备吸取他的内力，可是就在这个时候，任我行感觉自己的经脉被堵，怕五岳剑派合力追讨，就向五岳剑派说让其准备一月后，亲自讨伐五岳剑派。　　任我行回到日月神教，平一直为其把脉，结果知道了任我行的病症，让其不要在修炼吸星大法，否者吸星大法戏来的内力会反噬，不要修炼此法了，任我行为了不想让自己的病情告知出去，平一直明白教主的想法，就发誓离开黑木崖，平一直离开黑木崖，东方不败带着任盈盈来到大厅，当任我行救治任盈盈的时候，东方不败偷袭，任我行伤及内息，使其残害到了同门，就这样东方不败夺其教主之位。　　东方不败夺到教主之位就假装修练葵花宝典，最开始还比较迷惑葵花宝典的功法，最后找其她女人来掩饰自己练就葵花宝典，次日，向问天到大殿见东方不败，发现了东方不败已经变成女人，练就葵花宝典很惊讶。　　十年以后，华山派一群弟子在气夫子，为了赶走老夫子，令狐冲就和小师妹一起气走老夫子，岳不群很气恼，就严惩坐下弟子，让二师兄劳德诺鞭打他们，令狐冲为了让其也找了很多借口解释，但是师傅始终不相信，还是让其惩罚。令狐冲然后接师傅的安排下山采集物品为了气走老夫子的惩罚" andCancelButtonTitle:@"不好看不看了" andOtherButttonTitlesArr:@[@"真牛逼我去看"] andDelegate:self];
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
