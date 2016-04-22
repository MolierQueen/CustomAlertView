//
//  CustomAlertView.m
//  CustomAlertView
//
//  Created by 张宁浩 on 16/4/13.
//  Copyright © 2016年 张宁浩. All rights reserved.
//

#import "CustomAlertView.h"
#define kScreenSize [[UIScreen mainScreen] bounds].size
#define kScreenHeight CGRectGetHeight([[UIScreen mainScreen] bounds])
#define kScreenWidth  CGRectGetWidth([[UIScreen mainScreen] bounds])


static float buttonHeight = 45.f;

@interface CustomAlertView ()
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelToTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alertViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageLabelToTitleLabel;


@end

@implementation CustomAlertView {
    NSInteger _numberOfButton;
}


-(instancetype)initWithTitle:(NSString *)title
                          andMessage:(NSString *)message
           andCancelButtonTitle:(NSString *)cancelButtonTitle
  andOtherButttonTitlesArr:(NSArray<NSString *> *)OtherButttonTitles {
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomAlertView" owner:nil options:nil] firstObject];
    }
    [self setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.isAnimate = YES;

    [self createviewWithTitle:title
                                message:message
                 cancelButtonTitle:cancelButtonTitle
               otherButtonsTitles:OtherButttonTitles];
    return self;
}

#pragma mark -
#pragma mark - create view
- (void) createviewWithTitle:(NSString *)title
                                message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelButtonTitle
               otherButtonsTitles:(NSArray*)otherButtonsTitles {
    NSMutableArray * tmpArr = [NSMutableArray  arrayWithArray:otherButtonsTitles];
    if (cancelButtonTitle) {
        [tmpArr insertObject:cancelButtonTitle atIndex:0];
    }
    _numberOfButton = [tmpArr count];
    [_titleLabel setText:title];
    [_titleLabelToTop setConstant:title?25:0];
    [_titleLabel sizeToFit];
    [_messageLabel setText:message];
    [_messageLabelToTitleLabel setConstant:message?27:0];
    [_messageLabel sizeToFit];


    float buttonCenterY =_titleLabelToTop.constant + _titleLabel.frame.size.height + _messageLabelToTitleLabel.constant + _messageLabel.frame.size.height + 50;
    float buttonSeparat = 15;             //两个button之间的间距的一半

    NSLog(@"========%f", _messageLabel.frame.size.height);


    if (_numberOfButton) {
        for (int i = 0; i < _numberOfButton; i ++) {

            if (_numberOfButton >2) {
                buttonSeparat = 15/_numberOfButton;
            }
            float buttonWidth = (kScreenWidth - 100 - ((float)_numberOfButton - 1) * buttonSeparat) /(float) _numberOfButton;
            buttonWidth = buttonWidth>132 ? 132 : (kScreenWidth - 100 - ((float)_numberOfButton - 1) * buttonSeparat) /(float) _numberOfButton;
            float buttonCenterX = (self.center.x - 20 -(_numberOfButton-1)*(buttonSeparat + buttonWidth/2) + i*(buttonWidth + 2 * buttonSeparat));
            [self createButtonWtihButtonTag:cancelButtonTitle ? i : i+1
                                                 withFrame:CGRectMake(0, 0, buttonWidth, buttonHeight)
                                                       center:CGPointMake(buttonCenterX, buttonCenterY)
                                                     andTitle:tmpArr[i]];
        }
        [_alertViewHeight setConstant:buttonCenterY + 47.5];
    } else {
        [_alertViewHeight setConstant:_titleLabelToTop.constant + _titleLabel.frame.size.height + _messageLabelToTitleLabel.constant + _messageLabel.frame.size.height + 26];
    }
}

#pragma mark -
#pragma mark - create button with some property
- (void) createButtonWtihButtonTag:(NSInteger) buttonTag
                                         withFrame:(CGRect)frame
                                               center:(CGPoint)center
                                            andTitle:(NSString*)title {
    UIButton * button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTag:buttonTag];
    [button setCenter:center];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button.layer setCornerRadius:10];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:[UIColor colorWithRed:0.2627 green:0.702 blue:0.3098 alpha:1.0]];
    [button setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    if(_numberOfButton > 2) {
        [button.titleLabel setAdjustsFontSizeToFitWidth:YES];
    } else {
        [button.titleLabel setAdjustsFontSizeToFitWidth:NO];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    if (!buttonTag) {
        [button.layer setBorderColor:[UIColor colorWithRed:0.7882 green:0.7882 blue:0.7882 alpha:1.0].CGColor];
        [button.layer setBorderWidth:1.0];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitleColor:[UIColor colorWithRed:0.7882 green:0.7882 blue:0.7882 alpha:1.0] forState:UIControlStateNormal];
    }
    [_alertView addSubview:button];
}

#pragma mark -
#pragma mark - buttonAction
- (void) buttonAction:(UIButton*) sender {
    if(self.actionWithButton) {
        self.actionWithButton(sender.tag);
    }
    [self dismissAnimateWithType:self.animateType];
}

#pragma mark -
#pragma mark - to show this alertView
- (void) showInView:(UIView*)view withBlock:(buttonActionBlock)blockAction {
    if (blockAction) {
        self.actionWithButton = blockAction;
    }
    [self showAnimateWithType:self.animateType];
}

