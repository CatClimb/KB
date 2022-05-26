

# Mybatis-Plus



# 一、Mybatis-Plus简介



[MyBatis-Plus (opens new window)](https://github.com/baomidou/mybatis-plus)（简称 MP）是一个 [MyBatis (opens new window)](https://www.mybatis.org/mybatis-3/)的增强工具，在 MyBatis 的基础上**只做增强不做改变**，为简化开发、提高效率而生。

## 1.简介 2.特性  3.支持数据库 4.框架结构 5.代码文档地址

[官网简介。]([简介 | MyBatis-Plus](https://www.mybatis-plus.com/guide/#特性))



# 二、入门案例

## 1.开发环境

IDE：idea 2021.3.2

JDK：JDK8+ 

构建工具：maven3.5.4 

MySQL版本：MySQL 8.0.26

Spring Boot：2.6.3 MyBatis-Plus：3.5.1

## 2.创建数据库及表

sql代码如下：

```sql
-- 创建数据库
create database mybatis_plus-test;
use mybatis_plus-test;
-- 创建表
CREATE DATABASE `mybatis_plus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
use `mybatis_plus`;
CREATE TABLE `user` (
`id` bigint(20) NOT NULL COMMENT '主键ID',
`name` varchar(30) DEFAULT NULL COMMENT '姓名',
`age` int(11) DEFAULT NULL COMMENT '年龄',
`email` varchar(50) DEFAULT NULL COMMENT '邮箱',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 添加数据
INSERT INTO user (id, name, age, email) VALUES
(1, 'Jone', 18, 'test1@baomidou.com'),
(2, 'Jack', 20, 'test2@baomidou.com'),
(3, 'Tom', 28, 'test3@baomidou.com'),
(4, 'Sandy', 21, 'test4@baomidou.com'),
(5, 'Billie', 24, 'test5@baomidou.com');
```

## 3.Spring Boot 搭建

使用 Spring Initializr 快速初始化一个 Spring Boot 工程

![image-20220520181003050](MyBatis-Plus.assets\image-20220520181003050.png)

![image-20220520214746893](MyBatis-Plus.assets\image-20220520214746893.png)

### a 相关依赖

如何操作？在Mybatis的子项目中找操作文档。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.0</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.example</groupId>
    <artifactId>mybatis_plus_test</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>mybatis_plus_test</name>
    <description>mybatis_plus_test</description>
    <properties>
        <java.version>1.8</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>com.baomidou</groupId>
            <artifactId>mybatis-plus-boot-starter</artifactId>
            <version>3.5.1</version>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>

    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <excludes>
                        <exclude>
                            <groupId>org.projectlombok</groupId>
                            <artifactId>lombok</artifactId>
                        </exclude>
                    </excludes>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>

```

### b 配置application.yml

配置数据源，配置mybatis日志

```yml
#数据源
spring:
  datasource:
    type:  com.zaxxer.hikari.HikariDataSource
    url: jdbc:mysql://localhost:3306/mybatis_plus?TimeZone=&characterEncoding=utf8&useSSL=false
    username: root
    password: 123456
    driver-class-name: com.mysql.cj.jdbc.Driver
#输出日志
mybatis-plus:
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl

```



### c 启动类Mapper扫描

```java
package com.example.mybatis_plus_test;

import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.mybatis_plus_test.mapper")
public class MybatisPlusTestApplication {

    public static void main(String[] args) {
        SpringApplication.run(MybatisPlusTestApplication.class, args);
    }

}

```

### d 实体类及mapper接口编写

**实体类**

```java
package com.example.mybatis_plus_test.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
  	
    private Long id;
    private String name;
    private Integer age;
    private String email;

}

```

> 注意
>
> id为Long是由于[雪花算法]()待处理



**mapper接口**

```java
package com.example.mybatis_plus_test.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.mybatis_plus_test.pojo.User;

public interface UserMapper extends BaseMapper<User> {
}

```

**UserService接口**

```java

```



测试结果：

```java
@SpringBootTest
public class UserMapperTest {
    @Autowired
    public UserMapper userMapper;
    @Test
    public void testCURD(){
        List<User> users = userMapper.selectList(null);
        users.forEach(System.out::println);

    }
}

控制台信息：
  
Creating a new SqlSession
SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@5fbdc49b] was not registered for synchronization because synchronization is not active
2022-05-20 23:48:28.307  INFO 8920 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2022-05-20 23:48:28.639  INFO 8920 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
JDBC Connection [HikariProxyConnection@439078230 wrapping com.mysql.cj.jdbc.ConnectionImpl@68d7a2df] will not be managed by Spring
==>  Preparing: SELECT id,name,age,email FROM user
==> Parameters: 
<==    Columns: id, name, age, email
<==        Row: 1, Jone, 18, test1@baomidou.com
<==        Row: 2, Jack, 20, test2@baomidou.com
<==        Row: 3, Tom, 28, test3@baomidou.com
<==        Row: 4, Sandy, 21, test4@baomidou.com
<==        Row: 5, Billie, 24, test5@baomidou.com
<==      Total: 5
Closing non transactional SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@5fbdc49b]
User(id=1, name=Jone, age=18, email=test1@baomidou.com)
User(id=2, name=Jack, age=20, email=test2@baomidou.com)
User(id=3, name=Tom, age=28, email=test3@baomidou.com)
User(id=4, name=Sandy, age=21, email=test4@baomidou.com)
User(id=5, name=Billie, age=24, email=test5@baomidou.com)
```



# 三、基本CRUD

## 1.Mapper CRUD 接口（BaseMapper）

Mybatis-Plus已实现了BaseMapper接口中的CRUD的方法，直接使用即可。

> 说明:
>
> - 通用 CRUD 封装[BaseMapper (opens new window)](https://gitee.com/baomidou/mybatis-plus/blob/3.0/mybatis-plus-core/src/main/java/com/baomidou/mybatisplus/core/mapper/BaseMapper.java)接口，为 `Mybatis-Plus` 启动时自动解析实体表关系映射转换为 `Mybatis` 内部对象注入容器
> - 泛型 `T` 为任意实体对象
> - 参数 `Serializable` 为任意类型主键 `Mybatis-Plus` 不推荐使用复合主键约定每一张表都有自己的唯一 `id` 主键
> - 对象 `Wrapper` 为 [条件构造器](https://www.mybatis-plus.com/guide/wrapper.html)

```java
package com.example.mybatis_plus_test.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.mybatis_plus_test.pojo.User;

public interface UserMapper extends BaseMapper<User> {

}

```

### a 已经实现的CRUD

#### Insert

**接口：**

```java
// 插入一条记录
int insert(T entity);
```

测试：

```java
    @Test
    public void testC(){
        //插入只有一个方法
        User user = new User();
        user.setAge(18);
        user.setEmail("1104432863@qq.com");
        user.setName("Tom");
        int insert = userMapper.insert(user);
    }

Creating a new SqlSession
SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@62db0521] was not registered for synchronization because synchronization is not active
2022-05-21 00:19:16.461  INFO 12580 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2022-05-21 00:19:16.682  INFO 12580 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
JDBC Connection [HikariProxyConnection@1260390769 wrapping com.mysql.cj.jdbc.ConnectionImpl@1a2bcd56] will not be managed by Spring
==>  Preparing: INSERT INTO user ( id, name, age, email ) VALUES ( ?, ?, ?, ? )
==> Parameters: 1527685397552865281(Long), Tom(String), 18(Integer), 1104432863@qq.com(String)
<==    Updates: 1
Closing non transactional SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@62db0521]
```

#### Delete

**接口：**

```java
// 根据 entity 条件，删除记录
int delete(@Param(Constants.WRAPPER) Wrapper<T> wrapper);
// 删除（根据ID 批量删除）
int deleteBatchIds(@Param(Constants.COLLECTION) Collection<? extends Serializable> idList);
// 根据 ID 删除
int deleteById(Serializable id);
// 根据 columnMap 条件，删除记录
int deleteByMap(@Param(Constants.COLUMN_MAP) Map<String, Object> columnMap);
```

#### Update

**接口：**

```java
// 根据 whereWrapper 条件，更新记录
int update(@Param(Constants.ENTITY) T updateEntity, @Param(Constants.WRAPPER) Wrapper<T> whereWrapper);
// 根据 ID 修改
int updateById(@Param(Constants.ENTITY) T entity);
```

#### Select

**接口：**

```java
// 根据 ID 查询
T selectById(Serializable id);
// 根据 entity 条件，查询一条记录
T selectOne(@Param(Constants.WRAPPER) Wrapper<T> queryWrapper);

// 查询（根据ID 批量查询）
List<T> selectBatchIds(@Param(Constants.COLLECTION) Collection<? extends Serializable> idList);
// 根据 entity 条件，查询全部记录
List<T> selectList(@Param(Constants.WRAPPER) Wrapper<T> queryWrapper);
// 查询（根据 columnMap 条件）
List<T> selectByMap(@Param(Constants.COLUMN_MAP) Map<String, Object> columnMap);
// 根据 Wrapper 条件，查询全部记录
List<Map<String, Object>> selectMaps(@Param(Constants.WRAPPER) Wrapper<T> queryWrapper);
// 根据 Wrapper 条件，查询全部记录。注意： 只返回第一个字段的值
List<Object> selectObjs(@Param(Constants.WRAPPER) Wrapper<T> queryWrapper);

// 根据 entity 条件，查询全部记录（并翻页）
IPage<T> selectPage(IPage<T> page, @Param(Constants.WRAPPER) Wrapper<T> queryWrapper);
// 根据 Wrapper 条件，查询全部记录（并翻页）
IPage<Map<String, Object>> selectMapsPage(IPage<T> page, @Param(Constants.WRAPPER) Wrapper<T> queryWrapper);
// 根据 Wrapper 条件，查询总记录数
Integer selectCount(@Param(Constants.WRAPPER) Wrapper<T> queryWrapper);
```







## 2.Service CRUD 接口 （IService ServiceImpl）

> - 通用 Service CRUD 封装[IService (opens new window)](https://gitee.com/baomidou/mybatis-plus/blob/3.0/mybatis-plus-extension/src/main/java/com/baomidou/mybatisplus/extension/service/IService.java)接口，进一步封装 CRUD 采用 `get 查询单行` `remove 删除` `list 查询集合` `page 分页` 前缀命名方式区分 `Mapper` 层避免混淆，
> - 泛型 `T` 为任意实体对象
> - 建议如果存在自定义通用 Service 方法的可能，请创建**自己的** `IBaseService` 继承 `Mybatis-Plus` 提供的基类
> - 对象 `Wrapper` 为 [条件构造器](https://www.mybatis-plus.com/guide/wrapper.html)

```java
package com.example.mybatis_plus_test.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.mybatis_plus_test.pojo.User;

public interface UserService extends IService<User> {
}

```

```java
package com.example.mybatis_plus_test.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mybatis_plus_test.mapper.UserMapper;
import com.example.mybatis_plus_test.pojo.User;
import com.example.mybatis_plus_test.service.UserService;

public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService{
}

```

# 四、常用注解

**以下注解遵循 实体类的驼峰命名（包括大小驼峰）转为下划线命名的规则。（下文规则说的是这里的规则）**

## 1、@TableName



目的：保证实体类名与数据库中表名一致，或规则命名符合。（这里规则说的是上文规则）

解决方式：

1. 按照规则命名就行，不需要注解。

2. 通过设置实体类注解@tableName的value为表名

   ```java
   @Data
   @NoArgsConstructor
   @AllArgsConstructor
   @TableName("th_user")
   public class User {
       private Long id;
       private String name;
       private Integer age;
       private String email;
   
   }
   TestResult：
     SELECT id,name,age,email FROM th_user
   ```

   

3. 通过设置全局配置

   ```yml
   mybatis-plus:
     global-config:
       db-config:
         table-prefix: th_
         
         
     TestResult：
     SELECT id,name,age,email FROM th_user
   ```

## 2、@TableId

MyBatis-Plus在实现CRUD时，会==默认==将<font color='green'>实体属性名id</font>作为主键列，并在插入数据时，`默认`==基于雪花算法的策略生成id==

目的：保证实体属性字段与主键字段一致，或规则命名符合。（这里规则说的是上文规则）

解决方式：

1. 按照规则命名就行，不需要注解
   2. 通过在实体主键属性设置注解@TableId的value值为主键字段名

### a @TableId的Type属性

```java
@Getter
public enum IdType {
    /**
     * 数据库ID自增
     * <p>该类型请确保数据库设置了 ID自增 否则无效</p>
     */
    AUTO(0),
    /**
     * 该类型为未设置主键类型(注解里等于跟随全局,全局默认 ASSIGN_ID)
     */
    NONE(1),
    /**
     * 用户输入ID
     * <p>该类型可以通过自己注册自动填充插件进行填充</p>
     */
    INPUT(2),

    /* 以下3种类型、只有当插入对象ID 为空，才自动填充。 */
    /**
     * 分配ID (主键类型为number或string）,
     * 默认实现类 {@link com.baomidou.mybatisplus.core.incrementer.DefaultIdentifierGenerator}(雪花算法)
     *
     * @since 3.3.0
     */
    ASSIGN_ID(3),
    /**
     * 分配UUID (主键类型为 string)
     * 默认实现类 {@link com.baomidou.mybatisplus.core.incrementer.DefaultIdentifierGenerator}(UUID.replace("-",""))
     */
    ASSIGN_UUID(4);

    private final int key;

    IdType(int key) {
        this.key = key;
    }
}

```

### b 雪花算法

> #### 背景

需要选择合适的方案去应对数据规模的增长，以应对主键增长的访问压力和数据量。

数据库的扩展方式主要包括：业务分库、主从复制，数据库分表。

> #### 数据库分表

单表数据拆分有两种方式：垂直分表和水平分表。示意图如下：

![image-20220526231934501](MyBatis-Plus.assets\image-20220526231934501.png)

1. ##### 垂直分表

垂直分表适合将表中某些不常用且占了大量空间的列拆出去。

1. ##### 水平分表

水平分表适合行数特别大的表，有的公司要求单表行数超过5000万九必须进行分表，这个数字可以作为参考，但并不是绝对标准，关键还是要看表的访问性能。对于一些比较复杂的表，可能超过1000万就要分表了，而对于一些简单的表，即使存储数据超过1亿行，也可以不分表。

但不管怎么样当看到表的数据量达到千万级别时，作为架构师就要警觉起来，因为这很可能时架构的性能瓶颈或者隐患。

<font color='green'>水平分表相比垂直分表，会引入更多的复杂性，例如要求全局唯一的数据id该如何处理：</font>

> ###### 主键自增

①以最常见的用户 ID 为例，可以按照 1000000 的范围大小进行分段，1 ~ 999999 放到表 1中， 1000000 ~ 1999999 放到表2中，以此类推。

②**复杂点：**分段大小的选取。分段太小会导致切分后子表数量过多，增加维护复杂度；分段太大可能会 导致单表依然存在性能问题，一般建议分段大小在 100 万至 2000 万之间，具体需要根据业务选取合适 的分段大小。 

③**优点：**可以随着数据的增加平滑地扩充新的表。例如，现在的用户是 100 万，如果增加到 1000 万， 只需要增加新的表就可以了，原有的数据不需要动。 ④缺点：分布不均匀。假如按照 1000 万来进行分表，有可能某个分段实际存储的数据量只有 1 条，而 另外一个分段实际存储的数据量有 1000 万条。

> ###### 取模

①同样以用户 ID 为例，假如我们一开始就规划了 10 个数据库表，可以简单地用 user_id % 10 的值来 表示数据所属的数据库表编号，ID 为 985 的用户放到编号为 5 的子表中，ID 为 10086 的用户放到编号 为 6 的子表中。 ②复杂点：初始表数量的确定。表数量太多维护比较麻烦，表数量太少又可能导致单表性能存在问题。 ③优点：表分布比较均匀。 ④缺点：扩充新的表很麻烦，所有数据都要重分布。

②**复杂点：**初始表数量的确定。表数量太多维护比较麻烦，表数量太少又可能导致单表性能存在问题。 

③**优点：**表分布比较均匀。 ④缺点：扩充新的表很麻烦，所有数据都要重分布。

> ###### 雪花算法

雪花算法是由Twitter公布的分布式主键生成算法，它能够保证不同表的主键的不重复性，以及相同表的 主键的有序性。

①**核心思想：** 

* 长度共64bit（一个long型）。 

* 首先是一个符号位，1bit标识，由于long基本类型在Java中是带符号的，最高位是符号位，正数是0，负 数是1，所以id一般是正数，最高位是0。

* 41bit时间截(毫秒级)，存储的是时间截的差值（当前时间截 - 开始时间截)，结果约等于69.73年。 
* 10bit作为机器的ID（5个bit是数据中心，5个bit的机器ID，可以部署在1024个节点）。
* 12bit作为毫秒内的流水号（意味着每个节点在每毫秒可以产生 4096 个 ID）。



![image-20220526233413123](MyBatis-Plus.assets\image-20220526233413123.png)

②**优点：**整体上按照时间自增排序，并且整个分布式系统内不会产生ID碰撞，并且效率较高。



## 3、@TableField

目的：保证实体类属性与数据库中表字段一致，或规则命名符合。

解决方式：

1. 按照规则命名就行，不需要注解
2. 通过设置实体类非主键属性注解@tableField的value为普通字段名

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Long id;
    @TableField("name")
    private String xx;
    private Integer age;
    private String email;
}

TestResult:
SELECT id,name AS xx,age,email FROM user
```



## 4、@TableLogic

### a 逻辑删除：

* 物理删除：真实删除，将对应数据从数据库中删除
* 逻辑删除：假删除，修改代表删除的状态字段。
* 使用场景：数据恢复

### b 实现逻辑删除步骤：

> ###### step 1

执行sql语句，添加状态字段。

```sql
alter table user add column is_delete boolean default false
```

> ###### step 2

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Long id;
    private String name;
    private Integer age;
    private String email;
    @TableLogic
    private boolean isDelete;
}

```

> ###### step 3

测试删除功能：（服务层接口或数据访问层接口）

```java
userMapper.deleteById(1529858049893744642L);

TestResult:
UPDATE user SET is_delete=1 WHERE id=? AND is_delete=0
```

测试查询功能：（）

```java
List<User> users = userService.list();

TestResult:
SELECT id,name,age,email,is_delete FROM th_user WHERE is_delete=0
```

