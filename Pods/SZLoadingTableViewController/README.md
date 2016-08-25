# SZLoadingTableViewController

![](https://github.com/zhangxiaolian1991/SZLoadingTableViewController/blob/master/Example/SZLoadingTableViewController/Files/demo.gif)

#Setup with CocoaPods
* Add ```pod 'SZLoadingTableViewController'``` to your ```Podfile```
* Run ```pod install```
* Run ```open App.xcworkspace```

### Usage
```@import SZLoadingTableViewController ```  or ```#import<SZLoadingTableViewController/SZLoadingTableViewController.h>```

Make your ViewCtroller subClass SZLoadingTableViewController

### Set up Center Loading

#### Start Loading
objc ```[self startLaoding]```
Swift ```self.startLoading()```

#### Stop Loading
objc ```[self stopLoading]``` 
Swift ```self.stopLoading()```

### Set up Load more
override superclass method
```
#pragma nark -LoadMore

- (BOOL)loadMore {
if (!self.canLoadMore || ![super loadMore]) {
return NO;
} else {
[self performSelector:@selector(loadMoreData) withObject:nil afterDelay:0];
return YES;
}
}

- (void)loadMoreData {
[self addData];
self.canLoadMore = NO;
[self loadMoreCompleted];
[self.tableView reloadData];
}
```

### Author

Suric Zhang, zhangxiaolian1991@gmail.com

### License

SZLoadingTableViewController is available under the MIT license:
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
