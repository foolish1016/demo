//
//  ExcrptMed.m
//  Test
//
//  Created by shagua on 2017/4/25.
//  Copyright © 2017年 shagua. All rights reserved.
//

#import "ExcrptMedViewController.h"
@interface ExcrptMedViewController ()
@end
@implementation ExcrptMedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewPropty];
    [self setBackButtonTitle];
    [self createTableView];
}

- (void)setViewPropty
{
    LRUDataArray = [NSMutableArray arrayWithObjects:@"优立通 非布司他片",@"双海 碳酸氢钠片",@"优瑞 胰岛素注释笔针头(BD超细超短型)31G*5mm", @"优瑞 胰岛素注释笔针头(BD超细超短型)31G*5mm",nil];
    self.title = @"开药";

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


- (void)setBackButtonTitle {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(goToBack)];
    leftButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)goToBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)createTableView
{
    _iTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _iTableView.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
    _iTableView.separatorInset = UIEdgeInsetsMake(0,10, 0, 10);
    _iTableView.delegate = self;
    _iTableView.dataSource = self;
    _iTableView.tableFooterView = [[UIView alloc]init];
    _iTableView.tableFooterView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_iTableView];
}

#pragma mark  tableViewDataSource


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView  *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel  *headTitleLabel = [[UILabel alloc]init];
    [headTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [headView addSubview:headTitleLabel];
    headTitleLabel.font = [UIFont systemFontOfSize:15];
    headTitleLabel.textColor = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
    headTitleLabel.text = @"最常使用";
    [headView addConstraints:@[
     [NSLayoutConstraint constraintWithItem:headTitleLabel
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:headView
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1
                                   constant:15],
     
     [NSLayoutConstraint constraintWithItem:headTitleLabel
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:headView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]
                                     ]];
    
    
    UILabel   *imageLabel  = [[UILabel alloc]init];
    [headView addSubview:imageLabel];
    imageLabel.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
    [imageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [headView addConstraints:@[
      [NSLayoutConstraint constraintWithItem:imageLabel
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:headView
                                   attribute:NSLayoutAttributeLeft
                                  multiplier:1
                                    constant:0],
      
       [NSLayoutConstraint constraintWithItem:imageLabel
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:headView
                                    attribute:NSLayoutAttributeRight
                                   multiplier:1
                                     constant:0],
      
       [NSLayoutConstraint constraintWithItem:imageLabel
                                    attribute:NSLayoutAttributeBottom
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:headView
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1
                                     constant:0],
      
     [NSLayoutConstraint constraintWithItem:imageLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1],
                              ]];

    
    
    
    
    return headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (LRUDataArray) {
      return LRUDataArray.count;
    }
    return  0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
     cell.textLabel.numberOfLines = 0;
     cell.textLabel.textColor = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
     cell.textLabel.font = [UIFont systemFontOfSize:15];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text =  LRUDataArray[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return  60.0f;
}


//去掉最后一行线
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

#pragma mark  

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (!_popView)
    {
        PopupViewController  *popView = [[PopupViewController alloc]init];
        _popView = popView;
        [_popView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:_popView];

        [self.view addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem: _popView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                                   
                                   [NSLayoutConstraint constraintWithItem: _popView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:1],
                                   [NSLayoutConstraint constraintWithItem: _popView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:1],
                                   [NSLayoutConstraint constraintWithItem: _popView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1],
                                   
                                   
                                   
                                   ]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
