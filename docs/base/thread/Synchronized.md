# 锁

计算机的锁是从开始的悲观锁，发展到后来的乐观锁、偏向锁、分段锁等。锁主要有两种特性：互斥性和不可见性。

因为锁的存在，某些操作对于外界来说就是黑箱进行的，只有锁的持有者才知道对变量进行了什么修改。

**java.util.concurrent（JUC）包中基础类的解析来说明锁的本质和特性。**



Java 中常用锁实现的方式：

- 用并发包中的锁类

  并发包的类族中，Lock 是 JUC 包的顶层接口，它的实现逻辑并未用到 synchronized ，而是利用了 volatile 的可见性。

  

  [Lock的继承关系图]

​     JDK 8 提出了一个新的锁：StampedLock，改进了读写锁 ReentrantWriteLock。这些新增的锁相关类不断丰富了 JUC 包的内容，降低了并发编程的难度，提高了锁的性能和安全性。

- 利用同步代码块

同步代码块一般使用 Java 的 synchronized 关键字来实现，有两种方式对方法进行加锁操作：

第一：在方法签名处加 synchronized 关键字；

第二：使用 synchronized（对象或类）进行同步。这里原则是锁的范围尽可能的小，锁的时间尽可能的短，即能锁对象，就不要锁类；能锁代码块，就不要锁方法。

synchronized 锁特性由 JVM 负责实现。

## CAS

Compare And Swap (Compare And Exchange) / 自旋 / 自旋锁 / 无锁 （无重量锁）

因为经常配合循环操作，直到完成为止，所以泛指一类操作

cas(v, a, b) ，变量v，期待值a, 修改值b

ABA问题，你的女朋友在离开你的这段儿时间经历了别的人，自旋就是你空转等待，一直等到她接纳你为止

解决办法（版本号 AtomicStampedReference），基础类型简单值不需要版本号



## **可重入锁**：

同一线程调用两次锁

两个类都是同步的，并且还是父子类关系。子类通过 super 关键字进行访问父类的方法。又因为是同步的，所以这时候就出现了重入现象。

## 异常 & 锁：

在程序中如果出现异常的时候锁会被释放！！！

# 锁升级

[没错，我就是厕所所长！(一）](https://www.jianshu.com/p/b43b7bf5e052)

[没错，我就是厕所所长！（二）](https://www.jianshu.com/p/16c8b3707436)

![锁升级](../../image/Thread/lock_step.png)



![](../../image/THread/markword-64.png)

## 偏向锁

把自己线程 id 放在 markword 上

- 多数 synchronized 方法，在很多情况下，只有一个线程在运行
  - StringBuffer -- append
  - Vector中...

偏向锁默认是自动启动的。JVM 启动之后 4s 之后偏向锁启动。

偏向锁延迟  4s

锁撤销

偏向锁可以关闭。

`-XX:BiasedLockingStartupDelay=0`

## 轻量级锁

自旋锁 / 轻量级锁

不需要操作系统内核

while循环，需要消耗 CPU 资源



## 重量级锁

向操作系统申请锁🔒

不要消耗 CPU  资源。等待队列



markword 记录这个线程的ID （偏向锁）

- 偏向锁升轻量级锁，只要有线程竞争就升级。

- 轻量级锁升级重量级锁，
  - 早期：自旋超过 10 次/超过CPU核数的 1/2。
  - 目前：自适应自旋
- 偏向锁升级重量锁 ，重度竞争 / wait 

:warning: synchronized(Object)  不能用String常量 Integer Long

# synchronized

早期 JDK 1.2的时候，synchronized 是重量级锁。到 JDK 1.6 进行了优化。

其实锁升级就是对 synchronized 从重量级锁到轻量级锁的变化。

## 使用方式

有三种使用方式：

- 修饰实例方法

  作用于当前对象实例加锁，进入同步代码前获得当前对象实例的锁

- 修饰静态方法

  给当前类加锁，会作用于类的所有对象实例，因为静态成员不属于任何一个实例对象，是类成员。

  因为访问静态 synchronized 方法占用的锁是当前类的锁，而访问非静态 synchronized 方法占用的锁是当前实例对象锁。

- 修饰代码块

  指定加锁对象，对给定对象加锁，进入同步代码库前要获得给定对象的锁。

*总结：*

​		synchronized 关键字加到 static 静态方法上和 synchronized(class)代码块上都是给 Class 类上加锁。

​		synchronized 关键字加在实例方法上是给对象实例加锁。

​		*尽量不要使用 synchronized(String a)因为 JVM 中，字符串常量池具有缓存功能*

## synchronized的底层实现

lock comxchg .....指令

# volatile

[volatile关键字](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/base/thread/volatile.md)

