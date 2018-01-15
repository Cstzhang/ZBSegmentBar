//
//  ZBSegmentBarConfig.h
//  ZBSegmentBar
//
//  Created by Mzhangzb on 15/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBSegmentBarConfig : NSObject

/// default Config
+ (instancetype)defaultConfig;
/// background color
@property (nonatomic, strong) UIColor *segmentBarBackColor;
/// item Normal Color
@property (nonatomic, strong) UIColor *itemNormalColor;
/// item Selected Color
@property (nonatomic, strong) UIColor *itemSelectColor;
/// item Font
@property (nonatomic, strong) UIFont *itemFont;
/// indicator Color
@property (nonatomic, strong) UIColor *indicatorColor;
/// indicator Height
@property (nonatomic, assign) CGFloat indicatorHeight;
/// indicator ExtraW
@property (nonatomic, assign) CGFloat indicatorExtraW;

/// update  background color
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^backGroundColor)(UIColor *color);
/// update  background color
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^indicatorBackColor)(UIColor *color);
/// update item Normal Color
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^itemTitleFont)(UIFont *font);
/// update item Normal Color
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^itemTitleNormalColor)(UIColor *color);
/// update item Selected Color
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^itemTitleSelectColor)(UIColor *color);
/// update indicator Height
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^indicatorEH)(CGFloat h);
/// update indicator ExtraW
@property (nonatomic, copy, readonly) ZBSegmentBarConfig *(^indicatorEW)(CGFloat w);




@end
