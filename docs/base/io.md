## IO
Java中流有两个重要概念，一个是字节流，另一个则为字符流。

其中字节流以字节byte为基本处理单元，通常用于处理二进制文件，最典型的类为InputStream与OutputStream。

字符流则以Unicode字符（2个字符大小）为处理单元，最典型的类为FileReader与FileWriter，相比字节流而言字符流设置了一个内存缓冲区，一般用于操作纯文本文件。

按操作方式分类结构图：

![javaIO](https://i.imgur.com/RghJWRN.jpg)

按操作对象分类结构图：

[按操作对象分类结构图]
