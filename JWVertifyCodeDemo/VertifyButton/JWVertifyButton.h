//
//  JWVertifyButton.h
//  JWVertifyCodeDemo
//
//  Created by JessieWu on 2018/8/18.
//  Copyright © 2018年 JessieWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWVertifyButton : UIButton

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)color
                 disableColor:(UIColor *)disableColor
               countdownTitle:(NSString *)titleFormat
                  vertifyTime:(NSUInteger)time;

- (void)startCountdown;


@end
