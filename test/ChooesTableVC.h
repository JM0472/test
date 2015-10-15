//
//  ChooesTableVC.h
//  test
//
//  Created by carisok on 15/10/13.
//  Copyright © 2015年 QJM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooesTableVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    BOOL isEdit;
    UIButton *editBtn;
    NSMutableArray *dataArr;
    NSMutableArray *deleteArr;
}

@property (nonatomic, retain) UITableView *tableView;

@end
