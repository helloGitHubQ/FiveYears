# 函数式接口
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

其他函数式接口

![其他函数式接口](https://i.imgur.com/vCTEnb4.png)


[练习..]