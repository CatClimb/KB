# Spring5



# 一、概述——Spring框架入门

## 1、Spring概述

1. Spring 是轻量级的开源的JavaEE框架
2. Spring 可以解决企业应用开发的复杂性
3. Spring 有两个核心部分：IOC 和 Aop
   1. IOC：控制反转，把创建对象过程交给Spring进行管理
   2. AOP：面向切面，不修改源代码进行功能增强
4. Spring特点
   1. 方便解耦，简化开发
   2. Aop编程支持
   3. 方便程序测试
   4. 方便和其它框架进行整合
   5. 方便进行事务操作
   6. 降低API开发难度
   7. Java 源码是经典学习范例：
      1. Spring的源码设计精妙、结构清晰、匠心独运，处处体现着大师对Java设计模式灵活运用以及对Java技术的高深造诣。Spring框架源码无疑是Java技术的最佳实践范例。如果想在短时间内迅速提高自己的Java技术水平和应用开发水平，学习和研究Spring源码将会使你收到意想不到的效果。

## 2、主要内容

1. IOC 容器 
   1. IOC 底层原理 
   2. IOC 接口（BeanFactory）
   3. IOC 操作 Bean 管理（基于 xml） 
   4. IOC 操作 Bean 管理（基于注解） 
2. Aop 
3. JdbcTemplate 
4. 事务管理 
5. Spring5 新特性

## 3、入门案例



# 二、IOC——spring核心

[什么是bean管理？](2.3、bean管理)

## IOC思想

**IOC是一种设计思想，DI是实现IOC的一种方式。**

**控制反转是一种通过描述（XML或注解）并通过第三方去生产或获取特定对象的方式。在Spring中实现控制反转的是IOC容器，其实现方法是依赖注入。**

控制：传统应用程序的对象由程序自身控制，使用Spring后，对象由Spring控制。

反转：程序本身不创建对象

**依赖注入，就是注入属性**

### 1、什么是 IOC

（1）控制反转，把对象创建和对象之间的调用过程，交给 Spring 进行管理（Spring创建、管理、装配Bean）

（2）使用 IOC 目的：为了耦合度降低

（3）做入门案例就是 IOC 实现

## IOC实现原理

### 1、IOC 底层原理

**（1）xml 解析、工厂模式、反射**

（2）**对象有Spring来创建，管理，装配！**

### 2、IOC（BeanFactory 接口）

> #### Spring 提供 IOC 容器实现两种方式：（两个接口） 

1. BeanFactory：IOC 容器基本实现，是 Spring 内部的使用接口
   1. 不提供开发人员进行使用 * 加载配置文件时候不会创建对象，<font color='orange'>在获取对象（使用）才去创建对象</font> （<font color='red'>懒加载</font>）
2. ApplicationContext：BeanFactory 接口的<font color='orange'>子接口</font>，提供更多更强大的功能
   1. 一般由开发人 员进行使用 * 加载配置文件时候就会把在配置文件对象进行创建 (<font color='red'>快加载</font>)

3、ApplicationContext 接口<font color='orange'>有实现类</font> 

### 3、bean管理

1. 什么是 Bean 管理 

（0）Bean 管理指的是两个操作 

（1）Spring <font color='orange'>创建对象 </font>

（2）Spirng <font color='orange'>注入属性</font>

2. Bean 管理操作有两种方式
   1. 基于 <font color='orange'>xml 配置文件方式</font>实现
   2. 基于<font color='orange'>注解方式</font>实现

## Spring操作Bean管理（基于XML方式）



## IOC 操作 Bean 管理（bean 作用域）



## IOC 操作 Bean 管理（bean 生命周期）

