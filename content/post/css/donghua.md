---
title: CSS 动画学习笔记
description: 学习 CSS Animation 101 的随堂笔记
date: "2023-06-01"
tags:
  - animation
  - css
  - study
---

> 本文是 https://h-wakanda.github.io/css-animation-101-cn/ 学习笔记

## 为什么需要动画

人们对会动的东西更加关注，所以在网站的设计和开发中，如果能适当地添加一些动画，不光可以丰富网站的视觉和交互体验，还能更有效地抓住用户的眼球，吸引他们的注意力，从而更加关注和沉浸在我们的网站里，这可比只用简单的文字好多了。而且现代浏览器的性能越来越高，对动画地支持也越来越好，更有利于我们使用动画了。【Tips：也不能滥用动画。如果滥用反而会造成注意力的分散。】

我们不能让所有的东西都”动起来“，但可以在一些关键的地方添加一些合理精致的小动画，让用户更好的使用我们的网站和服务。想一想，是不是有些需要操作的地方没有引起用户的注意？是不是有些内容的变化太突兀，太生硬？如果有，那就可以考虑使用动画来优化。

在浏览器上可以使用 Flash、Canvas JavaScript 以及 CSS 进行制作动画。我们主要学习使用 CSS 来制作动画。

## CSS transition 属性

使用 CSS 制作动画的一种方式就是使用 transition 属性。啥是 transition ? transition 指从一个“状态”到另一个“状态”的动画模拟。

<Image src="/posts/css/ab.png"  width="400" height="404" alt="Image" />

当我们告诉浏览器，我们想在某个元素上使用 transition 时，就是让浏览器在状态的变化过程中对属性的值进行自动插值。

<Image src="/posts/css/ab_animated.png"  width="400" height="404" alt="Image" />

举个例子，我们可以在一个元素鼠标悬停的时候，使用过渡（transition）来改变元素的样式，让浏览器产生从起始状态到终止状态的平滑的过渡效果。

<Image src="/posts/css/button.png"  width="400" height="404" alt="Image" />

我们可以在元素的很多属性上创建过渡效果。我们可以控制过渡的快慢，延迟，还可以用 timing function 控制过渡具体的变化速度。来看几个例子。

<Image src="/posts/css/transitions-min.gif"  width="400" height="404" alt="Image" />
<b>总结：</b>
 transition 是指从一个状态到另一个状态的变化。比如当鼠标在某个元素上悬停时，我们会修改它的样式，采用 transition 可以创建一个平滑的动画效果。

### Transition 属性 （properties ）

<b>transition-property </b>规定应用过渡的 CSS 属性的名称，比如要修改 background ，就可以在这里写 background 。也可以使用 all ，所有适用的 CSS 过渡的属性上创建过渡效果（不是所有的属性都可以创建过渡效果的）。

<b>transition-duration </b> 过渡效果的持续时间， 单位可以是秒或者毫秒。3s 表示 3 秒，100ms 表示 100 毫秒，也可以写成 0.1s。

<b>transition-delay </b> 表示过渡效果的延迟时间（效果开始前的等待时间），单位可以是秒或者毫秒。3s 表示 3 秒，100ms 表示 100 毫秒，也可以写成 0.1s。

<b>transition-timing-function </b> 时间函数(timing function)是用来描述过渡过程中，属性值变化速度的。

<b>简写方式：</b> transition: [property] [duration] [delay] [timing-function];

### 代码

在浏览器中，一个元素从一个状态转变成另一个状态，我们称发生了过渡(transition)。浏览器负责来渲染状态变化过程中的每一帧从而创建一个动画效果。

transition 是 CSS 中的属性，就像给元素设置 height、width、border 一样，我们也可以给元素设置 transition。

那 transition 怎么用呢？来看下面代码：

`transition: background 0.5s linear;`

在上面的代码中，我们告诉浏览器，我们希望在 0.5 秒的时间里，按照 linear 的时间函数(timing-function)来改变某个元素的 background 属性。

下面结合具体的例子来看一下：我们希望当鼠标在按钮上悬停时(hover)改变按钮的 background。

```
button {
  background: white;
  transition: background 0.5s linear;
}

button:hover {
  background: green;
}
```

这里有一点要注意，transition 属性的位置要放到 button 中。这样会告诉浏览器，不光按钮从初始状态变成悬停(hover)的时候要添加过渡效果，当从悬停状态变回初始状态时也要添加过渡效果。

如果我们把 transition: background 0.5s linear; 这句放到下面 button:hover 里，那么当按钮从初始状态变成悬停状态时会有过渡效果，但当从悬停变回初始状态时，就立刻改变了 background，而没有过渡的效果。

<b>注意：</b>上面的代码，为了书写和阅读的方便，都没有添加浏览器前缀，如果要发布正式版，请在属性前加上对应的浏览器前缀。

```
  -webkit-transition: ...;
  -moz-transition: ...;
  transition: ...;
```

## CSS animation 属性

过渡（transition）和动画（animation）是相似的。两者都是 CSS 的属性，并且都可以通过持续时间（duration），延迟（delay）以及其他属性控制浏览器制作动画效果。

当然也有不同，过渡指从一个状态到另一个状态的平滑的变化过程，而动画可以是多个“状态”间的变化。

<Image src="/posts/css/ab-min.gif"  width="400" height="404" alt="Image" />

<Image src="/posts/css/abc.png"  width="400" height="404" alt="Image" />

