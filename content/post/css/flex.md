---
title: CSS Flex 布局
description: 学习 CSS Animation 101 的随堂笔记
date: "2023-06-01"
tags:
  - flex
  - css
  - 布局
---


## Flex 属性

在CSS中，`flex`属性是`flex-grow`、`flex-shrink`和`flex-basis`三个属性的简写形式。它指定了弹性盒子内的弹性项目（flex item）的伸缩性。以下是如何使用它的方法：

1. **flex-grow**：这个属性定义了弹性项目在必要时增长的能力。它接受一个无单位的比例值，表示弹性项目应该占据弹性容器内可用空间的多少。

2. **flex-shrink**：这个属性定义了弹性项目在必要时缩小的能力。与`flex-grow`一样，它也接受一个无单位的比例值，表示在分配负空间时弹性项目相对于容器中其他弹性项目的收缩量。

3. **flex-basis**：这个属性定义了分配剩余空间之前元素的默认大小。它可以是一个长度值（例如`20%`，`5rem`等）或一个关键字。关键字`auto`表示查看我的宽度或高度属性。

`flex`属性是可选的，你不必指定`flex-grow`、`flex-shrink`和`flex-basis`的所有三个值。你可以指定其中一个、两个或全部三个。以下是一些例子：

- `flex: 1;` 等同于 `flex: 1 1 0%;`，意味着`flex-grow`是1，`flex-shrink`是1，`flex-basis`是0%。
- `flex: 2 2;` 等同于 `flex: 2 2 auto;`，意味着`flex-grow`是2，`flex-shrink`是2，`flex-basis`是`auto`。
- `flex: 10px;` 等同于 `flex: 1 1 10px;`，将`flex-basis`设置为10px，并使用1作为`flex-grow`和`flex-shrink`的默认值。

当使用`flex`属性时，如果你省略了一个或两个值，浏览器将会为缺失的值设置默认值。`flex-grow`的默认值是0，`flex-shrink`的默认值是1，`flex-basis`的默认值是`auto`。
