//
//  BKPraiseView.m
//  BaiKeMiJiaLive
//
//  Created by chendb on 16/10/12.
//  Copyright © 2016年 facebac. All rights reserved.
//

#import "BKPraiseView.h"
#import "UIView+BKExtension.h"


static NSTimeInterval const liveAnimationDuration = 4;
@interface BKPraiseView ()

@property (nonatomic, strong) UIView *superView;
@end

@implementation BKPraiseView

- (instancetype)initWithFrame:(CGRect)frame withSuperView:(UIView *)superView
{
    if (self = [super initWithFrame:frame]) {
        
        self.superView = superView;
        int imageName = round(random() % 12);
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"resource.bundle/heart%d.png",imageName]];
    }
    return self;
}


- (void)addAnimationView
{
    // 初始化
    self.transform = CGAffineTransformMakeScale(0, 0);
    self.alpha = 0;
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 0.9;
    } completion:^(BOOL finished) {
        
    }];
    // 随机数
    NSInteger i = arc4random_uniform(2);
    NSInteger rotationDirection = 1 - (2*i);
    
    // 绘制路径
    UIBezierPath *heartTravelPath = [UIBezierPath bezierPath];
    [heartTravelPath moveToPoint:self.center];
    
    CGPoint endPoint = CGPointMake(self.centerX + (rotationDirection) * arc4random_uniform(2*self.width), self.superView.height/6.0 + arc4random_uniform(self.superView.height/6.0));
    
    CGFloat x = (self.width/2.0 + arc4random_uniform(2*self.width)) * rotationDirection;
    CGFloat y = MAX(endPoint.y ,MAX(arc4random_uniform(8*self.width), self.width));
    CGPoint controlPoint1 = CGPointMake(self.centerX + x, self.superView.height - y);
    CGPoint controlPoint2 = CGPointMake(self.centerX - 2*x, y);
    
    [heartTravelPath addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = heartTravelPath.CGPath;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyFrameAnimation.duration = liveAnimationDuration + endPoint.y/self.superView.height;
    [self.layer addAnimation:keyFrameAnimation forKey:@"positionOnPath"];
    
    [UIView animateWithDuration:3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

@end