#pragma mark -
#pragma mark - to show this alertView with animate
- (void)showAnimateWithType:(CustomAlertViewAimateType)type {
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    if (type) {
        [self setCenter:CGPointMake(self.center.x, 0)];
        [self setAlpha:0];
        [UIView animateWithDuration:_isAnimate?0.3:0 animations:^{
            [self setAlpha:1];
            [self setCenter:CGPointMake(self.center.x, kScreenHeight/2)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
            } completion:^(BOOL finished) {
            }];
        }];
    } else {
        [self setAlpha:0];
        [UIView animateWithDuration:_isAnimate?0.2:0 animations:^{
            [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
            [self setAlpha:1];
        } completion:^(BOOL finished) {
        }];
    }

}

#pragma mark -
#pragma mark - hid this view
- (void)dismissAnimateWithType:(CustomAlertViewAimateType)type {
    if (type) {
        [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]];
        [UIView animateWithDuration:_isAnimate?0.5:0 animations:^{
            [self setCenter:CGPointMake(self.center.x, kScreenHeight)];
            [self setAlpha:0];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        [self.layer addAnimation:[self rotation:_isAnimate?0.5:0 degree:0.5 direction:3 repeatCount:0] forKey:nil];
    } else {
        CGAffineTransform  transform;
        transform = CGAffineTransformScale(self.transform,1.2,1.2);
        [UIView beginAnimations:@"scale" context:nil];
        [UIView setAnimationDuration:_isAnimate?0.3:0];
        [UIView setAnimationDelegate:self];
        [self setTransform:transform];
        [UIView commitAnimations];
        [UIView animateWithDuration:_isAnimate?0.5:0 animations:^{
            [self setAlpha:0];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

#pragma mark - animate1
- (void) showAnimate:(UIView*)view{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = _isAnimate?0.5:0;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];

    animation.values = values;
    [view.layer addAnimation:animation forKey:nil];
}

#pragma mark - animate2
-( CABasicAnimation *)rotation:( float )dur degree:( float )degree direction:( int )direction repeatCount:( int )repeatCount
{
    CATransform3D rotationTransform = CATransform3DMakeRotation (degree, 0 , 0 , direction);
    CABasicAnimation *animation = [ CABasicAnimation animationWithKeyPath : @"transform" ];
    animation. toValue = [ NSValue valueWithCATransform3D :rotationTransform];
    animation. duration   =  dur;
    animation. autoreverses = NO ;
    animation. cumulative = NO ;
    animation. fillMode = kCAFillModeForwards ;
    animation. repeatCount = repeatCount;
    animation. delegate = self ;
    return animation;
}

#pragma mark -
#pragma mark - config background alpha
- (void)setBackViewAlpha:(float)backViewAlpha {
    if (backViewAlpha) {
        [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:backViewAlpha]];
    }
}

#pragma mark -
#pragma mark - config titleColor
-(void)setTitleColor:(UIColor *)titleColor {
    if (titleColor) {
        [_titleLabel setTextColor:titleColor];
    }
}

#pragma mark -
#pragma mark - config messageColor
-(void)setMessageColor:(UIColor *)messageColor {
    if (messageColor) {
        [_messageLabel setTextColor:messageColor];
    }
}

#pragma mark -
#pragma mark - config cancelButtonBackgroundColor
-(void)setCancelButtonBackgroundColor:(UIColor *)cancelButtonBackgroundColor {
    if (cancelButtonBackgroundColor) {
        UIButton * button = (UIButton*)[self viewWithTag:0];
        [button setBackgroundColor:cancelButtonBackgroundColor];
    }
}

#pragma mark -
#pragma mark - config cancelButtonTitleColor
- (void)setCancelButtonTitleColor:(UIColor *)cancelButtonTitleColor {
    if (cancelButtonTitleColor) {
        UIButton * button = (UIButton*)[self viewWithTag:0];
        [button setTitleColor:cancelButtonTitleColor forState:UIControlStateNormal];
    }
}

#pragma mark -
#pragma mark - config otherButtonBackgroundColor
-(void)setOtherButtonBackgroundColor:(UIColor *)otherButtonBackgroundColor {
    if (otherButtonBackgroundColor) {
        for (int i = 1; i <_numberOfButton; i++) {
            UIButton * button = (UIButton*)[self viewWithTag:i];
            [button setBackgroundColor:otherButtonBackgroundColor];
        }
    }
}

#pragma mark -
#pragma mark - config otherButtonTitleColor
-(void)setOtherButtonTitleColor:(UIColor *)otherButtonTitleColor {
    if (otherButtonTitleColor) {
        for (int i = 1; i <_numberOfButton; i++) {
            UIButton * button = (UIButton*)[self viewWithTag:i];
            [button setTitleColor:otherButtonTitleColor forState:UIControlStateNormal];
        }
    }
}

#pragma mark -
#pragma mark - config backGroundImage
-(void)setBackGroundImage:(UIImage *)backGroundImage {
    if (backGroundImage) {
        [_backGroundImageView setImage:backGroundImage];
    }
}

#pragma mark -
#pragma mark - config contentModel
-(void)setContentMode:(UIViewContentMode)contentMode {
    if (contentMode) {
        [_backGroundImageView setContentMode:contentMode];
    }
}

#pragma mark -
#pragma mark - when dismiss or show this alert wether to show animate
-(void)setIsAnimate:(BOOL)isAnimate {
    _isAnimate = isAnimate;
}


@end
