<!--TOC-->

- [线程池](#线程池)

  - [ThreadLocal的原理](#ThreadLocal的原理)

  - [ThreadLocal的set()方法](#ThreadLocal的set()方法)

  - [内存泄漏问题](#内存泄漏问题)

  - [引用类型](#引用类型)

    

  - [为什么要有线程池？](#为什么要有线程池？)

  - [怎么创建线程池呢？](#怎么创建线程池呢？)

  - [线程池的原理分析](#线程池的原理分析)

<!--TOC-->

# 线程池

通常情况下，我们创建的变量时可以被任何一个线程访问并修改的。**如果想实现每一个线程都有自己的专属本地变量该如何解决呢**？

TheadLocal 来了，解决了这个问题。

ThreadLocal 类主要解决的就是让每一个线程绑定自己的值。可以将 ThreadLocal 类形象的比喻成存放数据的盒子，盒子中可以存储每个线程的私有数据。

如果你创建了一个 ThreadLocal 变量，那么访问这个变量的每个线程都会有这个变量的本地副本，这也是 ThreadLocal 变量名的由来。可以使用 get() 和 set() 方法来获取默认值或将其值更改为当前线程所存的副本的值，从而避免了线程安全问题。

![](../../image/Thread/ThreadLocal.PNG)

### ThreadLocal的原理

让我们通过代码来说更好一点。从 Thread 类入手

```java
public class Thread implements Runnable {
    ......
    //与此线程有关的ThreadLocal值。由ThreadLocal类维护
    ThreadLocal.ThreadLocalMap threadLocals = null;
    //与此线程有关的InheritableThreadLocal值。由InheritableThreadLocal类维护
    ThreadLocal.ThreadLocalMap inheritableThreadLocals = null;
    ......
}
```

Thread类中有一个 threadLocals 和 inheritableThreadLocals 类型的变量，我们可以把 ThreadLocalMap 理解为 ThreadLocal 类实现的定制化的 HashMap 。默认情况下这两个变量都是 null 。只有当前线程调用 ThreadLocal类的 set 或 get 方法时才创建他们，实际上调用这两个方法的时候，我们调用的是 ThreadLocalMap 类对应的 get() ， set() 方法。

### ThreadLocal的set()方法

```java
 public void set(T value) {
        Thread t = Thread.currentThread();
        ThreadLocalMap map = getMap(t);
        if (map != null)
            map.set(this, value);
        else
            createMap(t, value);
}

 ThreadLocalMap getMap(Thread t) {
        return t.threadLocals;
}
```

ThreadLocal类中可以通过 Thread.currentThread()获取到当前线程对象后，直接通过 getMap（Thread t）可以访问到该线程的 ThreadLocalMap对象。

看了上面代码是不是发现了点什么。没错，最终变量是放在了当前线程的 ThredLocalMap 中，并不是存在 ThreadLocal 上；这里可以把 ThreadLocal 理解成 ThreadLocalMap 的封装，传递了变量值。



**ThreadLocal 内部维护的是一个类似 Map 的 ThreadLocalMap 数据结构，key 为当前对象的 Thread 对象，值为 Object 对象。**

```java
//ThreadLocalMap的构造函数
ThreadLocalMap(ThreadLocal<?> firstKey, Object firstValue) {
            table = new Entry[INITIAL_CAPACITY];
            int i = firstKey.threadLocalHashCode & (INITIAL_CAPACITY - 1);
            table[i] = new Entry(firstKey, firstValue);
            size = 1;
            setThreshold(INITIAL_CAPACITY);
}
```



ThreadLocalMap 是 ThreadLocal 的静态内部类。

### 内存泄漏问题

ThreadLocalMap（和 ThreadLocal 写在同一个类中，不过是 static ） 中使用的 key 为 ThreadLocal 的弱引用（可有可无），而 value 是强引用（必需品）。所以，如果 ThreadLocal 没有被外部强引用的情况下，在垃圾回收的时候，key 会被清理掉的。而 value 不会被清理掉。那么这样 ThreadLocalMap 中就会出现 key 为 null 的 Entry 。假如我们不做任何措施的话，value 永远无法被 GC 回收，这个时候就可能会产生**内存泄漏**。

```java
static class Entry extends WeakReference<ThreadLocal<?>> {
            /** The value associated with this ThreadLocal. */
            Object value;

            Entry(ThreadLocal<?> k, Object v) {
                super(k);
                value = v;
            }
}
```

ThreadLocalMap 已经考虑到这种情况，在调用 set() ，get()，remove() 方法的时候，会清理掉 key 为 null 的记录。

**使用完 ThreadLocal 方法后，最好手动调用 remove() 方法。**

### 引用类型

**强引用**：Strong Reference

​		最常见。如 Object object=new Object()；这样的变量声明和定义就会产生对该对象的强引用。只有对象有强引用指向，并且 GC  Roots 可达，那么 Java 内存回收时，即使濒临内存耗尽，也不会回收该对象。

**软引用**：Soft Reference

​		引用力弱于“强引用”，是用在非必须对象的场景。在即将 OOM 之前，垃圾回收器会把这些软引用指向的对象加入回收范围，以获得更多的内存空间，让程序能够继续健康运行。主要用来缓存服务器中间计算结果及不需要实时保存的用户行为等。

**弱引用**：Weak Reference

​		引用强度比前两者更弱，也是用在非必须对象的。如果弱引用指向的对象只存在弱引用这一条线路，则在下一次 YGC 时会被回收。由于 YGC 时间的不确定性，弱引用何时被回收也具有不确定性。弱引用主要用于指向某个易消失的对象，在强引用断开后，此引用不会劫持对象。调用 WeakReference.get() 可能返回 null ，要注意空指针异常。

**虚引用**：Phantom Reference

​		是极弱的一种引用关系，定义完成后，就无法通过该引用获取指定指向对象。为一个对象设置虚引用的唯一目的就是希望能在这个对象被回收时能够收到一个系统通知。虚引用必须于引用队列联合使用，当垃圾回收时，如果发现存在虚引用，就会在回收对象内存前，把这个虚引用加入与之关联的引用队列中。

## 线程池

### 为什么要有线程池？

为什么要有线程池？当然是因为她给我们带来了很多好处了。

- 降低资源消耗：

  通过重复利用已创建的线程降低线程创建和销毁造成的消耗

- 提高响应速度：

  当任务到达时，任务可以不需要等到线程创建就能立即执行

- 提高线程的可管理性：

  线程时稀缺资源，如果无限制的创建，不仅会消耗系统资源，还会降低系统的稳定性，使用线程池可以进行统一的分配，调优和监控。

### 怎么创建线程池呢？

《阿里巴巴 JAVA 开发手册》中强制规定  线程池不允许使用 Executors 去创建，而应该通过 ThreadPoolExecutor 的方式，这样的处理方式更加明确线程池的运行规则，规避资源耗尽的风险。

那么为什么不允许使用 Executors 呢？

- FixedThreadPool 和 SingleThreadExecutor

  允许请求的队列长度为 Integer.MAX_VALUE，可能堆积大量的请求，从而导致 OOM

- CacheThreadPool 和 ScheduledThreadPool

  允许创建的线程数量为 Integer.MAX_VALUE，可能会创建大量线程，从而导致 OOM

怎么通过 ThreadPoolExecutor 创建线程池呢？

1. 通过构造方法实现。

   ![](../../image/Thread/ThreadPoolExecutor.png)

2. 通过 Executor框架的工具类 Executors 来实现。

- FixedThreadPool    固定线程数量的线程池

  固定线程数量说的是线程池中线程数量始终不变。

  如果有一个新的任务提交的时候，线程池中若有空闲线程，则立即执行。

  如果没有，则新的任务会被暂存在一个任务队列中，待有线程空闲时，便处理在任务队列中的任务。

- SingleThreadExecutor    只有一个线程的线程池

  如果有多余的一个任务过来的时候，把该任务放在任务队列中，待线程空闲，按照先进先出的顺序执行任务队列中的任务。

- CachedThreadPool   可调节线程数量的线程池

  线程池中线程数量不确定，如果有空闲线程可以复用，如果没有空闲线程的时候来任务就创建一个线程，任务处理完成之后把线程归还给线程池。

![](../../image/Thread/Executors.png)



[ThreadPoolExecutor](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/base/thread/ThreadPoolExecutor.md)

### 线程池的原理分析

想要弄清出线程池原理 第一步就是要 分析下 execute 方法

```java
// 存放线程池的运⾏状态 (runState) 和线程池内有效线程的数量 (workerCount)
private final AtomicInteger ctl = new AtomicInteger(ctlOf(RUNNING, 0));
private static int workerCountOf(int c) {
	return c & CAPACITY;
}
private final BlockingQueue<Runnable> workQueue;

public void execute(Runnable command) {
    // 如果任务为null，则抛出异常。
    if (command == null)
    throw new NullPointerException();
    // ctl 中保存的线程池当前的⼀些状态信息
    int c = ctl.get();
	// 下⾯会涉及到 3 步 操作
    // 1.⾸先判断当前线程池中之⾏的任务数量是否⼩于 corePoolSize
    // 如果⼩于的话，通过addWorker(command, true)新建⼀个线程，并将任务(command)添加到该线程中；然后，启动该线程从⽽执⾏任务。
    if (workerCountOf(c) < corePoolSize) {
        if (addWorker(command, true))
            return;
        c = ctl.get();
    }
    
    // 2.如果当前之⾏的任务数量⼤于等于 corePoolSize 的时候就会⾛到这⾥
    // 通过 isRunning ⽅法判断线程池状态，线程池处于 RUNNING 状态才会被并且队列可以加⼊任务，该任务才会被加⼊进去
    if (isRunning(c) && workQueue.offer(command)) {
        int recheck = ctl.get();
        // 再次获取线程池状态，如果线程池状态不是 RUNNING 状态就需要从任务队列中移除任务，并尝试判断线程是否全部执⾏完毕。同时执⾏拒绝策略。
        if (!isRunning(recheck) && remove(command))
        	reject(command);
        // 如果当前线程池为空就新创建⼀个线程并执⾏。
        else if (workerCountOf(recheck) == 0)
        	addWorker(null, false);
    }
    
    //3. 通过addWorker(command, false)新建⼀个线程，并将任务(command)添加到该线程中；然后，启动该线程从⽽执⾏任务。
    //如果addWorker(command, false)执⾏失败，则通过reject()执⾏相应的拒绝策略的内容。
    else if (!addWorker(command, false))
    	reject(command);
}
```



线程池原理分析图：

![](../../image/Thread/ThreadPool.png)

