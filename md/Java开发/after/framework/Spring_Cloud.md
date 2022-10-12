# Spring Cloud

# 一、入门

1、背景

## 2、概述

### 2.1、微服务架构概述

> ### 什么是微服务？

​	微服务架构是一种架构模式，它提倡将单一应用程序划分成一组小的服务，服务之间相互协调、互相配合，为用户提供最终价值。每个服务运行在其独立的进程中，服务和服务之间采用轻量级的通信机制相互沟通（通常是基于HTTP的Restful API).每个服务都围绕着具体的业务进行构建，并且能够被独立的部署到生产环境、类生产环境等。另外，应尽量避免统一的、集中的服务管理机制，对具体的一个服务而言，应根据业务上下文，选择合适的语言、工具对其进行构"  ---- Martin Flower

**简而言之：拒绝大型单体应用，基于业务边界进行服务微化拆分，各个服务独立部署运行**

> 集群和分布式

* 集群是个物理形态，分布式是个工作方式。

* 集群：只要是一堆机器，就可以叫集群**，他们是不是一起协作着干活，这个谁也不知道**，集群指的是将几台服务器集中在一起，实现同一业务
* 分布式：分布式是指将不同的业务分布在不同的地方。
* 节点：集群中的一个服务器
* 分布式中的每一个节点，都可以做集群。 而集群并不一定就是分布式的。 

### 2.2、SpringCloud简介

**SpringCloud是**

> ### 	分布式微服务架构的一站式解决方案，是多种微服务架构落地技术的集合体，俗称微服务全家桶。

![image-20220820155834044](Spring_Cloud.assets\image-20220820155834044.png)

<center><b>图 1 全家桶</b></center>

