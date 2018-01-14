//
//  ZBSegmentBarViewController.m
//  ZBSegmentBar
//
//  Created by Cstzhang on 01/14/2018.
//  Copyright (c) 2018 Cstzhang. All rights reserved.
//

#import "ZBSegmentBarViewController.h"
#import "UIView+ZBSegmentBar.h"
#import "ZBSegmentBar.h"
@interface ZBSegmentBarViewController ()

@end

@implementation ZBSegmentBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = CGRectMake(0, 0, self.view.width, 35);
    ZBSegmentBar *segmentBar = [ZBSegmentBar segmentBarWithFrame:frame];
    segmentBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:segmentBar];
    segmentBar.items = @[@"专辑", @"声音", @"下载中", @"已完成",@"已删除"];
//    segmentBar.items = @[@"专辑", @"声音", @"下载中"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
