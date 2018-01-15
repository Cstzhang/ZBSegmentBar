//
//  ZBSegmentViewController.h
//  ZBSegmentBar
//
//  Created by Mzhangzb on 14/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBSegmentBar.h"

@interface ZBSegmentViewController : UIViewController

@property (nonatomic, weak) ZBSegmentBar *segmentBar;

/**
 Description
 
 @param items items description
 @param childVCs childVCs description
 */
- (void)setUpWithItems: (NSArray <NSString *>*)items
              childVCs: (NSArray <UIViewController *>*)childVCs;

@end
