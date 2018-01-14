//
//  ZBSegmentViewController.m
//  ZBSegmentBar
//
//  Created by Mzhangzb on 14/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import "ZBSegmentViewController.h"
#import "ZBSegmentBar.h"
#import "UIView+ZBSegmentBar.h"
@interface ZBSegmentViewController ()<ZBSegmentBarDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) ZBSegmentBar *segmentBar;

@property (nonatomic, weak) UIScrollView *contentView;
@end

@implementation ZBSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs {
    
    NSAssert(items.count != 0 || items.count == childVCs.count, @"number  wrong");
    
    self.segmentBar.items = items;
    
    // delete all childViewControllers
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    // add addChildViewController
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }
    // update contentSize
    self.contentView.contentSize = CGSizeMake(items.count * self.view.width, 0);
    // default selectIndex
    self.segmentBar.selectIndex = 0;
}


/**
 show selectIndex child vc

 @param index select index
 */
- (void)showChildVCViewsAtIndex: (NSInteger)index {
    
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    //add childVC to show
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.width, 0, self.contentView.width, self.contentView.height);
    [self.contentView addSubview:vc.view];
    // scroll childVC to show
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:YES];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    self.segmentBar.frame = CGRectMake(0, 60, self.view.width, 35);
    CGFloat contentViewY = self.segmentBar.y + self.segmentBar.height;
    CGRect  contentFrame = CGRectMake(0, contentViewY, self.view.width,
                                      self.view.height - contentViewY);
    self.contentView.frame = contentFrame;
}

#pragma mark - segmentBar delegate func
- (void)segmentBar:(ZBSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"fromIndex：%zd---- toIndex ：%zd", fromIndex, toIndex);
    [self showChildVCViewsAtIndex:toIndex];
}


#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // Calculate the final index
    NSInteger index = self.contentView.contentOffset.x / self.contentView.width;
    self.segmentBar.selectIndex = index;
}


#pragma mark — lazy func

- (ZBSegmentBar *)segmentBar {
    if (!_segmentBar) {
        ZBSegmentBar *segmentBar = [ZBSegmentBar segmentBarWithFrame:CGRectZero];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor brownColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}
@end
