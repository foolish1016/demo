//
//  ViewController.m
//  Test
//
//  Created by shagua on 2017/4/24.
//  Copyright © 2017年 shagua. All rights reserved.
//

#import "ViewController.h"
#import "ExcrptMedViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showExcrptMedViewController];
}

- (void)showExcrptMedViewController
{
    ExcrptMedViewController  *excrptMedVC = [[ExcrptMedViewController alloc]init];
    
    UINavigationController  *NavViewController = [[UINavigationController alloc]initWithRootViewController:excrptMedVC];
    NavViewController.navigationBar.barTintColor = [UIColor blackColor];
    
    [NavViewController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]}];

    [self presentViewController:NavViewController animated:YES completion:nil];
    
    
}



@end
