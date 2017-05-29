//
//  PopupViewController.h
//  Test
//
//  Created by shagua on 2017/4/25.
//  Copyright © 2017年 shagua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPNumberButton.h"
@interface PopupViewController : UIView <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSInteger  daytime;
    NSInteger  timecount;
    
    NSInteger   selectDaytime;
    NSInteger   selectTimecount;
    
    NSInteger    firstIndex;

}
@property (strong,nonnull) UIView   *showView;
@property (strong,nonnull) UIButton *cancelBtn;
@property (strong,nonnull) UIButton *confirmBtn;

@property (strong,nonnull) UILabel  *titleLabel;
@property (strong,nonnull) UILabel  *ruleLabel;
@property (strong,nonnull) UILabel  *ruleVarLable;


@property (strong,nonnull) UILabel  *countLabel;
@property (strong,nonnull) PPNumberButton *numberButton;
@property (strong,nonnull) UILabel  *labelLineTwo;


@property (strong,nonnull) UILabel  *userLabel;
@property (strong,nonnull) UIPickerView *dayPickerView;
@property (strong,nonnull) UIPickerView *timePickerView;

- (void)setUIValue:(NSString *_Nullable)titleString;


@end
