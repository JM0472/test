//
//  ViewController.h
//  test
//
//  Created by carisok on 15/9/1.
//  Copyright (c) 2015年 QJM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *rTextField;
@property (strong, nonatomic) IBOutlet UITextField *gTextField;
@property (strong, nonatomic) IBOutlet UITextField *bTextField;
@property (strong, nonatomic) IBOutlet UIView *colorView;

@end

