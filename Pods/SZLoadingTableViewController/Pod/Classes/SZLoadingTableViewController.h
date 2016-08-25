//
//  SZLoadingTableViewController.h
//  SZLoadingTableViewControllerDemo
//
//  Created by Suric on 16/1/30.
//  Copyright © 2016年 Suric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZLoadingTableViewController : UITableViewController
@property (nonatomic) BOOL canLoadMore;
@property (nonatomic) BOOL isLoadingMore;
- (void)startLoading;
- (void)stopLoading;
- (BOOL)loadMore;
- (void)loadMoreCompleted;
@end
