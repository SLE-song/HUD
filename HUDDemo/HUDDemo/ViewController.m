//
//  ViewController.m
//  HUDDemo
//
//  Created by mzyw on 16/10/13.
//  Copyright © 2016年 宋帅超. All rights reserved.
//

#import "ViewController.h"
#import "SLEProgressHUD.h"


#define SLEDAULT_DURATION 2.0

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *hudString;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [SLEProgressHUD dismiss];
}


- (IBAction)status:(id)sender {// 正常弹窗提示信息
    
    [SLEProgressHUD showStatusWithString:self.hudString.text dismiss:SLEDAULT_DURATION];
}

- (IBAction)success:(id)sender {
    
    [SLEProgressHUD showSuccessWithString:self.hudString.text dismiss:SLEDAULT_DURATION];
}

- (IBAction)error:(id)sender {
    
    [SLEProgressHUD showErrorWithString:self.hudString.text dismiss:SLEDAULT_DURATION];
}


- (IBAction)defaultStatus:(id)sender {// 默认弹窗不会消失，需要手动调用 dismiss 方法
    
    [SLEProgressHUD showStatusWithString:self.hudString.text];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(SLEDAULT_DURATION * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SLEProgressHUD dismiss];
        [SLEProgressHUD showSuccessWithString:self.hudString.text dismiss:2];
    });
}

@end
