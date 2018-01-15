//
//  ZBSegmentBarConfig.m
//  ZBSegmentBar
//
//  Created by Mzhangzb on 15/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import "ZBSegmentBarConfig.h"

@implementation ZBSegmentBarConfig

+ (instancetype)defaultConfig{
    ZBSegmentBarConfig *config = [[ZBSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont            = [UIFont systemFontOfSize:15];
    config.itemNormalColor     = [UIColor lightGrayColor];
    config.itemSelectColor     = [UIColor redColor];
    config.indicatorColor      = [UIColor redColor];
    config.indicatorHeight     = 2;
    config.indicatorExtraW     = 10;
    return config;
}

- (ZBSegmentBarConfig *(^)(UIColor *))indicatorBackColor
{
    return ^(UIColor *color) {
        self.indicatorColor = color;
        return self;
    };
}

- (ZBSegmentBarConfig *(^)(UIColor *))itemTitleNormalColor{
    return ^(UIColor *color) {
        self.itemNormalColor = color;
        return self;
    };
}

- (ZBSegmentBarConfig *(^)(UIColor *))itemTitleSelectColor{
    return ^(UIColor *color) {
        self.itemSelectColor = color;
        return self;
    };
    
}

- (ZBSegmentBarConfig *(^)(UIColor *))backGroundColor{
    return ^(UIColor *color) {
        self.segmentBarBackColor = color;
        return self;
    };
}

- (ZBSegmentBarConfig *(^)(UIFont *))itemTitleFont{
    return ^(UIFont *font) {
        self.itemFont = font;
        return self;
    };
}

- (ZBSegmentBarConfig *(^)(CGFloat))indicatorEH{
    return ^(CGFloat h) {
        self.indicatorHeight = h;
        return self;
    };
}

- (ZBSegmentBarConfig *(^)(CGFloat))indicatorEW{
    
    return ^(CGFloat w) {
        self.indicatorExtraW = w;
        return self;
    };
}


@end
