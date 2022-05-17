---
# try also 'default' to start simple
theme: apple-basic
layout: intro-image
remoteAssets: false
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
image: https://images.unsplash.com/photo-1533284133567-0da9844151ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2342&q=80
# apply any windi css classes to the current slide
# class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# show line numbers in code blocks
lineNumbers: false
# some information about the slides, markdown enabled
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
---

<div class="absolute top-10">
  <span class="font-700">
    Presented by <a href="https://twitter.com/madawei2699">@Dawei Ma</a> 2022/05/17
  </span>
</div>

<div class="absolute bottom-10">
  <h1>编程语言是如何实现并发的</h1>
</div>

---
layout: statement
---

# 操作系统篇

---
layout: statement
---

## 从操作系统运行程序说起
<p style="font-style:italic;"><span style="color:gray;">htop</span> Demo</p>

---

# 调度(Scheduling)

![](https://img.bmpi.dev/4791979c-5de3-508a-f900-f9c7ed2bb55e.png)

---

# 线程(Thread)

- 用户线程(User-level Thread)
  - 协程(Coroutines)
  - Go Goroutine
  - Erlang process
  - 绿色线程(Green Thread)
- 内核线程(Kernel-level Thread)
- 纤程(Fibers)

---

# 用户线程(User-level Thread)

- Elixir: 0.48 GB (Process)
- Golang: 1.91 GB (Goroutine)
- Java: 977 GB (Thread)
- PHP: 6836 GB (Laravel Request)

> 用户线程的轻量除了提现在调度的上下文切换开销上，还体现了在对内存的需求上。如果要在4核心4GB内存的笔记本电脑中测试同时生成100万个线程的话，不同编程语言对内存的需求

---

# 线程模型(Thread Model)

![](https://img.bmpi.dev/421a024f-d6ac-fa2a-b8f1-b1e9e1b98d0c.png)

---
layout: image
image: 'https://img.bmpi.dev/681c60d0-0ad4-23ec-a736-21048c875406.png'
---

---

# 上下文切换(Context switching)

Source: [How long does it take to make a context switch?](https://blog.tsunanet.net/2010/11/how-long-does-it-take-to-make-context.html)

> Context switching is expensive. My rule of thumb is that it’ll cost you about 30µs of CPU overhead…Applications that create too many threads that are constantly fighting for CPU time (such as Apache’s HTTPd or many Java applications) can waste considerable amounts of CPU cycles just to switch back and forth between different threads…I think the sweet spot for optimal CPU use is to have the same number of worker threads as there are hardware threads, and write code in an asynchronous / non-blocking fashion.

---

# 一些延时数据

![](https://img.bmpi.dev/e56407b8-7e10-59eb-208a-feafc399440c.png)

---

# I/O模型(I/O Model)

- 同步(Synchronous)
  - 阻塞式(Blocking)
  - 非阻塞式(Non-blocking)
  - 多路复用(Multiplexing)
  - 信号驱动(Signal Driven)
- 异步(Asynchronous)

---

<div class="">
  <img src="https://img.bmpi.dev/93d0d0d8-7a37-625c-2b75-cd2af7931493.png" style="width:90%"/>
</div>

---
layout: center
class: text-center
---

# 热身小问题

<v-click>

并发与并行的区别是？

</v-click>

<v-click>

同步与异步的区别是？

</v-click>

---

# 并发还是并行

- CPU密集型(CPU bound)
- I/O密集型(I/O bound)

---

# 并发模型

![](https://img.bmpi.dev/ad38e184-d881-f78b-f7aa-0cbd4f3ae1c7.png)

---
layout: center
class: text-center
---

# Thanks!
