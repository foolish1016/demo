//
//  PopupViewController.m
//  Test
//
//  Created by shagua on 2017/4/25.
//  Copyright © 2017年 shagua. All rights reserved.
//
#define textcolor   [UIColor  colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]
#define textfont    [UIFont systemFontOfSize:16]
#import "PopupViewController.h"
@interface PopupViewController ()
@end

@implementation PopupViewController
- (instancetype)init {
    
    self = [super init];
    daytime = 4;
    timecount = 4;
    selectTimecount = 0;
    selectDaytime = 0;
    [self  createShowView];
    [self  setUI];
    [self  setUIValue];
    [self  layoutAllSubView];

    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    return self;
}

-(void)createShowView
{
    self.showView = [[UIView alloc]init];
    self.showView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.showView];

    self.showView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height/2);
    
    [UIView animateWithDuration:0.3 animations:^{
          self.showView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height- [UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height/2);
        
    } completion:nil];
    
    UIButton  *bgbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgbutton addTarget:self action:@selector(sureEvent)  forControlEvents:UIControlEventTouchDown];
    bgbutton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width   ,
                                [UIScreen mainScreen].bounds.size.height/2);
    [self addSubview:bgbutton];
    
}



-(void)dissmissView
{
    [UIView animateWithDuration:0.3 animations:^{
         self.showView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height/2);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setUI
{
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showView  addSubview:self.cancelBtn];
    
    [self.cancelBtn setTitleColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] forState:UIControlStateNormal];
    [self.cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self.cancelBtn.layer.masksToBounds  = YES;
    [self.cancelBtn.layer setCornerRadius:5];
    [self.cancelBtn.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.cancelBtn.layer setBorderWidth:1.0f];
    [self.cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self
                       action:@selector(cancelEvent)
             forControlEvents:UIControlEventTouchUpInside];
    
    
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showView   addSubview:self.confirmBtn];
    [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmBtn addTarget:self
                        action:@selector(sureEvent)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.confirmBtn setTitleColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] forState:UIControlStateNormal];
    [self.confirmBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self.confirmBtn.layer.masksToBounds  = YES;
    [self.confirmBtn.layer setCornerRadius:5];
    [self.confirmBtn.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.confirmBtn.layer setBorderWidth:1.0f];
    [self.confirmBtn setBackgroundColor:[UIColor whiteColor]];
    
    
    
    self.labelLine  = [[UILabel alloc]init];
    self.labelLine.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
    [self.showView addSubview:self.labelLine];
    
    
    self.ruleLabel = [[UILabel alloc]init];
    self.ruleLabel.text = @"规格";
    self.ruleLabel.font = textfont;
    self.ruleLabel.textColor = textcolor;
    [self.showView addSubview:self.ruleLabel];
    
    self.ruleVarLable = [[UILabel alloc]init];
    self.ruleVarLable.textColor = [UIColor blackColor];
    self.ruleVarLable.font = [UIFont systemFontOfSize:15];
    [self.showView addSubview:self.ruleVarLable];
    
    self.countLabel  = [[UILabel alloc]init];
    self.countLabel.text = @"数量";
    self.countLabel.font = textfont;
    self.countLabel.textColor = textcolor;
    [self.showView addSubview:self.countLabel];
    
    
    self.numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 160, 120, 40)];
    //设置边框颜色
    self.numberButton.editing = NO;
    self.numberButton.borderColor = [UIColor grayColor];
    self.numberButton.increaseTitle = @"＋";
    self.numberButton.decreaseTitle = @"－";
    self.numberButton.currentNumber = 1;
    self.numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.showView addSubview:self.numberButton];
    
    self.labelLineTwo  = [[UILabel alloc]init];
    self.labelLineTwo.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
    [self.showView addSubview:self.labelLineTwo];

    self.userLabel = [[UILabel alloc]init];
    self.userLabel.text = @"用法";
    self.userLabel.textColor = textcolor;
    self.userLabel.font = textfont;
    [self.showView addSubview:self.userLabel];
    
    self.dayPickerView  = [[UIPickerView alloc]init];
    [self.showView addSubview:self.dayPickerView];
    self.dayPickerView.dataSource = self;
    self.dayPickerView.delegate = self;
    
    self.timePickerView = [[UIPickerView alloc]init];
    [self.showView addSubview:self.timePickerView];
    self.timePickerView.dataSource = self;
    self.timePickerView.delegate = self;
}

- (void)setUIValue
{
    self.ruleVarLable.text = @"40mg*14片";
}


-(void)cancelEvent
{
    [self dissmissView];
}

-(void)sureEvent
{
    [self dissmissView];
}

