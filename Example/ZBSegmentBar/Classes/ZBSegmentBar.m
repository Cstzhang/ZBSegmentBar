//
//  ZBSegmentBar.m
//  ZBSegmentBar
//
//  Created by Mzhangzb on 14/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//  

#import "ZBSegmentBar.h"
#import "UIView+ZBSegmentBar.h"

/// space min width
#define kMinMargin 30

@interface ZBSegmentBar (){
    /// the last clicked title button
    UIButton *_lastButton;
}
/// main content view
@property (nonatomic, weak) UIScrollView *contentView;
/// title button
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;
/// indicator View
@property (nonatomic, weak) UIView *indicatorView;

@end


@implementation ZBSegmentBar

+ (instancetype)segmentBarWithFrame: (CGRect)frame {
    ZBSegmentBar *segmentBar = [[ZBSegmentBar alloc] initWithFrame:frame];
    // add content view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    [segmentBar addSubview:scrollView];
    segmentBar.contentView = scrollView;
    return segmentBar;
}

/**
 itemBtns lazy func

 @return itemBtns
 */
- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}
/**
  indicatorView (line) lazy func
 
 @return indicatorView (line)
 */
- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = 2;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

/**
set title items

 @param items title array
 */
- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    // delete self.itemBtns
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    // add item buttons in content view
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(btnClick:)    forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [btn setTitle:item forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    // update the layout
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
}

/**
 title button click

 @param btn button clicked
 */
- (void)btnClick: (UIButton *)btn {
    // 1. set last clicked button
    _lastButton.selected = NO;
    btn.selected = YES;
    _lastButton = btn;
    
    // 2. add animation
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width;
        self.indicatorView.centerX = btn.centerX;
    }];
    
    // 3. indicatorView (line)  scroll to button
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;
    // need not scroll
    if (scrollX < 0) {
        scrollX = 0;
    }
    // set  max scroll X
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
}

/**
 update the layout
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    //update frame
    self.contentView.frame = self.bounds;
    // caculate itemBtns margin
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        totalBtnWidth += btn.width;
    }
    
    // space width
    CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    // caculate contentView contentSize
    CGFloat lastX = caculateMargin;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        btn.y = 0;
        btn.x = lastX;
        lastX += btn.width + caculateMargin;
    }
    self.contentView.contentSize = CGSizeMake(lastX, 0);

}





@end
