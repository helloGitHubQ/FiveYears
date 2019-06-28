# Map类集合

## 红黑树
[.....]
## TreeMap
[.....]
## HashMap
除局部方法或绝对线程安全的情形外，优先推荐使用 ConcurrentHashMap。两者相差无几，后者是线程安全的。

HashMap 的死链问题及扩容数据丢失问题是慎用 HashMap 的两个重要原因。
## ConcurrentHashMap
第一次了解，第一次使用！！！

JDK8 对 ConcurrentHashMap 进行了脱胎换骨式的改造，使用了大量的 lock-free 技术来减轻因锁的竞争而对性能造成的影响。是学习并发编程的一个绝佳示例，此类超过 6300 行代码，涉及到 volatitle、CAS、锁、链表、红黑树等众多知识点。

JDK8 之前采用的是分段锁的设计理念。分段锁是由内部类 Segment 实现的，它继承于 ReentranLock，用于管理它的辖区的各个 HashEntry。 ConcurrentHashMap 被 Segement 分成了很多小区，Segement 就相当于小区保安，HashEntry 列表相当于小区业主，小区保安采用加锁的方式，保证每个 Segment 内都不发生冲突。