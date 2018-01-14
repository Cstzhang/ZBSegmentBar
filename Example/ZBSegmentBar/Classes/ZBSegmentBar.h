//
//  ZBSegmentBar.h
//  ZBSegmentBar
//
//  Created by Mzhangzb on 14/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZBSegmentBar;

@protocol ZBSegmentBarDelegate <NSObject>
/**
 delegate func for ZBSegmentBar did Select

 @param segmentBar ZBSegmentBar
 @param toIndex did Select Index
 @param fromIndex from Index
 */
-(void)segmentBar:(ZBSegmentBar *)segmentBar
   didSelectIndex:(NSInteger)toIndex
        fromIndex:(NSInteger)fromIndex;
@end



@interface ZBSegmentBar : UIView

/**
 construction method

 @param frame  SegmentBar frame
 @return       SegmentBar object
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;
/// ZBSegmentBar delegate
@property (nonatomic, weak) id<ZBSegmentBarDelegate> delegate;
/// SegmentBar title array
@property (nonatomic, strong) NSArray <NSString *>*items;
/// selected Index
@property (nonatomic, assign) NSInteger selectIndex;
@end
