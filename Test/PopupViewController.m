//
//  PopupViewController.m
//  Test
//
//  Created by shagua on 2017/4/25.
//  Copyright © 2017年 shagua. All rights reserved.
//
#define textcolor   [UIColor  colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]
#define textfont    [UIFont systemFontOfSize:28]
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
    [self  layoutAllSubView];

    return self;
}

-(void)createShowView
{
    self.showView = [[UIView alloc]init];
    self.showView.backgroundColor = [UIColor whiteColor];
    self.showView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self addSubview:self.showView];
}


- (void)setUI
{
    
    self.titleLabel  = [[UILabel alloc]init];
    self.titleLabel.font = textfont;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.showView addSubview:self.titleLabel];
    
    self.dayPickerView  = [[UIPickerView alloc]init];
    [self.showView addSubview:self.dayPickerView];
    self.dayPickerView.dataSource = self;
    self.dayPickerView.delegate = self;
    
    self.timePickerView = [[UIPickerView alloc]init];
    [self.showView addSubview:self.timePickerView];
    self.timePickerView.dataSource = self;
    self.timePickerView.delegate = self;
    
    
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showView   addSubview:self.confirmBtn];
    [self.confirmBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.confirmBtn addTarget:self
                        action:@selector(nextEvent:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.confirmBtn setTitleColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] forState:UIControlStateNormal];
    [self.confirmBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self.confirmBtn.layer.masksToBounds  = YES;
    [self.confirmBtn.layer setCornerRadius:5];
    [self.confirmBtn.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.confirmBtn.layer setBorderWidth:1.0f];
    [self.confirmBtn setBackgroundColor:[UIColor whiteColor]];

    
    
}



- (void)setUIValue:(NSString *_Nullable)titleString;
{
    self.titleLabel.text = titleString;
}

//处理下一步
-(void)nextEvent:(id)sender
{
    
    
}

-(void)layoutAllSubView
{
    [self.dayPickerView     setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.timePickerView    setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.titleLabel        setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.confirmBtn         setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.showView addConstraints:@[
                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.showView
                                             attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                              constant:10],
                
                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeLeft
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.showView
                                             attribute:NSLayoutAttributeLeft
                                            multiplier:1.0
                                              constant:10],
                
              
                
                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeRight
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.showView
                                             attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                              constant:-10]
                                    ]];
    

    
    [self.showView addConstraints:@[
       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.showView
                                    attribute:NSLayoutAttributeLeft
                                   multiplier:1.0
                                     constant:10],
       
       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeCenterY
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.showView
                                    attribute:NSLayoutAttributeCenterY
                                   multiplier:1.0
                                     constant:10],

       [NSLayoutConstraint constraintWithItem:self.dayPickerView
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                    attribute:NSLayoutAttributeNotAnAttribute
                                   multiplier:1.0
                                     constant:120],

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
    
    
    
    //这里要设置多少，自己调整constant  后面的数字
    [self.showView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:20],
        
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:-10],
        
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.showView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:-10],
        
        [NSLayoutConstraint constraintWithItem:self.confirmBtn
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:25],
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

#pragma mark   这里是富文本  你需要在这里做一下字体加粗
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
                                 range:NSMakeRange(0, [attriString length])];
    
    return attributedString;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED
{
        if (pickerView  == self.dayPickerView)
        {
            
          return @"";
        }
    return @"";

}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textAlignment  = NSTextAlignmentCenter;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    
    if(row == firstIndex){
        
        pickerLabel.attributedText
        = [self pickerView:pickerView attributedTitleForRow:firstIndex forComponent:component];
        pickerLabel.attributedText=[self pickerView:pickerView attributedTitleForRow:row forComponent:component];
        [pickerView.subviews objectAtIndex:1].layer.borderWidth = 3;
        [pickerView.subviews objectAtIndex:2].layer.borderWidth = 3;
        
        //这里修改颜色
        ((UILabel *)[pickerView.subviews objectAtIndex:1]).layer.borderColor =  [UIColor redColor].CGColor;
        
        ((UILabel *)[pickerView.subviews objectAtIndex:2]).layer.borderColor = [UIColor redColor].CGColor;

        
    }else{
        
        pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    }
        return pickerLabel;
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
