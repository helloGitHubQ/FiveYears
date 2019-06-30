# Stream API
新增的(java.util.stream.*)

(流)Stream是什么呢？

是数据渠道，用于操作数据源（集合、数组等）所产生的元素序列。"集合讲的数据，流讲的计算"

注意：

	1. Stream 不会存储元素
	2. Stream 不会改变源对象。相反，他们会返回一个持有结果的新 Stream
	3. Stream 的操作是延迟执行的。

Stream 操作的三步：

- 创建 Stream :一个数据源（集合，数组等），获取一个流

		1.	通过 Collection 系列集合提供的 stream() 或 parallelStream()
		2.	通过 Arrays 中的静态方法 stream() 获取数组流
		3.	通过 Stream 类中的静态方法 of()
		4.	创建无限流 ， 迭代和生成

- 中间操作：一个中间操作链，对数据源的数据进行处理

多个中间操作可以连接起来形成一个流水线，除非流水线上触发终止操作，否则中间操作不会执行任何处理！而在终止操作的时候一次性全部处理，称为**惰性求值**

**内部迭代：**迭代操作由 Stream API 完成

筛选切片：

	 filter -- 接受 Lambda ,从流中排除某些元素
	 limit -- 截断流，使其元素不超过给定数量
	 skip(n) --  跳过元素，返回一个扔掉前 n 个元素的流；若流中元素不足n个，则返回一个空流
	 distinct -- 刷选，通过所生成元素的 hashCode() 和 equals() 去除重复元素

	@Test
    public void test1(){
        //中间操作：不做任何操作
        Stream<Employee> stream=employees.stream().filter((e)->{
            System.out.println("Stream API 的中间操作");
            return e.getAge()>35;
        });

        //终止操作：一次性全部执行
        stream.forEach(System.out::println);
    }

    //外部迭代：自己手动完成
    @Test
    public void test2(){
        Iterator<Employee> iterator=employees.iterator();

        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }
    }

    //limit
    @Test
    public  void test3(){
        employees.stream().filter((e)->{
            System.out.println("limit");
            return  e.getAge()>0;//短路 && | ||
        }).limit(2).forEach(System.out::println);
    }

    //skip 和 distinct
    @Test
    public void  test4(){
        employees.stream().filter((e)->e.getSalary()>5000).skip(2).distinct().forEach(System.out::println);
    }

映射：

	map -- 接收 Lambda ,将元素转换为其他形式或提取信息。接受一个函数作为参数，该函数会被应用到每个元素上，并将其映射成一个新元素
    flatMap -- 接收一个函数作为参数，将流中的每个值都换成另一个流，然后把所有的流连成另一个流
	
	@Test
    public void test5(){
        List<String> list1=Arrays.asList("1","2","3","4","5","6");
        //全部转大写
        list1.stream().map((x)->x.toUpperCase()).forEach(System.out::println);

        System.out.println("---------获取员工姓名--------");

        employees.stream().map((x)->x.getName()).forEach(System.out::println);

        System.out.println("---------map--------");

        Stream<Stream<Character>> stream=list1.stream().map(TestStreamAPI2::filterCharacter);
        stream.forEach((sm)->sm.forEach(System.out::println));

        System.out.println("--------flatMap--------");

        Stream<Character> stream1=list1.stream().flatMap(TestStreamAPI2::filterCharacter);
        stream1.forEach(System.out::println);

	}

    public static Stream<Character> filterCharacter(String str){
        List<Character> list=new ArrayList<>();

        for(Character character:str.toCharArray()){
                list.add(character);
        }

        return list.stream();
    }

排序：

	sorted -- 自然排序(Comparable)
    sorted(Comparator com) -- 定制排序

	@Test
    public void test7(){
        List<String> list1=Arrays.asList("7","2","5","4","5","6");
        list1.stream().sorted().forEach(System.out::println);

        System.out.println("--------定制排序-------");

        employees.stream().sorted((x,y)->x.getName().compareTo(y.getName())).forEach(System.out::println);
    }


