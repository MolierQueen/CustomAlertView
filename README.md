# CustomAlertView
一个自定义的AlertView，用户可以根据自己的需求来设置。
##使用方法

![初始化方法](http://upload-images.jianshu.io/upload_images/1792635-3348181721672df5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
类似于系统的初始化方法，如果没有值的话就传nil就好，不要传空字符串。最后一个参数传title数组就好了。
![使用](http://upload-images.jianshu.io/upload_images/1792635-310ade164255a641.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
然后调用showInViewWithAction方法显示出来
![显示](http://upload-images.jianshu.io/upload_images/1792635-4981ccabe9fa6c5c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)最后一个参数是button的点击事件，根据tag值来区分不同的button点击，只有取消button的tag是0，其他的是1.2.3...依次往下排列就好
![可自定义的一些属性](http://upload-images.jianshu.io/upload_images/1792635-e4d519aa99038710.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这些属性可以自定义，这里就不细说了，大家可以使试试。
##样式截图
![样式截图](http://upload-images.jianshu.io/upload_images/1792635-611be15229e0f3ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![使用截图](http://upload-images.jianshu.io/upload_images/1792635-d049d16e4a2e10c6.gif?imageMogr2/auto-orient/strip)
大概就这么多，很简单的，没有多少代码，有问题随时联系我吧。