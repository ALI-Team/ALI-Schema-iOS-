//
//  SZLoadingTableViewController.m
//  SZLoadingTableViewControllerDemo
//
//  Created by Suric on 16/1/30.
//  Copyright © 2016年 Suric. All rights reserved.
//

#import "SZLoadingTableViewController.h"
#import "SZFooterView.h"

static const CGFloat footViewHeight = 44.0;

@interface SZLoadingTableViewController ()
@property (strong, nonatomic) UIActivityIndicatorView *loading;
@property (strong, nonatomic) SZFooterView *footView;
@property (nonatomic) BOOL originCanLoadMore;
@end

@implementation SZLoadingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods

- (void)startLoading {
    self.originCanLoadMore = self.canLoadMore;
    self.tableView.tableFooterView = nil;
    _canLoadMore = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.loading startAnimating];
}

- (void)stopLoading {
    if (self.originCanLoadMore) {
        _canLoadMore = YES;
        self.tableView.tableFooterView = self.footView;
    }
    
    [self.loading stopAnimating];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - Private methods

- (void)setupLoading {
    [self setupCenterLoading];
    [self setupFootLoading];
}

- (void)setupCenterLoading {
    self.loading = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.loading.center = CGPointMake(self.tableView.center.x, self.tableView.center.y - 64);
    self.loading.color = [UIColor grayColor];
    [self.tableView addSubview:self.loading];
}

- (void)setupFootLoading{
    self.tableView.delegate = self;
    self.footView = [[SZFooterView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    self.tableView.tableFooterView = self.footView;
    _canLoadMore = YES;
}

-(void)setCanLoadMore:(BOOL)canLoadMore {
    _canLoadMore = canLoadMore;
    if (_canLoadMore) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.footView.loading  stopAnimating];
        });
    }
}

- (void)willBeginLoadingMore {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.footView.loading startAnimating];
    });
}

- (void)loadMoreCompleted {
    _isLoadingMore = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.footView.loading stopAnimating];
    });
}

- (BOOL)loadMore {
    if (_isLoadingMore)
        return NO;
    
    [self willBeginLoadingMore];
    _isLoadingMore = YES;
    return YES;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!_canLoadMore) {
        [self setCanLoadMore:NO];
        return;
    }
    if (!_isLoadingMore && _canLoadMore) {
        CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y;
        if (scrollPosition < footViewHeight) {
            [self loadMore];
        }
    }
}


@end
