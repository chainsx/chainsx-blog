---
layout: post
title: "dev-c++更新编译工具链"
quote: "嗷~"
image: false
video: false
comments: true
---

# dev-c++更新gcc-9.2工具链

### 我们看到devcpp的编译工具链是gcc-4.9的，及其古老，编译出来的文件大小也比较大，所以试着换成最新的gcc-9

#### 下载mingw工具链，具体百度下载，建议梯子。
#### 如果没有梯子可以用[我下载好的](https://one.chainsx.cn/?/%E8%BD%AF%E4%BB%B6/MinGW.zip)
#### 下载下来解压

#### 然后设置dev-cpp中文（可选），点击"工具-编译选项"，如下图。

![image1](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152353.png)

#### 新建一个编译器配置,随便命个名

![image2](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152430.png)

#### 在“在连接器命令行加入以下命令”加入`-static-libgcc`

![image3](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152503.png)

#### 把目录文件添加进去，如下几张图添加

![image4](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152544.png)

![image5](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152605.png)

![image6](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152618.png)

![image7](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152645.png)

![image8](https://raw.githubusercontent.com/chainsx/chainsx.github.io/master/media/20200308/%E6%89%B9%E6%B3%A8%202020-03-08%20152723.png)

#### 然后确定就行了。。。。

### 在编译文件时选择gcc-9.2编译就行了


