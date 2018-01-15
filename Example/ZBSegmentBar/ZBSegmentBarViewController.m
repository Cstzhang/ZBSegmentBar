//
//  ZBSegmentBarViewController.m
//  ZBSegmentBar
//
//  Created by Cstzhang on 01/14/2018.
//  Copyright (c) 2018 Cstzhang. All rights reserved.
//

#import "ZBSegmentBarViewController.h"
#import "ZBSegmentViewController.h"

@interface ZBSegmentBarViewController ()

@property (nonatomic, weak) ZBSegmentViewController *segmentViewController;

@end

@implementation ZBSegmentBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentViewController.segmentBar.frame = CGRectMake(0, 0, 300, 35);
    self.navigationItem.titleView = self.segmentViewController.segmentBar;
    
    self.segmentViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentViewController.view];

  
    NSArray *items = @[@"专辑", @"声音", @"下载中"];
    
    // add default childView in contenView and show it
    
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    
    [self.segmentViewController setUpWithItems:items childVCs:@[vc1, vc2, vc3]];
    
    // update contentView with more childView
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *items = @[@"0专辑", @"1声音", @"2下载中", @"3已完成", @"4已完成", @"5已完成", @"6已完成", @"7已完成"];
        
        // add  more  childView in contenView and show it
        
        UIViewController *vc1 = [UIViewController new];
        vc1.view.backgroundColor = [UIColor redColor];
        
        UIViewController *vc2 = [UIViewController new];
        vc2.view.backgroundColor = [UIColor greenColor];
        
        UIViewController *vc3 = [UIViewController new];
        vc3.view.backgroundColor = [UIColor yellowColor];
        
        UIViewController *vc4 = [UIViewController new];
        vc4.view.backgroundColor = [UIColor darkGrayColor];
        
        UIViewController *vc5 = [UIViewController new];
        vc5.view.backgroundColor = [UIColor blackColor];
        
        UIViewController *vc6 = [UIViewController new];
        vc6.view.backgroundColor = [UIColor orangeColor];
        
        UIViewController *vc7 = [UIViewController new];
        vc7.view.backgroundColor = [UIColor purpleColor];
        
        UIViewController *vc8 = [UIViewController new];
        vc8.view.backgroundColor = [UIColor cyanColor];

        [self.segmentViewController setUpWithItems:items childVCs:@[vc1, vc2, vc3, vc4,vc5,vc6,vc7,vc8]];

    });
    
}


#pragma mark — lazy func

- (ZBSegmentViewController *)segmentViewController {
    if (!_segmentViewController) {
        ZBSegmentViewController *vc = [[ZBSegmentViewController alloc] init];
        [self addChildViewController:vc];
        _segmentViewController = vc;
    }
    return _segmentViewController;
}



@end
