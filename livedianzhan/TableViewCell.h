//
//  TableViewCell.h
//  livedianzhan
//
//  Created by neghao on 2017/7/12.
//  Copyright © 2017年 neghao.studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (nonatomic, copy) NSNumber *liveStauts;

- (void)startPraiseAnimation:(BOOL)isStart;

@end
