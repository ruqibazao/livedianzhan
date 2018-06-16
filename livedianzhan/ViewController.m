//
//  ViewController.m
//  livedianzhan
//
//  Created by neghao on 2017/7/12.
//  Copyright © 2017年 neghao.studio. All rights reserved.
//

#import "ViewController.h"
#import "listTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    listTableViewController *table = [[listTableViewController alloc] init];
    
    [self presentViewController:table animated:YES completion:nil];
}
@end
