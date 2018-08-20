//
//  ViewController.m
//  JWVertifyCodeDemo
//
//  Created by JessieWu on 2018/8/18.
//  Copyright © 2018年 JessieWu. All rights reserved.
//

#import "ViewController.h"
#import "JWVertifyButton.h"

@interface ViewController ()

@property (nonatomic, strong) JWVertifyButton *vertifyBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.vertifyBtn = [[JWVertifyButton alloc] initWithTitle:@"获取验证码" titleColor:[UIColor blackColor] disableColor:[UIColor lightGrayColor] countdownTitle:@"%zis后重发" vertifyTime:10];
    [self.vertifyBtn setFrame:CGRectMake(30, 100, 100, 50)];
    [self.vertifyBtn.layer setBackgroundColor:[UIColor redColor].CGColor];
    self.vertifyBtn.layer.cornerRadius = 5.0f;
    [self.view addSubview:self.vertifyBtn];
    
    [self.vertifyBtn addTarget:self action:@selector(getVertifyCode:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - actions & events
- (void)getVertifyCode:(id)sender {
    [self.vertifyBtn startCountdown];
}

@end
