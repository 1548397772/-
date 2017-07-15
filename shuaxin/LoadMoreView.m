//
//  LoadMoreView.m
//  shuaxin#0	0x0000000107102137 in -[LoadMoreView beginRefreshing] at /Users/yinghuozhaoxingkong/Desktop/shuaxin/shuaxin/LoadMoreView.m:24

//
//  Created by yuanhc on 2017/7/15.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import "LoadMoreView.h"


@interface LoadMoreView ()

@end
@implementation LoadMoreView

+ (instancetype)footer
{
    return [[NSBundle mainBundle] loadNibNamed:@"LoadMoreView" owner:nil options:nil].lastObject;
}

- (void)beginRefreshing
{
    NSLog(@"123");
    self.label.text = @"正在加载";
    [self.indicator startAnimating];
    self.refreshing = YES;
}

- (void)endRefreshing
{
    NSLog(@"456");
    [self.indicator stopAnimating];
    self.refreshing = NO;
    if (self.isThatALL) {
       self.label.text = @"没有更多数据";
    }else
    {
    self.label.text = @"上拉可以加载更多数据";
    }
}
@end
