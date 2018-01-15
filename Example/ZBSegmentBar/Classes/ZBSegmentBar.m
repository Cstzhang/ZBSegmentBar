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
/// Indicator height
#define KIndicatorH 2

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

#pragma mark — interface

+ (instancetype)segmentBarWithFrame: (CGRect)frame {
    ZBSegmentBar *segmentBar = [[ZBSegmentBar alloc] initWithFrame:frame];
    return segmentBar;
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    // data filtering
    if (self.itemBtns.count == 0 || selectIndex < 0 ||
        selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
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
        btn.tag = self.itemBtns.count;// add button tags
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
    // 0. delegate func
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:btn.tag fromIndex:_lastButton.tag];
    }
    _selectIndex = btn.tag;
    
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
    
    if (self.itemBtns.count == 0) {
        return;
    }
    UIButton *btn = self.itemBtns[self.selectIndex];
    self.indicatorView.width = btn.width;
    self.indicatorView.centerX = btn.centerX;
    self.indicatorView.y = self.height - self.indicatorView.height;

}


#pragma mark - 懒加载
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
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - KIndicatorH, 0, KIndicatorH)];
        indicatorView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}

@end
