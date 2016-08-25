//
//  SZFooterView.m
//  SZLoadingTableViewControllerDemo
//
//  Created by Suric on 16/1/30.
//  Copyright © 2016年 Suric. All rights reserved.
//

#import "SZFooterView.h"

@implementation SZFooterView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.loading = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.loading.center = self.center;
        [self addSubview:self.loading];
    }
    return self;
}

@end
