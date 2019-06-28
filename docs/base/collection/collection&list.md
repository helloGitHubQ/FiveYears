# 数组和集合
数组的排序、查找、对比、拷贝等。

数组和集合都是用来存储对象的容器，前者性质单一，方便易用；后者类型安全，功能强大。

数组的下标从 0 开始，这点是不符合生活常识的，这源于 BCPL 语言，它将指针设置在 0 的位置，用数组下标作为直接偏移量进行计算。

有个问题，为什么下标不从 1 开始呢？如果是这样的话，计算偏移量就要使用当前下标减 1 的操作。加减法运算对 CPU 是一种双数运算，在数组下标使用频率极高的场景下，这种运算是十分耗时的。

	String[] string1={"1","2"};
    String[] string2=new String[2];
    string2[0]="1";
    string2[1]="2";

string1 是静态初始化的，而 string2 是动态初始化的。无论是什么，数组时固定容量大小的。对于动态大小的数组，集合提供了 <del>Vector </del>和 ArrayList 两个类，前者是线程安全的，性能差，基本弃用；而后者是线程不安全的，使用频率较高。

**foreach:**数组遍历推荐使用。JDK5引进的，可以在不使用下标的情况下遍历数组。
## 数组转集合
在数组转集合的过程中，注意是否使用了视图方式直接返回数组中的数据。
以 Arrays.asList 为例。

	String[] string2=new String[2];
    string2[0]="1";
    string2[1]="2";

    //数组转集合
    List<String> stringList= Arrays.asList(string2);
    stringList.set(0,"1List");
    System.out.println(string2[0]);

    //编译正确，但是会抛异常
    stringList.add("3");
    stringList.remove(2);
    stringList.clear();

可以通过 set() 方法修改元素的值，但是不能进行元素个数的任何操作，否则会抛出 UnsupportedOperationException 异常。

[为什么不能进行元素个数的任何操作的原因是]

*数组："要么直接用我，要么小心异常！"*
## 集合转数组

	//集合转数组
    List<String> list=new ArrayList<>();
    list.add("1");
    list.add("2");
    list.add("3");
    //泛型丢失，无法使用String[]来接收无参方法返回的结果
    Object[] array1=list.toArray();
    //array2数组长度小于元素个数
    String[] array2=new String[2];
    list.toArray(array2);
    System.out.println(Arrays.asList(array2));
    //array2数组长度等于元素个数
    String[] array3=new String[3];
    list.toArray(array3);
    System.out.println(Arrays.asList(array3));
	结果：
	[null, null]
	[1, 2, 3]

[.....]

多次运行结果表示，当数组容量等于集合大小时，运行总是最快的，空间消耗也是最少的。可知，如果数组初始化大小设置不当，不仅会降低性能，还会浪费空间。使用集合的 toArray(T[] array)方法，转为数组时，注意需要传入类型完全一样的数组，并且它的容量大小为list.size()。



