//
//  ZBSegmentBar.h
//  ZBSegmentBar
//
//  Created by Mzhangzb on 14/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBSegmentBar : UIView

/**
 construction method

 @param frame  SegmentBar frame
 @return       SegmentBar object
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;

/**
 SegmentBar title array
 */
@property (nonatomic, strong) NSArray <NSString *>*items;

@end
