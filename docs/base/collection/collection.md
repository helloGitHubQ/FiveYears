# Collection
## 集合
[java集合框架图]

其实框架图主要分为两类：第一类是按照单个元素存储的 Collection。Set 和 List 都实现了 Collection 接口；第二类是以 key-value 存储的 Map。下面我们就来看看他们的巧妙之处和区别：

- List 集合

List 集合是线性数据结构的主要实现，集合元素通常明确上一个和下一个，也存在明确第一个和最后一个元素。List 集合遍历的结果是非常稳定。常用的有 ArrayList 和 LinkedList 两个集合类。

>1. ArrayList 是容量可以改变的非线程安全集合。内部实现是使用数组进行存储的，集合扩容时会创建更大的数组空间，把原有数组复制到新数组中。ArrayList 支持对元素的快速访问，但是删除和新增速度很慢。
2. LinkedList 的本质是双向链表。如果跟 ArrayList 相比较的话，LinkedList 访问元素的速度很慢，但是新增和删除元素的速度就很快了。除了继承 AbstractList 抽象类之外，还实现了另一个接口 Deque。这个接口同时具有队列和栈的性质。

LinkedList  有三个重要成员：size,first,last。size 是双向链表中的节点个数。first 和 last 是指向第一个和最后一个节点引用。LinkedList 的优点是可以将零散的内存单元通过附加引用的方式关联起来，形成按链路查找的线性结构，内存利用率高。

- Queue 集合

队列是一种先进先出的数据结构，是一种特殊的线性表。它只允许在表的一段进行插入操作，在表的另一端进行获取操作。当队列中没有元素的时候，此时称为空队列。BlockingQueue(阻塞队列)，由于本身 FIFO 的特性和阻塞操作的特点，经常被作为 Buffer（数据缓冲区） 使用

- Map 集合

Map 集合是以key-value键值对作为存储元素实现的哈希结构。key 按照某种哈希函数计算后是唯一的。Value 则是重复的。Map类提供三种Collection 视图，指向 Collection 的箭头仅表示两个类之间的依赖关系。

> 使用 keySet() 查看所有 key，使用 values() 查看所有 values,使用 entrySet() 查看所有的键值对。

> HashMap 线程是不安全的，ConcurrentHashMap 是线程安全的。TreeMap 是 key 有序的 Map 类集合。 

- Set 集合

Set 是不允许出现重复元素的集合类型。Set 体系最常用的数HashSet，TreeSet 和 LinkedHashSet 三个集合类。

> HashSet 从源码分析是使用 HashMap 来实现的，只是 Value 固定为一个静态对象，使用 key 保证集合元素的唯一性。但不能保证元素的顺序。
> TreeSet 从源码分析是使用 TreeMap 来实现的，底层为树结构，在添加新元素到集合中的时候，按照某种比较规则将其插入合适的位置，保证插入后的集合仍然是有序的。
> LinkedHashSet 继承自 HashSet ，具有 HashSet 优点，内部使用链表维护了元素插入顺序。

## 集合初始化
以 HashMap 和 ArrayList 为例子。

ArrayList 是存储单个元素的顺序表结构， HashMap 是存错KV键值对的哈希式结构。

- ArrayList 

当 ArrayList 使用无参构造的时候，默认大小为10，也就是说第一次add的时候，分配为10的容量。后续的每次扩容都会调用 Array.copyOf 方法，创建新数组再复制。反之，如果初始化时便直接指定了容量 new ArrayList(?) ，那么在初始化 ArrayList 对象的时候就直接分配 储存空间了，从而避免被动扩容和数组复制的额外开销了。最后想象一下，如果数量足够大的话，却没有注意初始的容量分配问题，那么无形中造成的性能损耗是非常大的，甚至导致 OOM 的风险。

- HashMap

扩容时需要重建 hash 表，非常影响性能。在 HashMap 中有两个重要的参数：Capacity 和 Load Factor，其 Capacity 决定了存储容量的大小，默认为16;而Load Factor决定看填充比例，一般使用默认 0.75。基于这两个参数的乘积，HashMap 内部用 threshold 变量表 HashMap 中能放入的元素个数。

总结：

集合初始化的时候，要指定初始值大小。如果暂时无法确定集合大小，那么指定相应的默认值。ArrayList大小的为10，而HashMap默认值为16.

[集合和泛型](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/base/collection/collectionGenerics.md)

[集合和数组](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/base/collection/collectionList.md)

[Map类集合](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/base/collection/map.md)

