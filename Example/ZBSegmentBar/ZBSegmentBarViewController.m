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
@interface ZBSegmentBarViewController ()<ZBSegmentBarDelegate>
@property (nonatomic, weak) ZBSegmentBar *segmentBar;
@end

@implementation ZBSegmentBarViewController
- (ZBSegmentBar *)segmentBar {
    if (!_segmentBar) {
        CGRect frame = CGRectMake(0, 20, self.view.width, 35);
        ZBSegmentBar *segmentBar = [ZBSegmentBar segmentBarWithFrame:frame];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor brownColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
        
    }
    return _segmentBar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.segmentBar.items = @[@"1专辑", @"1声音", @"1下载中", @"1已完成",@"1已删除",@"2专辑", @"2声音", @"2下载中", @"2已完成",@"2已删除",@"3专辑", @"3声音", @"3下载中", @"3已完成",@"3已删除"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.segmentBar.selectIndex = 3;
}

-(void)segmentBar:(ZBSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex{
    
    NSLog(@"fromIndex :%zd---- toIndex:%zd", fromIndex, toIndex);
}

@end