### 2.3、SpringCloud版本

 SpringBoot与SPringCloud兼容版本看官网：[Spring Cloud](https://spring.io/projects/spring-cloud#learn)

当前学习项目版本：

![image-20220820161813535](Spring_Cloud.assets\image-20220820161813535.png)



### 2.4、SpringCloud技术栈

> ### 选用

#### 服务注册中心

Eureka（扭 瑞 卡）：不维护了，但是基础，需要学习。

Zookeeper（汝 ki pe）：替代方案1

Consul（堪少）：替代方案2 Golang语言写的

Nacos（耐扣死）：强烈推荐。 阿里巴巴（百万级）

#### 服务调用

Ribbon（率本）：维护中

LoadBalancer（load 掰冷死）

feign（粪）：不维护了

Openfeign（open 粪）

#### 服务降级（|熔断|限流）

Hystrix（hi 丝 据 可 死）

Sentinel（森 ti no）：强烈推荐。 阿里巴巴（百万级）

#### 服务网关

Zuul（汝）：不维护了

Zuul2：没有了

#### 服务配置

Config

Nacos

#### 服务总线

Bus

Nacos



![image-20220820165717994](Spring_Cloud.assets\image-20220820165717994.png)



## 3、简单搭建Rest微服务架构

思想：约定>配置>编码

### RestTemplate

[使用详情](https://docs.spring.io/spring-framework/docs/5.2.2.RELEASE/javadoc-api/org/springframework/web/client/RestTemplate.html)

ResultTemplate提供了多种便捷访问远程Http服务的方法，是一种简单便捷的访问resful服务模板类，是Spring提供的用于访问Result服务的客户端模板工具集。

```java
//注入
@Resource
public RestTemplate restTemplate;
```



### spring-cloud-01（父工程 提供者）

1. 创建maven父工程

2. 配置项目编码，配置**annotation processing**（作用类似：Lombok）为开启

3. java编译为8

4. 引入依赖：

```xml
<!-- 统一管理jar包版本 -->
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
     <maven.compiler.source>8</maven.compiler.source>
    <maven.compiler.target>8</maven.compiler.target>
    <junit.version>4.12</junit.version>
    <log4j.version>1.2.17</log4j.version>
    <lombok.version>1.16.18</lombok.version>
    <mysql.version>5.1.47</mysql.version>
    <druid.version>1.1.16</druid.version>
    <mybatis.spring.boot.version>1.3.0</mybatis.spring.boot.version>
</properties>

<!-- 1、只是声明依赖，并不实际引入，子项目按需声明使用的依赖 -->
<!-- 2、子项目可以继承父项目的 version 和 scope -->
<!-- 3、子项目若指定了 version 和 scope，以子项目为准 -->
<!--4、以上几点不准确，更改理解为 被 dependencyManagement 包含的依赖，其pom和子pom依赖都能继承它的版本-->
<dependencyManagement>
    <dependencies>
        <!--spring boot 2.2.2-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-dependencies</artifactId>
            <version>2.2.2.RELEASE</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
        <!--spring cloud Hoxton.SR1-->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-dependencies</artifactId>
            <version>Hoxton.SR1</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
        <!--spring cloud alibaba 2.1.0.RELEASE-->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-alibaba-dependencies</artifactId>
            <version>2.1.0.RELEASE</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>

        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>${mysql.version}</version>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>${druid.version}</version>
        </dependency>
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>${mybatis.spring.boot.version}</version>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>${junit.version}</version>
        </dependency>
        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>${log4j.version}</version>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>${lombok.version}</version>
            <optional>true</optional>
        </dependency>
    </dependencies>
</dependencyManagement>

<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <configuration>
                <fork>true</fork>
                <addResources>true</addResources>
            </configuration>
        </plugin>
    </plugins>
</build>
```

### cloud-provider-payment8001（子模块1）

5. 新建子模块

6. 引入依赖

   1. ```xml
      <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-web</artifactId>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-actuator</artifactId>
              </dependency>
              <dependency>
                  <groupId>org.mybatis.spring.boot</groupId>
                  <artifactId>mybatis-spring-boot-starter</artifactId>
              </dependency>
              <dependency>
                  <groupId>com.alibaba</groupId>
                  <artifactId>druid-spring-boot-starter</artifactId>
                  <version>1.2.8</version>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-jdbc</artifactId>
              </dependency>
              <dependency>
                  <groupId>mysql</groupId>
                  <artifactId>mysql-connector-java</artifactId>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-devtools</artifactId>
                  <scope>runtime</scope>
                  <optional>true</optional>
              </dependency>
              <dependency>
                  <groupId>org.projectlombok</groupId>
                  <artifactId>lombok</artifactId>
                  <optional>true</optional>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-test</artifactId>
                  <scope>test</scope>
              </dependency>
      ```

      

7. 写yml

   1. ```yml
      server:
        port: 8001
      
      spring:
        application:
          name: cloud-payment-service
      
        datasource:
          type: com.alibaba.druid.pool.DruidDataSource
          driver-class-name: org.gjt.mm.mysql.Driver
          url: jdbc:mysql://localhost:3306/cloud01_payment8001?useUnicode=true&characterEncoding=utf-8&useSSL=false
          username: wujianmin
          password: 123456
      
      mybatis:
        mapper-locations: classpath:mapper/*.xml
        type-aliases-package: com.example.springcloud.entities
      
      ```

      

8. 写主启动类

   1. ```java
      @SpringBootApplication
      public class PaymentMain8001 {
          public static void main(String[] args) {
              SpringApplication.run(PaymentMain8001.class,args);
          }
      }
      ```

9. 写业务

   1. ```mysql
      CREATE TABLE payment(
      id bigint(20)NOT NULL AUTO_INCREMENT COMMENT 'ID',
      serial varchar(200) DEFAULT '',
      PRIMARY KEY (id)
      )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
      
      ```



### cloud-provider-payment80（子模块2 消费者）

该模块直接调用cloud-provider-payment8001模块来消费业务。

所以只用写controller类来通过RestTemplate来调用cloud-provider-payment8001模块业务。

```java
@Configuration
public class ApplicationContext{
    @Bean
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }
}
```

```java
@Slf4j
@RestController
@RequestMapping("/consumer")
public class OrderController {
    public final static String PAYMENT_URL="http://localhost:8001";
    @Resource
    private RestTemplate restTemplate;

    @GetMapping("/payment/create")
    public CommonResult<Integer> create(Payment payment){
        log.info("result of  consumer payment: {}",payment);
        CommonResult commonResult = restTemplate.postForObject(PAYMENT_URL + "/payment/create",payment, CommonResult.class);
        log.info("result of consumer commonResult: {}",commonResult);
        return commonResult;


    }
    @GetMapping("/payment/get/{id}")
    public CommonResult<Payment> getPaymentById(@PathVariable("id") Integer id){
        CommonResult commonResult = restTemplate.getForObject(PAYMENT_URL + "/payment/get/"+id, CommonResult.class);
        log.info("result of commonResult: {}",commonResult);
        return commonResult;

    }
}
```

### cloud-api-commons（子模块 公共类）

略



# 二、Eureka 服务注册与发现

* Spring Cloud 封装了 Netflix 公司开发的Eureka 模块来实现服务治理。

* 什么是服务治理？
  * 在传统的rpc（remote produred call）远程调用框架中，管理每个服务与服务之间依赖关系比较复杂，所以需要使用服务治理，管理服务与服务之间依赖关系，可以实现服务调用、负载均衡、容错等，实现服务注册与发现。

## 1、服务注册

​	Eureka采用了CS的设计架构，Eureka Server作为服务注册功能的服务器，它是**服务注册中心**。而系统中的其他微服务，使用Eureka的客户端连接到Eureka Seve并维持心跳连接。这样系统的维护人员就可以通过Eureka Server 来监控系统中各个微服务是否正常运行。

​	在服务注册与发现中，有一个注册中心。当服务器启动的时候，会把当前自己服务器的信息比如服务地址通讯地址等以别名方式注册到注册中心上。另一方(消费者服务提供者)，以该别名的方式去注册中心上获取到实际的服务通讯地址，然后再实现本地RPC调用RPC远程调用框架核心设计思想:在于注册中心，因为使用注册中心管理每个服务与服务之间的一个依赖关系(服务治理概念)。在任何rpc远程框架中，都会有一个注册中心(存放服务地址相关信息(接口地址)

​	Eureka CS 架构：

![image-20220822134837762](Spring_Cloud.assets\image-20220822134837762.png)

### 1.1、Eureka Server 

#### cloud-eureka-server7001

**Eureka Server提供服务注册服务。**

各个微服务节点通过配置启动后，会在EurekaServer中进行注册，这样EurekaServer中的服务注册表中将会存储所有可用服务节点的信息，服务节点的信息可以在界面中直观看到。

导入：

```xml
以前的老版本（当前使用2018)<dependency>
<groupId>org-springframework.cloud</ groupId>
<artifactId>spring-cloud-starter-eureka</artifactId>
</dependency>
I
现在新版本（当前使用2020.2)
<dependency>
<groupId>org.springframework.cloud</groupId>
<artifactId>spring-cloud-starter-netflix-eureka-server</artifactId></dependency>
```



```yml
server:
  port: 7001

spring:
  application:
    name: cloud-eureka-server #微服务名
  boot:
    admin:
      client:
        url: [ http://localhost:65500 ]
        instance:
          prefer-ip: true



management:
  endpoints:
    enabled-by-default: true
    web:
      exposure:
        include: '*'


eureka:
  instance:
    hostname: localhost
  client:
    register-with-eureka: false #表示不向注册中心注册自己
    fetch-registry: false #表示自己就是注册中心，职责是维护服务实例，并不需要去检索服务

    service-url:
    #注册中心地址
    #设置与eureka server 交互的地址查询服务和注册服务都需要依赖这个地址 
      defaultZone: http://${eureka.instance.hostname}:${server.port}/eureka/ 
      #defaultZone源码在这：
      #StringUtils.commaDelimitedListToStringArray(serviceUrls);
```

```java
package com.example.springcloud;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class EurekaMain7001 {
    public static void main(String[] args) {
        SpringApplication.run(EurekaMain7001.class,args);
    }
}
```



### 1.2、Eureka Client

#### cloud-provider-payment8003

**EurekaClient通过注册中心进行访问。**

是一个Java客户端，用于简化Eureka Server的交互，**客户端同时也具备**一个内置的、使用轮询(round-robin)负载算法的**负载均衡器**。在应用启动后，将会向Eureka Server发送心跳(默认周期为30秒)。如果Eureka Server在多个心跳周期内没有接收到某个节点的心跳，EurekaServer将会从服务注册表中把这个服务节点移除（默认90秒)



```xml
<dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
        </dependency>
```

```yml
server:
  port: 8003

spring:
  application:
    name: cloud-payment-service #微服务名

  datasource:
    type: com.alibaba.druid.pool.DruidDataSource
    driver-class-name: org.gjt.mm.mysql.Driver
    url: jdbc:mysql://localhost:3306/cloud01_payment8001?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true
    username: wujianmin
    password: 123456

  boot:
    admin:
      client:
        url: [ http://localhost:65500 ]
        instance:
          prefer-ip: true


management:
  endpoints:
    enabled-by-default: true
    web:
      exposure:
        include: '*'


mybatis:
  mapper-locations: classpath:mapper/*.xml
  type-aliases-package: com.example.springcloud.entities




eureka:
  instance:
    hostname: localhost
  client:
    register-with-eureka: true
    fetch-registry: true
    service-url:
      defaultZone: http://localhost:7001/eureka #指向注册中心服务地址

```

```java
@SpringBootApplication
@EnableEurekaClient
public class PaymentMain8003 {
    public static void main(String[] args) {
        SpringApplication.run(PaymentMain8003.class,args);
    }
}

```

访问 Eureka Server 的根路径就能看到此图：

![image-20220822150410510](Spring_Cloud.assets\image-20220822150410510.png)

#### cloud-consumer-order82

```xml
 
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
        </dependency>
```

```java
server:
  port: 80

spring:
  application:
    name: cloud-order-service
  boot:
    admin:
      client:
        url: http://localhost:65500
        instance:
          prefer-ip: true

management:
  endpoints:
    enabled-by-default: true
    web:
      exposure:
        include: '*'
eureka:
  instance:
    hostname: localhost
  client:
    register-with-eureka: true
    fetch-registry: true
    service-url:
      defaultZone: http://localhost:7001/eureka
```

主启动略

### 1.3、集群配置

![image-20220822152157025](Spring_Cloud.assets\image-20220822152157025.png)

#### （1 EurekaServer集群

> 注意：集群服务名相同

> 注意：服务集群必须换域名，不然访问不到

```hosts
127.0.0.1      eureka7001.com
127.0.0.1      eureka7002.com
```

* 新建与cloud-eureka-server7001相同功能的微服务：**cloud-eureka-server7002**

* 修改它们两的yml文件，相互引用（前提得修改hosts）

* ```yml
  #cloud-eureka-server7001
  eureka:
    instance:
      hostname: eureka7001.com #
    client:
      register-with-eureka: false
      fetch-registry: false
      service-url:
        defaultZone: http://eureka7002.com:7002/eureka/ #引用另一个注册中心
  
  #cloud-eureka-server7002
  eureka:
    instance:
      hostname: eureka7002.com #
    client:
      register-with-eureka: false
      fetch-registry: false
      service-url:
        defaultZone: http://eureka7001.com:7001/eureka/ #引用另一个注册中心
  
  
  ```

  



#### （2 eurekaClient 集群

* 新建相同功能的微服务

* 客户端引用 EurekaServer集群 就可以了（修改yml）

* 其他客户端略

* > 注意 没有负载均衡

```yml
#cloud-provider-payment8003
eureka:
  instance:
    hostname: localhost
    instance-id: payment8003 # 如图所示：
    prefer-ip-address: true  #暴露ip 如图所示：
  client:
    register-with-eureka: true
    fetch-registry: true
    service-url:
    #引用 server 集群
      defaultZone: http://eureka7001.com:7001/eureka,http://eureka7002.com:7002/eureka

```



![image-20220822155807899](Spring_Cloud.assets\image-20220822155807899.png)

#### （3 负载均衡

条件：客户端必须有一个微服务的集群（在cloud-provider-payment8001 yml文件中增加 eureka配置，并加 @EnableEurekaClient）

开始负载均衡：

* 在消费者中 cloud-consumer-order82
* 修改 yml ，让它指向server集群 

* 首先，通过服务名链接来绑定集群: `"http://CLOUD-PAYMENT-SERVICE"`
* 在RestTemplate组件上标 @LoadBalanced

```java
 public final static String PAYMENT_URL="http://CLOUD-PAYMENT-SERVICE";

 CommonResult commonResult = restTemplate.postForObject(PAYMENT_URL + "/payment/create",payment, CommonResult.class);
```

```java
		@Bean
		@LoadBalanced
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }
```

在提供者集群添加返回端口信息，就可以看出轮询负载了

## 2、服务发现

对于注册进eureka里面的微服务，可以通过服务发现来获得该服务的信息

`cloud-provider-payment8001`

```java
@SpringBootApplication
@EnableEurekaClient
@EnableDiscoveryClient
public class PaymentMain8001 {
    public static void main(String[] args) {
        SpringApplication.run(PaymentMain8001.class,args);
    }
}

```



```java
@Resource
    private DiscoveryClient discoveryClient;


    @GetMapping(value = "/payment/discovery")
    public Object discovery(){
        List<String> services = discoveryClient.getServices();
        for (String element : services) {
            log.info("***** element:"+element);
        }
        List<ServiceInstance> instances = discoveryClient.getInstances("CLOUD-PAYMENT-SERVICE");
        for (ServiceInstance instance : instances) {
            log.info(instance.getServiceId()+"\t"+instance.getHost()+"\t"+instance.getPort()+"\t"+instance.getUri());
        }
        return this.discoveryClient;
    }
```

console result

```terminal
2022-08-24 10:06:06.401  INFO 13596 --- [nio-8001-exec-2] c.e.s.controller.PaymentController       : ***** element:cloud-payment-service
2022-08-24 10:06:06.401  INFO 13596 --- [nio-8001-exec-2] c.e.s.controller.PaymentController       : ***** element:cloud-order-service
2022-08-24 10:06:06.403  INFO 13596 --- [nio-8001-exec-2] c.e.s.controller.PaymentController       : CLOUD-PAYMENT-SERVICE	192.168.40.150	8003	http://192.168.40.150:8003
2022-08-24 10:06:06.403  INFO 13596 --- [nio-8001-exec-2] c.e.s.controller.PaymentController       : CLOUD-PAYMENT-SERVICE	192.168.40.150	8001	http://192.168.40.150:8001
```

web result

![image-20220822180131763](Spring_Cloud.assets\image-20220822180131763.png)

## 3、Eureka 自我保护机制

![image-20220822180208559](Spring_Cloud.assets\image-20220822180208559.png)

![image-20220822150347022](Spring_Cloud.assets\image-20220822150347022.png)



原因：

某时刻某一个微服务不可用了，Eureka不会立刻清理，依旧会对该微服务的信息进行保存



### 禁用自我保护

server集群要多个一起设置

```yml
erver:
  enable-self-preservation: false
  eviction-interval-timer-in-ms: 2000
```

client集群要多个一起设置

![image-20220822180627169](Spring_Cloud.assets\image-20220822180627169.png)

## 4、服务器停更说明

[Home · Netflix/eureka Wiki (github.com)](https://github.com/Netflix/eureka/wiki)

# 三、其他技术的 服务注册与发现

## 1、Zookeeper

[官网下载](https://github.com/apache/zookeeper/releases/tag/release-3.5.10)

1. 新建模块 cloud-provider-payment8004

2. 导入pom.xml,三个核心包：

```xml
<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework.cloud/spring-cloud-starter-zookeeper-discovery -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-zookeeper-discovery</artifactId>
            <version>2.2.5.RELEASE</version>
        </dependency>
```

3. 配置yml文件：（连接虚拟机的ip）

```yml
server:
  port: 8004

spring:
  application:
    name: cloud-provider-zookeeper-payment
  cloud:
    zookeeper:
      connect-string: 192.168.220.1:2181 #连接虚拟机的zookeeper ip和端口号
 

```

4. 主程序类：

```java
@SpringBootApplication
@EnableDiscoveryClient
public class PaymentMain8004 {
    public static void main(String[] args) {
        SpringApplication.run(PaymentMain8004.class,args);
    }
}

```

5. controller类：

```java
@RestController
public class PaymentController {
    @Value("${server.port}")
    private String serverPort;

    @GetMapping(value = "/payment/zk")
    public String paymentzk(){
        return "springcloud with zookeeper:"+serverPort+"\t"+ UUID.randomUUID().toString();
    }
}
```

6. zookeeper搭建：

必须下带有`bin`名的压缩包包，解压到 `/usr/local` 下

在解压包下执行：

```terminal
mkdir zkdata
sudo echo 1 > ./zkdata/myid
mkdir zkdatalogs
```

重命名配置：

conf下的zoo_xxxx.cfg 命名为zoo.cfg

修改配置：

```properties
dataDir=/usr/local/zookeeper/zkdata
dataLogsDir=/usr/local/zookeeper/zkdatalogs
server.1=master1:2888:3888 #待处理
```

在zookeeper包的bin目录下执行：

```terminal
xxx #关闭防火墙 各个linux系统指令不一样

./zkServer.sh start #在 启动服务器

./zkCli.sh #启动客户端
```

启动好客户端之后：

```terminal
ls / #查看根节点 zookeeper
get /zookeeper
#此时还没有services节点
```

7. 启动 cloud-provider-zookeeper-payment8004

访问控制器方法：

`http://localhost:8004/payment/zk`

zookeeper注册上了：

![image-20220902173052671](Spring_Cloud.assets\image-20220902173052671.png)

```terminal
[zk: localhost:2181(CONNECTED) 11] ls /
[services, zookeeper]
[zk: localhost:2181(CONNECTED) 12] ls /services /
services    zookeeper   
[zk: localhost:2181(CONNECTED) 12] ls /services/cloud-provider-payment/41d739e4-2452-4137-bfb2-c0cf75d5e802
[]
[zk: localhost:2181(CONNECTED) 13] ls /services
[cloud-provider-payment]
[zk: localhost:2181(CONNECTED) 14] get /services/cloud-provider-payment/41d739e4-2452-4137-bfb2-c0cf75d5e802
{"name":"cloud-provider-payment","id":"41d739e4-2452-4137-bfb2-c0cf75d5e802","address":"localhost","port":8004,"sslPort":null,"payload":{"@class":"org.springframework.cloud.zookeeper.discovery.ZookeeperInstance","id":"application-1","name":"cloud-provider-payment","metadata":{}},"registrationTimeUTC":1662110433938,"serviceType":"DYNAMIC","uriSpec":{"parts":[{"value":"scheme","variable":true},{"value":"://","variable":false},{"value":"address","variable":true},{"value":":","variable":false},{"value":"port","variable":true}]}}


```

该服务节点是`临时节点`，比eureka还绝情

消费者入驻同理

## 2、Consul

> ### Consul功能

* 服务发现
  * 提供HTTP和DNS两种发现方式
* 健康监测
  * 支持多种协议，HTTP、TCP、Docker、Shell脚本定制化
* KV存储
  * key，Value的存储方式
* 多数据中心
  * Consul支持多数据中心
* 可视化Web界面



### （1 下载安装

https://www.consul.io/

![image-20220903153523104](Spring_Cloud.assets\image-20220903153523104.png)

执行

```terminal
consul --version
consul agent -dev #启动
```

访问 http://localhost:8500/

![image-20220903153806050](Spring_Cloud.assets\image-20220903153806050.png)

![image-20220903155548102](Spring_Cloud.assets\image-20220903155548102.png)

### （2 编写 cloud-provider-consul-payment8006

1. 新建该模块

2. 导入pom

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
       <parent>
           <artifactId>cloud2020</artifactId>
           <groupId>com.atguigu.springcloud</groupId>
           <version>1.0-SNAPSHOT</version>
       </parent>
       <modelVersion>4.0.0</modelVersion>
   
       <artifactId>cloud-providerconsul-payment8006</artifactId>
   
       <dependencies>
           <!-- https://mvnrepository.com/artifact/org.springframework.cloud/spring-cloud-starter-consul-discovery -->
           <dependency>
               <groupId>org.springframework.cloud</groupId>
               <artifactId>spring-cloud-starter-consul-discovery</artifactId>
           </dependency>
   
           <dependency>
               <groupId>com.atguigu.springcloud</groupId>
               <artifactId>cloud-api-commons</artifactId>
               <version>${project.version}</version>
           </dependency>
   
   
           <!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web -->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-web</artifactId>
           </dependency>
   
           <!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web -->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-actuator</artifactId>
           </dependency>
   
           <!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-devtools -->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-devtools</artifactId>
               <scope>runtime</scope>
               <optional>true</optional>
           </dependency>
   
           <!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
           <dependency>
               <groupId>org.projectlombok</groupId>
               <artifactId>lombok</artifactId>
               <optional>true</optional>
           </dependency>
   
           <!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-test -->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-test</artifactId>
               <scope>test</scope>
           </dependency>
   
   
   
       </dependencies>
   
   </project>
    
   
   ```

   

3. 编写yml

   ```yml
   server:
     port: 8006
   
   
   spring:
     application:
       name: cloud-provider-consul-payment
     cloud:
       consul:
         host: localhost
         port: 8500
         discovery:
           service-name: ${spring.application.name}
   
   ```

   

4. 编写启动类

   ```java
   @SpringBootApplication
   @EnableDiscoveryClient
   public class PaymentMain8006 {
       public static void main(String[] args) {
           SpringApplication.run(PaymentMain8006.class,args);
       }
   }
   
   ```

   

5. 编写业务

   ```java
   
   @RestController
   @Slf4j
   public class PaymentController {
   
       @Value("${server.port}")
       private String serverPort;
   
       @GetMapping(value = "/payment/consul")
       public String paymentConsul(){
           return "springcloud with consul: "+serverPort+"\t"+ UUID.randomUUID().toString();
       }
   }
   
   ```

   

6. 启动

![image-20220903162536706](Spring_Cloud.assets\image-20220903162536706.png)

消费者同理

## 3、三个注册中心的异同

* CAP理论：

  * 翻译：

    * C：Consistency（强一致性）

    * A：Availability（可用性）

    * P：Partition tolerance（分区容错）

  * 解释：

    * ==最多只能同时较好的满足两个==
    * CAP理论的核心是:一个分布式系统不可能同时很好的满足一致性，可用性和分区容错性这三个需求,因此，根据CAP原理将NoSQL数据库分成了满足CA原则、满足CP原则和满足AP原则三大类
      * ​	<font color='red'>CA-单点集群，满足一致性，可用性的系统，通常在可扩展性上不太强大。</font>
      * ​	<font color='orange'>CP–满足—致性，分区容忍性的系统，通常性能不是特别高。</font>
      * ​	<font color='green'>AP-满足可用性，分区容忍性的系统，通常可能对—致性要求低此</font>

  * ![image-20220903163544306](Spring_Cloud.assets\image-20220903163544306.png)

  * 目标：

    * CAP理论关注粒度是数据，而不是整体系统设计的策略

* 异同：

  * AP（Eureka）
  * CP（Zookeeper/Consul）

  

  


# 四、负载均衡和服务调用

## 1、Ribbon

Spring CloudRibbon是基于NEtflix Ribbon实现的一套客户端 负载均衡的工具

简单的说，RIbbon是Netflix发布的开源项目，主要功能是提供客户端的软件==负载均衡算法==和==服务调用==。Ribbon客户端组件提供一系列完善的配置项如连接超时，重试等。简单的说，就是在配置文件中列出Load Balancer（简称LB）后面的所有的机器，Ribbon会自动的帮助你基于某种规则（如简单轮询，随机连接等）取连接这些机器。我们很容易使用Ribbon实现自定义的负载均衡算法。

> #### Lb负载均衡（Load Balance）是什么

​	简单的说就是将用户的请求平摊的分配到多个服务上，从而达到系统的HA（高可用）

> #### Ribbon本地负载均衡客户端 VS Nginx

​	Nginx是服务器负载均衡，客户端所有请求都会交给nginx，然后由nginx实现转发请求。即负载均衡是由服务端实现的。

​	Ribbon本地负载均衡，在调用微服务接口时候，会在注册中心上获取注册信息服务列表之后缓存到JVM本地，从而在本地实现RPC远程服务调用技术。

> #### 集中式LB 与 进程内LB

*  集中式LB：
  * 即在服务的消费方和提供方之间使用独立的LB设施（可以式硬件，如F5，也可以是软件，如nginx），由该设施负责把访问请求通过某种策略转发至服务的提供方；
* 进程内LB：
  * 将LB逻辑继承到消费方，消费方从服务注册中心获知由哪些地址可用，然后自己再从这些地址中选择出一个合适的服务器。Ribbon就属于进程内LB，它只是一个类库，集成于消费方进程，消费方通过它来获取到服务提供方的地址。



> #### 常见的负载均衡算法： 

* 轮询：为第一个请求选择健康池中的第一个后端服务器，然后按顺序往后依次选择，直 到最后一个，然后循环。 
* 最小连接：优先选择连接数最少，也就是压力最小的后端服务器，在会话较长的情况下 可以考虑采取这种方式。 
* 散列：根据请求源的 IP 的散列（hash）来选择要转发的服务器。这种方式可以一定程 度上保证特定用户能连接到相同的服务器。如果你的应用需要处理状态而要求用户能连接到 和之前相同的服务器，可以考虑采取这种方式。

### （1 工作流程

负载均衡（@LoadBalance）+RestTemplate调用

![image-20220904153527851](Spring_Cloud.assets\image-20220904153527851.png)

工作步骤：

* 第一步先选择EurekaServer，它优先选择在同一个区域内负载较少的server
* 第二步再根据用户指定的策略，再从server去到的服务注册列表中选择一个地址
* 其中Ribbon提供了多种策略：比如轮询、随机和根据响应时间加权。

### （2 核心组件IRule

```java
/*
*
* Copyright 2013 Netflix, Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
*/
package com.netflix.loadbalancer;

/**
 * Interface that defines a "Rule" for a LoadBalancer. A Rule can be thought of
 * as a Strategy for loadbalacing. Well known loadbalancing strategies include
 * Round Robin, Response Time based etc.
 * 
 * @author stonse
 * 
 */
public interface IRule{
    /*
     * choose one alive server from lb.allServers or
     * lb.upServers according to key
     * 
     * @return choosen Server object. NULL is returned if none
     *  server is available 
     */

    public Server choose(Object key);
    
    public void setLoadBalancer(ILoadBalancer lb);
    
    public ILoadBalancer getLoadBalancer();    
}

```

![image-20220904163430956](Spring_Cloud.assets\image-20220904163430956.png)

### （3 Ribbon负载均衡算法

轮询原理：

​	一句话，请求次数 % 集群数

![image-20220904172018795](Spring_Cloud.assets\image-20220904172018795.png)

### （4 实现

在cloud-consumer-order82 模块的基础上：

1. 改端口

2. 添加 ==不在== <font color='green'>主程序类所在的包路径</font> 的 rule包，并在该包下写入：

   ```java
   @Configuration
   public class MyRule {
       @Bean
       public IRule getMyRule(){
           return new RandomRule();
       }
   }
   
   ```

   原因：**这个自定义配置类不能放在@ComponentScan所扫描的当前包下以及子包下，否则我们自定义的这个配置类就会被所有的Ribbon客户端所共享，达不到特殊化定制的目的了。**

3. 在主程序类上标注：

   ```java
   @RibbonClient(name="CLOUD-PAYMENT-SERVICE",configuration={MyRule.class})
   ```

4. 测试就行

### （5 手写负载均衡

在cloud-consumer-ribbon-order上改造：

1. 去掉原生@LoadBalanced注解

2. 编写LoadBalanced接口

   ```java
   package com.atguigu.springcloud.lb;
   
   import org.springframework.cloud.client.ServiceInstance;
   
   import java.util.List;
   
   public interface LoadBalancer {
        //收集服务器总共有多少台能够提供服务的机器，并放到list里面
       ServiceInstance chooseServer(List<ServiceInstance> serviceInstances);
   
   }
   ```

3. 编写LoadBlanced实现类

   ```java
   package com.atguigu.springcloud.lb;
   
   import org.springframework.cloud.client.ServiceInstance;
   import org.springframework.stereotype.Component;
   
   import java.util.List;
   import java.util.concurrent.atomic.AtomicInteger;
   
   @Component
   public class MyLB implements LoadBalancer {
   
       private AtomicInteger atomicInteger = new AtomicInteger(0);
   
       //坐标
       private final int getAndIncrement(){
           int current;
           int next;
           do {
               current = this.atomicInteger.get();
               next = current >= 2147483647 ? 0 : current + 1;
           }while (!this.atomicInteger.compareAndSet(current,next));  //第一个参数是期望值，第二个参数是修改值是
           System.out.println("*******第几次访问，次数next: "+next);
           return next;
       }
   
       @Override
       public ServiceInstance chooseServer(List<ServiceInstance> serviceInstances) {  //得到机器的列表
          int index = getAndIncrement() % serviceInstances.size(); //得到服务器的下标位置
           return serviceInstances.get(index);
       }
   }
   ```

   

4. 写Controller

   ```java
   @RestController
   @Slf4j
   public class OrderController {
   
      // public static final String PAYMENT_URL = "http://localhost:8001";
       public static final String PAYMENT_URL = "http://CLOUD-PAYMENT-SERVICE";
   
       @Resource
       private RestTemplate restTemplate;
   
       @Resource
       private LoadBalancer loadBalancer;
   
       @Resource
       private DiscoveryClient discoveryClient;
   
       @GetMapping("/consumer/payment/create")
       public CommonResult<Payment>   create( Payment payment){
           return restTemplate.postForObject(PAYMENT_URL+"/payment/create",payment,CommonResult.class);  //写操作
       }
   
       @GetMapping("/consumer/payment/get/{id}")
       public CommonResult<Payment> getPayment(@PathVariable("id") Long id){
           return restTemplate.getForObject(PAYMENT_URL+"/payment/get/"+id,CommonResult.class);
       }
   
       @GetMapping("/consumer/payment/getForEntity/{id}")
        public CommonResult<Payment> getPayment2(@PathVariable("id") Long id){
           ResponseEntity<CommonResult> entity = restTemplate.getForEntity(PAYMENT_URL+"/payment/get/"+id,CommonResult.class);
           if (entity.getStatusCode().is2xxSuccessful()){
             //  log.info(entity.getStatusCode()+"\t"+entity.getHeaders());
               return entity.getBody();
           }else {
               return new CommonResult<>(444,"操作失败");
           }
        }
   
       @GetMapping(value = "/consumer/payment/lb")
        public String getPaymentLB(){
           List<ServiceInstance> instances = discoveryClient.getInstances("CLOUD-PAYMENT-SERVICE");
           if (instances == null || instances.size() <= 0){
               return null;
           }
           ServiceInstance serviceInstance = loadBalancer.chooseServer(instances);
           URI uri = serviceInstance.getUri();
           return restTemplate.getForObject(uri+"/payment/lb",String.class);
       }
   }
   ```

   

## 2、OpenFeign

​	Feign是一个声明式的web服务客户端，让编写web服务客户端变得非常容易，只需创建一个接口并在接口上添加注解即可

> 注意：

* Feign自带负载均衡配置项
* 建议Feign在消费端使用
  	

> Feign能干什么

Feign宗旨是使编写Java Http客户端变得更容易。

​	前面在使用Ribbon+RestTemplate时，利用RestTemplate对Http请求的封装处理，形成了一套模板化的调用方法。但是在实际开发过程中，由于对服务依赖的调用可能不止一处，往往一个接口会被多出调用，所以通常都会针对每个微服务自行封装一些客户端类来包装这些依赖服务的调用。所以，**Feign**在**此基础上做了进一步封装**，由他来帮助我们定义和实现依赖服务接口的定义。在Feign的实现下，我们只需创建一个接口并使用注解的方式来配置它（以前Dao接口上面标注Mapper注解，现在时一个微服务接口上面标注一个Feign注解即可），即可完成对服务提供方的接口绑定，简化了使用Spring cloud Ribbon时，自动封装服务调用客户端的开发量。

> Feign集成了Ribbon

利用Ribbon维护了Payment的服务列表信息，并且通过轮询实现了客户端负载均衡，而与Ribbon不同的时，通过feign只需要定义服务绑定接口且以声明式的方法，优雅而简单的实现了服务调用

[GitHub](https://github.com/spring-cloud/spring-cloud-openfeign)

> Feign和OpenFeign两者区别

| Feign                                                        | OpenFeign                                                    |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Feign是Spring Cloud组件中的一个轻量级RESTful的HTTP服务ke户端Feign内置了Ribbon，用来坐客户端负载均衡，去调用服务注册中心的服务。Feign的使用方式是：使用Feign的注解定义接口，调用这个接口，就可以调用服务组测中心的服务 | OpenFeign是Spring Cloud在Feign的基础上支持了SpringMVC的注解，如@RequestMapping等等。OpenFeign的@FeignClient可以解析SpringMVC的@RequestMapping注解下的接口，并通过动态代理的方式产生实现类，实现类中做负载均衡并调用其他服务。 |
| <dependency>	<groudId>org.springframework.cloud</groudId><br/>  <artifactId>spring-cloud-starter-feign</artifactId><br/></dependency> | `<dependency><br/><groupId>org.springframework.cloud</groupId><br/>  <artifactId>spring-cloud-starter-openfeign</artifactId><br/></dependency> |



### 1、步骤

1. 新建cloud-consumer-feign-order80

2. 

   1. ```xml
      <?xml version="1.0" encoding="UTF-8"?>
      <project xmlns="http://maven.apache.org/POM/4.0.0"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
          <parent>
              <artifactId>cloud2020</artifactId>
              <groupId>com.atguigu.springcloud</groupId>
              <version>1.0-SNAPSHOT</version>
          </parent>
          <modelVersion>4.0.0</modelVersion>
      
          <artifactId>cloud-consumer-feign-order80</artifactId>
      
      
          <!--openfeign-->
          <dependencies>
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-openfeign</artifactId>
              </dependency>
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
              </dependency>
              <dependency>
                  <groupId>com.atguigu.springcloud</groupId>
                  <artifactId>cloud-api-common</artifactId>
                  <version>${project.version}</version>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-web</artifactId>
              </dependency>
      
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-actuator</artifactId>
              </dependency>
      
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-devtools</artifactId>
                  <scope>runtime</scope>
                  <optional>true</optional>
              </dependency>
      
              <dependency>
                  <groupId>org.projectlombok</groupId>
                  <artifactId>lombok</artifactId>
                  <optional>true</optional>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-test</artifactId>
                  <scope>test</scope>
              </dependency>
          </dependencies>
      </project>
       
      
      ```

      

3. yml文件

   1. ```yml
      server:
        port: 84
      
      
      ribbon:
        #饥饿加载模式，初始化时就加载相关微服务，不像延迟加载
        eager-load:
          enabled: true
          clients: [CLOUD-PAYMENT-SERVICE]
      
      #该名由FeignClient指定
      CLOUD-PAYMENT-SERVICE:
        ribbon:
      
          #    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #配置规则 随机
          #    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RoundRobinRule #配置规则 轮询
          #    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RetryRule #配置规则 重试
          #    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.WeightedResponseTimeRule #配置规则 响应时间权重
          NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #配置规则 最空闲连接策略
          ConnectTimeout: 500 #请求连接超时时间
          ReadTimeout: 1000 #请求处理的超时时间
          OkToRetryOnAllOperations: true #对所有请求都进行重试
          MaxAutoRetriesNextServer: 2 #切换实例的重试次数
          MaxAutoRetries: 1 #对当前实例的重试次数
      
      
      
      
      spring:
        application:
          name: cloud-order-service
      
      
      eureka:
        instance:
          hostname: localhost
          instance-id: order84
          prefer-ip-address: true  #访问路径可以显示IP地址
        client:
          register-with-eureka: true
          fetch-registry: true
          service-url:
            defaultZone: http://eureka7001.com:7001/eureka,http://eureka7002.com:7002/eureka
      
      ```

      

4. 主启动类

   1. ```java
      package com.atguigu.springcloud;
      
      import org.springframework.boot.SpringApplication;
      import org.springframework.boot.autoconfigure.SpringBootApplication;
      import org.springframework.cloud.openfeign.EnableFeignClients;
      
      @SpringBootApplication
      @EnableFeignClients
      public class OrderFeignMain80 {
          public static void main(String[] args) {
              SpringApplication.run(OrderFeignMain80.class,args);
          }
      }
       
       
      ```

5. 业务类

   1. ```java
      package com.example.springcloud.service;
      
      import com.example.springcloud.CommonResult;
      import com.example.springcloud.entities.Payment;
      import org.springframework.cloud.openfeign.FeignClient;
      import org.springframework.stereotype.Component;
      import org.springframework.web.bind.annotation.GetMapping;
      import org.springframework.web.bind.annotation.PathVariable;
      import org.springframework.web.bind.annotation.RequestMapping;
      
      @Component
      @FeignClient("CLOUD-PAYMENT-SERVICE")//该处指定两处：微服务和配置文件中的
      @RequestMapping("/payment") 
      public interface PaymentFeignService {
          @GetMapping("/get/{id}")//该方法的访问映射要、方法声明与payment微服务一致
          public CommonResult<Payment> getPaymentById(@PathVariable("id") Long id);
      }
      
      ```

6. 控制类

   1. ```java
      
      @RestController
      @RequestMapping("/consumer")
      public class OrderController {
          private PaymentFeignService paymentFeignService;
          @Autowired
          public OrderController(PaymentFeignService paymentFeignService){
              this.paymentFeignService=paymentFeignService;
          }
      
          @GetMapping(value = "/payment/get/{id}")
          public CommonResult<Payment> getPaymentById(@PathVariable("id") Long id){
              return paymentFeignService.getPaymentById(id);
          }
      }
      
      ```

### 2、超时控制

> 注意

OpenFeign默认等待一秒钟，超过后报错

> 修改

payment8001写入暂停程序：

```java
@GetMapping(value = "/payment/feign/timeout")
public String paymentFeignTimeout(){
    try { TimeUnit.SECONDS.sleep(3); }catch (Exception e) {e.printStackTrace();}
    return serverPort;
}
 
```

order84添加：

```java
@GetMapping(value = "/payment/feign/timeout")
public String paymentFeignTimeout();
 
```

```java
@GetMapping(value = "/consumer/payment/feign/timeout")
public String paymentFeignTimeout(){
   return paymentFeignService.paymentFeignTimeout();
}
```

此时运行测试会报错：

![image-20220909152712095](Spring_Cloud.assets\image-20220909152712095.png)

应改变超时时间：

```yml
ribbon:
  ReadTimeout:  5000
  ConnectTimeout: 5000
 
```

即可通过

### 3、日志打印

对Feign接口的调用情况进行监控和输出

日志级别：

1. None: 默认的，不显示任何日志
2. BASIC：仅记录请求方法、URL、响应状态码及执行时间
3. HEADERS：除了BASIC中定义的信息之外，还有请求和响应的头信息。
4. FULL：除了HEADERS中定义的信息之外，还有请求和响应的正文及元素据



配置

```java
package com.atguigu.springcloud.config;

import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignConfig {

    @Bean
    Logger.Level feignLoggerLevel(){
        return Logger.Level.FULL;
    }
}
 
 

```

```yml
logging:
  level:
    com.atguigu.springcloud.service.PaymentFeignService: debug
 
```

在控制台查看日志

# 五、服务降级、熔断、限流

> ### 雪崩效应（背景）

​	在微服务架构中，微服务之间通过网络进行通信，存在相互依赖，当其中一个服务不可用时， 关联的服务也会变得不可用，造成雪崩显现。要防止这样的情况，必须要有**容错机制来保护服务。**

![image-20220909155557595](Spring_Cloud.assets\image-20220909155557595.png)

> 问题以及解决

* 对方服务（8001提供方）超时了，调用者（80消费方）不能一直卡死等待，必须有服务降级
* 对方服务（8001）down机了，调用者（80）不能一直卡死等待，必须有服务降级
* 对方服务（8001）OK，调用者（80）自己出故障或有自我要求（自己的等待时间小于服务提供者），自己处理降级

## 1、服务降级 

​	在运维期间，当系统处于高峰期，系统资源紧张，我们可以让非核心业 务降级运行。降级：某些服务不处理，或者简单处理【抛异常、返回 NULL、 调用 Mock 数据、调用 Fallback 处理逻辑】。（Fallback指：兜底方法）

> 哪些情况会触发

* 程序运行异常
* 超时
* 服务熔断触发服务降级
* 线程池/信号量打满也会导致服务降级

## 2、服务熔断 

概念：

​	设置服务的超时，当被调用的服务经常失败到达某个阈值，我们可以开 启断路保护机制，后来的请求不再去调用这个服务。本地直接返回默认 的数据

代码效果：

​	在有请求调用的时候，将不会调用主逻辑，而是直接调用降级fallback。通过断路器，实现了自动地发现错误并将降级逻辑功能切换为主逻辑，减少响应延迟的效果。



总过程：

​	服务的降级->进而熔断->恢复调用链路

断路器原理：

* 熔断打开（Open）
  * 对服务进行熔断
* 熔断关闭（Closed）
  * 不会对服务进行熔断
* 熔断半开（Half Open）
  	部分请求根据规则调用当前服务，如果请求成功且符合规则则认为当前服务恢复正常，关闭熔断

​	![image-20220910222420737](Spring_Cloud.assets\image-20220910222420737.png)

原理流程：

在一个时间周期内，（之前：Closed）当错误率上升达到阈值，断路器被打开（之前：Open），之后**慢慢恢复**（之前：（Half Open），关闭熔断（之后：Closed）。

这里的慢慢恢复理解为：（策略）

​	断路器打开，对主逻辑进行熔断之后，hystrix会启动一个休眠时间窗，在这个时间窗内，降级逻辑是临时的称为主逻辑，当休眠时间窗到期，断路器将进入半开状态，释放一次请求到原来的主逻辑上，如果此次请求正常返回，那么断路器将继续闭合，主逻辑恢复，如果这次请求依然有问题，断路器继续进入打开状态，休眠时间窗重新计时。



## 3、服务限流

秒杀高并发等操作，严禁一窝蜂的过来拥挤，大家排队，一秒钟N个，有序进行

## 4、Hystrix

工作流程：

[How it Works · Netflix/Hystrix Wiki (github.com)](https://github.com/Netflix/Hystrix/wiki/How-it-Works#Flow)

![在这里插入图片描述](Spring_Cloud.assets\watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0VsZXZlbl80dQ==,size_16,color_FFFFFF,t_70#pic_center.png)

### 1、基础步骤：

1. 新建cloud-provider-hystrix-payment8001

2. pom

   1. ```xml
      <?xml version="1.0" encoding="UTF-8"?>
      <project xmlns="http://maven.apache.org/POM/4.0.0"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
          <parent>
              <artifactId>cloud2020</artifactId>
              <groupId>com.atguigu.springcloud</groupId>
              <version>1.0-SNAPSHOT</version>
          </parent>
          <modelVersion>4.0.0</modelVersion>
      
          <artifactId>cloud-provider-hystrix-payment8001</artifactId>
      
      
          <dependencies>
              <!--新增hystrix-->
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-netflix-hystrix</artifactId>
              </dependency>
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
              </dependency>
      
      
              <dependency>
                  <groupId>com.atguigu.springcloud</groupId>
                  <artifactId>cloud-api-commons</artifactId>
                  <version>${project.version}</version>
              </dependency>
      
      
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-web</artifactId>
              </dependency>
      
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-actuator</artifactId>
              </dependency>
      
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-devtools</artifactId>
                  <scope>runtime</scope>
                  <optional>true</optional>
              </dependency>
      
              <dependency>
                  <groupId>org.projectlombok</groupId>
                  <artifactId>lombok</artifactId>
                  <optional>true</optional>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-test</artifactId>
                  <scope>test</scope>
              </dependency>
          </dependencies>
      
      </project>
       
      
      ```

      

3. yml

   1. ```yml
      server:
        port: 8001
      
      
      eureka:
        client:
          register-with-eureka: true    #表识不向注册中心注册自己
          fetch-registry: true   #表示自己就是注册中心，职责是维护服务实例，并不需要去检索服务
          service-url:
            # defaultZone: http://eureka7002.com:7002/eureka/    #设置与eureka server交互的地址查询服务和注册服务都需要依赖这个地址
            defaultZone: http://eureka7001.com:7001/eureka/
      #  server:
      #    enable-self-preservation: false
      spring:
        application:
          name: cloud-provider-hystrix-payment
      #    eviction-interval-timer-in-ms: 2000
       
      
      ```

      

4. 主程序类

   1. ```java
      package com.atguigu.springcloud;
      
      import org.springframework.boot.SpringApplication;
      import org.springframework.boot.autoconfigure.SpringBootApplication;
      import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
      
      @SpringBootApplication
      @EnableEurekaClient
      public class PaymentHystrixMain8001 {
          public static void main(String[] args) {
              SpringApplication.run(PaymentHystrixMain8001.class,args);
          }
      }
       
       
      
      ```

      

5. 业务类Service：

   1. ```java
      package com.atguigu.springcloud.service;
      
      import org.springframework.stereotype.Service;
      
      import java.util.concurrent.TimeUnit;
      
      @Service
      public class PaymentService {
      
          //成功
          public String paymentInfo_OK(Integer id){
              return "线程池："+Thread.currentThread().getName()+"   paymentInfo_OK,id：  "+id+"\t"+"哈哈哈"  ;
          }
      
          //失败
          public String paymentInfo_TimeOut(Integer id){
              int timeNumber = 3;
              try { TimeUnit.SECONDS.sleep(timeNumber); }catch (Exception e) {e.printStackTrace();}
              return "线程池："+Thread.currentThread().getName()+"   paymentInfo_TimeOut,id：  "+id+"\t"+"呜呜呜"+" 耗时(秒)"+timeNumber;
          }
      
      }
       
      ```

      

6. controller

   1. ```java
      package com.atguigu.springcloud.controller;
      
      import com.atguigu.springcloud.service.PaymentService;
      import lombok.extern.slf4j.Slf4j;
      import org.springframework.beans.factory.annotation.Value;
      import org.springframework.web.bind.annotation.GetMapping;
      import org.springframework.web.bind.annotation.PathVariable;
      import org.springframework.web.bind.annotation.RestController;
      
      import javax.annotation.Resource;
      
      @RestController
      @Slf4j
      public class PaymentController {
      
          @Resource
          private PaymentService paymentService;
      
          @Value("${server.port}")
          private String serverPort;
      
          @GetMapping("/payment/hystrix/ok/{id}")
          public String paymentInfo_OK(@PathVariable("id") Integer id){
              String result = paymentService.paymentInfo_OK(id);
              log.info("*******result:"+result);
              return result;
          }
          @GetMapping("/payment/hystrix/timeout/{id}")
          public String paymentInfo_TimeOut(@PathVariable("id") Integer id){
              String result = paymentService.paymentInfo_TimeOut(id);
              log.info("*******result:"+result);
              return result;
          }
      }
       
       
      
      ```

7. 使用Jmeter 压力测试：

   开启Jmeter，来20000个并发压死8001，20000个请求都去访问paymentInfo_TimeOut服务

结果：

​	**在并发期间内，另一个未被大量并发的服务也访问延迟了**

### 2、服务降级配置

1. 在主启动类上 添加新注解@EnableCircuitBreaker
2. 服务降级：@HystrixCommand

```java
package com.atguigu.springcloud.service;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class PaymentService {

    //成功
    public String paymentInfo_OK(Integer id){
        return "线程池："+Thread.currentThread().getName()+"   paymentInfo_OK,id：  "+id+"\t"+"哈哈哈"  ;
    }

    //失败
  	//指定兜底方法
    @HystrixCommand(fallbackMethod = "paymentInfo_TimeOutHandler",commandProperties = {
            @HystrixProperty(name = "execution.isolation.thread.timeoutInMilliseconds",value = "3000")  //3秒钟以内就是正常的业务逻辑
    })
    public String paymentInfo_TimeOut(Integer id){
       // int timeNumber = 5;
        int age = 10/0;
       // try { TimeUnit.SECONDS.sleep(timeNumber); }catch (Exception e) {e.printStackTrace();}
        //return "线程池："+Thread.currentThread().getName()+"   paymentInfo_TimeOut,id：  "+id+"\t"+"呜呜呜"+" 耗时(秒)"+timeNumber;
        return "线程池："+Thread.currentThread().getName()+"   paymentInfo_TimeOut,id：  "+id+"\t"+"呜呜呜"+" 耗时(秒)";
    }

    //兜底方法
    public String paymentInfo_TimeOutHandler(Integer id){
        return "线程池："+Thread.currentThread().getName()+"   系统繁忙, 请稍候再试  ,id：  "+id+"\t"+"哭了哇呜";
    }

}
 
 

```

3. 消费方

   1. 也可以服务降级，更好的保护自己

   2. yml

      1. ```yml
         feign:
           hystrix:
             enabled: true 
         
         ```

      

   3. 主启动类：

      1. ```java
         @EnableHystrix
         ```

         

   4. controller：

      1. ```java
         @GetMapping("/consumer/payment/hystrix/timeout/{id}")
         @HystrixCommand(fallbackMethod = "paymentTimeOutFallbackMethod",commandProperties = {
                 @HystrixProperty(name = "execution.isolation.thread.timeoutInMilliseconds",value = "1500")  //3秒钟以内就是正常的业务逻辑
         })
         public String paymentInfo_TimeOut(@PathVariable("id") Integer id){
             String result = paymentHystrixService.paymentInfo_TimeOut(id);
             return result;
         }
         
         //兜底方法
         public String paymentTimeOutFallbackMethod(@PathVariable("id") Integer id){
             return "我是消费者80，对付支付系统繁忙请10秒钟后再试或者自己运行出错请检查自己,(┬＿┬)";
         }
          
         ```

   5. 异常、宕机、超时被解决（可能 待处理）

#### 出现的问题 代码膨胀

> ### 代码膨胀

每个业务方法对应一个兜底的方法，代码膨胀

统一和自定义的分开



解决办法：

* @DefaultProperties(defaultFallback = "")：指定被@HystrixCommand标注且没有value的方法

* 代码如下：

* ```java
  package com.atguigu.springcloud.controller;
  
  import com.atguigu.springcloud.service.PaymentHystrixService;
  import com.netflix.hystrix.contrib.javanica.annotation.DefaultProperties;
  import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
  import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;
  import lombok.extern.slf4j.Slf4j;
  import org.springframework.web.bind.annotation.GetMapping;
  import org.springframework.web.bind.annotation.PathVariable;
  import org.springframework.web.bind.annotation.RestController;
  
  import javax.annotation.Resource;
  
  @RestController
  @Slf4j
  @DefaultProperties(defaultFallback = "payment_Global_FallbackMethod")  //全局的
  public class OrderHystrixController {
  
      @Resource
      private PaymentHystrixService paymentHystrixService;
  
      @GetMapping("/consumer/payment/hystrix/ok/{id}")
      public String paymentInfo_OK(@PathVariable("id") Integer id){
          String result = paymentHystrixService.paymentInfo_OK(id);
          return result;
      }
  
  //    @GetMapping("/consumer/payment/hystrix/timeout/{id}")
  //    public String paymentInfo_TimeOut(@PathVariable("id") Integer id){
  //        String result = paymentHystrixService.paymentInfo_TimeOut(id);
  //        return result;
  //    }
  
      @GetMapping("/consumer/payment/hystrix/timeout/{id}")
  //    @HystrixCommand(fallbackMethod = "paymentTimeOutFallbackMethod",commandProperties = {
  //            @HystrixProperty(name = "execution.isolation.thread.timeoutInMilliseconds",value = "1500")  //1.5秒钟以内就是正常的业务逻辑
  //    })
      @HystrixCommand
      public String paymentInfo_TimeOut(@PathVariable("id") Integer id){
          int age = 10/0;
          String result = paymentHystrixService.paymentInfo_TimeOut(id);
          return result;
      }
  
      //兜底方法
      public String paymentTimeOutFallbackMethod(@PathVariable("id") Integer id){
          return "我是消费者80，对付支付系统繁忙请10秒钟后再试或者自己运行出错请检查自己,(┬＿┬)";
      }
  
      //下面是全局fallback方法
      public String payment_Global_FallbackMethod(){
          return "Global异常处理信息，请稍后再试,(┬＿┬)";
      }
  }
   
   
  
  ```

#### 出现的问题 业务混乱

> ### 业务混乱

定义一个类实现**PaymentHystrixService**接口，并在**PaymentHystrixService**接口的==@feignClient==的**fallback**属性指定放置fallback方法的类。

> 注意

新建cloud-consumer-feign-hystrix-order80

```java
package com.atguigu.springcloud.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Component
@FeignClient(value = "CLOUD-PROVIDER-HYSTRIX-PAYMENT",fallback = PaymentFallbackService.class)
public interface PaymentHystrixService {

    @GetMapping("/payment/hystrix/ok/{id}")
    public String paymentInfo_OK(@PathVariable("id") Integer id);

    @GetMapping("/payment/hystrix/timeout/{id}")
    public String paymentInfo_TimeOut(@PathVariable("id") Integer id);


}
 
```

```java
package com.atguigu.springcloud.service;

import org.springframework.stereotype.Component;

@Component
public class PaymentFallbackService implements PaymentHystrixService {
    
  	@Override
    public String paymentInfo_OK(Integer id) {
        return "-----PaymentFallbackService fall back-paymentInfo_OK , (┬＿┬)";
    }

    @Override
    public String paymentInfo_TimeOut(Integer id) {
        return "-----PaymentFallbackService fall back-paymentInfo_TimeOut , (┬＿┬)";
    }
}
 
 
 
```

```yml
feign:
  hystrix:
    enabled: true #如果处理自身的容错就开启。开启方式与生产端不一样。
```

### 3、服务熔断配置

1. 修改cloud-provider-hystrix-payment8001

2. 通过设置@HystrixProperty进行配置

![image-20220910222916255](Spring_Cloud.assets\image-20220910222916255.png)

```java
@HystrixCommand(fallbackMethod = "paymentCircuitBreaker_fallback",commandProperties = {
        @HystrixProperty(name = "circuitBreaker.enabled",value = "true"),  //是否开启断路器
        @HystrixProperty(name = "circuitBreaker.requestVolumeThreshold",value = "10"),   //请求次数 （超过的话好像按失败处理 待处理）
        @HystrixProperty(name = "circuitBreaker.sleepWindowInMilliseconds",value = "10000"),  //时间范围
        @HystrixProperty(name = "circuitBreaker.errorThresholdPercentage",value = "60"), //失败率达到多少后跳闸
})
public String paymentCircuitBreaker(@PathVariable("id") Integer id){
    if (id < 0){
        throw new RuntimeException("*****id 不能负数");
    }
    String serialNumber = IdUtil.simpleUUID();

    return Thread.currentThread().getName()+"\t"+"调用成功,流水号："+serialNumber;
}
public String paymentCircuitBreaker_fallback(@PathVariable("id") Integer id){
    return "id 不能负数，请稍候再试,(┬＿┬)/~~     id: " +id;
}
 
```

@HystrixProperty属性值

```properties
hystrix.command.default和hystrix.threadpool.default中的default为默认CommandKey

Command Properties
Execution相关的属性的配置：
hystrix.command.default.execution.isolation.strategy 隔离策略，默认是Thread, 可选Thread｜Semaphore

hystrix.command.default.execution.isolation.thread.timeoutInMilliseconds 命令执行超时时间，默认1000ms

hystrix.command.default.execution.timeout.enabled 执行是否启用超时，默认启用true
hystrix.command.default.execution.isolation.thread.interruptOnTimeout 发生超时是是否中断，默认true
hystrix.command.default.execution.isolation.semaphore.maxConcurrentRequests 最大并发请求数，默认10，该参数当使用ExecutionIsolationStrategy.SEMAPHORE策略时才有效。如果达到最大并发请求数，请求会被拒绝。理论上选择semaphore size的原则和选择thread size一致，但选用semaphore时每次执行的单元要比较小且执行速度快（ms级别），否则的话应该用thread。
semaphore应该占整个容器（tomcat）的线程池的一小部分。
Fallback相关的属性
这些参数可以应用于Hystrix的THREAD和SEMAPHORE策略

hystrix.command.default.fallback.isolation.semaphore.maxConcurrentRequests 如果并发数达到该设置值，请求会被拒绝和抛出异常并且fallback不会被调用。默认10
hystrix.command.default.fallback.enabled 当执行失败或者请求被拒绝，是否会尝试调用hystrixCommand.getFallback() 。默认true
Circuit Breaker相关的属性
hystrix.command.default.circuitBreaker.enabled 用来跟踪circuit的健康性，如果未达标则让request短路。默认true
hystrix.command.default.circuitBreaker.requestVolumeThreshold 一个rolling window内最小的请求数。如果设为20，那么当一个rolling window的时间内（比如说1个rolling window是10秒）收到19个请求，即使19个请求都失败，也不会触发circuit break。默认20
hystrix.command.default.circuitBreaker.sleepWindowInMilliseconds 触发短路的时间值，当该值设为5000时，则当触发circuit break后的5000毫秒内都会拒绝request，也就是5000毫秒后才会关闭circuit。默认5000
hystrix.command.default.circuitBreaker.errorThresholdPercentage错误比率阀值，如果错误率>=该值，circuit会被打开，并短路所有请求触发fallback。默认50
hystrix.command.default.circuitBreaker.forceOpen 强制打开熔断器，如果打开这个开关，那么拒绝所有request，默认false
hystrix.command.default.circuitBreaker.forceClosed 强制关闭熔断器 如果这个开关打开，circuit将一直关闭且忽略circuitBreaker.errorThresholdPercentage
Metrics相关参数
hystrix.command.default.metrics.rollingStats.timeInMilliseconds 设置统计的时间窗口值的，毫秒值，circuit break 的打开会根据1个rolling window的统计来计算。若rolling window被设为10000毫秒，则rolling window会被分成n个buckets，每个bucket包含success，failure，timeout，rejection的次数的统计信息。默认10000
hystrix.command.default.metrics.rollingStats.numBuckets 设置一个rolling window被划分的数量，若numBuckets＝10，rolling window＝10000，那么一个bucket的时间即1秒。必须符合rolling window % numberBuckets == 0。默认10
hystrix.command.default.metrics.rollingPercentile.enabled 执行时是否enable指标的计算和跟踪，默认true
hystrix.command.default.metrics.rollingPercentile.timeInMilliseconds 设置rolling percentile window的时间，默认60000
hystrix.command.default.metrics.rollingPercentile.numBuckets 设置rolling percentile window的numberBuckets。逻辑同上。默认6
hystrix.command.default.metrics.rollingPercentile.bucketSize 如果bucket size＝100，window＝10s，若这10s里有500次执行，只有最后100次执行会被统计到bucket里去。增加该值会增加内存开销以及排序的开销。默认100
hystrix.command.default.metrics.healthSnapshot.intervalInMilliseconds 记录health 快照（用来统计成功和错误绿）的间隔，默认500ms
Request Context 相关参数
hystrix.command.default.requestCache.enabled 默认true，需要重载getCacheKey()，返回null时不缓存
hystrix.command.default.requestLog.enabled 记录日志到HystrixRequestLog，默认true

Collapser Properties 相关参数
hystrix.collapser.default.maxRequestsInBatch 单次批处理的最大请求数，达到该数量触发批处理，默认Integer.MAX_VALUE
hystrix.collapser.default.timerDelayInMilliseconds 触发批处理的延迟，也可以为创建批处理的时间＋该值，默认10
hystrix.collapser.default.requestCache.enabled 是否对HystrixCollapser.execute() and HystrixCollapser.queue()的cache，默认true

ThreadPool 相关参数
线程数默认值10适用于大部分情况（有时可以设置得更小），如果需要设置得更大，那有个基本得公式可以follow：
requests per second at peak when healthy × 99th percentile latency in seconds + some breathing room
每秒最大支撑的请求数 (99%平均响应时间 + 缓存值)
比如：每秒能处理1000个请求，99%的请求响应时间是60ms，那么公式是：
（0.060+0.012）

基本得原则时保持线程池尽可能小，他主要是为了释放压力，防止资源被阻塞。
当一切都是正常的时候，线程池一般仅会有1到2个线程激活来提供服务

hystrix.threadpool.default.coreSize 并发执行的最大线程数，默认10
hystrix.threadpool.default.maxQueueSize BlockingQueue的最大队列数，当设为－1，会使用SynchronousQueue，值为正时使用LinkedBlcokingQueue。该设置只会在初始化时有效，之后不能修改threadpool的queue size，除非reinitialising thread executor。默认－1。
hystrix.threadpool.default.queueSizeRejectionThreshold 即使maxQueueSize没有达到，达到queueSizeRejectionThreshold该值后，请求也会被拒绝。因为maxQueueSize不能被动态修改，这个参数将允许我们动态设置该值。if maxQueueSize == -1，该字段将不起作用
hystrix.threadpool.default.keepAliveTimeMinutes 如果corePoolSize和maxPoolSize设成一样（默认实现）该设置无效。如果通过plugin（https://github.com/Netflix/Hystrix/wiki/Plugins）使用自定义实现，该设置才有用，默认1.
hystrix.threadpool.default.metrics.rollingStats.timeInMilliseconds 线程池统计指标的时间，默认10000
hystrix.threadpool.default.metrics.rollingStats.numBuckets 将rolling window划分为n个buckets，默认10

```

结果：

​	看原理

### 4、服务监控hystrixDashboard

监控Hystrix发起的请求的执行信息的可视化界面。

步骤：

1. 新建cloud-consumer-hystrix-dashboard9001

2. ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
       <parent>
           <artifactId>cloud2020</artifactId>
           <groupId>com.atguigu.springcloud</groupId>
           <version>1.0-SNAPSHOT</version>
       </parent>
       <modelVersion>4.0.0</modelVersion>
   
       <artifactId>cloud-consumer-hystrix-dashboard9001</artifactId>
   
   
       <dependencies>
           <!--新增hystrix dashboard-->
           <dependency>
               <groupId>org.springframework.cloud</groupId>
               <artifactId>spring-cloud-starter-netflix-hystrix-dashboard</artifactId>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-actuator</artifactId>
           </dependency>
   
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-devtools</artifactId>
               <scope>runtime</scope>
               <optional>true</optional>
           </dependency>
   
           <dependency>
               <groupId>org.projectlombok</groupId>
               <artifactId>lombok</artifactId>
               <optional>true</optional>
           </dependency>
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-test</artifactId>
               <scope>test</scope>
           </dependency>
       </dependencies>
   
   </project>
    
   
   ```

3. ```yml
   server:
     port: 9001
   ```

4. 主启动 @EnableHystrixDashboard

   1. ```java
      package com.atguigu.springcloud;
      
      import org.springframework.boot.SpringApplication;
      import org.springframework.boot.autoconfigure.SpringBootApplication;
      import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
      
      @SpringBootApplication
      @EnableHystrixDashboard
      public class HystrixDashboardMain9001 {
          public static void main(String[] args) {
              SpringApplication.run(HystrixDashboardMain9001.class,args);
          }
      }
       
       
      
      ```

5. 被监控的微服务方 pom

   1. ```xml
      <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-actuator</artifactId>
      </dependency>
      ```

6. 访问 http://localhost:9001/hystrix

> 问题 Unable to connect to Command Metric Stream 或 404

主启动类中加入：

```java
 
@Bean
public ServletRegistrationBean getServlet(){
    HystrixMetricsStreamServlet streamServlet = new HystrixMetricsStreamServlet();
    ServletRegistrationBean registrationBean = new ServletRegistrationBean(streamServlet);
    registrationBean.setLoadOnStartup(1);
    registrationBean.addUrlMappings("/hystrix.stream");
    registrationBean.setName("HystrixMetricsStreamServlet");
    return registrationBean;
}
 

```

![image-20220910230054788](Spring_Cloud.assets\image-20220910230054788.png)

# 六、网关

## 1、 Zuul

https://github.com/Netflix/zuul/wiki

## 2、gateway

属于 springcloud

https://cloud.spring.io/spring-cloud-static/spring-cloud-gateway/2.2.1.RELEASE/reference/html/

> 是什么

​	该项目提供了一个构建在Spring生态系统之上的API网关，包括:Spring 5、Spring Boot 2和project Reactor。Spring Cloud Gateway旨在提供一种简单而有效的方法来路由到api，并向它们提供横切关注点，例如:安全性、监视/度量和弹性。

> 一句话

Spring Cloud Gateway 使用的Webflux中的reactor-netty响应式编程组件，底层使用了Netty通讯框架

> 能干嘛

* 反向代理
* 鉴权
* 流量控制
* 熔断
* 日志监控

> 微服务网关位置

![image-20220913205700048](Spring_Cloud.assets\image-20220913205700048.png)

> 为什么选择gateway？

* 1.neflix不太靠谱，zuul2.0一直跳票,迟迟不发布

* 2.SpringCloud Gateway具有如下特性
  * 动态路由（匹配任何请求属性）
  * 可以对路由指定Predicate（断言）和Filter（过滤器）
  * 集成Hystrix的断路器功能
  * 集成Spring Cloud 服务发现功能
  * 易于编写的Predicate（断言）和Filter（过滤器）
  * 请求限流功能
  * 支持路径重写
* 3.SpringCloud Gateway与Zuul的区别
  * 1、 Zuul 1.x 是阻塞I/O，不支持长连接（如WebSocket），Zuul的设计模式和Nginx较像，每次I/O操作都是从工作线程中选择一个执行，请求线程被阻塞到工作线程完成，但是差别是Nginx 用C++实现，Zuul用Java实现，而JVM本身会有第一次加载较慢的情况，使得Zuul的性能相对较差
  * 2、 Zuul 2.x 理念更先进，像基于Netty非阻塞和支持长连接，但SpringCloud目前还没有整合。Zuul 2.x的性能较Zuul 1.x 有较大提升。在性能方面，根据官方提供的基准测试，Spring Cloud Gateway 的RPS（每秒请求数） 是Zuul的1.6倍。
  * 3、Spring Cloud Gateway 建立 在 Spring Framework 5、PRoject Reactor 和Spring Boot 2 之上，使用非阻塞API
  * 4、 Spring Cloud Gateway 还支持 WebSocket，并且与Spring紧密集成拥有更好的开发体验

### 1、 组成：路由 断言 过滤

* Route：
  * 路由是构建网关的基本模块，它由ID，目标URL，一系列的断言和过滤器组成，如果断言为true则匹配该路由
* Predicate
  * 参考的是java8的java.util.function.Predicate开发人员可以匹配HTTP请求中的所有内容，如果请求与断言相匹配则进行路由
* Filter
  * 指的是Spring框架中GatewayFilter的实力，使用锅炉其，可以在请求被路由前或者之后对请求进行修改。

### 2、工作流程

执行过滤链、断言、路由转发

### 3、步骤

1. 新建 cloud-gateway-gateway9527

2. pom

   1.  

      ```xml
      <?xml version="1.0" encoding="UTF-8"?>
      <project xmlns="http://maven.apache.org/POM/4.0.0"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
          <parent>
              <artifactId>cloud2020</artifactId>
              <groupId>com.atguigu.springcloud</groupId>
              <version>1.0-SNAPSHOT</version>
          </parent>
          <modelVersion>4.0.0</modelVersion>
      
          <artifactId>cloud-gateway-gateway9527</artifactId>
      
      
          <dependencies>
              <!--新增gateway-->
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-gateway</artifactId>
              </dependency>
              <dependency>
                  <groupId>com.atguigu.springcloud</groupId>
                  <artifactId>cloud-api-commons</artifactId>
                  <version>1.0-SNAPSHOT</version>
              </dependency>
              
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-netflix-hystrix</artifactId>
              </dependency>
              <dependency>
                  <groupId>org.springframework.cloud</groupId>
                  <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
              </dependency>
      
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-devtools</artifactId>
                  <scope>runtime</scope>
                  <optional>true</optional>
              </dependency>
      
              <dependency>
                  <groupId>org.projectlombok</groupId>
                  <artifactId>lombok</artifactId>
                  <optional>true</optional>
              </dependency>
              <dependency>
                  <groupId>org.springframework.boot</groupId>
                  <artifactId>spring-boot-starter-test</artifactId>
                  <scope>test</scope>
              </dependency>
      
      
      
          </dependencies>
      
      
      </project>
       
      
      ```

3. yml

   1. ```yml
      server:
        port: 9527
      spring:
        application:
          name: cloud-gateway
        cloud:
          gateway:
            routes:
              - id: payment_routh #路由的ID，没有固定规则但要求唯一，建议配合服务名
                uri: http://localhost:8001   #匹配后提供服务的路由地址
                predicates:
                  - Path=/payment/get/**   #断言,路径相匹配的进行路由
      
              - id: payment_routh2
                uri: http://localhost:8001
                predicates:
                  - Path=/payment/lb/**   #断言,路径相匹配的进行路由
      
      
      eureka:
        instance:
          hostname: cloud-gateway-service
        client:
          service-url:
            register-with-eureka: true
            fetch-registry: true
            defaultZone: http://eureka7001.com:7001/eureka
       
       
      
      ```

       

4.  主启动类

   1. ```java
      package com.atguigu.springcloud;
      
      
      import org.springframework.boot.SpringApplication;
      import org.springframework.boot.autoconfigure.SpringBootApplication;
      import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
      
      @SpringBootApplication
      @EnableEurekaClient
      public class GateWayMain9527 {
          public static void main(String[] args) {
                  SpringApplication.run( GateWayMain9527.class,args);
              }
      }
       
      ```

      

5.  测试

### 4、路由与代码方式配置

在gateway中配置<font color='red'>id</font> 通常为服务名

在gateway中配置**uri**配置有三种方式，包括

* 第一种：<font color='orange'>ws</font>(websocket)方式: `uri: ws://localhost:9000`
* 第二种：<font color='orange'>http</font>方式:  `uri: http://localhost:8130/`
* 第三种：<font color='orange'>lb</font>(注册中心中服务名字)方式: `uri: lb://brilliance-consumer`

代码配置如下：

```java

package com.atguigu.springcloud.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GateWayConfig {

    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder routeLocatorBuilder) {
        RouteLocatorBuilder.Builder routes = routeLocatorBuilder.routes();
        routes.route("path_rote_atguigu", r -> r.path("/guonei").uri("http://news.baidu.com/guonei")).build();
        return routes.build();
    }
}
```

### 5、断言

类似条件是否满足，断言可能很多去官网看吧

```yml
server:
  port: 9527
spring:
  application:
    name: cloud-gateway
  cloud:
    gateway:
      discovery:
        locator:
          enabled: true  #开启从注册中心动态创建路由的功能，利用微服务名进行路由
      routes:
        - id: payment_routh #路由的ID，没有固定规则但要求唯一，建议配合服务名
          #uri: http://localhost:8001   #匹配后提供服务的路由地址
          uri: lb://cloud-payment-service
          predicates:
            - Path=/payment/get/**   #断言,路径相匹配的进行路由
 
        - id: payment_routh2
          #uri: http://localhost:8001   #匹配后提供服务的路由地址
          uri: lb://cloud-payment-service
          predicates:
            - Path=/payment/lb/**   #断言,路径相匹配的进行路由
            #- After=2020-03-08T10:59:34.102+08:00[Asia/Shanghai]
            #- Cookie=username,zhangshuai #并且Cookie是username=zhangshuai才能访问
            #- Header=X-Request-Id, \d+ #请求头中要有X-Request-Id属性并且值为整数的正则表达式
            #- Host=**.atguigu.com
            #- Method=GET
            #- Query=username, \d+ #要有参数名称并且是正整数才能路由
 
 
eureka:
  instance:
    hostname: cloud-gateway-service
  client:
    service-url:
      register-with-eureka: true
      fetch-registry: true
      defaultZone: http://eureka7001.com:7001/eureka
 
 

```

### 6、Filter与代码方式配置



和Java EE的 Filter 一样。

周期：Only Two：pre and post

种类：GatewayFilter and GlobalFilter

作用：

*  全局日志记录
*  同一网关鉴权
*  。。。

还有很多拦截器不一 一列举 

```yml
 filters:
 			  - AddRequestParameter=X-Request-Id,1023 #过滤器工厂会在匹配的请求头加上一堆请求头，名称为X-Request-Id值为1023
 
```

代码方式配置 

```java
package com.atguigu.springcloud.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Date;

@Component
@Slf4j
//全局过滤
public class MyLogGateWayFilter implements GlobalFilter,Ordered {
		//这算是pre方法，post方法好像是run方法 具体看官网
  	
  	@Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        log.info("*********come in MyLogGateWayFilter: "+new Date());
        String uname = exchange.getRequest().getQueryParams().getFirst("username");
        if(StringUtils.isEmpty(username)){
            log.info("*****用户名为Null 非法用户,(┬＿┬)");
            exchange.getResponse().setStatusCode(HttpStatus.NOT_ACCEPTABLE);//给人家一个回应
            return exchange.getResponse().setComplete();
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
 
 
```

实现种类、方法很多，具体看官网
