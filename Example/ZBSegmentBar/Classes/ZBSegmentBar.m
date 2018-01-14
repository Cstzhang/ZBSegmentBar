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

@interface ZBSegmentBar ()
// main content view
@property (nonatomic, weak) UIScrollView *contentView;
/// title button
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;

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
        [btn setTitle:item forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    // update the layout
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
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
