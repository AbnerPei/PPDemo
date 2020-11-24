#  判断[tableView reloadData]结束

```
[self.tableView reloadData];
dispatch_async(dispatch_get_main_queue(), ^{
    ///刷新完成,do what you want
});

```

/// `reloadData`会在主队列执行，而`dispatch_get_main_queue`会进行等待，直到主队列空闲才执行。
