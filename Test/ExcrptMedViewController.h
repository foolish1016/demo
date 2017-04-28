//
//  ExcrptMed.h
//  Test
//
//  Created by shagua on 2017/4/25.
//  Copyright © 2017年 shagua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupViewController.h"
@interface ExcrptMedViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray   *LRUDataArray;
}

@property (strong,nonnull) UITableView   *iTableView;
@property (weak,nullable) PopupViewController   *popView;
@end
