//
//  ZBSegmentViewController.h
//  ZBSegmentBar
//
//  Created by Mzhangzb on 14/01/2018.
//  Copyright © 2018 Cstzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBSegmentViewController : UIViewController
/**
 Description
 
 @param items items description
 @param childVCs childVCs description
 */
- (void)setUpWithItems: (NSArray <NSString *>*)items
              childVCs: (NSArray <UIViewController *>*)childVCs;

@end
