# Spring Cloud

# 一、入门

1、背景

## 2、概述

### 2.1、微服务架构概述

> ### 什么是微服务？

​	微服务架构是一种架构模式，它提倡将单一应用程序划分成一组小的服务，服务之间相互协调、互相配合，为用户提供最终价值。每个服务运行在其独立的进程中，服务和服务之间采用轻量级的通信机制相互沟通（通常是基于HTTP的Restful API).每个服务都围绕着具体的业务进行构建，并且能够被独立的部署到生产环境、类生产环境等。另外，应尽量避免统一的、集中的服务管理机制，对具体的一个服务而言，应根据业务上下文，选择合适的语言、工具对其进行构"  ---- Martin Flower

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

Consul（看少）：替代方案2 Golang语言写的

Nacos（耐扣死）：强烈推荐。 阿里巴巴（百万级）

#### 服务调用

Ribbon（率本）

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



# 二、Eureka 服务治理

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
      #
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



# 三、其他版本 服务治理

## 1、Zookeeper