- 终止操作（终端操作）：一个终止操作，执行中间操作并产生结果

查找与匹配：

 	allMatch -- 检查是否匹配所有元素
    anyMatch -- 检查是否至少匹配一个元素
    noneMatch -- 检查是否没有匹配所有元素
    findFirst -- 返回第一元素
    findAny -- 返回当前流中任意元素
    count -- 返回流中元素的总数
    max -- 返回流中元素的最大值
    min -- 返回流中元素的最小值

 	@Test
    public void test1(){
        System.out.println("----allMatch----");
        boolean b1=employees.stream().allMatch((x)->x.getStauts().equals(Employee.Stauts.BUSY));
        System.out.println(b1);
        System.out.println("----anyMatch----");
        boolean b2=employees.stream().anyMatch((x)->x.getStauts().equals(Employee.Stauts.FREE));
        System.out.println(b2);
        System.out.println("----noneMatch----");
        boolean b3=employees.stream().noneMatch((x)->x.getStauts().equals(Employee.Stauts.BUSY));
        System.out.println(b3);

        System.out.println("----findFirst----");
        //optional是java8中防止出现更多的空指针异常而建立的
        Optional<Employee> optional1= employees.stream().sorted((x, y)-> Double.compare(x.getSalary(),y.getSalary())).findFirst();
        System.out.println(optional1.get());
        System.out.println("----findAny----");
        //并行的流
        Optional<Employee> optional2 =employees.parallelStream().filter((e)->e.getStauts().equals(Employee.Stauts.BUSY)).findAny();
        System.out.println(optional2.get());
    }

    @Test
    public void test2(){
        Long count=employees.stream().count();
        System.out.println(count);

        Optional<Employee> employee1= employees.stream().max((x,y)->Double.compare(x.getSalary(),y.getSalary()));
        System.out.println(employee1.get());

        Optional<Double> employee2= employees.stream().map(Employee::getSalary).min(Double::compare);
        System.out.println(employee2.get());
    }


归约：

	1.T reduce(T identity, BinaryOperator<T> accumulator);
	2.Optional<T> reduce(BinaryOperator<T> accumulator);
	3.<U> U reduce(U identity,BiFunction<U, ? super T, U> accumulator,BinaryOperator<U> combiner);

map 和 reduce 的连接称为 map-reduce模式。

	@Test
    public void test3(){
        List<Integer> list=Arrays.asList(1,2,3,4,5,6,7,8,9,10);

        Integer sum=list.stream().reduce(0,(x,y)->x+y);
        System.out.println(sum);
        System.out.println("-------------");
        //所有员工工资之和
        Optional<Double> optional=employees.stream().map(Employee::getSalary).reduce(Double::sum);
        System.out.println(optional.get());
    }

收集（万能，需要熟悉其中方法）：

collect -- 将流转换为其他形式，接收一个Collector接口的实现，用于给Stream中的元素做汇总的方法。

Collector 接口方法中的实现决定了如何对流执行收集操作（如收集到List、Map、Set），但是 Collectors 实用类提供了很多静态方法，可以方便的创建常见收集器实例。

	@Test
    public void test4(){
        //List
        List<String> list=employees.stream().map(Employee::getName).collect(Collectors.toList());
        list.forEach(System.out::println);
        System.out.println("--------------");
        //Set
        Set<String> set=employees.stream().map(Employee::getName).collect(Collectors.toSet());
        set.forEach(System.out::println);
        System.out.println("--------------");
        //自定义
        HashSet<String> hashSet= employees.stream().map(Employee::getName).collect(Collectors.toCollection(HashSet::new));
        hashSet.forEach(System.out::println);
    }

	//分组
    @Test
    public void  test6(){
       Map<Employee.Stauts,List<Employee>> map=employees.stream().collect(Collectors.groupingBy(Employee::getStauts));
        System.out.println(map);
    }

[练习....]