动画更适合相对复杂的场景。上面的例子中有三种状态（A，B，C）。transition 只会从 A 开始一直到 C 结束，而 animation 允许我们添加状态 B，并且从 A 到 B 再到 C 经历完整的 3 个状态。

动画还有一点不同，它可以自动开始。过渡一般需要通过添加样式类或更改状态（如悬停）来触发，但动画可以在页面加载时自动启动。

animation 和 transition 很类似，不过多了一些其他的选项。下面是 animation 的简写方式：

<b>animation: change-background 4s linear infinite;</b>

分开写就是下面这样：

<b>animation-name: change-background;</b>

<b>animation-duration: 4s;</b>

<b>animation-timing-function: linear;</b>

<b>animation-repeat: infinite;</b>

<b>transition</b> 需要指定一个目标属性，例如 “background” 或 “all”，animation 则需要带 <b>keyframes</b> 的名字来描述动画。

<b>animation</b> 拥有一些 transition 没有的属性。例如，我们可以告诉动画来回交替循环，而不是每次从头开始循环。

### Keyframes

keyframes 是用来描述动画过程中一系列变化的。

我们用一个简单的例子来说明下：在网页上有一个 div 标签，它的背景颜色不断地在变，像下面图中显示的那样。

<Image src="/posts/css/change-background-min.gif"  width="200" height="200" alt="Image" />

怎样描述这种变化呢？我们可以说“开始时蓝色，到一半时变成橙色，最后变成绿色”

如果再精确一点描述，我们可以用百分比来描述：

“0%的时候蓝色背景，50%的时候橙色，100%的时候绿色”

我们可以概括为：

0% Blue
50% Green
100% Orange

这样子我们就创建了动画整个过程中包含的“路径点”（waypoint）。 现在要做的就是将这些百分比按照 keyframes 的规则去写并命名。 结果如下：

```css
@keyframes change-background {
  0% {
    background: blue;
  }
  50% {
    background: orange;
  }
  100% {
    background: green;
  }
}
```

这个动画名字叫 “change-background”。稍后我们会用到它。

结合下面的例子，我们可以看出，上面的百分比指的是在动画过程中，其对应的 keyframe 发生的“时间点”。还可以知道，我们只要告诉浏览器开始、中间和结束时的颜色就可以了，在这些状态之间变化时，浏览器会自动去计算颜色值的插值。

<Image src="/posts/css/simple-keyframes-min.gif"  width="400" height="200" alt="Image" />

前面提到过，使用 animation-direction 可以让动画来回交替变化，看下面的例子，直观地感受下：

<Image src="/posts/css/simple-keyframes-alternating-min.gif"  width="400" height="200" alt="Image" />

## Transition vs Animation

transition 是指从一种状态到另一种状态（A 到 B）的变化，通常是由某种“动作”触发，比如鼠标悬停，或者用 JavaScript 添加或删除样式类。

animation 更加复杂一些，它允许你按照实际需求添加很多的 keyframes 来创建动画。它可以自动触发，并且可以循环。

<Image src="/posts/css/transitions-animations-min.gif"  width="400" height="404" alt="Image" />

## 常见的时间函数（timing-function）

### Linear 线性

<Image src="/posts/css/linear-example-min.gif"  width="400" height="404" alt="Image" />

linear 表示属性值按照一个固定的速度线性的变化，中间不会有突变，所以不会出现加快或减慢的状态。非常适合速度不变的场景下使用，比如车窗外不断飞过的风景或者一直旋转的月亮。

### Ease-in 轻松进入

<Image src="/posts/css/ease-in-min.gif"  width="400" height="404" alt="Image" />

ease-in 表示属性值先以较慢速度变化，然后速度越来越快，就好比一个球从高处落下，一开始下降的速度很慢，然后越来越快。

### Ease-out 缓和

<Image src="/posts/css/ease-out-min.gif"  width="400" height="404" alt="Image" />

ease-out 刚好跟 ease-in 相反，一开始速度快，然后速度越来越慢。最适合元素从屏外进入屏内进行显示的情况。

### Ease-in-out 轻松进出

<Image src="/posts/css/ease-in-out-min.gif"  width="400" height="404" alt="Image" />

ease-in-out 是上面两个的合成，一开始慢，然后变快，然后又变慢。做加载的效果时用这个时间函数效果会很不错。

### Cubic-bezier 立方贝塞尔

<Image src="/posts/css/cubic-bezier-min.gif"  width="400" height="404" alt="Image" />

上面所讲的时间函数本质上都是贝塞尔曲线。利用 cubic-bezier 我们可以自定义具体的变化曲线。

cubic-bezier 有 4 个参数，代表两个控制点的坐标。

    transition-timing-function: cubic-bezier(1,-0.49,.13,1.09);

两个控制点坐标为 (1, -0.49) 和 (.13, 1.09)，画个坐标系来看一下：

<Image src="/posts/css/cubic-bezier-graph.png"  width="400" height="404" alt="Image" />

### Steps 步骤

<Image src="/posts/css/steps-min.gif"  width="400" height="404" alt="Image" />

目前为止讲过的时间函数（速度的变化）都是连续的曲线，steps 可以将过渡时间分成大小相等的时间时隔来运行。比如使用 steps(4)，效果就会变成如上图那样不连续的效果。

<Image src="/posts/css/steps.png"  width="400" height="404" alt="Image" />

这适合做精灵动画(sprite animation)。比如一个精灵动画有 4 帧，设置 steps，就可以通过改变 background position 来创建动画了。
