//
//  ViewController.m
//  test
//
//  Created by carisok on 15/9/1.
//  Copyright (c) 2015年 QJM. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ChooesTableVC.h"

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define WACOLOR(w, a) [UIColor colorWithWhite:w alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [self.view addGestureRecognizer:tap];
    
    // 测试网络请求
//    [self test];
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    
    [self.view endEditing:YES];
    
//    [self changeColor];
    
    ChooesTableVC *chooesTbVC = [[ChooesTableVC alloc] init];
    [self.navigationController pushViewController:chooesTbVC animated:YES];
}

- (void)changeColor {
    
    NSInteger r = [self.rTextField.text integerValue];
    NSInteger g = [self.gTextField.text integerValue];
    NSInteger b = [self.bTextField.text integerValue];
    
    self.colorView.backgroundColor = RGBCOLOR(r, g, b);
}

// 测试
- (void)test {
    
    NSDictionary *parameters = @{@"username":@"test1",@"password":@"123456"};
    NSString *url = @"http://120.24.239.93:8080/album/login/login4App.jhtml";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //SEND YOUR REQUEST
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSString *token = [data objectForKey:@"token"];
        
//        NSLog(@"JSON: %@", string);
        NSLog(@"data: %@", data);
        NSLog(@"token: %@", token);

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error.userInfo);
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
//    NSLog(@"%@", textField.text);
    
    [self changeColor];
    
    return YES;
}

@end
