//
//  TableViewCell.m
//  livedianzhan
//
//  Created by neghao on 2017/7/12.
//  Copyright © 2017年 neghao.studio. All rights reserved.
//

#import "TableViewCell.h"
#import "BKPraiseView.h"

@interface TableViewCell ()
@property (nonatomic, strong) NSTimer   *timer;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self praiseAnimation];
        

    }
    return self;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
        //将定时器加入NSRunLoop，保证滑动表时，UI依然刷新
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)startPraiseAnimation:(BOOL)isStart {

    if (isStart) {
        [self timer];
        
    } else {
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
    }
}

- (void)timerRun:(NSTimer *)timer {
    [self praiseAnimation];
}

- (void)dealloc {
    NSLog(@"cell释放");
}


//重写父类方法，保证定时器被销毁
- (void)removeFromSuperview {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    [super removeFromSuperview];
}


// 点赞动画
- (void)praiseAnimation {
    
    CGRect frame = CGRectMake(0, 0, 30, 30);
    BKPraiseView *animationView = [[BKPraiseView alloc] initWithFrame:frame withSuperView:self];
    
    CGPoint center = CGPointMake(self.bounds.size.width - 30, self.bounds.size.height - 40);
    animationView.center = center;
    
    [animationView addAnimationView];
    [self addSubview:animationView];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
