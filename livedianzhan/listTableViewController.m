//
//  listTableViewController.m
//  livedianzhan
//
//  Created by neghao on 2017/7/12.
//  Copyright © 2017年 neghao.studio. All rights reserved.
//

#import "listTableViewController.h"
#import "TableViewCell.h"

@interface listTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, copy) NSArray *currentCell;
@end

@implementation listTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentCell = [[NSArray alloc] init];
    [self.tableView registerClass:TableViewCell.class forCellReuseIdentifier:@"TableViewCell"];
    
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        for (NSInteger i = 0;  i < 1000 ; i++) {
            if (i % 2 == 0) {
                [_dataSource addObject:@(0)];
            } else {
                [_dataSource addObject:@(1)];
            }
        }
    }
    return _dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.bounds.size.width;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    cell.liveStauts = [self.dataSource objectAtIndex:indexPath.row];
//    if ([[self.dataSource objectAtIndex:indexPath.row] isEqual:@(1)]) {
//        [cell startPraiseAnimation:YES];
//    } else {
//        [cell startPraiseAnimation:NO];
//    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    NSArray *currentCell = [self.tableView visibleCells];
    
    for (TableViewCell *cell in currentCell) {
        if (![self.currentCell containsObject:cell]) {
            [cell startPraiseAnimation:NO];
            NSLog(@"%@",@"离开屏幕了");
            
        } else {
            if ([cell.liveStauts isEqual:@(1)]) {
                [cell startPraiseAnimation:YES];
            } else {
                [cell startPraiseAnimation:NO];
            }
        }
    }
    self.currentCell = currentCell;
//    for (TableViewCell *cell in currentCell) {
//        if ([cell.liveStauts isEqual:@(1)]) {
//            [cell startPraiseAnimation:YES];
//        } else {
//            [cell startPraiseAnimation:NO];
//        }
//    }
    
    NSLog(@"%@",self.currentCell);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
