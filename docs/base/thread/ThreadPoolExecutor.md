<!--TOC-->

- [构造方法分析](#构造方法分析)
- [构造方法参数分析](#构造方法参数分析)
- [饱和策略](#饱和策略)

<!--TOC-->

# ThreadPoolExecutor 分析

package java.util.concurrent;

## 构造方法分析

ThreadPoolExecutor类中提供的四个构造方法。我们来看最长的那个，其余三个都是在这个构造方法的基础上产生的（看如下代码）。

```java
public ThreadPoolExecutor(int corePoolSize,
                              int maximumPoolSize,
                              long keepAliveTime,
                              TimeUnit unit,
                              BlockingQueue<Runnable> workQueue,
                              RejectedExecutionHandler handler) {
        this(corePoolSize, maximumPoolSize, keepAliveTime, unit, workQueue,
             Executors.defaultThreadFactory(), handler);
    }

//.....

/**
 * 用给定的初始参数创建一个新的ThreadPoolExcecutor
 */
public ThreadPoolExecutor(int corePoolSize,
                              int maximumPoolSize,
                              long keepAliveTime,
                              TimeUnit unit,
                              BlockingQueue<Runnable> workQueue,
                              ThreadFactory threadFactory,
                              RejectedExecutionHandler handler) {
        if (corePoolSize < 0 ||
            maximumPoolSize <= 0 ||
            maximumPoolSize < corePoolSize ||
            keepAliveTime < 0)
            throw new IllegalArgumentException();
        if (workQueue == null || threadFactory == null || handler == null)
            throw new NullPointerException();
        this.acc = System.getSecurityManager() == null ?
                null :
                AccessController.getContext();
        this.corePoolSize = corePoolSize;
        this.maximumPoolSize = maximumPoolSize;
        this.workQueue = workQueue;
        this.keepAliveTime = unit.toNanos(keepAliveTime);
        this.threadFactory = threadFactory;
        this.handler = handler;
    }
```

## 构造方法参数分析

:smile:

- corePoolSize	核心线程数  线程数定义了最小可以同时运行的线程数量
- maximumPoolSize    当队列中存放的任务到达队列的容量的时候，当前可以同时运行线程数量变成最大线程数
- workQueue    当新任务来的时候会先判断当前运行的线程数量是否达到核心线程数，如果达到的话，新任务就会被存放在队列中

:sweat_smile:  其他参数

- keepAliveTime   当线程池中的线程数量大于 corePoolSize 的时候，如果这时没有新的任务提交，核心线程外的线程不会立即销毁，而会等待，直到等待的时间超过了 keepAliveTime 才会被回收销毁

- unit   keepAliveTime 参数的时间单位

- threadFactory   executor创建新线程的时候会用到

- handler   饱和策略。

## 饱和策略

定义：

如果当前同时运行的线程数量达到最大线程数量并且队列也已经被放满了时，ThreadPoolTaskExecutor定义一些策略：

- ThreadPoolExecutor.AbortPolicy：抛出 RejectedExecutionException来拒绝新任务的处理

- THreadPoolExecutor.CallerRunsPolicy：调用执行自己的线程运行任务。这种策略会降低对于新任务提交速度，影响程序的整体性能。另外，这个策略喜欢增加队列容量。

  如果应用程序可以承受延迟并且要求不能丢弃任何一个任务请求的话，可以选择这个策略

- THreadPoolExecutor.DiscardPolicy： 不处理新任务，直接丢弃掉

- ThreadPoolExecutor.Discard)ldestPolicy：此策略将丢弃最早的未处理的任务请求