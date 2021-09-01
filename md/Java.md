



# 项目文件详解

# 深入理解Class对象（不全面以后搞）

[什么是RRTI？](####RRTI)

## Class对象概念

​		在Java中用来表示运行时类型信息的对应类就是Class类，Class类也是一个实实在在的类，存在于JDK的java.lang包中，源码如下：

```java
public final class Class<T> implements java.io.Serializable,GenericDeclaration,Type, AnnotatedElement {
    private static final int ANNOTATION= 0x00002000;
    private static final int ENUM      = 0x00004000;
    private static final int SYNTHETIC = 0x00001000;private static native void registerNatives();
static {
    registerNatives();
}

/*
 * Private constructor. Only the Java Virtual Machine creates Class objects.（私有构造，只能由JVM创建该类）
 * This constructor is not used and prevents the default constructor being
 * generated.
 */
private Class(ClassLoader loader) {
    // Initialize final field for classLoader.  The initialization value of non-null
    // prevents future JIT optimizations from assuming this final field is null.
    classLoader = loader;
}
```

该类的描述如下：

* 手动编写的类被编译后会产生一个Class对象，`它表示的是创建的类的类型信息，且该对象保存在同名的.class文件中（（这是其中一种保存方式的）编译后的字节码文件 ）`。比如创建一个Shapes类，编译Shapes类后就会创建其包含Shapes类相关类型信息的Class对象，并保存在Shapes.class字节码文件中。
* 每个通过关键字class标识的类，在内存中有且只有一个与之对应的Class对象来描述其类型信息，`无论创建多少个实例对象，其依据的都是用一个Class对象`。
* jClass类存有私有构造函数，因此对应`Class对象只能有JVM创建和加载`
* Class类的对象作用是`运行时提供`或获得某个对象的类型信息（反射）

![image-20210803125459596](F:\data\knowledge_data\md\pic\image-20210803125459596.png)

## Class对象加载

实际上所有的类都是在对其第一次使用时动态加载到JVM中的，加载的时机是？对类的静态成员引用（并且不是编译器常量）（大概）。

![image-20210803133532687](F:\data\knowledge_data\md\pic\image-20210803133532687.png)

> - 加载：类加载过程的一个阶段：通过一个类的完全限定查找此类字节码文件，并利用字节码文件创建一个Class对象
> - 链接：验证字节码的安全性和完整性，准备阶段正式为静态域分配存储空间，注意此时只是分配静态成员变量的存储空间，不包含实例成员变量，如果必要的话，解析这个类创建的对其他类的所有引用。
> - 初始化：类加载最后阶段，若该类具有超类，则对其进行初始化，执行静态初始化器和静态初始化成员变量。完成这个阶段后类也就加载到内存中(Class对象在加载阶段已被创建)，此时可以对类进行各种必要的操作了（如new对象，调用静态成员等）。

初始化类的需求场景：

* 使用new关键字实例化对象时、读取或者设置一个类的静态字段(不包含编译期常量)以及调用静态方法的时候，必须触发类加载的初始化过程(类加载过程最终阶段)。

* 使用反射包(java.lang.reflect)的方法对类进行反射调用时，如果类还没有被初始化，则需先进行初始化，这点对反射很重要。

* 当初始化一个类的时候，如果其父类还没进行初始化则需先触发其父类的初始化。

* 当Java虚拟机启动时，用户需要指定一个要执行的主类(包含main方法的类)，虚拟机会先初始化这个主类

* 当使用JDK 1.7 的动态语言支持时，如果一个java.lang.invoke.MethodHandle 实例最后解析结果为REF_getStatic、REF_putStatic、REF_invokeStatic的方法句柄，并且这个方法句柄对应类没有初始化时，必须触发其初始化。

  

## Class对象获取方式

> * Class.forName(“com.example.A”)方法
> * Class字面量A.class（`不触发最后的加载阶段`）
> * boolean.class == Boolean.TYPE;
>   char.class == Character.TYPE;
>   byte.class == Byte.TYPE;
>   short.class == Short.TYPE;
>   int.class == Integer.TYPE;
>   long.class == Long.TYPE;
>   float.class == Float.TYPE;
>   double.class == Double.TYPE;
>   void.class == Void.TYPE;
> * 继承自Object类的getClass方法

类型转化问题

```java
Animal animal= new Dog();
//这两句等同于Dog dog = (Dog) animal;
Class<Dog> dogType = Dog.class;
Dog dog = dogType.cast(animal)
    

```

```java
public T cast(Object obj) {
    if (obj != null && !isInstance(obj))
         throw new ClassCastException(cannotCastMsg(obj));
     return (T) obj;
  }
```

## 反射技术

​		==反射机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法==。在Java中，Class类与java.lang.reflect类库一起对反射技术进行了全力的支持。reflect类库中，通过`Constructor、Field、Method、Array`类来反映Class对象的所表示的构造器、属性（包括私有）、方法（包括私有）、数组。

​		



# Java注解

## 声明注解与元注解

​		==注解==：从`JDK5`开始,Java增加对元数据的支持，也就是注解，注解与注释是有一定区别的，可以把注解理解为代码里的特殊标记，这些标记可以在编译，类加载，运行时被读取，并执行相应的处理。通过注解开发人员可以在不改变原有代码和逻辑的情况下在源代码中嵌入补充信息。

​		==元注解==：标记其他注解的注解。

​		@Test声明如下：

~~~java
//表名该注解只能用于方法上
@Target(ElementType.METHOD)
/*@Target(value={CONSTRUCTOR, FIELD, LOCAL_VARIABLE, METHOD, PACKAGE, PARAMETER, TYPE})*/
//生存期是运行时
@Retention(RetentionPolicy.RUNTIME)
public @interface Test{
    
}


~~~

​		==标记注解==不包含成员/元素，它仅用于标记声明。其中`ElementType`是枚举类型，值包括

~~~java
public enum ElementType {
    /**标明该注解可以用于类、接口（包括注解类型）或enum声明*/
    TYPE,
    /** 标明该注解可以用于字段(域)声明，包括enum实例 */
    FIELD,
    /** 标明该注解可以用于方法声明 */
    METHOD,
    /** 标明该注解可以用于参数声明 */
    PARAMETER,
    /** 标明注解可以用于构造函数声明 */
    CONSTRUCTOR,
    /** 标明注解可以用于局部变量声明 */
    LOCAL_VARIABLE,
    /** 标明注解可以用于注解声明(应用于另一个注解上)*/
    ANNOTATION_TYPE,
    /** 标明注解可以用于包声明 */
    PACKAGE,
    /**
     * 标明注解可以用于类型参数声明（1.8新加入）
     * @since 1.8
     */
    TYPE_PARAMETER,
    /**
     * 类型使用声明（1.8新加入)
     * @since 1.8
     */
    TYPE_USE
}
~~~

​		`@Retention`是用来约束注解的生命周期,值有源码级别（source），类文件级别（class）或者运行时级别（runtime）。

含义如下：

1. SOURCE：注解将被编译器丢弃（该类型的注解信息只会保留在源码里，源码经过编译后，注解信息会被丢弃，不会保留在编译好的class文件里）

2. CLASS：注解在class文件中可用，但会被`VM`丢弃（该类型的注解信息会保留在源码里和class文件里，在执行的时候，不会加载到虚拟机中），请注意，当注解未定义Retention值时，默认值是CLASS。例如Java内置注解，`@Override`、`@Deprecated`对应`RetentionPolicy.SOURCE`，`@SuppressWarnning`对应`RetentionPolicy.RUNTIME`等

3. RUNTIME：注解信息将在运行期(`JVM`)也保留，因此可以通过`反射机制`读取注解的信息（源码、class文件和执行的时候都有注解的信息），如`SpringMVC`中的`@Controller`、`@Autowired`、`@RequestMapping`等。

------------------------------------------------


​		该注解编译好后，会生成`Test.class`文件。

## 注解元素及其数据类型

​		定义一个名为`DBTable`的注解，声明一个String类型的name元素，其默认值为空字符，但是必须注意到对应任何元素的声明应采用方法的声明方式，同时可选择使用default提供默认值，定义如下：

~~~java

@Target(ElementType.TYPE)//只能应用于类上
@Retention(RetentionPolicy.RUNTIME)//保存到运行时
public @interface DBTable {
    String name() default "";
}

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@interface Reference{
    boolean next() default false;
}
public @interface AnnotationElementDemo {
    //枚举类型
    enum Status {FIXED,NORMAL};

    //声明枚举
    Status status() default Status.FIXED;

    //布尔类型
    boolean showSupport() default false;

    //String类型
    String name()default "";

    //class类型
    Class<?> testCase() default Void.class;

    //注解嵌套
    Reference reference() default @Reference(next=true);

    //数组类型
    long[] value();
}
~~~

==数据类型==

- `所有基本类型（int,float,boolean,byte,double,char,long,short）`
- `String`

- `Class`

- `enum`

- `Annotation`

- `上述类型的数组`



==编译器对默认值的限制==

​		对于非基本类型的元素，无论是在源代码中声明，还是在注解接口中定义默认值，都不能以null作为值，这就是限制。为了绕开这个限制，只能定义一些特殊的值，例如空字符串或负数，表示某个元素不存在。

==注解不支持继承==

​		注解在编译后，编译器会让它自动继承`java.lang.annotation.Annotation`接口。

## Java内置注解与其它元注解

内置注解主要有三个：

==@Override==：用于标明此方法覆盖了父类的方法，源码如下

```java
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.SOURCE)
public @interface Override {
}
```

==@Deprecated==：用于标明已经过时的方法或类，源码如下，关于@Documented稍后分析：

```java
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(value={CONSTRUCTOR, FIELD, LOCAL_VARIABLE, METHOD, PACKAGE, PARAMETER, TYPE})
public @interface Deprecated {
}
```

==@SuppressWarnnings==:用于有选择的关闭编译器对类、方法、成员变量、变量初始化的警告，其实现源码如下：

```java
@Target({TYPE, FIELD, METHOD, PARAMETER, CONSTRUCTOR, LOCAL_VARIABLE})
@Retention(RetentionPolicy.SOURCE)
public @interface SuppressWarnings {
    String[] value();
}
```


其内部有一个String数组，主要接收值如下：

> `deprecation`：使用了不赞成使用的类或方法时的警告；
> `unchecked`：执行了未检查的转换时的警告，例如当使用集合时没有用泛型 (Generics) 来指定集合保存的类型; 
> `fallthrough`：当 Switch 程序块直接通往下一种情况而没有 Break 时的警告;
> `path`：在类路径、源文件路径等中有不存在的路径时的警告; 
> `serial`：当在可序列化的类上缺少 serialVersionUID 定义时的警告; 
> `finally`：任何 finally 子句不能正常完成时的警告; 
> `all`：关于以上所有情况的警告。

两种元注解：

==@Documented==：被修饰的注解会生成到javadoc中。

==@Inherited==：可以让子类Class对象使用getAnnotations()获取父类被@Inherited修饰的注解。

## 注解与反射机制

​		前面经过反编译后，我们知道Java所有注解都继承了Annotation接口，也就是说　Java使用Annotation接口代表注解元素，该接口是所有Annotation类型的父接口。`同时为了运行时能准确获取到注解的相关信息，Java在java.lang.reflect 反射包下新增了AnnotatedElement接口`，它主要用于表示目前正在 VM 中运行的程序中已使用注解的元素，通过该接口提供的方法可以利用反射技术地读取注解的信息，如反射包的Constructor类、Field类、Method类、Package类和Class类`都`实现了`AnnotatedElement接口`。

AnnotatedElement接口方法的使用：

```java
package com.example;

import java.lang.annotation.*;
import java.util.Arrays;
@Inherited
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@interface DocumentA{

}
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@interface DocumentB{

}
@DocumentA
class A{

}
@DocumentB
public class Annotation1 extends A{
    public static void main(String[] args){
        Class<?> clazz=Annotation1.class;
        //指定注解
        DocumentA documentA=clazz.getAnnotation(DocumentA.class);
        System.out.println("DocumentA:"+documentA);
        //获取该类和其父类的所有注解
        Annotation[] annotations=clazz.getAnnotations();
        System.out.println("annotations:"+ Arrays.toString(annotations));
        Annotation[] annotations1=clazz.getDeclaredAnnotations();
        System.out.println("annotations1:"+Arrays.toString(annotations1));
        boolean b=clazz.isAnnotationPresent(DocumentA.class);
        System.out.println("b:"+b);
        //没继承注解的话为false
        

    }
}

```

## 运行时注解处理器

利用注解与反射机制组装数据库SQL的构建语句的过程

```java
/**
 * Created by wuzejian on 2017/5/18.
 * 表注解
 */
@Target(ElementType.TYPE)//只能应用于类上
@Retention(RetentionPolicy.RUNTIME)//保存到运行时
public @interface DBTable {
    String name() default "";
}


/**
 * Created by wuzejian on 2017/5/18.
 * 注解Integer类型的字段
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface SQLInteger {
    //该字段对应数据库表列名
    String name() default "";
    //嵌套注解
    Constraints constraint() default @Constraints;
}


/**
 * Created by wuzejian on 2017/5/18.
 * 注解String类型的字段
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface SQLString {

    //对应数据库表的列名
    String name() default "";

    //列类型分配的长度，如varchar(30)的30
    int value() default 0;

    Constraints constraint() default @Constraints;
}


/**
 * Created by wuzejian on 2017/5/18.
 * 约束注解
 */

@Target(ElementType.FIELD)//只能应用在字段上
@Retention(RetentionPolicy.RUNTIME)
public @interface Constraints {
    //判断是否作为主键约束
    boolean primaryKey() default false;
    //判断是否允许为null
    boolean allowNull() default false;
    //判断是否唯一
    boolean unique() default false;
}

/**
 * Created by wuzejian on 2017/5/18.
 * 数据库表Member对应实例类bean
 */
@DBTable(name = "MEMBER")
public class Member {
    //主键ID
    @SQLString(name = "ID",value = 50, constraint = @Constraints(primaryKey = true))
    private String id;

    @SQLString(name = "NAME" , value = 30)
    private String name;

    @SQLInteger(name = "AGE")
    private int age;

    @SQLString(name = "DESCRIPTION" ,value = 150 , constraint = @Constraints(allowNull = true))
    private String description;//个人描述

   //省略set get.....
}
```

```java
package com.zejian.annotationdemo;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zejian on 2017/5/13.
 * Blog : http://blog.csdn.net/javazejian [原文地址,请尊重原创]
 * 运行时注解处理器，构造表创建语句
 */
public class TableCreator {

  public static String createTableSql(String className) throws ClassNotFoundException {
    Class<?> cl = Class.forName(className);
    DBTable dbTable = cl.getAnnotation(DBTable.class);
    //如果没有表注解，直接返回
    if(dbTable == null) {
      System.out.println(
              "No DBTable annotations in class " + className);
      return null;
    }
    String tableName = dbTable.name();
    // If the name is empty, use the Class name:
    if(tableName.length() < 1)
      tableName = cl.getName().toUpperCase();
    List<String> columnDefs = new ArrayList<String>();
    //通过Class类API获取到所有成员字段
    for(Field field : cl.getDeclaredFields()) {
      String columnName = null;
      //获取字段上的注解
      Annotation[] anns = field.getDeclaredAnnotations();
      if(anns.length < 1)
        continue; // Not a db table column

      //判断注解类型
      if(anns[0] instanceof SQLInteger) {
        SQLInteger sInt = (SQLInteger) anns[0];
        //获取字段对应列名称，如果没有就是使用字段名称替代
        if(sInt.name().length() < 1)
          columnName = field.getName().toUpperCase();
        else
          columnName = sInt.name();
        //构建语句
        columnDefs.add(columnName + " INT" +
                getConstraints(sInt.constraint()));
      }
      //判断String类型
      if(anns[0] instanceof SQLString) {
        SQLString sString = (SQLString) anns[0];
        // Use field name if name not specified.
        if(sString.name().length() < 1)
          columnName = field.getName().toUpperCase();
        else
          columnName = sString.name();
        columnDefs.add(columnName + " VARCHAR(" +
                sString.value() + ")" +
                getConstraints(sString.constraint()));
      }


    }
    //数据库表构建语句
    StringBuilder createCommand = new StringBuilder(
            "CREATE TABLE " + tableName + "(");
    for(String columnDef : columnDefs)
      createCommand.append("\n    " + columnDef + ",");

    // Remove trailing comma
    String tableCreate = createCommand.substring(
            0, createCommand.length() - 1) + ");";
    return tableCreate;
  }


    /**
     * 判断该字段是否有其他约束
     * @param con
     * @return
     */
  private static String getConstraints(Constraints con) {
    String constraints = "";
    if(!con.allowNull())
      constraints += " NOT NULL";
    if(con.primaryKey())
      constraints += " PRIMARY KEY";
    if(con.unique())
      constraints += " UNIQUE";
    return constraints;
  }

  public static void main(String[] args) throws Exception {
    String[] arg={"com.zejian.annotationdemo.Member"};
    for(String className : arg) {
      System.out.println("Table Creation SQL for " +
              className + " is :\n" + createTableSql(className));
    }

    /**
     * 输出结果：
     Table Creation SQL for com.zejian.annotationdemo.Member is :
     CREATE TABLE MEMBER(
     ID VARCHAR(50) NOT NULL PRIMARY KEY,
     NAME VARCHAR(30) NOT NULL,
     AGE INT NOT NULL,
     DESCRIPTION VARCHAR(150)
     );
     */
  }
}
```

## Java8中注解新增

### 元注解@Repeatable

它表示在同一个位置重复相同的注解。

```java
package com.zejian.annotationdemo;

import java.lang.annotation.*;

/**
 * Created by zejian on 2017/5/20.
 * Blog : http://blog.csdn.net/javazejian [原文地址,请尊重原创]
 */
//使用Java8新增@Repeatable原注解
@Target({ElementType.TYPE,ElementType.FIELD,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Repeatable(FilterPaths.class)//参数指明接收的注解class
public @interface FilterPath {
    String  value();
}

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@interface FilterPaths {
    FilterPath[] value();
}

//使用案例
@FilterPath("/web/update")
@FilterPath("/web/add")
@FilterPath("/web/delete")
class AA{ }
```



* 为了处理上述的新增注解，Java8还在AnnotatedElement接口新增了`getDeclaredAnnotationsByType()` 和 `getAnnotationsByType()`两个方法并在接口给出了默认实现，在指定@Repeatable的注解时，可以通过这两个方法获取到注解相关信息。
* 旧版API中的`getDeclaredAnnotation()`和 `getAnnotation()`是不对@Repeatable注解处理的(`除非该注解没有在同一个声明上重复出现`)。
* 当 getAnnotationsByType()方法调用时，其内部先执行了getDeclaredAnnotationsByType方法，只有当前类不存在指定注解时，getAnnotationsByType()才会继续从其父类寻找，但请注意如果`@FilterPath和@FilterPaths`没有使用了`@Inherited`的话，仍然无法获取。

```java
package com.example;

import java.lang.annotation.*;

/**
 * Created by zejian on 2017/5/20.
 * Blog : http://blog.csdn.net/javazejian [原文地址,请尊重原创]
 */
//使用Java8新增@Repeatable原注解
@Target({ElementType.TYPE, ElementType.FIELD,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited //添加可继承元注解
@Repeatable(FilterPaths.class)
public @interface FilterPath {
    String  value();
}


@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Inherited //添加可继承元注解
@interface FilterPaths {
    FilterPath[] value();
}

@FilterPath("/web/list")
@FilterPath("/web/getList")
class CC { }

//@FilterPath("/web/update")
//@FilterPath("/web/add")
//@FilterPath("/web/delete")
//AA上不使用@FilterPath注解,getAnnotationsByType将会从父类查询
class AA extends CC{
    public static void main(String[] args) {

        Class<?> clazz = AA.class;
        //通过getAnnotationsByType方法获取所有重复注解
        FilterPath[] annotationsByType = clazz.getAnnotationsByType(FilterPath.class);
        FilterPath[] annotationsByType2 = clazz.getDeclaredAnnotationsByType(FilterPath.class);
        if (annotationsByType != null) {
            for (FilterPath filter : annotationsByType) {
                System.out.println("1:"+filter.value());
            }
        }

        System.out.println("-----------------");

        if (annotationsByType2 != null) {
            for (FilterPath filter : annotationsByType2) {
                System.out.println("2:"+filter.value());
            }
        }


        System.out.println("使用getAnnotation的结果:"+clazz.getAnnotation(FilterPath.class));


        /**
         * 执行结果(当前类没有@FilterPath,getAnnotationsByType方法从CC父类寻找)
         1:/web/list
         1:/web/getList
         -----------------
         使用getAnnotation的结果:null
         */
    }
}
```

### 新增两种Element Type

1. ==TYPE_PARAMETER==：用于标注类型参数。
2. ==TYPE_USE==：用于标注任意类型(不包括class、import)。

```java
//TYPE_PARAMETER 标注在类型参数上
class D<@Parameter T> { }

//TYPE_USE则可以用于标注任意类型(不包括class)
//用于父类或者接口
class Image implements @Rectangular Shape { }

//用于构造函数
new @Path String("/usr/bin")

//用于强制转换和instanceof检查,注意这些注解中用于外部工具，它们不会对类型转换或者instanceof的检查行为带来任何影响。
String path=(@Path String)input;
if(input instanceof @Path String)

//用于指定异常
public Person read() throws @Localized IOException.

//用于通配符绑定
List<@ReadOnly ? extends Person>
List<? extends @ReadOnly Person>

@NotNull String.class //非法，不能标注class
import java.lang.@NotNull String //非法，不能标注import
```


​		TYPE_USE，类型注解用来支持在Java的程序中做强类型检查，配合第三方插件工具（如Checker Framework），可以在编译期检测出runtime error（如UnsupportedOperationException、NullPointerException异常），避免异常延续到运行期才发现，从而提高代码质量，这就是类型注解的主要作用。


# 参考文献



#### RRTI

RRTI（Run-Time Type Identification）运行时类型识别

