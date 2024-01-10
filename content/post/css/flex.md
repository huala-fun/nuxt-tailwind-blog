---
title: Flex 布局
description: 学习 CSS Animation 101 的随堂笔记
date: "2023-06-01"
tags:
  - flex
  - css
  - 布局
---


Flex属性值
flex属性值可以为1个、2个、3个以及关键字属性值
对应：
flex: flex-grow flex-shrink flex-basis;

1、一个值
如果flex的属性值只有一个值，则： 如果是数值，例如flex: 1，则这个1表示flex-grow，此时flex-shrink和flex-basis都使用默认值，分别是1和auto。 如果是长度值，例如flex: 100px，则这个100px显然指flex-basis，因为3个缩写CSS属性中只有flex-basis的属性值是长度值。此时flex-grow和flex-shrink都使用默认值，分别是0和1。

2、两个值
如果flex的属性值有两个值，则第1个值一定指flex-grow，第2个值根据值的类型不同表示不同的CSS属性，具体规则如下： 如果第2个值是数值，例如flex: 1 2，则这个2表示flex-shrink，此时flex-basis使用默认值auto。 如果第2个值是长度值，例如flex: 1 100px，则这个100px指flex-basis，此时flex-shrink都使用默认值0。

3、三个值
如果flex的属性值有三个值，则这3个值分别表示flex-grow，flex-shrink和flex-basis。grow是放大，shrink是收缩，而basis是基准。

4、关键字属性值
flex: initial等同于设置flex: 0 1 auto
flex: auto等同于设置flex: 1 1 auto
flex: none等同于设置flex: 0 0 auto