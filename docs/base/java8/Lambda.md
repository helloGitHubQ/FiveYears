# Lambda 表达式
是一种匿名函数(新增的)，一段可传递的代码。

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

