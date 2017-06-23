## iOS开发---先不提技术，只讲讲效率 
> **先看其中一个效果图**

> ![YYLabel.gif](http://upload-images.jianshu.io/upload_images/402808-fdf12d64b08ffac2.gif?imageMogr2/auto-orient/strip)


![Snip20170623_13.png](http://upload-images.jianshu.io/upload_images/402808-12bb5c616494fabf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20170623_15.png](http://upload-images.jianshu.io/upload_images/402808-36e5c3a716541b6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20170623_16.png](http://upload-images.jianshu.io/upload_images/402808-5511e0dae2d4a106.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![

--------------
> 一切的缘由来源于`MJRefresh`的源码（如下）：

![MJRefreshComponent.h.png](http://upload-images.jianshu.io/upload_images/402808-12bb5c616494fabf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![MJRefreshComponent.m.png](http://upload-images.jianshu.io/upload_images/402808-36e5c3a716541b6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> 而，同样的事情，我也做过，只是我是以另一种方式实现的（如下）：

![tool.png](http://upload-images.jianshu.io/upload_images/402808-5511e0dae2d4a106.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> 当然，结果都是一样的，目的都达到了！**节省了时间/不再一行一行写UI代码**。

### `UI创建工具类`与`UI创建 Category`两者比较：
> `UI创建工具类`: 一个个工具类太多，不容易记住，尤其团队合作；
如果都写到一个工具类，造成整个工具类代码臃肿等【一个人管太多事，累】
`UI创建 Category`：各个分类负责自己各自的职责，分工明确！【各管各的，不累，如下图分析：】
![Snip20170623_19.png](http://upload-images.jianshu.io/upload_images/402808-a1e8252467f1d1c4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 整理代码，提高效率
> 既然`分类`优于工具，那就改成`分类`。流程，还是按照上图走。

#### `分类`step 1：创建显示诗歌的LB
![step1.png](http://upload-images.jianshu.io/upload_images/402808-2625fbfe2e1b16db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 看两个其它的创建LB的方法，对比下，发现，上面的就需要那么简单，至于为什么，*上图已说明*。
> ![step1_normal.png](http://upload-images.jianshu.io/upload_images/402808-706ac6c74ea5e157.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### `分类`step 2： 创建LB Category
![Snip20170623_24.png](http://upload-images.jianshu.io/upload_images/402808-dbb5315f32ec4dc4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20170623_25.png](http://upload-images.jianshu.io/upload_images/402808-fe10415d06e6894f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 可以看到，方法中需要的参数，几乎都是`NSMutableAttributedString`控制的，所以这时候`NSMutableAttributedString` Category就要上场了。

#### `分类`step 3： 创建`NSMutableAttributedString` Category
![Snip20170623_26.png](http://upload-images.jianshu.io/upload_images/402808-81bdd81e9a05a526.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 说明：此处没有注释，参考LB中的，毕竟这家伙是服务于LB的。
这时候，`NSMutableAttributedString`需要的就多了：`UIFont`/`UIColor`等。

#### `分类`step 3： 创建`UIFont`/`UIColor` Category
![Snip20170623_27.png](http://upload-images.jianshu.io/upload_images/402808-3301cbb38ba1b2d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20170623_28.png](http://upload-images.jianshu.io/upload_images/402808-1b90bf97d8a4232e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 说明: `UIColor`比较简单，接收的都是`UIColor`类型，无非判断个特殊字符的`range`；而`UIFont`就不一样，如上图代码中的注释，它支持`3`种数据格式，方便传值！！！

#### 至此，到VC中证实下：
![Snip20170623_29.png](http://upload-images.jianshu.io/upload_images/402808-df39d77a8509175b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 很显然，结果我们一开始就看到了！！！OK！棒棒的！！！

今天的分享，到此也结束了，目前我只完善了`YYLabel`的部分，后续会晚上其它的。到时候再分享出来。
[源码在此](https://github.com/chinesemanbobo/PPDemo)  `2017-06-23`
