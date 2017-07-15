//
//  LoadMoreView.h
//  shuaxin
//
//  Created by yuanhc on 2017/7/15.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadMoreView : UIView
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property(assign,nonatomic)BOOL isThatALL;
+ (instancetype)footer;

- (void)beginRefreshing;
- (void)endRefreshing;

@property (nonatomic, assign, getter = isRefreshing) BOOL refreshing;
@end
