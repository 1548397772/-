//
//  ViewController.m
//  shuaxin
//
//  Created by yuanhc on 2017/7/15.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import "ViewController.h"
#import "LoadMoreView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)UIRefreshControl *ccc;
@property(strong,nonatomic)LoadMoreView *footer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIRefreshControl *ccc = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:ccc];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.backgroundView.backgroundColor = [UIColor greenColor];
    _ccc = ccc;
    [_ccc addTarget:self action:@selector(tapccc:) forControlEvents:UIControlEventValueChanged];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    LoadMoreView *footer = [LoadMoreView footer];
    self.tableView.tableFooterView = footer;
    self.footer = footer;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tapccc:(UIRefreshControl *)ccc
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_ccc endRefreshing];
        UILabel *vv = [[UILabel alloc]initWithFrame:CGRectMake(0, 64 - 35, self.view.frame.size.width, 35)];
        vv.text = @"6666";
        vv.backgroundColor = [UIColor greenColor];
        [self.navigationController.view insertSubview:vv belowSubview:self.navigationController.navigationBar];
        
        [UIView animateWithDuration:1.0 animations:^{
            vv.transform = CGAffineTransformMakeTranslation(0, 35);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^{
                vv.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [vv removeFromSuperview];
            }];
        }];
        
        
    });
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"888";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.footer.isRefreshing) {
        return; //正在刷新则取消刷新
    }
    // 1.差距
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    // 刚好能完整看到footer的高度
    CGFloat sawFooterH = self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height;
    if (delta < sawFooterH) {
        [self.footer beginRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.footer.isThatALL = YES;
            [self.footer endRefreshing];
        });
    }
    
    
}

@end
