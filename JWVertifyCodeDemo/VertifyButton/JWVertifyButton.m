//
//  JWVertifyButton.m
//  JWVertifyCodeDemo
//
//  Created by JessieWu on 2018/8/18.
//  Copyright © 2018年 JessieWu. All rights reserved.
//

#import "JWVertifyButton.h"

@interface JWVertifyButton()

@property (nonatomic, assign) NSUInteger currentTime;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *countdownTitle;
@property (nonatomic, assign) NSUInteger vertifyTime;

@end

@implementation JWVertifyButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.vertifyTime = 60;  //默认60s
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)color
                 disableColor:(UIColor *)disableColor
               countdownTitle:(NSString *)titleFormat
                  vertifyTime:(NSUInteger)time {
    self = [super init];
    if (self) {
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitleColor:disableColor forState:UIControlStateDisabled];
        self.normalTitle = title;
        self.countdownTitle = titleFormat;
        self.vertifyTime = time;
        [self setupUI];
    }
    return self;
}

- (void)dealloc {
    [self stopCount];
}

#pragma mark - UI
- (void)setupUI {
    [self setTitle:self.normalTitle forState:UIControlStateNormal];
}
#pragma mark - private methods
- (void)countdownAction {
    self.currentTime--;
    self.enabled = self.currentTime == 0;
    if (self.currentTime > 0) {
        [self setTitle:[NSString stringWithFormat:self.countdownTitle, self.currentTime] forState:UIControlStateDisabled];
    } else {
        [self setTitle:self.normalTitle forState:UIControlStateNormal];
        [self stopCount];
    }
    [self setNeedsLayout];
}

- (void)stopCount {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - public method
- (void)startCountdown {
    //NSTimer
    
    //ios10 以后使用
//    __weak typeof(self) weakSelf = self;
//    if (@available(iOS 10.0, *)) {
//        self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//            weakSelf.enabled = weakSelf.currentTime == 0;
//            if (weakSelf.currentTime > 0) {
//
//                NSString *showInfo = [NSString stringWithFormat:weakSelf.countdownTitle,  weakSelf.currentTime];
//                [weakSelf setTitle:showInfo forState:UIControlStateDisabled];
//                weakSelf.currentTime--;
//            } else {
//                [weakSelf setTitle:weakSelf.normalTitle forState:UIControlStateNormal];
//                [weakSelf stopCount];
//            }
//            [self setNeedsDisplay];
//        }];
//    } else {
//        // Fallback on earlier versions
//    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countdownAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

#pragma mark - setter & getter
- (void)setVertifyTime:(NSUInteger)vertifyTime {
    _vertifyTime = vertifyTime;
    self.currentTime = vertifyTime;
}

@end
