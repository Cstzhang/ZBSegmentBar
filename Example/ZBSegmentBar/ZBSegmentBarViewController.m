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
    CGRect frame = CGRectMake(0, 20, self.view.width, 35);
    ZBSegmentBar *segmentBar = [ZBSegmentBar segmentBarWithFrame:frame];
    segmentBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:segmentBar];
   // segmentBar.items = @[@"专辑", @"声音", @"下载中", @"已完成",@"已删除"];
    segmentBar.items = @[@"1专辑", @"1声音", @"1下载中", @"1已完成",@"1已删除",@"2专辑", @"2声音", @"2下载中", @"2已完成",@"2已删除",@"3专辑", @"3声音", @"3下载中", @"3已完成",@"3已删除"];
   //    segmentBar.items = @[@"专辑", @"声音", @"下载中"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
