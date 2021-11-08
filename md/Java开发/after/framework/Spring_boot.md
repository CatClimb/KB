# Spring Boot

==**spring-boot-starter-parent**==是一个特殊的启动器，提供有用的 Maven 默认值。 它还提供了一个 dependency-management部分，以便您可以省略 version“祝福”依赖的标签。 



 `@EnableAutoConfiguration`。此注解告知 Spring Boot 根据您添加的 jar 依赖来“猜测”您想如何配置 Spring 并进行自动配置，由于 ==**spring-boot-starter-web**== 添加了 Tomcat 和 Spring MVC，auto-configuration（自动配置）将假定您要开发 web 应用并相应设置了 Spring。



main 方法通过调用 `run` 来委托 Spring Boot 的 `SpringApplication` 类，`SpringApplication` 类将引导我们的应用，启动 Spring，然后启动自动配置的 Tomcat web 服务器。我们需要将 `Example.class`  作为一个参数传递给 `run` 方法来告知 `SpringApplication`，它是 Spring 主组件。

要创建一个可执行的 jar，我们需要添加 ==**spring-boot-maven-plugin**==给我们的 `pom.xml`. 为此，请在下方插入以下几行 `dependencies`部分： 



 `mvn package`   生成可执行jar命令

 `mvn spring-boot:run`

```java
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>myproject</artifactId>
    <version>0.0.1-SNAPSHOT</version>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.5.4</version>
    </parent>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    </dependencies>
    <!-- Additional lines to be added here... -->
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
```







材料清单

https://github.com/spring-projects/spring-boot/blob/v2.0.0.RELEASE/spring-boot-project/spring-boot-dependencies/pom.xml

## 配置类

但我们通常建议主配置源为 `@Configuration` 类

## 自动配置

您需要通过将 `@EnableAutoConfiguration` 或者 `@SpringBootApplication` 注解添加到其中一个 `@Configuration` 类之上以启用自动配置。



@SpringBootApplication` 注解相当于使用 `@Configuration`、`@EnableAutoConfiguration` 和 `@ComponentScan







# Spring Boot2

SpringBoot是整合Spring技术栈的一站式框架。

SpringBoot是简化Spring技术栈的快速开发脚手架

用来组装spring生态圈或整合技术栈，简化配置。能快速创建出生产级别的Spring应用。并引入了两套方案Reactive Stack 、Servlet Stack。

## 一、Spring Boot概述

## 1.1 Spring Boot 特点

人称版本帝，迭代快，需要时刻关注变化，社区活跃，bug少

### 1.1.1Spring Boot优点

* 创建独立的Spring应用
* 内嵌web服务器 
  * Tomcat letty or Undertow
* 自动starter依赖，简化构建配置
  * 如web场景（web starter）
* 自动配置Spring以及第三方功能
  * 简化配置
* 提供生产级别的监控、健康检查及外部化配置
* 无代码生成、无需编写XML
  * 基于自动配置

### 1.1.2 SpringBoot缺点

- 封装太深，内部原理复杂，不容易精通

## 1.2 时代应用背景

1.2.1 微服务

1.2.2 分布式

1.2.3 云原生