-(void)layoutAllSubView
{
    
    [self.cancelBtn         setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.confirmBtn        setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.labelLine         setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.dayPickerView     setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.timePickerView    setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.labelLineTwo      setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.countLabel        setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.ruleLabel         setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.userLabel         setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.numberButton      setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.ruleVarLable       setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.showView addConstraints:@[
       [NSLayoutConstraint constraintWithItem:self.cancelBtn
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.showView
                                    attribute:NSLayoutAttributeLeft
                                   multiplier:1.0
                                     constant:10],
       
       [NSLayoutConstraint constraintWithItem:self.cancelBtn
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.showView
                                    attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                     constant:10],
       
       [NSLayoutConstraint constraintWithItem:self.cancelBtn
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                    attribute:NSLayoutAttributeNotAnAttribute
                                   multiplier:1.0
                                     constant:40],
       
       [NSLayoutConstraint constraintWithItem:self.cancelBtn
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                    attribute:NSLayoutAttributeNotAnAttribute
                                   multiplier:1.0
                                     constant:25],
       ]];
    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:-10],
        
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:10],
        
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:40],
        
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:25],
                                    ]];
    
    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.labelLine
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:10],
        
        [NSLayoutConstraint constraintWithItem:self.labelLine
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:-10],
        
        [NSLayoutConstraint constraintWithItem:self.labelLine
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.confirmBtn
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:15],
            
        [NSLayoutConstraint constraintWithItem:self.labelLine
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:1],
                                ]];
    
    
    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.ruleLabel
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:10],
        
        [NSLayoutConstraint constraintWithItem:self.ruleLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.labelLine
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:20],
        [NSLayoutConstraint constraintWithItem:self.ruleLabel
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:20],
                                    ]];
    
    
    [self.showView addConstraints:@[
    [NSLayoutConstraint constraintWithItem:self.ruleVarLable
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.showView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:-10],
    
    [NSLayoutConstraint constraintWithItem:self.ruleVarLable
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.ruleLabel
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0],
    
    ]];
//
//    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.countLabel
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:10],
        
        [NSLayoutConstraint constraintWithItem:self.countLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.ruleLabel
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:20],
        
        [NSLayoutConstraint constraintWithItem:self.countLabel
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:1.0
                                               constant:20]
        
        
    
        ]];
    
    
    [self.showView addConstraints:@[
    [NSLayoutConstraint constraintWithItem:self.numberButton
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.showView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:-10],
    
    [NSLayoutConstraint constraintWithItem:self.numberButton
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.countLabel
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0],
    
    [NSLayoutConstraint constraintWithItem:self.numberButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:100],
    
    [NSLayoutConstraint constraintWithItem:self.numberButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:35]

                                    ]];

    
    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.labelLineTwo
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:10],
        
        [NSLayoutConstraint constraintWithItem:self.labelLineTwo
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:-10],
        
        [NSLayoutConstraint constraintWithItem:self.labelLineTwo
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.countLabel
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:15],
        
        [NSLayoutConstraint constraintWithItem:self.labelLineTwo
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:1],
        ]];
    
//
//
    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.userLabel
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:10],
        
        [NSLayoutConstraint constraintWithItem:self.userLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.labelLineTwo
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:10],
        [NSLayoutConstraint constraintWithItem:self.userLabel
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:20],
        
        
        
        
                                    ]];
    
//    
//    
    [self.showView addConstraints:@[
       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.showView
                                    attribute:NSLayoutAttributeLeft
                                   multiplier:1.0
                                     constant:10],
       
       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.userLabel
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                     constant:10],

       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeBottom
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.showView
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                     constant:0],

       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                    attribute:NSLayoutAttributeNotAnAttribute
                                   multiplier:1.0
                                     constant:[UIScreen mainScreen].bounds.size.width/2 - 20]
       ]];

    
    
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.timePickerView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:-10],
        
        [NSLayoutConstraint constraintWithItem:self.timePickerView
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.dayPickerView
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:0],
        
        [NSLayoutConstraint constraintWithItem:self.timePickerView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.dayPickerView
                                     attribute:NSLayoutAttributeHeight
                                    multiplier:1.0
                                      constant:0],
        
        [NSLayoutConstraint constraintWithItem:self.timePickerView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:[UIScreen mainScreen].bounds.size.width/2 - 20]
                                    ]];

}

#pragma mark

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.dayPickerView)
    {
        return daytime;
    }
    return timecount;
}
- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
 
    NSString *attriString;
    if (pickerView == _dayPickerView)
    {
        attriString  =   [NSString stringWithFormat:@"每天 %ld 次",(long)row+1];
    }
    else
    {
        attriString  =   [NSString stringWithFormat:@"每次 %ld 片",(long)row+1];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:attriString];
    
    [attributedString addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:24]
     
                          range:NSMakeRange(3, 1)];
    return attributedString;
}



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textAlignment  = NSTextAlignmentCenter;
        pickerLabel.adjustsFontSizeToFitWidth = YES;

    }
    pickerLabel.attributedText=[self pickerView:pickerView attributedTitleForRow:row forComponent:component];
    
    
    ((UILabel *)[pickerView.subviews objectAtIndex:1]).backgroundColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];
    
    ((UILabel *)[pickerView.subviews objectAtIndex:2]).backgroundColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];    return pickerLabel;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
     //处理事件，并返回数据
    
    if(pickerView == _dayPickerView)
    {
        selectDaytime = row;
    }
    else
    {
        selectTimecount = row;
    }
    
    
    
}
@end
