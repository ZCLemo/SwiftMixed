# SwiftMixed
Swift和OC混编

Swift与OC混编的一些配置，容易忘记，写个文章记录一下

1.第一次创建Swift文件的时候会提示是否建立桥接文件，选择创建
![20160112200003812.jpg](https://upload-images.jianshu.io/upload_images/1930004-54e2ce0c6ae803e7.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.工程配置：
设置Product Module Name 为当前工程名
设置Defines Mod￼ule为Yes

 ![20160113091837371.jpg](https://upload-images.jianshu.io/upload_images/1930004-6f090cbc2ae13d69.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![20160113091702493.jpg](https://upload-images.jianshu.io/upload_images/1930004-3eeb162521d27784.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.Swift引用OC,在桥接文件中加入OC头文件
![1.png](https://upload-images.jianshu.io/upload_images/1930004-c4a3f0caf4705463.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.OC引用Swift，在OC文件中导入#import "工程名-Swift.h"，注意swift文件的方法名前面要加@objc，不然在OC文件中方法调用不了

![2.png](https://upload-images.jianshu.io/upload_images/1930004-44fcde91c45ee5a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.代码地址：[https://github.com/ZCLemo/SwiftMixed](https://github.com/ZCLemo/SwiftMixed)
