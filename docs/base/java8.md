<!-- TOC -->
- [java8新特性](#java8新特性)
	- [Lambda表达式/新增](#Lambda表达式/新增)
	- [函数式接口](#函数式接口)
	- [方法引用于构造器引用](#方法引用于构造器引用)
	- [StreamAPI/新增](#StreamAPI/新增) 
	- [接口中的默认方法与静态方法](#接口中的默认方法与静态方法)
	- [新时间日期API](#新时间日期API)
	- [其他新特性](#其他新特性)

# java8新特性
- 速度更快(HashMap、ConcurrentHashMap等)
- 代码更少（新增语法Lambda表达式）
- 强大的Stream API
- 便于并行
- 最大化减少空指针异常 Optional

jdk8 中对 ConcurrentHashMap进行了脱胎换骨式的改造，使用了大量的lock-free技术来减轻因锁的竞争而对性能造成的影响。

数组+链表+红黑树：当某个槽内的元素个数增加到超过8个且table的容量大于或等于64时，由链表转为红黑树；当某个槽内的元素个数减少到6个时，由红黑树转回链表。CAS

## Lambda表达式/新增
是一种匿名函数，一段可传递的代码。

匿名内部类/Lambda表达式

- 基础语法

新的操作符："->"箭头操作符或Lambda表达式	

语法格式一：无参数，无返回值

	@Test
    public void test1(){
        int num=0;//jdk1.7之前，必须是final(匿名内部类使用时),之后只是final关键字省略了
        Runnable runnable1=new Runnable() {
            @Override
            public void run() {
                System.out.println("Hello Runnable!"+num);
            }
        };
        runnable1.run();

        System.out.println("--------------------");

        Runnable runnable2=()-> System.out.println("Hello Lambda!");
        runnable2.run();
    }
																															
语法格式二：有一个参数，并且有返回值	

语法格式三：如果只有一个参数，小括号可以不写（一般不这样做）

	@Test
    public void test2(){
        Consumer<String> consumer1=(x)-> System.out.println(x);
        consumer1.accept("Hello test2!");
        System.out.println("------------------------");
        Consumer<String> consumer2=x-> System.out.println(x);
        consumer2.accept("Hello test2!");
    }

语法格式四：有两个以上的参数，有返回值，并且 Lambda 体中多条语句

 	@Test
    public void test3(){
        Comparator<Integer> comparator=(x,y)->{
            System.out.println("Hello Comparator");
            return Integer.compare(x,y);
        };
        System.out.println(comparator.compare(2,3));
    }

语法格式五：如果 Lambda 体中只有一条语句，return 和大括号都可以省略不写。

 	@Test
    public void test4(){
        Comparator<Integer> comparator=(Integer x,Integer y)->Integer.compare(x,y);
    }

语法格式六：Lambda 表达式中数据类型可以省略不写，因为 JVM 编译器通过上下文推断出，数据类型
，即"类型推断"

	@Test
 	public void test5(){
        String[] strings={"1","2","3"};

        List<String> list=new ArrayList<>();
    }

**左右遇一括号省，左侧推断类型省。**

- Lambda表达式需要"函数式接口"的支持。

函数式接口：接口中只有一个抽象方法接口。用注解 @FunctionalInterface 修饰可以检查是否是函数式接口


## 函数式接口

java 四大内置核心函数式接口：

Consumer<T>:消费型接口

void accept(T t);	

 	@Test
    public void test1(){
        happy(1000,(moneny)->System.out.println("买飞机票花费："+moneny+"元"));
    }

    public void happy(double moneny, Consumer<Double> consumer){
        consumer.accept(moneny);
    }
Supplier<T>：供给型接口
    
T get();

 	@Test
    public void test2(){
        List<Integer> list=getNumList(5,()->(int)(Math.random()*100));
        for (int i:
             list) {
            System.out.println(i);
        }
    }

    //产生一些整数并放入集合中
    public List<Integer> getNumList(int num,Supplier<Integer> supplier){
        List<Integer> list=new ArrayList<>();

        for (int i=0;i<num;i++){
            list.add(supplier.get());
        }

        return list;
    }

Function<T,R>：函数型接口

R apply(T t);

	@Test
    public void test3(){
        String newStr=strHandler("\t\t\t hahaha",(str)->str.trim());
        System.out.println(newStr);
    }

    //处理字符串
    public String strHandler(String string, Function<String,String> function){
        return function.apply(string);
    }

Predicate<T>：断言型接口
    
boolean test(T t);

	@Test
    public void test4(){
        List<String> list= Arrays.asList("www","ok","hello","Lambda");
        List<String> lengthList=filterStr(list,(str)->str.length()>3);
        for (String str :
                lengthList) {
            System.out.println(str);
        }
    }

    //将满足条件的字符串放入集合中
    public List<String>   filterStr(List<String> list, Predicate<String> predicate){
        List<String> stringList=new ArrayList<>();

        for (String str :
                list) {
            if (predicate.test(str)) {
                stringList.add(str);
            }
            }
        return stringList;
    }

![其他函数式接口](https://i.imgur.com/vCTEnb4.png)

## 方法引用于构造器引用



## StreamAPI/新增

## 接口中的默认方法与静态方法

## 新时间日期API

## 其他新特性