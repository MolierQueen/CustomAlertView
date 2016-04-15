//
//  CustomAlertView.h
//  CustomAlertView
//
//  Created by 张宁浩 on 16/4/13.
//  Copyright © 2016年 张宁浩. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  button action
 *
 *  @param NSInteger button tag
 */
typedef void(^buttonActionBlock)(NSInteger buttonTag);


@interface CustomAlertView : UIView

@property (nonatomic, copy) buttonActionBlock actionWithButton;

/**
 *  the big background alpha  default is 0;     0~1
 */
@property (nonatomic, assign) float backViewAlpha;

/**
 *  the title clolr; default is [UIColor colorWithRed:0.2627 green:0.702 blue:0.3098 alpha:1.0]
 */
@property (nonatomic, strong) UIColor * titleColor;

/**
 *  the message clolr; default is [UIColor colorWithRed:0.1506 green:0.1506 blue:0.1506 alpha:1.0]
 */
@property (nonatomic, strong) UIColor * messageColor;

/**
 *  the cancel button color default is [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
 */
@property (nonatomic, strong) UIColor * cancelButtonBackgroundColor;

/**
 *  the cancel button title color default is [UIColor colorWithRed:0.7882 green:0.7882 blue:0.7882 alpha:1.0]
 */
@property (nonatomic, strong) UIColor * cancelButtonTitleColor;

/**
 *  the other button clolr; default is [UIColor colorWithRed:0.2627 green:0.702 blue:0.3098 alpha:1.0]
 */
@property (nonatomic, strong) UIColor * otherButtonBackgroundColor;

/**
 *  the other button title color default is [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
 */
@property (nonatomic, strong) UIColor * otherButtonTitleColor;

/**
 *  this is the backgroundimage you can use your image. defaule is null
 */
@property (nonatomic, strong) UIImage * backGroundImage;

/**
 *  to config the imageView contentModel
 */
@property (nonatomic, assign) UIViewContentMode contentModel;

/**
 *  when dismiss or show this alert wether to show animate; default is YES
 */
@property (nonatomic, assign) BOOL isAnimate;

/**
 *  this is an initialize method, you can use the flow properties to create this alertView。
 *
 *  @param title              AlertView title
 *  @param message         AlertView information
 *  @param cancelButtonTitle  cancel button title
 *  @param OtherButtton  Titles other button's title you need to give it a arr with string value
 *
 *  @return return self
 */
-(instancetype) initWithTitle:( NSString * )title
                           andMessage:( NSString * )message
            andCancelButtonTitle:( NSString * )cancelButtonTitle
   andOtherButttonTitlesArr:( NSArray < NSString * > *)OtherButttonTitles;

/**
 *  to dismiss alertView
 */
- (void) disMissAlertView;

/**
 *  to show this alertView in your view
 *
 *  @param view your view
 *  @param blockAction  to return back the button action;
 */
- (void) showInView:(UIView*)view withBlock:(buttonActionBlock)blockAction;
@end
