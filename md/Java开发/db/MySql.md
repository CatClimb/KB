# 一、数据库概述

## 1. 为什么要使用数据库

* 持久化(persistence)： <font color='orange'>把数据保存到可掉电式存储设备中以供之后使用</font> 。大多数情况下，特别是企
  业级应用， <font color='orange'>数据持久化意味着将内存中的数据保存到硬盘上加以”固化”</font> ，而持久化的实现过程大多
  通过各种关系数据库来完成。

* 持久化的主要作用是<font color='orange'> 将内存中的数据存储在关系型数据库中 </font>，当然也可以存储在磁盘文件、XML数
  据文件中。

  ![image-20220209095607064](MySql.assets/image-20220209095607064.png)

**DB：数据库（Database）**

即存储数据的“仓库”，其本质是一个文件系统。它保存了一系列有组织的数据。

**DBMS：数据库管理系统（Database Management System）**

是一种操纵和管理数据库的大型软件，用于建立、使用和维护数据库，对数据库进行统一管理和控
制。用户通过数据库管理系统访问数据库中表内的数据。

**SQL：结构化查询语言（Structured Query Language）**

专门用来与数据库通信的语言。

## 2. 数据库与数据库管理系统

### 2. 1 数据库的相关概念

### 2. 2 数据库与数据库管理系统的关系

数据库管理系统(DBMS)可以管理多个数据库，一般开发人员会针对每一个应用创建一个数据库。为保存应用中实体的数据，一般会在数据库创建多个表，以保存程序中实体用户的数据。数据库管理系统、数据库和表的关系如图所示：。，

![image-20220209095838316](MySql.assets/image-20220209095838316.png)

![image-20220209095912237](MySql.assets/image-20220209095912237.png)

### 2. 3 常见的数据库管理系统排名(DBMS)

目前互联网上常见的数据库管理软件有Oracle、MySQL、MS SQL Server、DB2、PostgreSQL、Access、
Sybase、Informix这几种。以下是 2021 年 **DB-Engines Ranking** 对各数据库受欢迎程度进行调查后的统计结
果：（查看数据库最新排名: **https://db-engines.com/en/ranking** ）

![image-20220209095935699](MySql.assets/image-20220209095935699.png)

对应的走势图：（ **https://db-engines.com/en/ranking_trend** ）

![image-20220209100009976](MySql.assets/image-20220209100009976.png)

### 2. 4 常见的数据库介绍

**Oracle**

1979 年，Oracle 2 诞生，它是第一个商用的 RDBMS（关系型数据库管理系统）。随着 Oracle 软件的名气
越来越大，公司也改名叫 Oracle 公司。

2007 年，总计 85 亿美金收购BEA Systems。

2009 年，总计 74 亿美金收购SUN。此前的 2008 年，SUN以 10 亿美金收购MySQL。意味着Oracle 同时拥有了
MySQL 的管理权，至此 Oracle 在数据库领域中成为绝对的领导者。

2013 年，甲骨文超越IBM，成为继Microsoft后全球第二大软件公司。

如今 Oracle 的年收入达到了 400 亿美金，足以证明商用（收费）数据库软件的价值。

**SQL Server**

SQL Server 是微软开发的大型商业数据库，诞生于 1989 年。C#、.net等语言常使用，与WinNT完全集
成，也可以很好地与Microsoft BackOffice产品集成。

**DB**

IBM公司的数据库产品,收费的。常应用在银行系统中。

**PostgreSQL**

PostgreSQL 的稳定性极强，最符合SQL标准，开放源码，具备商业级DBMS质量。PG对数据量大的文本以
及SQL处理较快。

**SyBase** 北京宏福校区：010-56253825 深圳西部硅谷校区：0755-23060254 上海大江商厦校区：021-

已经淡出历史舞台。提供了一个非常专业数据建模的工具PowerDesigner。

**SQLite**

嵌入式的小型数据库，应用在手机端。 零配置，SQlite3不用安装，不用配置，不用启动，关闭或者配置
数据库实例。当系统崩溃后不用做任何恢复操作，再下次使用数据库的时候自动恢复。

**informix**

IBM公司出品，取自Information 和Unix的结合，它是第一个被移植到Linux上的商业数据库产品。仅运行
于unix/linux平台，命令行操作。 性能较高，支持集群，适应于安全性要求极高的系统，尤其是银行，证
券系统的应用。

## 3. MySQL介绍

### 3. 1 概述

- MySQL是一个`开放源代码的关系型数据库管理系统`，由瑞典MySQL AB（创始人Michael Widenius）公司 1995 年开发，迅速成为开源数据库的 No.1。
- 2008 被`Sun`收购（ 10 亿美金）， 2009 年Sun被`Oracle`收购。`MariaDB`应运而生。（MySQL 的创造者担心 MySQL 有闭源的风险，因此创建了 MySQL 的分支项目 MariaDB）
- MySQL6.x 版本之后分为`社区版`和`商业版`。
- MySQL是一种关联数据库管理系统，将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。
- MySQL是开源的，所以你不需要支付额外的费用。
- MySQL是可以定制的，采用了`GPL（GNU General Public License）`协议，你可以修改源码来开发自己的MySQL系统。
- MySQL支持大型的数据库。可以处理拥有上千万条记录的大型数据库。
- MySQL支持大型数据库，支持 5000 万条记录的数据仓库， 32 位系统表文件最大可支持`4GB`， 64 位系统支持最大的表文件为`8TB`。
- MySQL使用`标准的SQL数据语言形式`。
- MySQL可以允许运行于多个系统上，并且支持多种语言。这些编程语言包括C、C++、Python、Java、Perl、PHP和Ruby等。

### 3. 2 MySQL发展史重大事件

MySQL的历史就是整个互联网的发展史。互联网业务从社交领域、电商领域到金融领域的发展，推动着
应用对数据库的需求提升，对传统的数据库服务能力提出了挑战。高并发、高性能、高可用、轻资源、
易维护、易扩展的需求，促进了MySQL的长足发展。

![image-20220209102208792](MySql.assets/image-20220209102208792.png)

### 3. 3 关于MySQL 8. 0

==MySQL从5.7版本直接跳跃发布了8.0版本，==可见这是一个令人兴奋的里程碑版本。MySQL 8版本在功能上
做了显著的改进与增强，开发者对MySQL的源代码进行了重构，最突出的一点是多MySQL Optimizer优化
器进行了改进。不仅在速度上得到了改善，还为用户带来了更好的性能和更棒的体验。

### 3.4 Why choose MySQL?

![image-20220209102230027](MySql.assets/image-20220209102230027.png)

为什么如此多的厂商要选用MySQL？大概总结的原因主要有以下几点：

1. 开放源代码，使用成本低。
2. 性能卓越，服务稳定。
3. 软件体积小，使用简单，并且易于维护。
4. 历史悠久，社区用户非常活跃，遇到问题可以寻求帮助。
5. 许多互联网公司在用，经过了时间的验证。

### 3.5 Oracle vs MySQL

Oracle 更适合大型跨国企业的使用，因为他们对费用不敏感，但是对性能要求以及安全性有更高的要
求。

MySQL 由于其 `体积小、速度快、总体拥有成本低，可处理上千万条记录的大型数据库，尤其是开放源码`
`这一特点，使得很多互联网公司、中小型网站选择了MySQL作为网站数据库` （Facebook，Twitter，
YouTube，阿里巴巴/蚂蚁金服，去哪儿，美团外卖，腾讯）。

## 4. RDBMS 与 非RDBMS

从排名中我们能看出来，关系型数据库绝对是 DBMS 的主流，其中使用最多的 DBMS 分别是 Oracle、
MySQL 和 SQL Server。这些都是关系型数据库（RDBMS）。

### 4.1 关系型数据库(RDBMS)

#### 4. 1. 1 实质

- 这种类型的数据库是==最古老==的数据库类型，关系型数据库模型是把复杂的数据结构归结为简单的==二元关系==（即二维表格形式）。

![image-20220209110239220](MySql.assets/image-20220209110239220.png)

- 关系型数据库以==行(row)==和==列(column)==的形式存储数据，以便于用户理解。这一系列的行和列被称为==表（table）==，一组表组成了一个==库（database）==

* 表与表之间的数据记录有关系(relationship)。现实世界中的各种实体以及实体之间的各种联系均用
  ==关系模型==来表示。关系型数据库，就是建立在==关系模型==基础上的数据库。
* SQL 就是关系型数据库的查询语言。

#### 4. 1. 2 优势

- 复杂查询 可以用SQL语句方便的在一个表以及多个表之间做非常复杂的数据查询。
- 事务支持 使得对于安全性能很高的数据访问要求得以实现。

![image-20220209110411967](MySql.assets/image-20220209110411967.png)

### 4. 2 非关系型数据库(非RDBMS)

#### 4. 2. 1 介绍

`非关系型数据库` ，可看成传统关系型数据库的功能==阉割版本==，基于键值对存储数据，不需要经过SQL层的解析，==性能非常高==。同时，通过减少不常用的功能，进一步提高性能。目前基本上大部分主流的非关系型数据库都是免费的。

#### 4. 2. 2 有哪些非关系型数据库

相比于 SQL，NoSQL 泛指非关系型数据库，包括了榜单上的键值型数据库、文档型数据库、搜索引擎和
列存储等，除此以外还包括图形数据库。也只有用 NoSQL 一词才能将这些技术囊括进来。

**键值型数据库**

键值型数据库通过 Key-Value 键值的方式来存储数据，其中 Key 和 Value 可以是简单的对象，也可以是复
杂的对象。Key 作为唯一的标识符，优点是查找速度快，在这方面明显优于关系型数据库，缺点是无法
像关系型数据库一样使用条件过滤（比如 WHERE），如果你不知道去哪里找数据，就要遍历所有的键，
这就会消耗大量的计算。

键值型数据库典型的使用场景是作为==内存缓存==。`Redis`是最流行的键值型数据库。

**文档型数据库**

此类数据库可存放并获取文档，可以是XML、JSON等格式。在数据库中文档作为处理信息的基本单位，一个文档就相当于一条记录。文档数据库所存放的文档，就相当于键值数据库所存放的“值”。MongoDB
是最流行的文档型数据库。此外，还有CouchDB等。

**搜索引擎数据库**

虽然关系型数据库采用了索引提升检索效率，但是针对全文索引效率却较低。搜索引擎数据库是应用在
搜索引擎领域的数据存储形式，由于搜索引擎会爬取大量的数据，并以特定的格式进行存储，这样在检
索的时候才能保证性能最优。核心原理是“倒排索引”。

典型产品：Solr、Elasticsearch、Splunk 等。

**列式数据库**

列式数据库是相对于行式存储的数据库，Oracle、MySQL、SQL Server 等数据库都是采用的行式存储
（Row-based），而列式数据库是将数据按照列存储到数据库中，这样做的好处是可以大量降低系统的
I/O，适合于分布式文件系统，不足在于功能相对有限。典型产品：HBase等。

![image-20220209111216640](MySql.assets/image-20220209111216640.png)

##### 图形数据库

图形数据库，利用了图这种数据结构存储了实体（对象）之间的关系。图形数据库最典型的例子就是社交网络中人与人的关系，数据模型主要是以节点和边（关系）来实现，特点在于能高效地解决复杂的关系问题。图形数据库顾名思义，就是一种存储图形关系的数据库。它利用了图这种数据结构存储了实体（对象）之间的关系。关系型数据用于存储明确关系的数据，但对于复杂关系的数据存储却有些力不从心。如社交网络中人物之间的关系，如果用关系型数据库则非常复杂，用图形数据库将非常简单。典型产品：Neo4J、InfoGrid等。

![image-20220209095433462](MySql.assets/image-20220209095433462.png)

#### 4. 2. 3 NoSQL的演变

由于 SQL 一直称霸 DBMS，因此许多人在思考是否有一种数据库技术能远离 SQL，于是 NoSQL 诞生了，
但是随着发展却发现越来越离不开 SQL。到目前为止 NoSQL 阵营中的 DBMS 都会有实现类似 SQL 的功
能。下面是“NoSQL”这个名词在不同时期的诠释，从这些释义的变化中可以看出 ==NoSQL 功能的演变==：

1970 ：NoSQL = We have no SQL

1980 ：NoSQL = Know SQL

2000 ：NoSQL = No SQL!

2005 ：NoSQL = Not only SQL

2013 ：NoSQL = No, SQL!

NoSQL 对 SQL 做出了很好的补充，比如实际开发中，有很多业务需求，其实并不需要完整的关系型数据
库功能，非关系型数据库的功能就足够使用了。这种情况下，使用==性能更高、成本更低==的非关系型数据
库当然是更明智的选择。比如：日志收集、排行榜、定时器等。

### 4. 3 小结

NoSQL 的分类很多，即便如此，在 DBMS 排名中，还是 SQL 阵营的比重更大，影响力前 5 的 DBMS 中有
4 个是关系型数据库，而排名前 20 的 DBMS 中也有 12 个是关系型数据库。所以说，掌握 SQL 是非常有
必要的。整套课程将围绕 SQL 展开。

## 5. 关系型数据库设计规则

关系型数据库的典型数据结构就是数据表，这些数据表的组成都是结构化的（Structured）。
将数据放到表中，表再放到库中。
一个数据库中可以有多个表，每个表都有一个名字，用来标识自己。表名具有唯一性。
表具有一些特性，这些特性定义了数据在表中如何存储，类似Java和Python中 “类”的设计。

### 5. 1 表、记录、字段

E-R（entity-relationship，实体-联系）模型中有三个主要概念是：==实体集、属性、联系集==。
一个实体集（class）对应于数据库中的一个表（table），一个实体（instance）则对应于数据库表
中的一行（row），也称为一条记录（record）。一个属性（attribute）对应于数据库表中的一列
（column），也称为一个字段（field）。

![image-20220209095406153](MySql.assets/image-20220209095406153.png)

**ORM思想 (Object Relational Mapping)体现：** 

- 数据库中的一个表 <---> Java或Python中的一个类
- 表中的一条数据 <---> 类中的一个对象（或实体）
- 表中的一个列 <----> 类中的一个字段、属性(field)

### 5. 2 表的关联关系

表与表之间的数据记录有关系(relationship)。现实世界中的各种实体以及实体之间的各种联系均用
关系模型来表示。
四种：==一对一关联、一对多关联、多对多关联、**自我引用**==

#### 5.2.1 一对一关联（one-to-one）

- 在实际的开发中应用不多，因为一对一可以创建成一张表。
- 举例：设计==学生表==：学号、姓名、手机号码、班级、系别、身份证号码、家庭住址、籍贯、紧急联系人、...
  - 拆为两个表：两个表的记录是一一对应关系。
  - ==基础信息表==（常用信息）：学号、姓名、手机号码、班级、系别
  - ==档案信息表==（不常用信息）：学号、身份证号码、家庭住址、籍贯、紧急联系人、...
- 两种建表原则：
  - 外键唯一：主表的主键和从表的外键（唯一），形成主外键关系，外键唯一。
  - 外键是主键：主表的主键和从表的主键，形成主外键关系。

#### 5.2.2 一对多关系（one-to-many）

- 常见实例场景：客户表和订单表，分类表和商品表，部门表和员工表。

  - ##### 举例：

    - 员工表：编号、姓名、...、所属部门
    - 部门表：编号、名称、简介

- 一对多建表原则：在从表(多方)创建一个字段，字段作为外键指向主表(一方)的主键

![image-20220209111831633](MySql.assets/image-20220209111831633.png)

#### 5. 2. 3 多对多（many-to-many）

- 要表示多对多关系，必须创建第三个表，该表通常称为==联接表==，它将多对多关系划分为两个一对多关系。将这两个表的主键都插入到第三个表中。

- 举例 1 ：学生-课程

  - ==学生信息表==：一行代表一个学生的信息（学号、姓名、手机号码、班级、系别...）
  - ==课程信息表==：一行代表一个课程的信息（课程编号、授课老师、简介...）
  - ==选课信息表==：一个学生可以选多门课，一门课可以被多个学生选择

- 举例 2 ：产品-订单

- “订单”表和“产品”表有一种多对多的关系，这种关系是通过与“订单明细”表建立两个一对多关系来定义的。一个订单可以有多个产品，每个产品可以出现在多个订单中。

  - ==产品表==：“产品”表中的每条记录表示一个产品。
  - ==订单表==：“订单”表中的每条记录表示一个订单。
  - ==订单明细表==：每个产品可以与“订单”表中的多条记录对应，即出现在多个订单中。一个订单可以与“产品”表中的多条记录对应，即包含多个产品。

- 举例 3 ：用户-角色

- 多对多关系建表原则：需要创建第三张表，中间表中至少两个字段，这两个字段分别作为外键指向各自一方的主键。

  ![image-20220209112426323](MySql.assets/image-20220209112426323.png)

#### 5.3.4 自我引用(Self reference)

![image-20220209112448228](MySql.assets/image-20220209112448228.png)



# 二、基本操作与目录结构

## 1. MySQL操作

### 1.1 对库操作。

```mysql
    -- 查看数据库的创建信息:
    show create database 数据库名;
    -- 结果：
    +----------+---------------------------------------------------------------------------------------------------------------------------------+
    | Database | Create Database                                                                                                                 |
    +----------+---------------------------------------------------------------------------------------------------------------------------------+
    | mysql    | CREATE DATABASE `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
    +----------+---------------------------------------------------------------------------------------------------------------------------------+


    -- 展示所有数据库：
    show databses;

    -- 创建数据库：
    create database 数据库名;

    -- 使用或者说选择数据库：
    use database 数据库名;

    -- 删除数据库：小心，use了也能删。
    drop database 数据库名;

```
### 1.2 对表操作

```mysql
-- 查看表的创建信息:
show create table 表名;
-- 结果：
+-------+-------------------------------------------------------------------------------------------------------------------------------------------    -----------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                  |
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| user  | CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

-- 查看表的字段信息:
desc 表名;

-- 创建表 
create Table: CREATE TABLE `student` (
`id` int(11) NOT NULL,
`name` varchar(20) DEFAULT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8


-- 查看某个库的所有表格1：
show tables from 数据库名;

-- 已经选择了某个数据库，查看该数据库下的所有表格：
show tables;

-- 删除表
drop table 表名;
```

### 1.3 解决字符集

#### a ==解决全局配置字符集问题==

1. 检查全局配置

   ```mysql
   show variables like 'character_%';
   show variables like 'collation_%';
   ```

2. 修改mysql的数据目录下的my.ini配置文件

   ```properties
   [mysql]
   default-character-set=utf8 #默认字符集
   [mysqld] # 大概在76行左右，在其下添加
   ...
   character-set-server=utf8
   collation-server=utf8_general_ci
   ```

3. 重启服务

4. 重新检查全局配置  

#### b ==解决表字符集问题==

```mysql
alter table 表名charset utf8;  
```
#### c ==解决数据库字符集问题==

```mysql
alter database 数据库名 charset utf8; 
--或者
create database 数据库名 charset Latin1;
```
### 1.4 解决其它问题
1. **问题**： 在连接MySQL8时出现“Authentication plugin 'caching_sha2_password' cannot be loaded”错误。

   **原因**：由于出现这个原因是MySQL8之前的版本中加密规则是mysql_native_password，而在MySQL8之后，加密规则是caching_sha2_password。

   **解决办法**：
   第一种：升级图形工具。
   第二种：使用命令：

   ```mysql
   #使用mysql数据库
   use mysql;
   
   #修改'root'@'localhost'用户的密码规则和密码
   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'abc123'
   
   #刷新权限
   FLUSH PRIVILEGES;
   ```



## 2. 目录结构

| bin目录                                     | 所有MySQL的可执行文件。如：mysql.exe |
| ------------------------------------------- | ------------------------------------ |
| MySQLInstanceConfig.exe                     | 数据库的配置向导，在安装时出现的内容 |
| data目录                                    | 系统数据库所在的目录                 |
| my.ini文件                                  | MySQL的主要配置文件                  |
| c:\ProgramData\MySQL\MySQL Server 8.0\data\ | 用户创建的数据库所在的目录           |

# 三、基本SELECT语句

## 1. SQL概述

### 1.1 SQL背景知识
* 1946 年，世界上第一台电脑诞生，如今，借由这台电脑发展起来的互联网已经自成江湖。在这几十
  年里，无数的技术、产业在这片江湖里沉浮，有的方兴未艾，有的已经几幕兴衰。但在这片浩荡的
  波动里，有一门技术从未消失，甚至“老当益壮”，那就是 SQL。
    * 45 年前，也就是 1974 年，IBM 研究员发布了一篇揭开数据库技术的论文《SEQUEL：一门结构
  化的英语查询语言》，直到今天这门结构化的查询语言并没有太大的变化，相比于其他语
  言， SQL 的半衰期可以说是非常长 了。

* 不论是前端工程师，还是后端算法工程师，都一定会和数据打交道，都需要了解如何又快又准确地
  提取自己想要的数据。更别提数据分析师了，他们的工作就是和数据打交道，整理不同的报告，以
  便指导业务决策。

* SQL（Structured Query Language，结构化查询语言）是使用关系模型的数据库应用语言， 与数据直
  接打交道 ，由 IBM 上世纪70年代开发出来。后由美国国家标准局（ANSI）开始着手制定SQL标准，
  先后有 SQL-86 ， SQL-89 ， SQL-92 ， SQL-99 等标准。
    * SQL 有两个重要的标准，分别是 SQL92 和 SQL99，它们分别代表了 92 年和 99 年颁布的 SQL 标
  准，我们今天使用的 SQL 语言依然遵循这些标准

* 不同的数据库生产厂商都支持SQL语句，但都有特有内容。

  ![image-20220629223330994](\MySql.assets\image-20220629223330994.png)

### 1.2 SQL分类
* **DDL（Data Definition Languages、数据定义语言）**，这些语句定义了不同的数据库、表、视图、索
  引等数据库对象，还可以用来创建、删除、修改数据库和数据表的结构。
    * CREATE \ ALTER \ DROP \ RENAME \ TRUNCATE
* **DML（Data Manipulation Language、数据操作语言）**，用于添加、删除、更新和查询数据库记
  录，并检查数据完整性。
    * SELECT \ UPDATE \ DELETE \ INSERT
* DCL**（Data Control Language、数据控制语言）**，用于定义数据库、表、字段、用户的访问权限和
  安全级别。
    * COMMIT \ ROLLBACK \ SAVEPOINT \  GRANT \ REVOKE



> 因为查询语句使用的非常的频繁，所以很多人把查询语句单拎出来一类：`DQL`（数据查询语言）。
> 还有单独将 COMMIT 、 ROLLBACK 取出来称为`TCL` （Transaction Control Language，事务控制语
> 言）。

## 2 SQL语言的规则与规范

* SQL 可以写在一行或者多行。为了提高可读性，各子句分行写，必要时使用缩进
* 每条命令以 ; 或 \g 或 \G 结束
* 关键字不能被缩写也不能分行
* 关于标点符号

    * 必须保证所有的()、单引号、双引号是成对结束的
    * 必须使用英文状态下的半角输入方式
    * 字符串型和日期时间类型的数据可以使用单引号（' '）表示
    * 列的别名，尽量使用双引号（" "），而且不建议省略as
    
### 2.1 SQL大小写规范 （建议遵守）
* **MySQL 在 Windows 环境下是大小写不敏感的**
* **MySQL 在 Linux 环境下是大小写敏感的**
    * 数据库名、表名、表的别名、变量名是严格区分大小写的
    * 关键字、函数名、列名(或字段名)、列的别名(字段的别名) 是忽略大小写的。
* **推荐采用统一的书写规范：**
    * 数据库名、表名、表别名、字段名、字段别名等都小写
    * SQL 关键字、函数名、绑定变量等都大写

### 2.2 注 释

可以使用如下格式的注释结构：

```mysql
单行注释：#注释文字(MySQL特有的方式)
单行注释：-- 注释文字(--后面必须包含一个空格。)
多行注释：/* 注释文字 */
```

### 2.3 命名规则（暂时了解）
* 数据库、表名不得超过30个字符，变量名限制为29个
* 必须只能包含 A–Z, a–z, 0–9, _共63个字符
* 数据库名、表名、字段名等对象名中间不要包含空格
* 同一个MySQL软件中，数据库不能同名；同一个库中，表不能重名；同一个表中，字段不能重名
* 必须保证你的字段没有和保留字、数据库系统或常用方法冲突。如果坚持使用，请在SQL语句中使
用`（**着重号**）引起来
* 保持字段名和类型的一致性，在命名字段并为其指定数据类型的时候一定要保证一致性。假如数据
类型在一个表里是整数，那在另一个表里可就别变成字符型了
例如：
```mysql
-- 因为order是保留字，所以要着重符号。
CREATE TABLE `order`(...);
```
### 2.4 执行SQL脚本

```mysql
source SQL脚本的路径
```

## 3.基本的SELECT语句

### 3.1 SELECT...

```mysql
SELECT 1;
SELECT 9/2;

-- DUAL是伪表
SELECT 1+1 FROM DUAL;
```

### 3.2 SELECT...FROM

* 语法：

  `SELECT` 标识选择哪些列
  `FROM` 标识从哪个表中选择

```mysql
SELECT *
FROM departments;
```

> `*`表示全部列。
>
> 一般来说不建议列全部列，除非全部都用得到，因为效率问题。

选择特定的列：

```mysql
SELECT department_id, location_id
FROM departments;
```
### 3.3 列的别名

重命名一个列。

**在列名和别名之间加入关键字AS，别名使用双引号。**

```mysql
-- 例如：
SELECT last_name AS name, commission_pct comm
FROM employees;

SELECT last_name "Name", salary*12 "Annual Salary"
FROM employees;



```


### 3.4 去除重复行

```mysql
-- 默认情况下，查询会返回全部行。
SELECT DISTINCT department_id
FROM employees;
```
> DISTINCT 其实是对**后面所有列名的组合**进行去重

### 3.5 空值参与运算

* 所有运算符或列值遇到null值，==运算的结果都为null==
* null不等同于0，''，'null'

例如：

```mysql
-- 错误，空值参与运算 commission_pct可能为空的设定
SELECT employee_id,salary "月工资",salary * (1 + commission_pct) * 12 "年工资"
FROM employees; 

-- 正确，空值不参与运算
SELECT employee_id,salary "月工资",salary * (1 + isNull(commission_pct,0)) * 12 "年工资"
FROM employees;


```
### 3.6 使用常数列

```mysql
SELECT User, '哈士奇' AS xxx FROM user;
-- 结果：
+------------------+--------+
| User             | xxx    |
+------------------+--------+
| mysql.infoschema | 哈士奇 |
| mysql.session    | 哈士奇 |
| mysql.sys        | 哈士奇 |
| root             | 哈士奇 |
+------------------+--------+
```
### 3.7 显示表结构

```mysql
DESC 表名;
DESCRIBE 表名;

-- 结果：
+----------------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| employee_id | int(6) | NO | PRI | 0 | |
| first_name | varchar(20) | YES | | NULL | |
| last_name | varchar(25) | NO | | NULL | |
| email | varchar(25) | NO | UNI | NULL | |
| phone_number | varchar(20) | YES | | NULL | |
| hire_date | date | NO | | NULL | |
| job_id | varchar(10) | NO | MUL | NULL | |
| salary | double(8,2) | YES | | NULL | |
| commission_pct | double(2,2) | YES | | NULL | |
| manager_id | int(6) | YES | MUL | NULL | |
| department_id | int(4) | YES | MUL | NULL | |
+----------------+-------------+------+-----+---------+-------+
```

### 3.8 SELECT...FROM...WHERE

* 语法：
    SELECT 字段1,字段2
    FROM 表名
    WHERE 过滤条件
    * 使用WHERE 子句，将不满足条件的行过滤掉
    * **WHERE子句紧随 FROM子句**
* 举例

```mysql
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90 ;

-- 结果
+-------------+-----------+---------+---------------+
| employee_id | last_name | job_id  | department_id |
+-------------+-----------+---------+---------------+
|         100 | King      | AD_PRES |            90 |
|         101 | Kochhar   | AD_VP   |            90 |
|         102 | De Haan   | AD_VP   |            90 |
+-------------+-----------+---------+---------------+

SELECT * FROM employees WHERE last_name='king';
-- 结果
+-------------+------------+-----------+-------+--------------------+------------+---------+----------+----------------+------------+---------------+
| employee_id | first_name | last_name | email | phone_number       | hire_date  | job_id  | salary   | commission_pct | manager_id | department_id |
+-------------+------------+-----------+-------+--------------------+------------+---------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING | 515.123.4567       | 1987-06-17 | AD_PRES | 24000.00 |           NULL |       NULL |            90 |
|         156 | Janette    | King      | JKING | 011.44.1345.429268 | 1996-01-30 | SA_REP  | 10000.00 |           0.35 |        146 |            80 |
+-------------+------------+-----------+-------+--------------------+------------+---------+----------+----------------+------------+---------------+
```
> MySQL不严谨，**查询字符串不区分大小写**,不符合标准ANSI，Oracle不是这样的哦。
>
> #### mysql的表名/字段名/字段值默认不区分大小写
>
> show Variables like '%table_names'

# 四、运算符
## 1. 算数运算符

| 符号 |          说明          |
| :--: | :--------------------: |
|  +   |       加法运算符       |
|  -   |       减法运算符       |
|  *   |       乘法运算符       |
|  /   |     DIV 除法运算符     |
|  %   | MOD 求模（求余）运算符 |

### 1.1 加法与减法运算符



```mysql
SELECT 100, 100 + 0, 100 - 0, 100 + 50, 100 + 50 -30, 100 + 35.5, 100 - 35.5,1+null
FROM dual;
-- Result：
+-----+---------+---------+----------+--------------+------------+------------+--------+
| 100 | 100 + 0 | 100 - 0 | 100 + 50 | 100 + 50 -30 | 100 + 35.5 | 100 - 35.5 | 1+null |
+-----+---------+---------+----------+--------------+------------+------------+--------+
| 100 |     100 |     100 |      150 |          120 |      135.5 |       64.5 |   NULL |
+-----+---------+---------+----------+--------------+------------+------------+--------+
```

结论：

* 一个整数类型的值对整数进行加法和减法操作，结果还是一个整数；
* 一个整数类型的值对浮点数进行加法和减法操作，结果是一个浮点数；
* 加法和减法的优先级相同，进行先加后减操作与进行先减后加操作的结果是一样的；
* 在Java中，+的左右两边如果有字符串，那么表示字符串的拼接。但是在MySQL中+只表示数
值相加。如果遇到非数值类型，先尝试转成数值（**隐式转换**），==如果转失败，就按0计算==。（补充：MySQL
中字符串拼接要使用字符串函数CONCAT()实现）

### 1.2 乘法与除法运算符

```mysql
SELECT 100,100*1,100*1.0,100/1.0,100/2,100+2*5/2,100/3,100 DIV 0
FROM DUAL;
-- 结果：
+-----+-------+---------+----------+---------+-----------+---------+-----------+
| 100 | 100*1 | 100*1.0 | 100/1.0  | 100/2   | 100+2*5/2 | 100/3   | 100 DIV 0 |
+-----+-------+---------+----------+---------+-----------+---------+-----------+
| 100 |   100 |   100.0 | 100.0000 | 50.0000 |  105.0000 | 33.3333 |      NULL |
+-----+-------+---------+----------+---------+-----------+---------+-----------+
```

结论：
* 一个数乘以整数1和除以整数1后仍得原数；
* 一个数乘以浮点数1和除以浮点数1后变成浮点数，数值与原数相等；
* **一个数除以整数后，不管是否能除尽，结果都为一个浮点数，并保留到小数点后4位；**
* 乘法和除法的优先级相同，进行先乘后除操作与先除后乘操作，得出的结果相同。
* 在数学运算中，0不能用作除数，在MySQL中，**一个数除以0为NULL。**

### 1.3 求模（求余）运算符

```mysql
SELECT 12 % 3, 12 % 5,12 MOD -5,-12 % 5,-12 %-5
FROM DUAL;

-- Result：
+--------+--------+-----------+---------+---------+
| 12 % 3 | 12 % 5 | 12 MOD -5 | -12 % 5 | -12 %-5 |
+--------+--------+-----------+---------+---------+
|      0 |      2 |         2 |      -2 |      -2 |
+--------+--------+-----------+---------+---------+
```
结论：

* 模数为什么，结果就为什么。如模是负数，那结果结果就是正数。

## 2. 比较运算符

|   符号   |      说明      |
| :------: | :------------: |
|    =     |   等于运算符   |
|   <=>    | 安全等于运算符 |
| <>（!=） |  不等于运算符  |
|    <     |   小于运算符   |
|    <=    | 小于等于运算符 |
|    >     |   大于运算符   |
|    >=    | 大于等于运算符 |



### 2.1 等于运算符

```mysql

#字符串存在隐式转换，如果转换数值不成功，则看做0
SELECT 1=2,1!=2,1='1',1='a',0='a'
FROM DUAL;

-- Result:
+-----+------+-------+-------+-------+
| 1=2 | 1!=2 | 1='1' | 1='a' | 0='a' |
+-----+------+-------+-------+-------+
|   0 |    1 |     1 |     0 |     1 |
+-----+------+-------+-------+-------+

#两边都是字符串的话，则按照ANSI的比较规则进行比较。
SELECT 'a'='a','ab'='ab','a'='b'
FROM DUAL;
+---------+-----------+---------+
| 'a'='a' | 'ab'='ab' | 'a'='b' |
+---------+-----------+---------+
|       1 |         1 |       0 |
+---------+-----------+---------+

#只要有null参与判断，结果就为null
SELECT 1=NULL,NULL=NULL;
+--------+-----------+
| 1=NULL | NULL=NULL |
+--------+-----------+
|   NULL |      NULL |
+--------+-----------+

SELECT last_name,salary
FROM employees
WHERE commission_pct=NULL; #没有任何结果。

--Result：
Empty set (0.00 sec) 
```
结论：
* 等号运算符（=）判断等号两边的值、字符串或表达式是否相等，如果相等则返回1，不相等则返回
0。
* 在使用等号运算符时，遵循如下规则：
    * 如果等号两边的值、字符串或表达式都为字符串，则MySQL会按照字符串进行比较，**其比较的**
    **是每个字符串中字符的ANSI编码是否相等。**
    * 如果等号两边的值都是整数，则MySQL会按照整数来比较两个值的大小。
    * 如果等号两边的值一个是整数，另一个是字符串，**则MySQL会将字符串转化为数字进行比较。**
    * 如果等号两边的值、字符串或表达式中有一个为NULL，**则比较结果为NULL。**



### 2.2 安全等于运算符

与等于运算符唯一的==区别==就是 <=> 可以用来对NULL进行判断。**当两个操作数均为NULL时，其返回值为1，而不为NULL;当一个操作数为NULL时，其返回值为0。**

```mysql
SELECT 1 <=> 2, 1 <=> '1', 1 <=> 'a', 0 <=> 'a'
FROM DUAL;

--Result：
+---------+-----------+-----------+-----------+
| 1 <=> 2 | 1 <=> '1' | 1 <=> 'a' | 0 <=> 'a' |
+---------+-----------+-----------+-----------+
|       0 |         1 |         0 |         1 |
+---------+-----------+-----------+-----------+
SELECT 1 <=> NULL, NULL <=> NULL
FROM DUAL;

--Result:
+------------+---------------+
| 1 <=> NULL | NULL <=> NULL |
+------------+---------------+
|          0 |             1 |
+------------+---------------+

#找绩点为空的用户
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct <=> NULL;

--Result：
+-------------+----------+----------------+
| last_name   | salary   | commission_pct |
+-------------+----------+----------------+
| King        | 24000.00 |           NULL |
| Kochhar     | 17000.00 |           NULL |
| De Haan     | 17000.00 |           NULL |
| Hunold      |  9000.00 |           NULL |
| Ernst       |  6000.00 |           NULL |
| Austin      |  4800.00 |           NULL |
| Pataballa   |  4800.00 |           NULL |
| Lorentz     |  4200.00 |           NULL |


#找绩点不为空的用户
SELECT last_name,commission_pct FROM employees WHERE !(commission_pct <=> NULL); 
#或者
SELECT last_name,commission_pct FROM employees WHERE NOT commission_pct <=> NULL;

--Result：

+------------+----------------+
| last_name  | commission_pct |
+------------+----------------+
| Russell    |           0.40 |
| Partners   |           0.30 |
| Errazuriz  |           0.30 |
| Cambrault  |           0.30 |
| Zlotkey    |           0.20 |
| Tucker     |           0.30 |
| Bernstein  |           0.25 |
| Hall       |           0.25 |

```

### 2.3 不等于运算符



```mysql
 SELECT 1 <> 1,1!=2,'a'!='b',(3+4) <>(2+6), 'a'!=NULL,NULL<>NULL;
 +--------+------+----------+---------------+-----------+------------+
| 1 <> 1 | 1!=2 | 'a'!='b' | (3+4) <>(2+6) | 'a'!=NULL | NULL<>NULL |
+--------+------+----------+---------------+-----------+------------+
|      0 |    1 |        1 |             1 |      NULL |       NULL |
+--------+------+----------+---------------+-----------+------------+
```

## 3. 非符号运算符

| 运算符       | 名称             | 注意                                         | 示例 |
| ------------ | ---------------- | -------------------------------------------- | ---- |
| IS NULL      | 为空运算符       |                                              |      |
| IS NOT NULL  | 不为空运算符     |                                              |      |
| LEAST        | 最小值运算符     |                                              |      |
| GREATEST     | 最大值运算符     |                                              |      |
| BETWEEN AND  | 两值之间的运算符 | 第一个为下限，第二个为上限，反过来没有结果。 |      |
| ISNULL       | 为空运算符       | 要（）                                       |      |
| IN           | 属于运算符       | 要（）                                       |      |
| NO IN        | 不属于运算符     | 要（）                                       |      |
| LIKE         | 模糊匹配运算符   |                                              |      |
| REGEXP\RLIKE | 正则表达式运算符 | 两个都一样                                   |      |

### IS NULL / IS NOT NULL / ISNULL()

```MYSQL
SELECT last_name,salary,commission_pct FROM employees WHERE commission_pct IS NOT NULL;
SELECT last_name,salary,commission_pct FROM employees WHERE commission_pct IS NULL;
SELECT last_name,salary,commission_pct FROM employees WHERE ISNULL(commission_pct);
```

### LEAST() / GREATEST()

```mysql
SELECT LEAST('A','S','B'),GREATEST('A','S','B');
+--------------------+-----------------------+
| LEAST('A','S','B') | GREATEST('A','S','B') |
+--------------------+-----------------------+
| A                  | S                     |
+--------------------+-----------------------+


SELECT first_name,last_name,LEAST(first_name,last_name) FROM employees ;
+-------------+-------------+-----------------------------+
| FIRST_NAME  | LAST_NAME   | LEAST(first_name,last_name) |
+-------------+-------------+-----------------------------+
| Steven      | King        | King                        |
| Neena       | Kochhar     | Kochhar                     |
| Lex         | De Haan     | De Haan                     |
| Alexander   | Hunold      | Alexander                   |
| Bruce       | Ernst       | Bruce                       |
| David       | Austin      | Austin                      | 
```

### BETWEEN 下限 AND 上限（包括上下限）

```mysql
SELECT employee_id,last_name,salary FROM employees WHERE salary BETWEEN 6000 AND 8000;
+-------------+-----------+---------+
| employee_id | last_name | salary  |
+-------------+-----------+---------+
|         104 | Ernst     | 6000.00 |
|         111 | Sciarra   | 7700.00 |
|         112 | Urman     | 7800.00 |
|         113 | Popp      | 6900.00 |

SELECT employee_id,last_name,salary FROM employees WHERE salary BETWEEN 8000 AND 6000;
SELECT employee_id,last_name,salary FROM employees WHERE salary>=8000 AND salary<=6000;
Empty set (0.00 sec)
SELECT employee_id,last_name,salary FROM employees WHERE salary>=8000 OR salary<=6000;
+-------------+-------------+----------+
| employee_id | last_name   | salary   |
+-------------+-------------+----------+
|         100 | King        | 24000.00 |
|         101 | Kochhar     | 17000.00 |
|         102 | De Haan     | 17000.00 |
|         103 | Hunold      |  9000.00 |
|         104 | Ernst       |  6000.00 |
|         105 | Austin      |  4800.00 |
```

### IN / NOT IN

```mysql
SELECT last_name,salary,department_id
FROM employees
WHERE salary NOT IN (6000,7000,8000);
+-------------+----------+---------------+
| last_name   | salary   | department_id |
+-------------+----------+---------------+
| King        | 24000.00 |            90 |
| Kochhar     | 17000.00 |            90 |
| De Haan     | 17000.00 |            90 |

SELECT last_name,salary,department_id
FROM employees
WHERE salary IN (6000,7000,8000);
+-----------+---------+---------------+
| last_name | salary  | department_id |
+-----------+---------+---------------+
| Ernst     | 6000.00 |            60 |
| Weiss     | 8000.00 |            50 |
| Olsen     | 8000.00 |            80 |
| Tuvault   | 7000.00 |            80 |
| Smith     | 8000.00 |            80 |
| Sewall    | 7000.00 |            80 |
| Grant     | 7000.00 |          NULL |
| Fay       | 6000.00 |            20 |
+-----------+---------+---------------+
```

### LIKE

```mysql
SELECT last_name FROM employees WHERE last_name LIKE 'a%';
+-----------+
| last_name |
+-----------+
| Austin    |
| Atkinson  |
| Ande      |
| Abel      |
+-----------+

# _ 代表不确定的一个字符
SELECT last_name FROM employees WHERE last_name LIKE '_a%';
+-----------+
| last_name |
+-----------+
| Pataballa |
| Faviet    |
| Raphaely  |
| Baida     |
| Kaufling  |
| Nayer     |
| Landry    |

# \ 代表转义字符
SELECT last_name FROM employees WHERE last_name LIKE '\_a%';
+-----------+
| last_name |
+-----------+
| _Pataballa |
| _Faviet    |
| _Raphaely  |

#  ESCAPE 指定某个符号为转义字符
SELECT last_name FROM employees WHERE last_name LIKE '@_a%' ESCAPE '@';
+-----------+
| last_name |
+-----------+
| _Austin   |
| _Atkinson |
| _Ande     |
| _Abel     |
+-----------+
```

### REGEXP | RLIKE

```mysql
SELECT 'shkstart' REGEXP '^s', 'shkstart' REGEXP 't$', 'shkstart' REGEXP 'hk';
+------------------------+------------------------+------------------------+
| 'shkstart' REGEXP '^s' | 'shkstart' REGEXP 'T$' | 'shkstart' REGEXP 'hk' |
+------------------------+------------------------+------------------------+
|                      1 |                      1 |                      1 |
+------------------------+------------------------+------------------------+

#不区分大小写
SELECT last_name FROM employees WHERE last_name RLIKE '^s';

#可区分大小写 
#5.7直接支持 
#8报错
#Character set 'utf8_general_ci' cannot be used in conjunction with 'binary' in call to regexp_like.
SELECT last_name FROM employees WHERE last_name RLIKE BINARY '^s';
```

> 注意

BINARY可以区分大小写。原理待处理 （但不走索引待处理）

## 4. 逻辑运算符

逻辑运算符主要用来判断表达式的真假，在MySQL中，逻辑运算符的返回结果为1、0或者NULL。

| 运算符     | 作用     |
| ---------- | -------- |
| NOT 或 ！  | 逻辑非   |
| AND 或 &&  | 逻辑与   |
| OR 或 \|\| | 逻辑或   |
| XOR        | 逻辑异或 |

```mysql
SELECT NOT 1, NOT 0, NOT(1+1), NOT !1, NOT NULL;
+-------+-------+----------+--------+----------+
| NOT 1 | NOT 0 | NOT(1+1) | NOT !1 | NOT NULL |
+-------+-------+----------+--------+----------+
|     0 |     1 |        0 |      1 |     NULL |
+-------+-------+----------+--------+----------+
```

## 5. 位运算符

| 运算符 | 作用     |
| ------ | -------- |
| &      | 按位与   |
| \|     | 按位或   |
| ^      | 按位异或 |
| ~      | 按位取反 |
| >>     | 按位右移 |
| <<     | 按位左移 |



```mysql
 SELECT 12 & 5, 12 | 5,12 ^ 5 FROM DUAL;
 +--------+--------+--------+
| 12 & 5 | 12 | 5 | 12 ^ 5 |
+--------+--------+--------+
|      4 |     13 |      9 |
+--------+--------+--------+
```

## 6. 运算符优先级

数字编号越大，优先级越高。

![image-20220704140403422](MySql.assets\image-20220704140403422.png)



> #### 导致的问题
查阅资料，**关系型运算符优先级高到低为：`NOT >AND >OR`**


# 五、 排序和分页

## 1. 排序

### 1.1 排序规则

* 使用 ORDER BY 子句排序
  *  **ASC（ascend）: 升序** ==（默认）==
  * **DESC（descend）:降序** 
* ORDER BY 子句在SELECT语句的结尾（在where之后，LIMIT之前，因为sql执行顺序问题）。

### 1.2 单列排序

```mysql
#默认升序
SELECT employee_id,last_name,salary FROM employees ORDER BY salary;
+-------------+-------------+----------+
| employee_id | last_name   | salary   |
+-------------+-------------+----------+
|         132 | Olson       |  2100.00 |
|         128 | Markle      |  2200.00 |
|         136 | Philtanker  |  2200.00 |
#降序
SELECT employee_id,last_name,salary FROM employees ORDER BY salary DESC;

```

### 1.2 多列排序

* **当第一列出现相同值才会对第二列排序，依次类推**
* 排序列的值为NULL，放在最前面

```mysql
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;
+-------------+---------------+----------+
| last_name   | department_id | salary   |
+-------------+---------------+----------+
| Grant       |          NULL |  7000.00 |
| Whalen      |            10 |  4400.00 |
| Hartstein   |            20 | 13000.00 |
| Fay         |            20 |  6000.00 |
| Raphaely    |            30 | 11000.00 |
| Khoo        |            30 |  3100.00 |

-- 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序。
SELECT employee_id,last_name,email,department_id FROM employees 
WHERE email REGEXP '[e]'
ORDER BY LENGTH(email) DESC,department_id;
+-------------+------------+----------+---------------+
| employee_id | last_name  | email    | department_id |
+-------------+------------+----------+---------------+
|         201 | Hartstein  | MHARTSTE |            20 |
|         114 | Raphaely   | DRAPHEAL |            30 |
|         119 | Colmenares | KCOLMENA |            30 |
|         186 | Dellinger  | JDELLING |            50 |
|         191 | Perkins    | RPERKINS |            50 |
```

> 注意

我们可以<font color='orange'>使用列的别名，进行排序</font>，**但列的别名不能在WHERE中使用。**（sql执行顺序问题）

```mysql
#使用列的别名，进行排序
SELECT employee_id,salary,salary * 12 annual_sal FROM employees ORDER BY annual_sal;
+-------------+----------+------------+
| employee_id | salary   | annual_sal |
+-------------+----------+------------+
|         132 |  2100.00 |   25200.00 |
|         128 |  2200.00 |   26400.00 |
|         136 |  2200.00 |   26400.00 |
|         127 |  2400.00 |   28800.00 |
|         135 |  2400.00 |   28800.00 |

#报错 Unknown column 'annual_sal' in 'where clause'
SELECT employee_id,salary,salary * 12 annual_sal FROM employees WHERE annual_sal > 81600;
```

## 2. 分页

### 2.1 背景

* 背景1：查询返回的记录太多了，查看起来很不方便，怎么样能够实现分页查询呢？ 
* 背景2：表里有 4 条数据，我们只想要显示第 2、3 条数据怎么办呢？

### 2.2 实现规则

* 分页原理 所谓分页显示，就是将数据库中的结果集，一段一段显示出来需要的条件。 

* MySQL中使用 LIMIT 实现分页

* 格式：

  * ```mysql
    LIMIT [位置偏移量,] 条目数（也称为 “每页条数”）
    LIMIT 0,条目数  /*等效于*/ LIMIT 条目数
    ```

    

举例：

```mysql
-- 前10条记录：
SELECT employee_id,first_name FROM employees LIMIT 0,10;
-- 或者
SELECT employee_id,first_name FROM employees LIMIT 10;
-- 第11至20条记录：
SELECT employee_id,first_name FROM employees LIMIT 10,10;
-- 第21至30条记录：
SELECT employee_id,first_name FROM employees LIMIT 20,10;

```

> MySQL 8.0新特性
>
> * 简而言之 LIMIT 条目数 OFFSET 偏移量
>
>   ```mysql
>   -第21至30条记录：
>   SELECT employee_id,first_name FROM employees  LIMIT  10 OFFSET 20;
>   +-------------+------------+
>   | employee_id | first_name |
>   +-------------+------------+
>   |         120 | Matthew    |
>   |         121 | Adam       |
>   |         122 | Payam      |
>   |         123 | Shanta     |
>   |         124 | Kevin      |
>   |         125 | Julia      |
>   |         126 | Irene      |
>   |         127 | James      |
>   |         128 | Steven     |
>   |         129 | Laura      |
>   +-------------+------------+
>   ```



* <font color='green'>分页显式公式：（当前页数-1）*每页条数，每页条数</font>

  * ```mysql
    SELECT * FROM table
    LIMIT(PageNo - 1)*PageSize,PageSize;
    ```

* 注意：LIMIT 子句必须放在整个SELECT语句的最后！

* SQL执行顺序 WHERE -> ORDER BY -> LIMIT

### 2.3 拓展

在不同的 DBMS 中使用的关键字可能不同。在 MySQL、PostgreSQL、MariaDB 和 SQLite 中使用 LIMIT 关 键字，而且需要放到 SELECT 语句的最后面。

* 如果是 SQL Server 和 Access，需要使用 TOP 关键字，比如：

  * ```SQL
    SELECT TOP 5 name, hp_max FROM heros ORDER BY hp_max DESC
    ```

* 如果是 DB2，使用 FETCH FIRST 5 ROWS ONLY 这样的关键字：

  * ```
    SELECT name, hp_max FROM heros ORDER BY hp_max DESC FETCH FIRST 5 ROWS ONLY
    
    ```

* 如果是 Oracle，你需要基于 ROWNUM 来统计行数：

  * ```MYSQL
    SELECT rownum,last_name,salary FROM employees WHERE rownum < 5 ORDER BY salary DESC;
    #该语句先取前5数据在排序，需要子查询来先排序后取前5数据
    #纠正后
    SELECT rownum,last_name,salary FROM (last_name,salary FROM employees ORDER BY salary DESC) WHERE rownum < 5;
    ```

  

# 六、多表查询

多表查询，也称为**关联查询**，指两个或更多个表一起完成查询操作。

前提条件：这些一起查询的表之间是有关系的（一对一，一对多），他们之间一定是有关联字段，**这个关联字段可能建立了外键，也可能没有建立外键。**

## 1、 笛卡尔积（交叉连接）

* 解释：

  * 笛卡尔积也称为==交叉连接==，英文是 ==CROSS JOIN==。**在多表查询中这是一种错误的实现方式**（能执行），这叫做**笛卡尔积的错误。**

  * 错误原因：

    * 因为每个员工都与每个部门匹配了一遍。（就笛卡尔积原理），所以需要添加连接条件

      

* 作用：
  * 可以把任意表进行连接，即使这两张表不相关。

* 错误方式

  * 笛卡尔积出现情况如下：

    ```sql
    SELECT last_name,department_name FROM employees,departments;
    SELECT last_name,department_name FROM employees CROSS JOIN departments;
    SELECT last_name,department_name FROM employees INNER JOIN departments;
    ```

* 笛卡尔积的错误产生条件

  * 省略多个表的连接条件（或关联条件）
  * 连接条件（或关联条件）无效
  * 所有表中的所有行互相连接

* 正确方式

  * 在 WHERE 加入有效的连接条件

    * 例如：

      * ```sql
        SELECT employee_id,department_name
        FROM employees,departments
        WHERE employees.department_id=departments.department_id;
        #记录为106条 连接条件
        ```

* 使用建议
  * 从sql优化的角度，建议多表查询时，每个字段前都指明其所在的表
  * 给表起了别名的话，则必须使用表的别名，而不能在使用表的原名



运用：

```sql
# 查询员工的employee_id,last_name,department_name,city
SELECT employee_id,last_name,department_name,city
FROM employees e,departments d,locations l
WHERE e.department_id==d.department_id
AND d.location_id=l.location_id
```

演绎式思维：  提出问题-》解决问题

归纳式：总--分

## 2、分类

角度1： 等值连接 vs 非等值连接

角度2： 自连接 vs 非自连接

角度3： 内连接 vs 外连接

### 1、非等值连接

多表连接中的连接条件，不是等号连接就是非等值连接。

表描述：

​	员工表、薪资等级表（之间没有外键关联）

查询员工的last_name，薪资，薪资等级



```sql
SELECT e.last_name,e.salary,g.grade_level
    -> FROM employees e,job_grades g
    -> WHERE e.salary BETWEEN g.lowest_sal AND g.highest_sal;
    
 
    +-------------+----------+-------------+
| last_name   | salary   | grade_level |
+-------------+----------+-------------+
| King        | 24000.00 | E           |
| Kochhar     | 17000.00 | E           |
| De Haan     | 17000.00 | E           |
| Hunold      |  9000.00 | C           |
| Ernst       |  6000.00 | C           |
| _Austin     |  4800.00 | B           |
| Pataballa   |  4800.00 | B           |
```

### 2、自连接

自己表和自己表连接

```sql
 #查询员工的名字与其管理者的名字
SELECT e1.first_name,e2.first_name FROM employees e1,employees e2
WHERE e1.manager_id=e2.employee_id;
  
+-------------+-----------+
| 员工名      | 管理者名  |
+-------------+-----------+
| Neena       | Steven    |
| Lex         | Steven    |
| Alexander   | Lex       |
| Bruce       | Alexander |
| David       | Alexander
```

### 3、内连接和左、右（外）连接

* 内连接：

  * 也就是满足等值连接或非等值连接的行。

    * ```sql
      SELECT employee_id,department_name
      FROM employees,departments
      WHERE employees.department_id=departments.department_id;
      #记录为106条 连接条件
      #SQL92语法实现内连接：见上，略
      #SQL99语法。。。。。：
      SELECT employee_id,department_name,city
      FROM employees JOIN [INNER] departments ON employees.department_id=departments.department_id JOIN locations ON dpartment.location_id=locations.location_id;
      ```

      

* 外连接(全外连接)：

  * 不满足等值连接或非等值连接的行

  * 分类：

    * 左外连接

      * 除了满足等值连接或非等值连接的行外，还返回左表中不满足连接条件的行（**FORM 的 表的 顺序确定 左右**）

      * ```sql
        #SQL92语法实现外连接：MYSQL不支持抱歉，但Orcle支持 内容如下
        SELECT employee_id,department_name
        FROM employees,departments
        WHERE employees.department_id=departments.department_id(+);#理解就是把腿增高
        #SQL99
        SELECT employee_id,department_name
        FROM employees LEFT [OUTER] JOIN departments
        ON employees.department_id=departments.department_id;
        ```

        

    * 右外连接

      * 除了满足等值连接或非等值连接的行外，还返回右表中不满足连接条件的行

    * 满外连接（全外连接）

      * 除了满足等值连接或非等值连接的行外，还返回左、右表中不满足连接条件的行

      * ```sql
        #SQL99 MySQL也不支持这种写法 ，但Oracle支持
        SELECT employee_id,department_name 
        FROM employees FULL [OUTER] JOIN departments
        ON employees.department_id=departments.department_id;
        ```



MySQL满外连接不支持怎么办？使用UNION 和 7种join组合

### 4、UNION 使用

**合并查询结果**

* 作用：

  * 利用UNION关键字，可以给出多条SELECT语句，并将他们的结果组合成单个结果集。

* 前提条件

  * 两个表对应的列数和数据类型必须相同，兵器相互对应
  * 各个SELECT语句之间使用UNION或UNION ALL 关键字分隔

* 语法格式

  * ```sql
    SELECT column，.. FROM table1
    UNION [ALL]
    SELECT column, ... FROM table2
    ```

* **UNION**

  * UNION操作符返回两个查询的结果集的并集，去除重复记录

* **UNION ALL**

  * 操作符返回两个查询的结果集的并集，不去重。（更纯粹）,效率更高



### 5、七种SQL JOINS的实现

SQL99语法：

![image-20221021161015142](MySql.assets\image-20221021161015142.png)

```sql
#中图 内连接 #106条
SELECT e.employee_id,p.department_name
FROM employees e JOIN departments p
ON e.department_id=p.department_id

#左上图 左外连接 #107
SELECT e.employee_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id

#右上图 右外连接 #122
SELECT e.employee_id,p.department_name
FROM employees e RIGHT JOIN departments p
ON e.department_id=p.department_id

#左图 A - A∩B # 1
SELECT e.employee_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id
WHERE p.department_id IS NULL
#或 WHERE e.department_id IS NULL

#右图 B - B∩A # 16
SELECT e.employee_id,p.department_name
FROM employees e RIGHT JOIN departments p
ON e.department_id=p.department_id
WHERE e.department_id IS NULL
-- WHERE p.department_id IS NULL 这为 0条 注意
为什么会这样呢？
一：看哪张表需要不满连接条件（也就是外连接）的记录
二：看连接键是这个表的主键还是外键
三：分辨：若没有外键的表需要不满连接条件的记录，则主键为NULL 记录也为0了（WHERE p.department_id IS NULL （像上面的一样	））

#左下图 全外连接
	#第一种方式 #123
	SELECT e.employee_id,p.department_name
	FROM employees e LEFT JOIN departments p
	ON e.department_id=p.department_id
	UNION
	SELECT e.employee_id,p.department_name
	FROM employees e RIGHT JOIN departments p
	ON e.department_id=p.department_id
	WHERE e.department_id IS NULL

	#第二种方式
	SELECT e.employee_id,p.department_name
	FROM employees e RIGHT JOIN departments p
	ON e.department_id=p.department_id
	UNION
	SELECT e.employee_id,p.department_name
	FROM employees e LEFT JOIN departments p
	ON e.department_id=p.department_id
	WHERE p.department_id IS NULL

-- 右下图 
#右下图 # 17
#左图 + 右图 A ∪B- A∩B 或者 (A - A∩B) ∪ （B - A∩B）
SELECT e.employee_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id
WHERE p.department_id IS NULL
UNION ALL #效率更高
SELECT e.employee_id,p.department_name
FROM employees e RIGHT JOIN departments p
ON e.department_id=p.department_id
WHERE e.department_id IS NULL
```

### 6、SQL99语法新特性

#### 6.1 自然连接

SQL99在SQL92的基础上提供了一些特殊语法，比如 ==NATURAL JOIN== 用来表示自然连接。我们可以把自然连接理解为SQL92中的等值连接。它会帮你自动查询两张连接表中 ==所有相同的字段==，然后进行==等值连接==

* 不足：
  * 多个连接条件就不太好了，可选性差。

* 在SQL92标准中：

  * ```sql
    SELECT employee_id,last_name,department_name
    FROM employees e JOIN departments d
    ON e.department_id = d.department_id
    AND e.manager_id = d.manager_id
    ```

* 在SQL99中你可以写成：

  * ```sql
    SELECT employee_id,last_name,department_name
    FROM employees e NATURAL JOIN departments d;
    ```

    

#### 6.2 USING 连接

* 指定数据表里的同名字段（同名列）进行等值连接。

* 前提条件：

  * 只能配合JOIN一起使用：

    ```sql
    SELECT employee_id,last_name,department_name
    FROM USING(department_id);
    ```

* 作用：
  * 简化==JOIN ON==的等值连接



### 7、表连接约束

* WHERE: 适用于所有关联查询
* ==ON==: 只能和JOIN一起使用，只能写关联条件。虽然关联条件可以放在WHERE中和其他条件一起写，但分开写可读性更好。
* USING: 
  * 只能和JOIN一起使用，而且要求两个关联字段在关联表中名称一致，而且只能表示关联字段值相等。

> 注意

我们要==控制连接表的数量==。多表连接就相当于嵌套for循环一样，非常消耗资源，会让SQL查询性能下降的很严重，因此不要连接不必要的表。在许多DBMS中，也都会有最大连接表的限制。



> 【强制】超过三个表禁止join。需要join的字段，**数据类型保持绝对一致**；多表关联查询时，保证被关联的字段需要有**索引**
>
> 说明：即使双表join也要注意表索引、SQL性能。
>
> 来源：阿里巴巴《Java开发手册》
>
> 性能原因：待处理

## 3、必要练习

```sql
#中图 内连接 #106条
SELECT e.employee_id,p.department_name
FROM employees e JOIN departments p
ON e.department_id=p.department_id

#左上图 左外连接 #107
SELECT e.employee_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id

#右上图 右外连接 #122
SELECT e.employee_id,p.department_name
FROM employees e RIGHT JOIN departments p
ON e.department_id=p.department_id

#左图 A - A∩B # 1
SELECT e.employee_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id
WHERE p.department_id IS NULL
#或 WHERE e.department_id IS NULL

#右图 B - B∩A # 16
SELECT e.employee_id,p.department_name
FROM employees e RIGHT JOIN departments p
ON e.department_id=p.department_id
WHERE e.department_id IS NULL
-- WHERE p.department_id IS NULL 这为 0条 注意
#左下图 全外连接
	#第一种方式 #123
	SELECT e.employee_id,p.department_name
	FROM employees e LEFT JOIN departments p
	ON e.department_id=p.department_id
	UNION
	SELECT e.employee_id,p.department_name
	FROM employees e RIGHT JOIN departments p
	ON e.department_id=p.department_id
	WHERE e.department_id IS NULL

	#第二种方式
	SELECT e.employee_id,p.department_name
	FROM employees e RIGHT JOIN departments p
	ON e.department_id=p.department_id
	UNION
	SELECT e.employee_id,p.department_name
	FROM employees e LEFT JOIN departments p
	ON e.department_id=p.department_id
	WHERE p.department_id IS NULL

-- 右下图 
#右下图 # 17
#左图 + 右图 A ∪B- A∩B 或者 (A - A∩B) ∪ （B - A∩B）
SELECT e.employee_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id
WHERE p.department_id IS NULL
UNION ALL #效率更高
SELECT e.employee_id,p.department_name
FROM employees e RIGHT JOIN departments p
ON e.department_id=p.department_id
WHERE e.department_id IS NULL




#显示所有员工的姓名，部门号和名称
SELECT CONCAT(e.first_name,e.last_name) emp_name,p.department_id,p.department_name
FROM employees e LEFT JOIN departments p
ON e.department_id=p.department_id


#查询90号部门员工的job_id和90号部门的location_id
SELECT e.job_id,d.location_id
FROM employees e JOIN departments d 
ON e.department_id=d.department_id
WHERE d.department_id=90

#选择所有有奖金的员工的last_name,department_name,location_id,city
SELECT e.last_name,d.department_name,l.location_id,l.city
FROM employees e LEFT JOIN departments d
ON 
e.department_id=d.department_id
LEFT JOIN locations l
ON
d.location_id=l.location_id
WHERE e.commission_pct IS NOT NULL

#选择city在Toronto工作的员工的last_name,job_id,department_id,department_name

SELECT e.last_name,job_id,d.department_id,d.department_name
FROM employees e  JOIN departments d
ON e.department_id=d.department_id
JOIN locations l
ON
d.location_id=l.location_id
WHERE
l.city='Toronto'
#sql 92
SELECT e.last_name,job_id,d.department_id,d.department_name
FROM employees e,departments d,locations l
WHERE e.department_id=d.department_id
AND d.location_id=l.location_id
AND l.city='Toronto'

#查询员工所在的部门名称，部门地址，姓名，工作，工资，其中员工所在部门名称为‘Executive’
SELECT d.department_name,l.street_address,CONCAT(e.first_name,e.last_name) emp_name,j.job_title,e.salary
FROM employees e RIGHT JOIN departments d#查询主对象是部门，这个部门可能没有人
ON e.department_id=d.department_id
LEFT JOIN locations l#可能这是假部门
ON d.location_id=l.location_id
LEFT JOIN jobs j#可能这员工被白嫖
ON e.job_id=j.job_id
WHERE d.department_name='Executive'

#选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格式
SELECT CONCAT(e.first_name,e.last_name),e.employee_id,CONCAT(m.first_name,m.last_name),m.employee_id
FROM employees e
LEFT JOIN employees m
ON e.manager_id=m.employee_id

#查询哪个部门没有员工 #可以子查询
SELECT d.* 
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id
WHERE 
e.department_id IS NULL

#查询哪个城市没有部门
SELECT * 
FROM locations l
LEFT JOIN 
departments d
ON 
l.location_id=d.location_id
WHERE
d.location_id IS NULL

#查询部门名为 Sales 或 IT 的员工信息
SELECT e.*
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE
d.department_name IN ('Sales','IT')

```





# 七、单行函数

函数是封装

* 分类
  * 定义角度
    * 内置函数
    * 自定义函数
  * 功能角度
    * 数值函数、字符串函数、日期和时间函数、流程控制函数、加解密函数、获取MySQL信息函数、聚合函数（或分组函数）等
  * 从函数定义结构角度
    * 单行函数
    * 聚合函数
  * 



1、不同DBMS函数的差异

​	我们在使用SQL语言的时候，不是直接和这门语言打交道，而是通过它使用不同的数据库软件，即DBMS。**DBMS之间的差异性很大，远大于同一个语言不同版本之间的差异**。实际上，只有很少的函数是被DBMS同时支持的。比如，大多数DBMS使用（||）或者（+）来做拼接符，而在MySQL中的字符串拼接函数为concat()。大部分DBMS会有自己特定的函数，这就意味着**采用SQL函数的代码可移植性很差的**，因此在使用函数的时候需要特别注意。



* 单行函数 
  * 操作数据对象 
  * 接受参数返回一个结果 
  * 只对一行进行变换 
  * 每行返回一个结果 
  * 可以嵌套 
  * 参数可以是一列或一个值

## 1、数值函数

### （1 基本函数

|       ABS(x)        |                        返回x的绝对值                         |
| :-----------------: | :----------------------------------------------------------: |
|       SIGN(X)       |          返回X的符号。正数返回1，负数返回-1，0返回0          |
|        PI()         |                        返回圆周率的值                        |
| CEIL(x)，CEILING(x) |          返回大于或等于某个值的最小整数 天花板 一样          |
|      FLOOR(x)       |             返回小于或等于某个值的最大整数 地板              |
|  LEAST(e1,e2,e3…)   |                      返回列表中的最小值                      |
| GREATEST(e1,e2,e3…) |                      返回列表中的最大值                      |
|      MOD(x,y)       |                      返回X除以Y后的余数                      |
|       RAND()        |                       返回0~1的随机值                        |
|       RAND(x)       | 返回0~1的随机值，其中x的值用作种子值，相同的X值会产生相同的随机 数 |
|      ROUND(x)       |        返回一个对x的值进行四舍五入后，最接近于X的整数        |
|     ROUND(x,y)      | 返回一个对x的值进行四舍五入后最接近X的值，并保留到小数点后面Y位 |
|    TRUNCATE(x,y)    |                 返回数字x截断为y位小数的结果                 |
|       SQRT(x)       |           返回x的平方根。当X的值为负数时，返回NULL           |
|     RADIANS(x)      |            将角度转化为弧度，其中，参数x为角度值             |
|     DEGREES(x)      |            将弧度转化为角度，其中，参数x为弧度值             |

```sql
SELECT
ABS(-123),ABS(32),SIGN(-23),SIGN(43),PI(),CEIL(32.32),CEILING(-43.23),FLOOR(32.32),
FLOOR(-43.23),MOD(12,5)
FROM DUAL;
```

![image-20221024095516313](MySql.assets\image-20221024095516313.png)

```sql
SELECT RAND(),RAND(),RAND(10),RAND(10),RAND(-1),RAND(-1)
FROM DUAL;

```

![image-20221024095556952](MySql.assets\image-20221024095556952.png)

```sql
SELECT
ROUND(12.33),ROUND(12.343,2),ROUND(12.324,-1),TRUNCATE(12.66,1),TRUNCATE(12.66,-1)
FROM DUAL;
```

![image-20221024095626009](MySql.assets\image-20221024095626009.png)

```sql
SELECT RADIANS(30),RADIANS(60),RADIANS(90),DEGREES(2*PI()),DEGREES(RADIANS(90))
FROM DUAL;
```

### （2 三角函数

| SIN(x)     | 返回x的正弦值，其中，参数x为弧度值                           |
| ---------- | ------------------------------------------------------------ |
| ASIN(x)    | 返回x的反正弦值，即获取正弦为x的值。如果x的值不在-1到1之间，则返回NULL |
| COS(x)     | 返回x的余弦值，其中，参数x为弧度值                           |
| ACOS(x)    | 返回x的反余弦值，即获取余弦为x的值。如果x的值不在-1到1之间，则返回NULL |
| TAN(x)     | 返回x的正切值，其中，参数x为弧度值                           |
| ATAN(x)    | 返回x的反正切值，即返回正切值为x的值                         |
| ATAN2(m,n) | 返回两个参数的反正切值                                       |
| COT(x)     | 返回x的余切值，其中，X为弧度值                               |

```sql
SELECT SIN(RADIANS(30)),DEGREES(ASIN(1)),TAN(RADIANS(45)),DEGREES(ATAN(1)),DEGREES(ATAN2(1,1) ) FROM DUAL;
```

![image-20221024100744221](MySql.assets\image-20221024100744221.png)

### （3 其他数学函数

| POW(x,y)，POWER(X,Y) |                    返回x的y次方 一样                     |
| :------------------: | :------------------------------------------------------: |
|        EXP(X)        |     返回e的X次方，其中e是一个常数，2.71828182845904      |
|    LN(X)，LOG(X)     | 返回以e为底的X的对数，当X <= 0 时，返回的结果为NULL 一样 |
|       LOG10(X)       |   返回以10为底的X的对数，当X <= 0 时，返回的结果为NULL   |
|       LOG2(X)        |       返回以2为底的X的对数，当X <= 0 时，返回NULL        |

```sql
mysql> SELECT POW(2,5),POWER(2,4),EXP(2),LN(10),LOG10(10),LOG2(4)
-> FROM DUAL;
+----------+------------+------------------+-------------------+-----------+---------+
| POW(2,5) | POWER(2,4) | EXP(2) | LN(10) | LOG10(10) | LOG2(4) |
+----------+------------+------------------+-------------------+-----------+---------+
| 32 | 16 | 7.38905609893065 | 2.302585092994046 | 1 | 2 |
+----------+------------+------------------+-------------------+-----------+---------+
1 row in set (0.00 sec)

```

### （4 进制转换函数

| BIN(x)        | 返回x的二进制编码             |
| ------------- | ----------------------------- |
| HEX(x)        | 返回x的十六进制编码           |
| OCT(x)        | 返回x的八进制编码             |
| CONV(x,f1,f2) | x进制由f1之指定，返回f2进制数 |

```sql
mysql> SELECT BIN(10),HEX(10),OCT(10),CONV(10,2,8)
-> FROM DUAL;
+---------+---------+---------+--------------+
| BIN(10) | HEX(10) | OCT(10) | CONV(10,2,8) |
+---------+---------+---------+--------------+
| 1010 | A | 12 | 2 |
+---------+---------+---------+--------------+
1 row in set (0.00 sec)
```

## 2、 字符串函数

|             ASCII(S)             |             返回字符串S中的第一个字符的ASCII码值             |
| :------------------------------: | :----------------------------------------------------------: |
|          CHAR_LENGTH(s)          |      返回字符串s的字符数。作用与CHARACTER_LENGTH(s)相同      |
|            LENGTH(s)             |              返回字符串s的字节数，和字符集有关               |
|     CONCAT(s1,s2,......,sn)      |               连接s1,s2,......,sn为一个字符串                |
|  CONCAT_WS(x, s1,s2,......,sn)   |                     x为分隔符，其他同上                      |
| NSERT(str, idx, len, replacestr) | 将字符串str从第idx位置开始，len个字符长的子串替换为字符串replacestr |
|        REPLACE(str, a, b)        |           用字符串b替换字符串str中所有出现的字符串           |
|       UPPER(s) 或 UCASE(s)       |               将字符串s的所有字母转成大写字母                |
|       LOWER(s) 或LCASE(s)        |               将字符串s的所有字母转成小写字母                |
|           LEFT(str,n)            |                 返回字符串str最左边的n个字符                 |
|           RIGHT(str,n)           |                 返回字符串str最右边的n个字符                 |
|       LPAD(str, len, pad)        |   用字符串pad对str最左边进行填充，直到str的长度为len个字符   |
|       RPAD(str ,len, pad)        |   用字符串pad对str最右边进行填充，直到str的长度为len个字符   |
|             LTRIM(s)             |                    去掉字符串s左侧的空格                     |
|             RTRIM(s)             |                    去掉字符串s右侧的空格                     |
|         TRIM(s1 FROM s)          |                  去掉字符串s开始与结尾的s1                   |
|     TRIM(LEADING s1 FROM s)      |                    去掉字符串s开始处的s1                     |
|     TRIM(LEADING s1 FROM s)      |                    去掉字符串s结尾处的s1                     |
|          REPEAT(str, n)          |                     返回str重复n次的结果                     |
|             SPACE(n)             |                         返回n个空格                          |
|          STRCMP(s1,s2)           |               比较字符串s1,s2的ASCII码值的大小               |
|       SUBSTR(s,index,len)        | 返回从字符串s的index位置其len个字符，作用与SUBSTRING(s,n,len)、 MID(s,n,len)相同 |
|        LOCATE(substr,str)        | 返回字符串substr在字符串str中首次出现的位置，作用于POSITION(substr IN str)、INSTR(str,substr)相同。未找到，返回0 |
|        ELT(m,s1,s2,…,sn)         | 返回指定位置的字符串，如果m=1，则返回s1，如果m=2，则返回s2，如 果m=n，则返回sn |
|       FIELD(s,s1,s2,…,sn)        |          返回字符串s在字符串列表中第一次出现的位置           |
|        FIND_IN_SET(s1,s2)        | 返回字符串s1在字符串s2中出现的位置。其中，字符串s2是一个以逗号分 隔的字符串 |
|            REVERSE(s)            |                     返回s反转后的字符串                      |
|      NULLIF(value1,value2)       | 比较两个字符串，如果value1与value2相等，则返回NULL，否则返回 value1 |

> 注意：MySQL中，字符串的位置是从1开始的。

```sql
SELECT FIELD('mm','hello','ssm','amma'),FIND_IN_SET('mm','hello,mm,amma'),
FIELD('mm','hello','mm','amma')
 FROM DUAL;
```

![image-20221024103828546](MySql.assets\image-20221024103828546.png)

```sql
mysql> SELECT NULLIF('mysql','mysql'),NULLIF('mysql', '');
+-------------------------+---------------------+
| NULLIF('mysql','mysql') | NULLIF('mysql', '') |
+-------------------------+---------------------+
| NULL | mysql |
+-------------------------+---------------------+
1 row in set (0.00 sec)
```



## 3、日期和时间函数

**参数 date、time、timeN 没有啥意思，日期、时间和日期时间 都行。嗷呜~**

#### 1、获取日期、时间

| 函数                                                         | 用法                            |
| ------------------------------------------------------------ | ------------------------------- |
| CURDATE() ，CURRENT_DATE()                                   | 返回当前日期，只包含年、 月、日 |
| CURTIME() ， CURRENT_TIME()                                  | 返回当前时间，只包含时、 分、秒 |
| NOW() / SYSDATE() / CURRENT_TIMESTAMP() / LOCALTIME() / LOCALTIMESTAMP() | 返回当前系统日期和时间          |
| UTC_DATE()                                                   | 返回UTC（世界标准时间） 日期    |
| UTC_TIME()                                                   | 返回UTC（世界标准时间） 时间    |

```sql
SELECT 
CURDATE(),CURRENT_DATE(),
CURTIME(),CURRENT_TIME(),
NOW() , SYSDATE() , CURRENT_TIMESTAMP() , LOCALTIME() ,LOCALTIMESTAMP() ;
```

![image-20221024104715888](MySql.assets\image-20221024104715888.png)

#### 2、日期与时间戳的转换

| 函数                     | 用法                                                         |
| ------------------------ | ------------------------------------------------------------ |
| UNIX_TIMESTAMP()         | 以UNIX时间戳的形式返回当前时间。SELECT UNIX_TIMESTAMP() - >1634348884 |
| UNIX_TIMESTAMP(date)     | 将时间date以UNIX时间戳的形式返回。                           |
| FROM_UNIXTIME(timestamp) | 将UNIX时间戳的时间转换为普通格式的时间                       |



```sql
mysql> SELECT
    -> UNIX_TIMESTAMP(),UNIX_TIMESTAMP(NOW()),FROM_UNIXTIME(UNIX_TIMESTAMP())  ;
+------------------+-----------------------+---------------------------------+
| UNIX_TIMESTAMP() | UNIX_TIMESTAMP(NOW()) | FROM_UNIXTIME(UNIX_TIMESTAMP()) |
+------------------+-----------------------+---------------------------------+
|       1666579958 |            1666579958 | 2022-10-24 10:52:38             |
+------------------+-----------------------+---------------------------------+
1 row in set (0.00 sec)
```

#### 3、获取月份、星期、星期数、天数等函数

| 函数                                     | 用法                                             |
| ---------------------------------------- | ------------------------------------------------ |
| YEAR(date) / MONTH(date) / DAY(date)     | 返回具体的日期值                                 |
| HOUR(time) / MINUTE(time) / SECOND(time) | 返回具体的时间值                                 |
| MONTHNAME(date)                          | 返回月份：January，..                            |
| DAYNAME(date)                            | 返回星期几：MONDAY，TUESDAY.....SUNDAY           |
| WEEKDAY(date)                            | 返回周几，注意，周1是0，周2是1，。。。周日是6    |
| QUARTER(date）                           | 返回日期对应的季度，范围为1～4                   |
| WEEK(date) ， WEEKOFYEAR(date)           | 返回一年中的第几周                               |
| DAYOFYEAR(date)                          | 返回日期是一年中的第几天                         |
| DAYOFMONTH(date)                         | 返回日期位于所在月份的第几天                     |
| DAYOFWEEK(date)                          | 返回周几，注意：周日是1，周一是2，。。。周六是 7 |



```sql
SELECT YEAR(CURDATE()),MONTH(CURDATE()),DAY(CURDATE()),
HOUR(CURTIME()),MINUTE(NOW()),SECOND(SYSDATE())
FROM DUAL;
```

![image-20221024105704827](MySql.assets\image-20221024105704827.png)

```sql
SELECT MONTHNAME('2021-10-26'),DAYNAME('2021-10-26'),WEEKDAY('2021-10-26'),
QUARTER(CURDATE()),WEEK(CURDATE()),DAYOFYEAR(NOW()),
DAYOFMONTH(NOW()),DAYOFWEEK(NOW())
FROM DUAL;
```

![image-20221024105729525](MySql.assets\image-20221024105729525.png)



| 函数                    | 用法                                       |
| ----------------------- | ------------------------------------------ |
| EXTRACT(type FROM date) | 返回指定日期中特定的部分，type指定返回的值 |

![image-20221024105908067](MySql.assets\image-20221024105908067.png)

```sql
mysql> SELECT EXTRACT(MINUTE FROM NOW()),EXTRACT( WEEK FROM NOW());
+----------------------------+---------------------------+
| EXTRACT(MINUTE FROM NOW()) | EXTRACT( WEEK FROM NOW()) |
+----------------------------+---------------------------+
|                         59 |                        43 |
+----------------------------+---------------------------+


mysql> SELECT EXTRACT( QUARTER FROM NOW()),EXTRACT( MINUTE_SECOND FROM NOW());
+------------------------------+------------------------------------+
| EXTRACT( QUARTER FROM NOW()) | EXTRACT( MINUTE_SECOND FROM NOW()) |
+------------------------------+------------------------------------+
|                            4 |                                5941 |
+------------------------------+------------------------------------+
1 row in set (0.00 sec)
```

#### 4、时间和秒钟转换的函数

| 函数                 | 用法                                          |
| -------------------- | --------------------------------------------- |
| TIME_TO_SEC(time)    | 将 time 转化为秒并返回结果值。                |
| SEC_TO_TIME(seconds) | 将 seconds 描述转化为包含小时、分钟和秒的时间 |

```sql
| TIME_TO_SEC(NOW()) |
+--------------------+
| 78774 |
+--------------------+
1 row in set (0.00 sec)
```



```sql
mysql> SELECT SEC_TO_TIME(78774);
+--------------------+
| SEC_TO_TIME(78774) |
+--------------------+
| 21:52:54 |
+--------------------+
1 row in set (0.12 sec)
 
```

#### 5、计算时间间隔函数

##### **第一组**

| 函数                                                         | 用法                                 |
| ------------------------------------------------------------ | ------------------------------------ |
| DATE_ADD(datetime, INTERVAL expr type)， ADDDATE(date,INTERVAL expr type) | 返回date与INTERVAL指定的时间间隔的和 |
| DATE_SUB(date,INTERVAL expr type)， SUBDATE(date,INTERVAL expr type) | 返回date与INTERVAL指定的时间间隔的差 |

![image-20221024112052333](MySql.assets\image-20221024112052333.png)



```sql
mysql> SELECT ADDDATE('2021-10-21 23:32:12',INTERVAL 1 SECOND) AS col3,
    -> DATE_ADD('2021-10-21 23:32:12',INTERVAL '1_1' MINUTE_SECOND) AS col4,
    -> DATE_ADD(NOW(), INTERVAL -1 YEAR) AS col5, #可以是负数
    -> DATE_ADD(NOW(), INTERVAL '1_1' YEAR_MONTH) AS col6 #需要单引号
    -> FROM DUAL;
+---------------------+---------------------+---------------------+---------------------+
| col3                | col4                | col5                | col6                |
+---------------------+---------------------+---------------------+---------------------+
| 2021-10-21 23:32:13 | 2021-10-21 23:33:13 | 2021-10-24 11:19:52 | 2023-11-24 11:19:52 |
+---------------------+---------------------+---------------------+---------------------+
1 row in set (0.00 sec)


mysql> SELECT DATE_SUB('2021-01-21',INTERVAL 31 DAY) AS col1,
    -> SUBDATE('2021-01-21',INTERVAL 31 DAY) AS col2,
    -> DATE_SUB('2021-01-21 02:01:01',INTERVAL '1 1' DAY_HOUR) AS col3
    -> FROM DUAL;
+------------+------------+---------------------+
| col1       | col2       | col3                |
+------------+------------+---------------------+
| 2020-12-21 | 2020-12-21 | 2021-01-20 01:01:01 |
+------------+------------+---------------------+
1 row in set (0.00 sec)
```

##### **第二组** 存在部分其他函数

| 函数                         | 用法                                                         |
| ---------------------------- | ------------------------------------------------------------ |
| ADDTIME(time1,time2)         | 返回time1加上time2的时间。当time2为一个数字时，代表的是 秒 ，可以为负数 |
| SUBTIME(time1,time2)         | 返回time1减去time2后的时间。当time2为一个数字时，代表的 是 秒 ，可以为负数 |
| DATEDIFF(date1,date2)        | 返回date1 - date2的日期间隔天数                              |
| TIMEDIFF(time1, time2)       | 返回time1 - time2的时间间隔，单位是时间                      |
| FROM_DAYS(N)                 | 返回从0000年1月1日起，N天以后的日期                          |
| TO_DAYS(date)                | 返回日期date距离0000年1月1日的天数                           |
| LAST_DAY(date)               | 返回date所在月份的最后一天的日期                             |
| MAKEDATE(year,n)             | 针对给定年份与所在年份中的天数返回一个日期                   |
| MAKETIME(hour,minute,second) | 将给定的小时、分钟和秒组合成时间并返回                       |
| PERIOD_ADD(time,n)           | 返回time加上n后的时间                                        |

```sql
SELECT
ADDTIME(NOW(),20),SUBTIME(NOW(),30),SUBTIME(NOW(),'1:1:3'),DATEDIFF(NOW(),'2021-10-
01'),
TIMEDIFF(NOW(),'2021-10-25 22:10:10'),FROM_DAYS(366),TO_DAYS('0000-12-25'),
LAST_DAY(NOW()),MAKEDATE(YEAR(NOW()),12),MAKETIME(10,21,23),PERIOD_ADD(20200101010101,
10)
FROM DUAL;
```

```sql
mysql> SELECT ADDTIME(NOW(), 50);
+---------------------+
| ADDTIME(NOW(), 50) |
+---------------------+
| 2019-12-15 22:17:47 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBTIME(NOW(), '1:1:1');
+-------------------------+
| SUBTIME(NOW(), '1:1:1') |
+-------------------------+
| 2019-12-15 21:23:50 |
+-------------------------+
1 row in set (0.00 sec)


mysql> SELECT SUBTIME(NOW(), '-1:-1:-1');
+----------------------------+
| SUBTIME(NOW(), '-1:-1:-1') |
+----------------------------+
| 2019-12-15 22:25:11 |
+----------------------------+
1 row in set, 1 warning (0.00 sec)

mysql> SELECT FROM_DAYS(366);
+----------------+
| FROM_DAYS(366) |
+----------------+
| 0001-01-01 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT MAKEDATE(2020,1);
+------------------+
| MAKEDATE(2020,1) |
+------------------+
| 2020-01-01 |
+------------------+
1 row in set (0.00 sec)

mysql> SELECT MAKEDATE(2020,32);
+-------------------+
| MAKEDATE(2020,32) |
+-------------------+
| 2020-02-01 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT MAKETIME(1,1,1);
+-----------------+  
| MAKETIME(1,1,1) |
+-----------------+
| 01:01:01 |
+-----------------+
1 row in set (0.00 sec)

SELECT PERIOD_ADD(20200101010101,1);
| PERIOD_ADD(20200101010101,1) |
+------------------------------+
| 20200101010102 |
+------------------------------+
1 row in set (0.00 sec)

mysql> SELECT TO_DAYS(NOW());
+----------------+
| TO_DAYS(NOW()) |
+----------------+
| 737773 |
+----------------+
1 row in set (0.00 sec)
```

举例：查询 7 天内的新增用户数有多少？

```sql
SELECT COUNT(*) as num FROM new_user WHERE TO_DAYS(NOW())-TO_DAYS(regist_time)<=7
```



#### 6、日期的格式化与解析

| 函数                              | 用法                                       |
| --------------------------------- | ------------------------------------------ |
| DATE_FORMAT(date,fmt)             | 按照字符串fmt格式化日期date值              |
| TIME_FORMAT(time,fmt)             | 按照字符串fmt格式化时间time值              |
| GET_FORMAT(date_type,format_type) | 返回日期字符串的显示格式                   |
| STR_TO_DATE(str,fmt)              | 按照字符串fmt对str进行解析，解析为一个日期 |

上述 ==非GET_FORMAT==函数中fmt参数常用的格式符：

| 格式符 | 说明                                                    | 格式符 | 说明                                                      |
| ------ | ------------------------------------------------------- | ------ | --------------------------------------------------------- |
| %Y     | 4位数字表示年份                                         | %y     | 表示两位数字表表示年份                                    |
| %M     | 月名表示月份（January，....）                           | %m     | 两位数字表示月份（01，02，03,....）                       |
| %b     | 缩写的月名（Jan,Feb,....)                               | %c     | 数字表示月份（1，2，3...)                                 |
| %D     | 英文后缀表示月中的天数（1st,2nd,3rd,...）               | %d     | 两位数字表示月中的天数（01,02）                           |
| %e     | 数字形式表示月中的天数（1,2,3,4,5）                     |        |                                                           |
| %H     | 24小时制（01，02）                                      | %h和%I | 12小时制（01,02..）                                       |
| %k     | 数字形式的小时，24小时制（1,2,3）                       | %l     | 数字形式表示小时，12小时制                                |
| %i     | 两位数字表示分钟                                        | %S和%s | 两位数字表示秒                                            |
| %w     | 以数字表示周中的天数（0=Sunday,1=Monday)                |        |                                                           |
| %j     | 以3位数字表示年中的天数（001,002...)                    | %U     | 以数字表示年终的第几周，（1，2，3）其中Sunday为周中第一天 |
| %u     | 以数字表示年中的第几周（1，2，3）其中Monday为周中第一天 |        |                                                           |
| %T     | 24小时制                                                | %r     | 12小时制                                                  |
| %p     | AM或PM                                                  | %%     | 表示%                                                     |

GET_FORMAT函数中date_type和format_type参数取值如下：

![image-20221024133306358](MySql.assets\image-20221024133306358.png)

![image-20221024133246325](MySql.assets\image-20221024133246325.png)

## 4、流程控制函数

| 函数                                                         | 用法                                          |
| ------------------------------------------------------------ | --------------------------------------------- |
| IF(value,value1,value2)                                      | 如果value的值返回value1，否则返回value2       |
| IFNULL(value1,value2)                                        | 如果value1不为NULL,返回value1，否则返回value2 |
| CASE WHEN 条件1 THEN 结果1 WHEN 条件2 结果2 ... [ELSE 结果值] END | 相当于java的else if语句                       |
| CASE expr WHEN 常量值1 THEN 结果值1 WHEN 常量值2 THEN 结果值2 ... [ELSE 值n] END | 相当于java的switch语句                        |

```sql
SELECT IF(1 > 0,'正确','错误')
->正确
SELECT IFNULL(null,'Hello Word')
->Hello Word

SELECT CASE
WHEN 1 > 0
THEN '1 > 0'
WHEN 2 > 0
THEN '2 > 0'
ELSE '3 > 0'
END
->1 > 0

SELECT CASE 1
WHEN 1 THEN '我是1'
WHEN 2 THEN '我是2'
ELSE '你是谁'

```

```sql
SELECT employee_id,salary, CASE WHEN salary>=15000 THEN '高薪'
WHEN salary>=10000 THEN '潜力股'
WHEN salary>=8000 THEN '屌丝'
ELSE '草根' END "描述"
FROM employees;
```

```sql
SELECT oid,`status`, CASE `status` WHEN 1 THEN '未付款'
WHEN 2 THEN '已付款'
WHEN 3 THEN '已发货'
WHEN 4 THEN '确认收货'
ELSE '无效订单' END
FROM t_order;

mysql> SELECT CASE WHEN 1 > 0 THEN 'yes' WHEN 1 <= 0 THEN 'no' ELSE 'unknown' END;
+---------------------------------------------------------------------+
| CASE WHEN 1 > 0 THEN 'yes' WHEN 1 <= 0 THEN 'no' ELSE 'unknown' END |
+---------------------------------------------------------------------+
| yes                                                                 |
+---------------------------------------------------------------------+
1 row in set (0.01 sec)
```

计算工资（细节就是为null的换成0）

```sql
SELECT employee_id,12 * salary * (1 + IFNULL(commission_pct,0))
FROM employees;
```

练习：**查询部门号为 10,20, 30 的员工信息, 若部门号为 10, 则打印其工资的 1.1 倍, 20 号部门, 则打印其 工资的 1.2 倍, 30 号部门打印其工资的 1.3 倍数，其他部门1.4倍。**

```sql
SELECT e.first_name,CASE e.department_id 
WHEN 10 THEN 1.1*e.salary
WHEN 20 THEN 1.2*e.salary
WHEN 30 THEN 1.3*e.salary
ELSE 1.4*e.salary 
END details
FROM 
employees e 
WHERE
e.department_id IN (10,20,30);
```

## 5、加密与解密函数

| 函数                        | 用法                                                         |
| --------------------------- | ------------------------------------------------------------ |
| PASSWORD(str)               | 返回字符串str的加密版本，41位长的字符串，加密结果==不可逆==，常用于用户的密码加密==MYSQL8 no_support== |
| MD5(str)                    | 返回字符串str的md5加密后的值，也是一种加密方式。若参数为 NULL，则会返回NULL |
| SHA(str)                    | 从原明文密码str计算并返回加密后的密码字符串，当参数为 NULL时，返回NULL。 ==SHA加密算法比MD5更加安全 。== |
| ENCODE(value,password_seed) | 返回使用password_seed作为加密串加密value==MYSQL8 no_support== |
| DECODE(value,password_seed) | 返回使用password_seed作为加密串解密value ==MYSQL8 no_support== |

## 6、MySQL信息函数

| 函数                                                | 用法                                                     |
| --------------------------------------------------- | -------------------------------------------------------- |
| VERSION()                                           | 返回当前版本号                                           |
| CONNECTION_ID()                                     | 返回当前MySQL服务器的连接数                              |
| USER(),CURRENT_USER()、SYSTEM_USER()\SESSION_USER() | 返回当前连接MySQL的用户名，返回结果格式为“主机名@用户名” |
| CHARSET(value)                                      | 返回字符串value自变量的字符集                            |
| COLLATION(value)                                    | 返回字符串value的比较规则                                |



```sql
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| test |
+------------+
1 row in set (0.00 sec)

mysql> SELECT USER(), CURRENT_USER(), SYSTEM_USER(),SESSION_USER();
+----------------+----------------+----------------+----------------+
| USER() | CURRENT_USER() | SYSTEM_USER() | SESSION_USER() |
+----------------+----------------+----------------+----------------+
| root@localhost | root@localhost | root@localhost | root@localhost |
+----------------+----------------+----------------+----------------+

mysql> SELECT CHARSET('ABC');
+----------------+
| CHARSET('ABC') |
+----------------+
| utf8mb4 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT COLLATION('ABC');
+--------------------+
| COLLATION('ABC') |
+--------------------+
| utf8mb4_general_ci |
+--------------------+
1 row in set (0.00 sec)
```

## 7、其他函数

| 函数                           | 用法                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| FORMAT(value,n)                | 返回对数字value进行格式化后的结果数据。n表示==四舍五入==后保留到小数点后n位 |
| CONV(vale,from,to)             | 将value的值进行不同进制之间的转换                            |
| INET_ATON(ipvalue)             | 将以点分隔的IP地址转化位一个数字                             |
| INET_NOTOA(value)              | 将数字形式的IP地址转化为以点分隔的IP地址                     |
| BENCHMARK(n,expr)              | 将表达式expr重复执行n次。用于测试MySQL处理expr表达式所耗费的时间 |
| CONVERT(value USING char_code) | 将value所使用的字符编码修改为char_code                       |

# 八、聚合函数

* why
  * 聚合函数作用于一组数据，并对一组数据返回一个值。

* 语法
  * 





## 1、常用聚合函数

* AVG/SUM

  * 只是用于数值类型的字段（或变量）：

  * ```SQL
    SELECT AVG（salary）,SUM(salary),AVG(salary)*107
    FROM employees;
    
    ```

  * 如果是其他类型的，就没有什么意义：

  * ```sql
    SELECT SUM(last_name),AVG(last_name),SUM(hire_date)
    FROM
    employees;
    
    虽然会有结果：
    0,0,数字,
    ```

* MAX/MIN

  * 适用于数值、字符串类型、日期时间类型的字段（或变量）

    * ```sql
      SELECT MAX (last_name),MAX(salary),MIN(salary)
      FROM employees;
      ```

* COUNT  

  * 作用：计算指定字段在查询结果中出现的个数

  * ```sql
    
    SELECT COUNT(employee_id),COUNT(*),COUNT(1),COUNT(2),COUNT(commission_pct)
    FROM 
    employees;
    
    +--------------------+----------+----------+----------+-----------------------+
    | COUNT(employee_id) | COUNT(*) | COUNT(1) | COUNT(2) | COUNT(commission_pct) |
    +--------------------+----------+----------+----------+-----------------------+
    |                107 |      107 |      107 |      107 |                    35 |
    +--------------------+----------+----------+----------+-----------------------+
    ```

  * 怎么选取好呢？

    * **应选取COUNT(1)、COUNT(*)，**选取指定字段有可能某条记录该字段为NULL不被记录。
    * count(*)会统计值为 NULL 的行，而 count(列名)不会统计此列为 NULL 值的行。

  * 原理：

    * COUNT(1)一行记录封装成1对象
    * COUNT(*)对一行记录封装成`*`对象

* 总下结：
  * 从count引入的问题我们可知，AVG/SUM/MIN/MAX选取字段可能会产生的非预期的结果。他们都会无视或忽略NULL
  
  * ```sql
    SELECT AVG(manager_id),SUM(manager_id)/COUNT(manager_id),SUM(manager_id)/COUNT(*),COUNT(manager_id),COUNT(*),MIN(manager_id),MAX(manager_id)
    FROM
    employees
    ```
  
    

## 2、GROUP BY

* 作用：

  * 将表中的数据分成若干组

* 语法：

  * ```sql
    SELECT column,group_function(column)
    FROM table
    [WHERE condition]
    [GROUP BY gourp_by_expression]
    [ORDER BY column];
    ```

* 结论：

  1. SELECT中出现的非组函数的字段必须声明在group by 中
  2. group by 声明在 select、where后面，order by前面，limit则在order by后面。
  3. MySQL中GOURP BY中使用WITH ROLLUP,把整个数据看成一组进行计算，并加入结果集中
  4. with rollup 与 order by 相互排斥







```sql
#需求：查询各个部门的平均工资，最高工资
SELECT department_id,AVG(IFNULL(salary,0)),MAX(salary)
FROM employees
GROUP BY
department_id;

#需求：查询各个job_id的平均工资
SELECT job_id,AVG(IFNULL(salary,0))
FROM employees
GROUP BY
job_id;

#需求：查询各个department_id,job_id的平均工资
SELECT department_id,job_id,AVG(salary)
FROM employees
GROUP BY job_id,department_id
#方式2
SELECT department_id,job_id,AVG(salary)
FROM employees
GROUP BY department_id,job_id
#过程不一样，结果一样

#这样是错误的，job_id有很多
#结论1：
#SELECT中出现的非组函数的字段必须声明在group by 中
SELECT department_id,job_id,AVG(salary)
FROM employees
GROUP BY department_id;

#结论2：group by 声明在 select、where后面，order by前面，limit则在order by后面。
#结论3：MySQL中GOURP BY中使用WITH ROLLUP,把整个数据看成一组进行计算，并加入结果集中
SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id WITH ROLLUP;

#以下语句错误
SELECT department_id,AVG(salary) avg_sal
FROM employees
GROUP BY department_id WITH ROLLUP
ORDER BY avg_sal ASC;

#结论4：with rollup 与 order by 相互排斥
#
```

## 3、HAVING

* 作用

  * 过滤 分好的组

* 结论

  * 行已经被分组

  * HAVING不能单独使用，必须要跟GROUP BY 一起使用(当然也可以 但意义不大)

  * 过滤条件中有聚合函数 

  * HAVING与WHERE对比

    * | WHERE  | 先筛选数据再关联，执行效率高 | 不能使用分组中的计算函数进行筛选       |
      | ------ | ---------------------------- | -------------------------------------- |
      | HAVING | 可以使用分组中的计算函数     | 在最后的结果集中进行筛选，执行效率较低 |



```sql
#查询各个部门中最高工资比10000高得部门信息

SELECT department_id,MAX(salary)
FROM employees 
GROUP BY department_id
HAVING MAX(salary)>10000


#练习： 查询部门id为10,20,30,40这个部门中最高工资比10000高得部门信息
#方式一：
SELECT department_id,MAX(salary)
FROM employees
WHERE department_id IN (10,20,30,40)
GROUP BY department_id
HAVING MAX(salary) > 10000;
#方式二：
SELECT department_id,MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000 AND department_id IN (10,20,30,40);

#结论：
#当过滤条件中没有聚合函数时，
#则此过滤条件声明在WHERE中或HAVING中都可以
#效率选第一种方式

#where与having对比
#1. having使用范围更广。
#2. 如果过滤条件中没有聚合函数：这种情况下，where的执行效率要高于having
```

## 4、SELECT的执行过程

* sql92语法

  * ```SQL
    SELECT ....,...., (存在聚合函数)
    FROM ...,...,...,
    WHERE 多表的连接条件 AND 不包含聚合函数的过滤条件
    GROUP BY ...,...,...
    HAVING 包含聚合函数的过滤条件
    ORDER BY ...,...(ASC / DESC)
    LIMIT ....
    
    ```

* sql99语法

  * ```sql
    #流程2
    SELECT ... (存在聚合函数)
    #流程1
    FROM ... (LEFT RIGHT)JOIN ... ON 多表的连接条件
    (LEFT RIGHT)JOIN ... ON 多表的连接条件
    WHERE 不包含聚合函数的过滤条件
    #流程3
    GROUP BY ...
    HAVING 包含聚合函数的过滤条件
    ORDER BY ...,...(ASC / DESC)
    LIMIT ...
    ```

    

* 语句执行过程：
  * FROM -> ON -> (LEFT /RIGHT) JOIN ->WHERE ->GROUP BY -> HAVING ->SELECT ->DISTINCT-> ORDER BY (ASC /DESC)-> LIMIT 

## 5、操练

```sql
#1.where子句可否使用组函数进行过滤?
#答：不能，因为WHERE先于GROUP BY 执行

#2.查询公司员工工资的最大值，最小值，平均值，总和
SELECT MAX(salary) max_sal,MIN(salary) max_sal,AVG(salary) max_sal,SUM(salary) max_sal
FROM employees;

#3.查询各job_id的员工工资的最大值，最小值，平均值，总和
SELECT job_id,MAX(salary),MIN(salary),AVG(salary),SUM(salary)
FROM employees
GROUP BY job_id;

#4.选择具有各个job_id的员工人数
SELECT job_id,COUNT(*)
FROM employees
GROUP BY job_id

# 5.查询员工最高工资和最低工资的差距（DIFFERENCE）
SELECT MAX(salary)-MIN(salary) `DIFFERENCE`
FROM employees;

# 6.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，没有管理者的员工不计算在内
SELECT manager_id,MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >=6000;

# 7.查询所有部门的名字，location_id，员工数量和平均工资，并按平均工资降序
SELECT d.department_name,d.location_id,COUNT(e.`employee_id`),AVG(e.salary)
FROM employees e RIGHT JOIN departments d
ON e.`department_id`=d.department_id
GROUP BY department_name
ORDER BY salary DESC

# 8.查询每个工种(job_id)、每个部门的部门名、工种名和最低工资
SELECT d.department_name,e.job_id,MIN(e.salary)
FROM employees e RIGHT JOIN departments d
ON e.`department_id`=d.`department_id`
GROUP BY d.`department_name`,e.job_id

```

# 九、子查询

​	子查询又称嵌套查询，子查询指一个查询语句嵌套在另一个查询语句内部的查询，这个特性从MySQL 4.1开始引入。类似嵌套for循环。

## 1、介绍

### 1. 实际问题

![image-20221104093551739](MySql.assets\image-20221104093551739.png)

```sql

#方式一
SELECT salary
FROM employees
WHERE last_name='_Abel';

SELECT last_name
FROM employees
WHERE salary > 11000;

#方式二 自连接 快慢待处理
SELECT e2.last_name
FROM employees e1,employees e2
WHERE e1.`last_name`='_Abel'
AND
e2.salary > e1.`salary`
#方式二 自连接 快慢待处理
SELECT e2.last_name
FROM employees e1 JOIN employees e2

ON
e2.salary > e1.`salary`
WHERE e1.`last_name`='_Abel'

#方式三 子查询
SELECT last_name
FROM employees
WHERE salary > (
		SELECT salary
		FROM employees
		WHERE last_name='_Abel'
);


```

**问题：**子查询和子连接谁好？

**解答：**自连接方式好！ 

题目中可以使用子查询，也可以使用自连接。一般情况建议你使用自连接，因为在许多 DBMS 的处理过 程中，对于自连接的处理速度要比子查询快得多。 

可以这样理解：子查询实际上是通过未知表进行查询后的条件判断，而自连接是通过已知的自身数据表 进行条件判断，因此在大部分 DBMS 中都对自连接处理进行了优化。

### 2. 称谓规范与分类

* 外查询（或主查询）、内查询（或子查询）
* 从子查询结果数量进行分类
  * 单行子查询
  * 多行子查询
* 从内外关系角度进行分类：
  * 关联子查询
    * 外内查询类似于变量xy的自变量因变量。
  * 非关联子查询

### 3. 子查询的基本使用

* 子查询基本语法结构

  * ![image-20221104095748922](MySql.assets\image-20221104095748922.png)

* 子查询（内查询）在主查询之前一次执行完成。

* 子查询的结果被主查询（外查询）使用

* 注意事项

  * 子查询要包含在括号内（可读性好）
  * 将子查询放在比较条件的右侧（可读性好）
  * 单行操作符对应单行子查询，多行操作符对应多行子查询、单行子查询（规定，不然报错）

* 单行子查询操作符

  * | 操作符 | 含义                     |
    | ------ | ------------------------ |
    | =      | equal to                 |
    | >      | greater than             |
    | >=     | greater than or equal to |
    | <      | less than                |
    | <=     | less than or equal to    |
    | <>     | not equal to             |

* 多行子查询操作符

* | 操作符 | 含义                                                       |
  | ------ | ---------------------------------------------------------- |
  | IN     | 等于列表中的任意一个                                       |
  | ANY    | 需要和单行比较操作符一起使用，和子查询返回的某一个值比较   |
  | ALL    | 需要和单行比较操作符一起使用，和子查询返回的所有值进行比较 |
  | SOME   | 等价 ALL 常用 ALL                                          |

## 2、单行子查询

```sql
 
#查询工资大于149号员工工资的员工的信息
 SELECT employee_id,last_name
 FROM 
 employees
 WHERE salary >(
	SELECT salary 
	FROM employees
	WHERE employee_id=149
	
 )
#返回job_id与141号员工相同，salary比143号员工多的员工姓名，job_id和工资

SELECT last_name,job_id,salary
FROM employees
WHERE job_id=(
	SELECT job_id 
	FROM employees
	WHERE employee_id=141
)
AND
salary > (
	SELECT salary
	FROM employees
	WHERE employee_id=143
)
AND employee_id NOT IN(174,141);


#返回公司工资最少的员工的last_name,job_id和salary (注意结果员工是多个)
#这是错的 group by 中没包含 last_name,job_id
#select last_name,job_id,min(salary)
#from employees

SELECT last_name,job_id,salary
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees

)
#查询与141号员工的manager_id和department_id相同的其他员工的employee_id，
#manager_id，department_id
#方式一 条件更改灵活
SELECT employee_id,manager_id,department_id
FROM employees
WHERE 
manager_id=(
	SELECT manager_id
	FROM employees
	WHERE employee_id=141
)
AND
department_id=(
	SELECT department_id
	FROM employees
	WHERE employee_id=141
)
AND
employee_id != 141

#方式二 效率好一点点 
SELECT employee_id,manager_id,department_id
FROM employees
WHERE 
(manager_id,department_id)=(
			SELECT manager_id,department_id
			FROM employees
			WHERE employee_id=141
			)
AND
employee_id != 141

```

### 2.1、HAVING中的子查询

```sql
SELECT department_id,MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) >(
		SELECT MIN(salary)
		FROM employees
		WHERE department_id=110
		)
		
```

### 2.2、case中的子查询

```sql
#显式员工的employee_id,last_name和location。其中，若员工department_id与location_id为1800
#的department_id相同，则location为’Canada’，其余则为’USA’。
SELECT employee_id,last_name,
				(
					CASE department_id
					WHEN
					(	
						SELECT department_id
						FROM departments
						WHERE 
						location_id=1800
					) 
					THEN 'Canada'
					ELSE 'USA' END 
				)
				"location"
FROM employees;
```

### 2.3 单行子查询空值问题

```sql
#子查询中的空值问题
SELECT last_name, job_id
FROM employees
WHERE job_id =
#没有值
(SELECT job_id
FROM employees
WHERE last_name = 'Haas');

SELECT last_name, job_id
FROM employees
WHERE job_id =
#为NULL值。
(SELECT NULL);

#结果都是没有值。
```

### 2.4、非法子查询

```sql
SELECT employee_id, last_name
FROM employees
WHERE salary =
(SELECT MIN(salary)
FROM employees
GROUP BY department_id);

#结果
错误代码： 1242
Subquery returns more than 1 row
#修改：单行操作符对应单行结果集
```

## 3、多行子查询

* 也称为集合比较子查询
* 内查询返回多行
* 使用多行比较操作符

```sql
#返回其它job_id中比job_id为‘IT_PROG’工号 任一 工资低的员工的员工号、姓名、job_id 以及salary
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ANY (
	SELECT salary FROM employees
	WHERE job_id='IT_PROG'
)
AND 
job_id <> 'IT_PROG'

#返回其它job_id中比job_id为‘IT_PROG’工号 所有 工资低的员工的员工号、姓名、job_id 以及salary
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ALL (
	SELECT salary FROM employees
	WHERE job_id='IT_PROG'
)
AND 
job_id <> 'IT_PROG'

#查询平均工资最低的部门id

#MySQL中聚合函数是不能嵌套的，Oracle可以
#可以封装成表在进行嵌套，如方式一
#下面的语句是错误的哦
#select min(avg(salary)
#from employees
#group by employee_id
SELECT department_id
FROM employees
GROUP BY department_id


#方式一 
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) =(
	SELECT MIN(tmp.avg_sal)
	FROM (

		SELECT AVG(salary) avg_sal
		FROM employees
		WHERE department_id IS NOT NULL
		GROUP BY
		department_id
		
	) tmp
	
)

#方式二
SELECT department_id
FROM employees
GROUP BY department_id
HAVING
AVG(salary) <= ALL (

		SELECT AVG(salary)
		FROM employees
		WHERE department_id IS NOT NULL
		GROUP BY
		department_id
		
	)

```

### 3.1 多行子查询空值问题

```sql
#多行子查询空值为题
SELECT last_name
FROM employees
WHERE employee_id NOT IN (
#内查询存在NULL值
SELECT manager_id
FROM employees
);
#结果为没有值


SELECT last_name
FROM employees
WHERE employee_id NOT IN (
#内查询没有值。
SELECT manager_id
FROM employees
WHERE last_name='panties'
);

#结果等于 SELECT last_name FROM employees
```

## 4、相关子查询

### 4.1 执行过程

* 概念
  * 如果子查询的执行依赖于外部查询，通常情况下都是因为子查询中的表用到了外部的表，并进行了条件关联，因此每执行一次外部查询，子查询都要重新计算一次，这样的子查询就称之位==关联子查询==
  * 总结：子查询中使用主查询中的列
* 相关子查询的执行过程
  * 相关子查询按照一行接一行的顺序执行，主查询的每一行都执行一次子查询。
    * 执行流程：
      * GET 从著查询中获取候选列
      * EXECUTE 子查询使用主查询的数据
      * USE 如果满足子查询的条件则返回改行
        * ![image-20221104143954988](MySql.assets\image-20221104143954988.png)
* 非相关子查询执行过程
* 待处理

```sql

#查询员工中工资大于本部门平均工资的员工的last_name,salary和其department_id
#方式一 关联子查询
SELECT last_name,salary,department_id
FROM 
employees e1
WHERE salary >(
	SELECT AVG(e2.salary)
	FROM
	employees e2
	GROUP BY 
	e2.department_id
	HAVING 
	e1.`department_id`=e2.`department_id`
)

#方式二 在FROM 中使用子查询
SELECT e1.last_name,e1.salary,e1.department_id
FROM
employees e1,(
	SELECT e2.department_id,AVG(e2.salary) avg_sal
	FROM
	employees e2
	GROUP BY 
	e2.department_id
) t_dept_avg_sal
WHERE e1.`department_id`=t_dept_avg_sal.department_id
AND
e1.salary > t_dept_avg_sal.avg_sal



#查询员工的id,salary,按照department_name 排序
SELECT e.employee_id,e.salary
FROM employees e
ORDER BY (
	SELECT department_name
	FROM departments d
	WHERE e.department_id=d.`department_id`
)

#若employees表中employee_id与job_history表中employee_id相同的数目不小于2，输出这些相同
#id的员工的employee_id,last_name和其job_id
SELECT 
employee_id,last_name,job_id
FROM
employees e
WHERE 2<=(
	SELECT COUNT(*)
	FROM job_history j
	WHERE e.employee_id=j.`employee_id`
)

```

### 4.2、EXISTS与 NOT EXISTS 关键字  

* 关联子查询通常也会和EXISTS操作符一起来使用，用来检查在子查询中是否存在满足条件的行。
* **如果在子查询中不存在满足条件的行**：
  * 条件返回FALSE
  * 继续在子查询中查找
* **如果在子查询中存在满足条件的行**：
  * 不在子查询中继续查找
  * 条件返回TRUE
* NOT EXIST 关键字表示如果不存在某种条件，则返回TRUE 否则返回FALSE

```sql

#查询公司管理者的employee_id，last_name，job_id，department_id信息
#方式一
SELECT employee_id,last_name,job_id,department_id
FROM employees emp
WHERE  EXISTS (
	SELECT '这里返回什么都行'
	FROM employees mgr
	WHERE emp.employee_id=mgr.manager_id
)

#方式二 自连接
SELECT DISTINCT emp.employee_id,emp.last_name,emp.job_id,emp.department_id
FROM employees emp,employees e2
WHERE emp.employee_id=e2.manager_id


#方式三 非关联多行子查询
SELECT employee_id,last_name,job_id,department_id
FROM employees emp
WHERE emp.employee_id IN (
		SELECT DISTINCT manager_id
		FROM employees		
)


#查询departments表中，不存在于employees表中的部门的department_id和department_name
SELECT department_id,department_name
FROM departments d
WHERE NOT EXISTS(
	SELECT "哈哈笑死 pussy"
	FROM employees e
	WHERE e.`department_id`=d.department_id
)
```

### 4.3、相关更新

```sql

#在employees中增加一个department_name字段，数据为员工对应的部门名称
ALTER TABLE employees
	ADD department_name VARCHAR(20);
	
UPDATE employees e
SET department_name=(
	SELECT department_name
	FROM departments d
	WHERE e.`department_id`=d.`department_id`
)
	

#检查更新数据是否正确
SELECT e.`department_name`,d.department_name
FROM employees e,departments d
WHERE e.department_id = d.department_id;

#更新数据撤回sql
待处理
```

### 4.4、相关删除

```sql
#删除表employees中，其与`job_history`表皆有的数据
DELETE FROM employees e
WHERE employee_id IN
(SELECT employee_id
FROM emp_history
WHERE employee_id = e.employee_id);
```

## 5、练习

```sql

#1.查询和Zlotkey相同部门的员工姓名和工资
#方式一 子查询
SELECT last_name,salary
FROM employees
WHERE department_id=(
	SELECT department_id
	FROM employees
	WHERE last_name='Zlotkey'
)
#方式二 自连接 连接条件优先执行
SELECT
e1.last_name,e1.salary
FROM employees e1,employees e2
WHERE e1.department_id=e2.department_id
AND
e2.last_name='Zlotkey'
#2.查询工资比公司平均工资高的员工的员工号，姓名和工资。
#方式一
SELECT 
employee_id,last_name,salary
FROM
employees
WHERE
salary >(
	SELECT AVG(salary)
	FROM employees
)
#3.选择工资大于所有JOB_ID = 'SA_MAN'的员工的工资的员工的last_name, job_id, salary
#方式一
SELECT
last_name,job_id,salary
FROM
employees
WHERE
salary > ALL (
	SELECT salary
	FROM 
	employees
	WHERE
	job_id='SA_MAN'
)

#4.查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名
SELECT
employee_id,last_name
FROM
employees
WHERE
department_id IN (
	SELECT DISTINCT department_id
	FROM
	employees
	WHERE 
	last_name LIKE "%u%"
)
 
#5.查询在部门的location_id为1700的部门工作的员工的员工号
SELECT last_name
FROM
employees
WHERE
department_id IN(
	SELECT department_id
	FROM departments
	WHERE location_id=1700
)
#6.查询管理者是King的员工姓名和工资
SELECT 
last_name,salary
FROM
employees
WHERE 
manager_id IN(
	SELECT employee_id
	FROM employees
	WHERE last_name='King'
)

#7.查询工资最低的员工信息: last_name, salary
SELECT last_name,salary
FROM
employees
WHERE
salary = (
	SELECT MIN(salary)
	FROM employees
)
#8.查询平均工资最低的部门信息
#方式一 多行子查询

SELECT department_id,department_name
FROM
departments
WHERE
department_id=(
	SELECT department_id
	FROM 
	employees
	GROUP BY department_id
	HAVING AVG(salary) <= ALL(
		SELECT  AVG(salary)
		FROM
		employees
		GROUP BY department_id
	)
)


#方式二 因为不能嵌套聚合函数，用临时表来弄
SELECT department_id,department_name
FROM
departments
WHERE
department_id=(
	SELECT department_id
	FROM
	employees
	GROUP BY department_id
	HAVING 
	AVG(salary)=(
		SELECT MIN(tmp.avg_sal)
		FROM(
			SELECT  AVG(salary) avg_sal
			FROM
			employees
			GROUP BY department_id
		) tmp
	)	
)
#方式三 LIMIT
SELECT department_id,department_name
FROM
departments
WHERE
department_id=(
	SELECT department_id
	FROM
	employees
	GROUP BY department_id
	HAVING
	AVG(salary)=(
		SELECT AVG(salary)
		FROM
		employees
		GROUP BY department_id
		ORDER BY AVG(salary) ASC
		LIMIT 1
	) 
)
#方式四 临时表 连接查询 
d.*
FROM
departments d,(
	SELECT department_id,AVG(salary) avg_sal
	FROM
	employees
	GROUP BY
	department_id
	ORDER BY
	avg_sal
	ASC
	LIMIT 1
	) tmp 
	
WHERE
d.department_id=tmp.department_id

#注意
#第四种方式最可能漏部门，平均工资的最低的部门可能有多个


#9.查询平均工资最低的部门信息和该部门的平均工资（相关子查询）
#select 子查询

SELECT d.*,(SELECT AVG(salary) FROM employees GROUP BY department_id HAVING department_id=d.department_id) avg_sal
FROM
departments d
WHERE 
department_id=(
	
	SELECT department_id
	FROM 
	employees
	GROUP BY
	department_id
	HAVING
	AVG(salary) = (
		SELECT AVG(salary)
		FROM employees
		GROUP BY
		department_id
		ORDER BY
		AVG(salary) ASC
		LIMIT 1
	)
)
#mysql 8 This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery' 我丢

#10.查询平均工资最高的 job 信息
#方式一： 多行子查询
SELECT *
FROM
jobs
WHERE job_id=(
		
	SELECT job_id
	FROM
	employees
	GROUP BY job_id
	HAVING AVG(salary) >= ALL(
		SELECT AVG(salary)
		FROM
		employees
		GROUP BY job_id
	)
)

#方式二： 封装成表在聚合
SELECT *
FROM
jobs
WHERE 
job_id=(
	SELECT job_id
	FROM
	employees
	GROUP BY
	job_id
	HAVING
	AVG(salary) =(
		SELECT MAX(emp_avg_sal.avg_sal)
		FROM (
			SELECT AVG(salary) avg_sal
			FROM
			employees
			GROUP BY 
			job_id
		) emp_avg_sal
	)
)
#方式三 limit
SELECT *
FROM
jobs
WHERE
job_id=(
	SELECT job_id
	FROM
	employees
	GROUP BY
	job_id
	HAVING
	AVG(salary)=(
		SELECT AVG(salary)
		FROM
		employees
		GROUP BY
		job_id
		ORDER BY
		AVG(salary)
		DESC
		LIMIT 1
	)
)
#方式四 临时表连接 比上面的那题更稳
SELECT j.*
FROM jobs j,(
	SELECT job_id
	FROM
	employees
	GROUP BY
	job_id
	HAVING
	AVG(salary)=(
		SELECT AVG(salary)
		FROM
		employees
		GROUP BY
		job_id
		ORDER BY
		AVG(salary)
		DESC
		LIMIT 1
	)
) tmp
WHERE
j.job_id=tmp.job_id



#11.查询平均工资高于公司平均工资的部门有哪些?
SELECT department_id
FROM employees
WHERE
department_id IS NOT NULL
GROUP BY department_id
HAVING
AVG(salary) > (
	SELECT AVG(salary)
	FROM employees
	WHERE
	department_id IS NOT NULL
	 
)

#12.查询出公司中所有 manager 的详细信息
#方式一 自连接
SELECT DISTINCT e1.* 
FROM
employees e1,employees e2
WHERE e1.employee_id=e2.manager_id

#方式二 子查询
SELECT *
FROM employees
WHERE employee_id IN (
	SELECT DISTINCT manager_id
	FROM employees
	
)
#方式三 相关子查询 exist
SELECT DISTINCT *
FROM employees e
WHERE  EXISTS (
	SELECT manager_id
	FROM employees e1
	WHERE e.employee_id=e1.employee_id
)	

#13.各个部门中 最高工资中最低的那个部门的 最低工资是多少?

SELECT department_id,MIN(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary)=(
	SELECT MAX(salary)
	FROM employees
	GROUP BY department_id
	ORDER BY MAX(salary) ASC
	LIMIT 1
	)
	
	
	
#14.查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary
SELECT last_name, department_id, email, salary
FROM employees
WHERE employee_id=(
	SELECT manager_id
	FROM departments
	WHERE department_id=(
		SELECT department_id
		FROM employees
		GROUP BY department_id
		HAVING AVG(salary)=(
			SELECT AVG(salary)
			FROM employees
			GROUP BY department_id
			ORDER BY AVG(salary) DESC
			LIMIT 1
		)	
	)
)
#15. 查询部门的部门号，其中不包括job_id是"ST_CLERK"的部门号
SELECT DISTINCT department_id
FROM departmentS
WHERE department_id NOT IN ( #IN 与NULL 判断 是 false
	SELECT  DISTINCT department_id
	FROM employees
	WHERE job_id = 'ST_CLERK'
)
SELECT DISTINCT department_id
FROM departments d
WHERE NOT EXISTS (
	SELECT *
	FROM employees e2
	WHERE d.department_id=e2.department_id
	AND job_id='ST_CLERK'
)


#16. 选择所有没有管理者的员工的last_name 
SELECT last_name
FROM employees e
WHERE manager_id IS NULL

SELECT last_name
FROM employees emp
WHERE NOT EXISTS(
	SELECT 'xx'
	FROM employees e2
	WHERE emp.manager_id=e2.employee_id
)
#17．查询员工号、姓名、雇用时间、工资，其中员工的管理者为 'De Haan'
SELECT emp.employee_id,emp.last_name,emp.hire_date,emp.salary
FROM employees emp
WHERE  EXISTS(
	SELECT *
	FROM employees mgr
	WHERE  emp.manager_id=mgr.employee_id
	AND mgr.last_name='De Haan'
)
SELECT emp.employee_id,emp.last_name,emp.hire_date,emp.salary
FROM employees emp
WHERE emp.manager_id IN (
	SELECT employee_id
	FROM employees 
	WHERE last_name='De Haan'
)

#18.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资（相关子查询）
#方式一 关联子查询
SELECT last_name,salary,department_id
FROM 
employees e1
WHERE salary >(
	SELECT AVG(e2.salary)
	FROM
	employees e2
	GROUP BY 
	e2.department_id
	HAVING 
	e1.`department_id`=e2.`department_id`
)

#方式二 在FROM 中使用子查询
SELECT e1.last_name,e1.salary,e1.department_id
FROM
employees e1,(
	SELECT e2.department_id,AVG(e2.salary) avg_sal
	FROM
	employees e2
	GROUP BY 
	e2.department_id
) t_dept_avg_sal
WHERE e1.`department_id`=t_dept_avg_sal.department_id
AND
e1.salary > t_dept_avg_sal.avg_sal
#19.查询每个部门下的部门人数大于 5 的部门名称（相关子查询）
SELECT department_name
FROM departments d
WHERE EXISTS (
	SELECT *
	FROM employees e
	WHERE d.department_id=e.department_id
	GROUP BY e.department_id
	HAVING 5< COUNT(e.department_id)
	
	)
	
SELECT department_name
FROM departments d
WHERE   5< (
	SELECT COUNT(e.department_id)
	FROM employees e
	WHERE d.department_id=e.department_id
	#GROUP BY e.department_id 可要可不要
	)


#20.查询每个国家下的部门个数大于 2 的国家编号（相关子查询）
#自连接
SELECT l.country_id
FROM departments d,locations l
WHERE l.location_id=d.location_id
GROUP BY  l.country_id
HAVING 2<COUNT(department_id)

#相关子查询1
SELECT country_id
FROM locations l
WHERE EXISTS (
	SELECT *
	FROM departments d
	WHERE l.location_id=d.location_id
	GROUP BY l.country_id
	HAVING 2 <COUNT(*)
)
#相关子查询2
SELECT country_id
FROM locations l
WHERE  2 <(
	SELECT COUNT(*)
	FROM departments d
	WHERE l.location_id=d.location_id
	GROUP BY l.country_id
	
)

/*
	子查询的编写技巧（或步骤）：1、从里往外写 2、从外往里写
	如何选择？
	1、如果子查询相对简单，建议从外往里写。一旦子查询结构较复杂，则建议从里往外写
	
	2、如果相关子查询的话，通常都是从外往里写
	

*/
```

# 十、管理数据库、表

## 1、前提知识

### 1.1 一条数据存储的过程

​	==存储数据是处理数据的第一步==。只有正确地把数据存储起来，我们才能进行有效的处理和分析。否则，只能是一团乱麻，无从下手。

那么，怎样才能把用户各种经营相关的、纷繁复杂的数据，有序、高效地存储起来呢？在MySQL中，一个完整的数据存储过程总共有4步，分别是 **创建数据库、确认字段、创建数据表、插入数据**

![image-20221108133818557](MySql.assets\image-20221108133818557.png)

> 我们要先创建一个数据库，而不是直接创建数据表呢？ 

因为从系统架构的层次上看，MySQL 数据库系统从大到小依次是 ==数据库服务器== 、 ==数据库== 、==数据表==、数 据表的 ==行与列==。

### 1.2 标识符命名规则

* 数据库名、表名不得超过30个字符，变量名限制为29个
* 必须只能包含 A–Z, a–z, 0–9, _共63个字符
* 数据库名、表名、字段名等对象名中间不要包含空格
* 同一个MySQL软件中，数据库不能同名；同一个库中，表不能重名；同一个表中，字段不能重名
* 必须保证你的字段没有和保留字、数据库系统或常用方法冲突。如果坚持使用，请在SQL语句中使 用`（着重号）引起来
* **保持字段名和类型的一致性**：在命名字段并为其指定数据类型的时候一定要保证一致性，假如数据 类型在一个表里是整数，那在另一个表里可就别变成字符型



| 整数类型         | tinyint smallint mediumint int(或integer) bigint             |
| ---------------- | ------------------------------------------------------------ |
| 浮点类型         | flooat double                                                |
| 定点类型         | decimal                                                      |
| 位类型           | bit                                                          |
| 日期时间类型     | year time date datetime timestamp                            |
| 文本字符串类型   | char varchar tinytext text mediumtext longtext               |
| 枚举类型         | ENUM                                                         |
| 集合类型         | SET                                                          |
| 二进制字符串类型 | binary varbinary tinyblob blob medumblob longblob            |
| JSON类型         | JSON对象 JSON数组                                            |
| 空间数据类型     | 单值：geometry point linestring polygon                      |
| 空间数据类型     | 集合： multipoint multilinestring multipolygon geometrycollection |

其中，常用的几类类型介绍如下：

| 数据类型      | 描述                                                         |
| ------------- | ------------------------------------------------------------ |
| INT           | 从-2^31到2^31-1的整型数据。存储大小为 **4个字节**            |
| CHAR(size)    | 定长字符数据。若未指定，**默认为1个字符**，最大长度255       |
| VARCHAR(size) | 可变长字符数据，根据字符串实际长度保存，**必须指定长度**     |
| FLOAT(M,D)    | 单精度，占用**4个字节**，M=整数位+小数位，D=小数位。 D<=M<=255,0<=D<=30， **默认M+D<=6** |
| DOUBLE(M,D)   | 双精度，占用8个字节，D<=M<=255,0<=D<=30，**默认M+D<=15**     |
| DATE          | 日期型数据，格式'YYYY-MM-DD                                  |
| BLOB          | 二进制形式的长文本数据，最大可达4G                           |
| TEXT          | 长文本数据，最大可达4G                                       |

## 2、创建和管理数据库

### 2.1 创建库

```sql
#方式1：创建数据库
CREATE DATABASE db_name
#方式2：创建数据库并指定字符集
CREATE DATABASE 数据库名  CHARACTER SET 字符集
#方式3：判断数据库是否已经存在，不存在则创建数据库（推荐）
CREATE DATABASE IF NOT EXISTS db_name;
#如果MySQL中已经存在相关的数据库，则忽略创建语句，不再创建数据库。 不会报错
```

### 2.2 管理库

> 注意：**DATABASE 不能改名。**一些可视化工具可以改名，它是建新库，把所有表复制到新库，再删 旧库完成的。

* 查看当前所有的数据库

```sql
SHOW DATABASES; #有一个S，代表多个数据库
```

* 切换数据库

```sql
USE 数据库名;
```



* 查看当前正在使用的数据库

```sql
SELECT DATABASE(); #使用的一个 mysql 中的全局函数
```

* 查看指定库下所有的表

```sql
SHOW TABLES FROM 数据库名
```

* 查看数据库的创建信息

```sql
SHOW CREATE DATABASE 数据库名;
或者：
SHOW CREATE DATABASE 数据库名\G #这里注意没;号
```

* 更改数据库字符集

```sql
ALTER DATABASE 数据库名 CHARACTER SET 字符集; #比如：gbk、utf8等
```

* 方式1：删除指定的数据库

```sql
DROP DATABASE 数据库名;
```

* 方式2：删除指定的数据库（推荐）

```sql
DROP DATABASE IF EXISTS 数据库名
```

## 3、创建和管理表

### 3.1 创建表

* 必须具备：
  * CREATE TABLE权限 
  * 存储空间
* 语法格式：

```sql
CREATE TABLE [IF NOT EXISTS] 表名(
字段1, 数据类型 [约束条件] [默认值],
字段2, 数据类型 [约束条件] [默认值],
字段3, 数据类型 [约束条件] [默认值],
……
[表约束条件]
);
```

* 必须指定：
  * 表名
  * 列名(或字段名)，数据类型，长度
* 可选指定：
  * 约束条件
  * 默认值
* 创建表举例：

```sql
#方式一：
-- 创建表
CREATE TABLE emp (
	-- int类型
	emp_id INT,
	-- 最多保存20个中英文字符
	emp_name VARCHAR(20),
	-- 总位数不超过15位
	salary DOUBLE,
	-- 日期类型
	birthday DATE
);
#方式二： 基于现有的表（没有过滤表数据）
CREATE TABLE myemp2
AS
SELECT employee_id,last_name,salary
FROM employees;
#方式三：创建表并过滤表数据
CREATE  TABLE IF NOT EXISTS myemp2
AS
SELECT employee_id,last_name,salary
FROM employees
WHERE 1=2


#基于现表创建新表注意点
/*
查询语句中字段的别名，可以作为新创建的表的字段的名称
*/
#查看表结构
DESC employees;
#查看创建表的语句结构
SHOW CREATE TABLE employees;
```





### 3.2 管理表



```SQL

#1.修改表 ALTER TABLE
DROP TABLE IF EXISTS myempl;
CREATE TABLE myempl
AS
SELECT employee_id,last_name
FROM employees
WHERE 1=2
#1.1 添加一个字段
ALTER TABLE myempl
ADD salary DOUBLE(10,2)#默认添加到表中的最后一个字段的位置

ALTER TABLE  myempl
ADD phone_number VARCHAR(20) FIRST #first 放最前面的位置

ALTER TABLE myempl
ADD email VARCHAR(45) AFTER last_name # after指定字段后面

#1.2 修改一个字段：数据类型、长度、默认值（略）
ALTER TABLE myempl
MODIFY last_name VARCHAR(25) #改数据类型

ALTER TABLE myempl
MODIFY last_name VARCHAR(35) DEFAULT 'aaa' #改默认值，可以同时改类型

#1.3 重命名一个字段
ALTER TABLE myempl
CHANGE salary monthly_salary DOUBLE(10,2);#newcol oldcol oldtype （oldtype不能少）

ALTER TABLE myempl
CHANGE email my_email VARCHAR(50);#可以同时改类型

#1.4 删除一个字段
ALTER TABLE myempl
DROP COLUMN my_email;

#2.重命名表
#方式一
RENAME TABLE myempl
TO myemplx;
#方式二
ALTER TABLE myemplx
RENAME TO myempl;

#3.删除表
#不光把表结构删除掉，同时表中的数据也删除掉，释放表空间。
DROP TABLE IF EXISTS myemp2;
DELETE FROM myemp2 ;
#4. 清空表
#保留表结构，删除表数据
TRUNCATE TABLE myemp2;

#5. DCL 中 commit 和 rollback
#commit： 提交数据。 一旦执行commit，则数据永久化，不能回滚
#rollback：回滚数据。一旦执行rollback，则数据回滚，回滚到最近的一次commit之后

#6 对比 TRUNCATE TABLE 和DELETE FROM
/*
 相同点：都可以删除数据并保留表结构
 不同点：
 1点：
	TRUNCATE TABLE:一旦执行操作，表数据clear，不能回滚
	DELETE FROM: 一旦执行此操作，表数据clear，数据可以实现回滚
	
#7. DDL和DML的说明：
① DDL的操作一旦执行，就不可回滚（内置执行DDL之后就执行一次commit）
② DML的操作默认情况，一旦执行，也是不可回滚的。
	如果在执行DML之前，执行了 SET autocommit=FALSE 则执行的DML操作就可以实现回滚
		
```

> 阿里开发规范： 【参考】TRUNCATE TABLE 比 DELETE 速度快，且使用的系统和事务日志资源少，但 TRUNCATE 无 事务且不触发 TRIGGER，有可能造成事故，故不建议在开发代码中使用此语句。 说明：TRUNCATE TABLE 在功能上与不带 WHERE 子句的 DELETE 语句相同。

## 4、内容扩展

### 拓展1：阿里巴巴《Java开发手册》之MySQL字段命名

* 【 **强制** 】表名、字段名必须使用小写字母或数字，禁止出现数字开头，禁止两个下划线中间只出 现数字。数据库字段名的修改代价很大，因为无法进行预发布，所以字段名称需要慎重考虑。
  * 正例：aliyun_admin，rdc_config，level3_name
  * 反例：AliyunAdmin，rdcConfig，level_3_name
* 【 **强制** 】禁用保留字，如 desc、range、match、delayed 等，请参考 MySQL 官方保留字。
* 【 **强制** 】表必备三字段：id, gmt_create, gmt_modified。
  * 说明：其中 id 必为主键，类型为**BIGINT UNSIGNED**、单表时自增、步长为 1。gmt_create, gmt_modified 的类型均为 DATETIME 类型，前者现在时表示主动式创建，后者过去分词表示被 动式更新
* 【 **推荐** 】表的命名最好是遵循 “业务名称_表的作用”。
  * 正例：alipay_task 、 force_project、 trade_config
* 【 推荐 】库名与应用名称尽量一致。
* 【参考】合适的字符存储长度，不但节约数据库表空间、**节约索引存储，更重要的是提升检索速 度**。
  * 正例：无符号值可以避免误存负数，且扩大了表示范围。

![image-20221108161105208](MySql.assets\image-20221108161105208.png)

## 5、练习不常用不写了

# MySQL8新特性—DDL的原子化

* 在**MySQL 8.0**版本中，InnoDB表的DDL支持事务完整性，即 **DDL操作要么成功要么回滚** 。DDL操作回滚日志 写入到data dictionary数据字典表mysql.innodb_ddl_log（该表是隐藏的表，通过show tables无法看到） 中，用于回滚操作。通过设置参数，可将DDL操作日志打印输出到MySQL错误日志中。

分别在MySQL 5.7版本和MySQL 8.0版本中创建数据库和数据表，结果如下：

```sql
CREATE DATABASE mytest;
USE mytest;
CREATE TABLE book1(
book_id INT ,
book_name VARCHAR(255)
);
SHOW TABLES;

DROP TABLE book1,book2
```

结果：

* MySQL 5.7 book1表数据被删除，DDL没有原子性
* MySQL 8.0 book1表数据没有被删除，因为回滚了 

## 

# 十一、数据处理之增删改

## 1、INSERT

语句结构：

* INSERT [INTO] table_name[(column,...)] VALUES(column_value)

* ```sql
  DROP TABLE IF EXISTS xx;
  CREATE TABLE xx(
  	id  INT PRIMARY KEY,
  	`name`  VARCHAR(10) ,
  	x_date DATE,
  	salary INT
  )
  
  ```

  

* 方式一：一条一条的添加数据

  * ```sql
    #未指明字段
    INSERT INTO xx
    VALUES (1,'Tom','2000-12-21',3400);
    
    #指明字段
    INSERT INTO xx (id,x_date,salary,`name`)
    VALUES(2,'1999-09-09',4000,'Jerry');
    
    #同时插入多条记录
     INSERT INTO xx(id,`name`,salary)
     VALUES
    	(4,'Jie',5000),
    	(5,'Q',5000)
    ```

* 

* 方式二：将查询结果插入到表中

  * ```sql
    #不用书写VALUES语句
    INSERT INTO xx(id,`name`,salary,x_date)
     SELECT employee_id,last_name,salary,hire_date
     FROM employees
     WHERE department_id IN (70,60);
     #结论：
     #字段要一一对应
     #建议：类型尽量相同（因为可以不同），且类型要大于等于插入类型。不然容易报类型错误
    ```
    




## 2、UPDATE

语句结构：

* UPDATE ... SET ... WHERE

* ```sql
  UPDATE xx
  SET x_date=CURDATE(),salary=6000
  WHERE id=103
  ```

  

## 3、DELETE

语句结构：

* DELETE FROM table_name where ...

* ```sql
  DELETE FROM departments
  WHERE department_id =50
  #增删改操作都可能被约束影响，导致操作失败。
  ```

  # MySQL8新特性：计算列

  是在DDL中定义的通过a、b两列和计算规则算出c列。

  ```SQL
  #数值
  DROP TABLE IF EXISTS tb1;
  CREATE TABLE tb1(
  id INT,
  a INT,
  b INT,
  c INT GENERATED ALWAYS AS (a+b) VIRTUAL
  )
  
  INSERT INTO tb1(a,b) VALUES(100,200)
  SELECT * FROM tb1;
  
  #字符
  DROP TABLE IF EXISTS tb1;
  CREATE TABLE tb1(
  id INT,
  a VARCHAR(10),
  b VARCHAR(10),
  c VARCHAR(20) GENERATED ALWAYS AS (CONCAT(a,b)) VIRTUAL
  )
  
  INSERT INTO tb1(a,b) VALUES('s','asad');
  SELECT * FROM tb1;
  ```

  

# 十二、MySQL数据类型精讲

| 整数类型         | tinyint smallint mediumint int(或integer) bigint             |
| ---------------- | ------------------------------------------------------------ |
| 浮点类型         | flooat double                                                |
| 定点类型         | decimal                                                      |
| 位类型           | bit                                                          |
| 日期时间类型     | year time date datetime timestamp                            |
| 文本字符串类型   | char varchar tinytext text mediumtext longtext               |
| 枚举类型         | ENUM                                                         |
| 集合类型         | SET                                                          |
| 二进制字符串类型 | binary varbinary tinyblob blob medumblob longblob            |
| JSON类型         | JSON对象 JSON数组                                            |
| 空间数据类型     | 单值：geometry point linestring polygon                      |
| 空间数据类型     | 集合： multipoint multilinestring multipolygon geometrycollection |

常见数据类型的属性，如下：

| MySQL关键字        | 含义                     |
| ------------------ | ------------------------ |
| NULL               | 数据列可包含NULL值       |
| NOT NULL           | 数据列不允许包含NULL值   |
| DEFAULT            | 默认值                   |
| PRIMARY KEY        | 主键                     |
| AUTO_INCREMENT     | 自动递增，适用于整数类型 |
| UNSIGNED           | 无符号                   |
| CHARACTER SET name | 指定一个字符集           |

* 关于属性：character set name

* ```sql
  #创建数据库时指明字符集
  CREATE DATABASE IF NOT EXISTS  dbtest12 CHARACTER SET 'utf8';
  SHOW CREATE DATABASE dbtest12;
  
  #创建表的时候，指明表的字符集
  DROP TABLE IF EXISTS temp;
  CREATE TABLE temp(
  id INT
  ) CHARACTER SET 'utf8';
  SHOW CREATE TABLE temp;
  
  #创建表，指明表中字段时，可以指定字段的字符集
  DROP TABLE IF EXISTS tempx;
  CREATE TABLE  tempx(
  id INT,
  NAME VARCHAR(15) CHARACTER SET 'gbk'
  );
  SHOW CREATE TABLE tempx;
  
  
  #以哪个为准呢？
  #子类下，有设置就遵循多态，没有就继承父类
  ```


## 1、整数类型

### 1.1 类型介绍

整数类型一共有5种，包括TINYINT、SMALLINT、MEDIUMINT\INT(INTEGER)和BIGINT

| 整数类型     | 字节 | 有符号数取值范围                         | 无符号数取值范围       |
| ------------ | ---- | ---------------------------------------- | ---------------------- |
| TINYINT      | 1    | -128~127                                 | 0~255                  |
| SMALLINT     | 2    | -32768~32767                             | 0~65535                |
| MEDIUMINT    | 3    | -8388608~8388607                         | 0~16777215             |
| INT、INTEGER | 4    | -2147483648~2147483647                   | 0~4294967295           |
| BIGINT       | 8    | -9223372036854775808~9223372036854775807 | 0~18446744073709551615 |

### 1.2 可选数据类型属性

整数类型的可选属性有三个：

* 显示宽度 
  * `INT(number)` 
  * 从MySQL 8.0.17开始，整数数据类型不推荐使用显示宽度属性。
* UNSIGNED
  * 无符号整型
  
  * ```sql
    CREATE TABLE test_int2(
    F1 INT UNSIGNED
    )
    ```
  
* ZEROFILL 
  * 0填充。（宽度不足指定宽度，左边填充）（如果某列是ZEROFILL，那么MySQL会自动为当前列添加UNSIGNED属性）。
  * 填充宽度 `INT(number)`和`UNSIGEND ZEROFILL`一起使用才有意义。
  
    * ```sql
      DROP TABLE IF EXISTS test_int2;
      CREATE TABLE test_int2(
      	f1 INT,
      	f2 INT(5),
      	f3 INT(5) ZEROFILL #显示宽度为5。当insert的值不足5位时，使用0填充。
      )
      
      INSERT INTO test_int2(f1,f2)
      VALUES(123,123),(123456,123456);
      
      SELECT * FROM test_int2;
      
      INSERT test_int2(f3) 
      VALUES(123),(123456);
      ```
  
      

### 1.3 适用场景

==TINYINT== ：一般用于枚举数据，比如系统设定取值范围很小且固定的场景。

 ==SMALLINT== ：可以用于较小范围的统计数据，比如统计工厂的固定资产库存数量等。

==MEDIUMINT==：用于较大整数的计算，比如车站每日的客流量等。

==INT、INTEGER== ：取值范围足够大，一般情况下不用考虑超限问题，用得最多。比如商品编号。 ==BIGINT==：只有当你处理特别巨大的整数时才会用到。比如双十一的交易量、大型门户网站点击量、证 券公司衍生产品持仓等。

### 1.4 如何选择？

* ​	在评估用哪种整数类型的时候，你需要考虑 ==存储空间== 和 ==可靠性== 的平衡问题：一方 面，用占用字节数少 的整数类型可以节省存储空间；另一方面，要是为了节省存储空间， 使用的整数类型取值范围太小，一 旦遇到超出取值范围的情况，就可能引起 系统错误 ，影响可靠性。 
* ​    举个例子，商品编号采用的数据类型是 INT。原因就在于，客户门店中流通的商品种类较多，而且，每 天都有旧商品下架，新商品上架，这样不断迭代，日积月累。 
* ​    如果使用 SMALLINT 类型，虽然占用字节数比 INT 类型的整数少，但是却不能保证数据不会超出范围 65535。相反，使用 INT，就能确保有足够大的取值范围，不用担心数据超出范围影响可靠性的问题。 
* ​    你要注意的是，在实际工作中，<font color='gree'>系统故障产生的成本远远超过增加几个字段存储空间所产生的成本。</font>因 此，我建议你首先确保数据不会超过取值范围，在这个前提之下，再去考虑如何节省存储空间。

## 2、浮点数

### 2.1、类型介绍

​	浮点数和定点数类型的特点是可以==处理小数==，你可以把整数看成小数的一个特例。因此，浮点数和定点数的使用场景，比整数大多了。MySQL支持的浮点数据类型。分别是FLOOAT、DOUBLE、REAL。

* FLOAT表示单精度浮点数
* DOUBLE表示双精度浮点数

![image-20221115153425608](MySql.assets\image-20221115153425608.png)

* REAL默认就是DOUBLE,如果你把SQL模式设定为启用==REAL_AS_FLOAT==那么，MySQL就认为REAL是FLOAT。如果要启用它，可以通过以下SQL语句实现：

  ```SQL
  SET sql_mode="REAL_AS_FLOAT";
  ```

  > 问题1：FLOAT和DOUBLE 这两种数据类型的区别是啥呢？

  FLOAT占用字节数少，取值范围小，DOUBLE占用字节数多，取值范围也大。

  > 问题2：为什么浮点数类型的无符号数取值范围，只相当于有符号数值范围的一半，也就是只相当于有符号数取值范围大于等于零的部分呢？

  MySQL 存储浮点数的格式为： 符号(S) 、 尾数(M) 和 阶码(E) 。因此，无论有没有符号，MySQL 的==浮点数都会存储表示符号的部分==。因此， 所谓的无符号数取值范围，其实就是有符号数取值范围大于等于 零的部分。

  结论：声明 UNSIGNED 没有意义。因为该类型无论正负都会存储符号位。

### 2.2、数据精度说明

对于浮点类型，在MySQL中单精度值使用 ==4== 个字节，双精度值使用 ==8== 个字节。

*  ==FLOAT(M,D)== 或 ==DOUBLE(M,D)== 建议不用，属于<font color='red'>非标准语法</font>。（其他数据库未必支持，因此如果涉及到数据迁移，则最好不要这么 用）
  
  * M称为 ==精度== ，D称为 ==标度== 。(M,D)中 M=整数位+小数 位，D=小数位。 <font color='gree'>D<=M<=255，0<=D<=30。</font>
  
* UNSIGNED 加不加无所谓

* 不管是否显式设置了精度(M,D)，这里MySQL的处理方案如下：

  * 如果存储时，整数部分超出了范围，MySQL就会报错，不允许存这样的值

  * 如果存储时，小数点部分若超出范围，就分以下情况：

    * 若四舍五入后，整数部分没有超出范围，则只警告，但能成功操作并四舍五入删除多余 的小数位后保存。例如在FLOAT(5,2)列内插入999.009，近似结果是999.01。

    * 若四舍五入后，整数部分超出范围，则MySQL报错，并拒绝处理。如FLOAT(5,2)列内插入 999.995和-999.995都会报错。

    * <font color='red'>从MySQL 8.0.17开始，FLOAT(M,D) 和DOUBLE(M,D)用法在官方文档中已经明确不推荐使用</font>，将来可 能被移除。另外，关于浮点型FLOAT和DOUBLE的UNSIGNED也不推荐使用了，将来也可能被移除。

    * 举例

      * ```sql
        CREATE TABLE test_double1(
        f1 FLOAT,
        f2 FLOAT(5,2),
        f3 DOUBLE,
        f4 DOUBLE(5,2)
        );
        DESC test_double1;
        INSERT INTO test_double1
        VALUES(123.456,123.456,123.4567,123.45);
        #Out of range value for column 'f2' at row 1
        INSERT INTO test_double1
        VALUES(123.456,1234.456,123.4567,123.45);
        SELECT * FROM test_double1;
        
        CREATE TABLE test_double2(
        f1 DOUBLE
        );
        INSERT INTO test_double2
        VALUES(0.47),(0.44),(0.19)
        
        
        SELECT SUM(f1)
        FROM test_double2;
        +--------------------+
        | SUM(f1) 					|
        +--------------------+
        | 1.0999999999999999 |
        +--------------------+
        1 row in set (0.00 sec)
        
        mysql> SELECT SUM(f1) = 1.1,1.1 = 1.1
        -> FROM test_double2;
        +---------------+-----------+
        | SUM(f1) = 1.1 | 1.1 = 1.1 |
        +---------------+-----------+
        | 0 | 1 									|
        +---------------+-----------+
        1 row in set (0.00 sec)
        ```

## 3、定点数类型

### 3.1、类型介绍

* MySQL中的定点数类型只有DECIMAL一种类型。

| 数据类型                 | 字节数  | 含义               |
| ------------------------ | ------- | ------------------ |
| DECIMAL(M,D)DEC,NUMBERIC | M+2字节 | 有效范围由M和D决定 |

使用DECIMAL(M,D)的方式表示高精度小数。其中，M被称为精度，D被称为标度。<font color='orange'>0<=M<=65,0<=D<=30,D<M。</font>例如，定义DECIMAL(5,2)的类型，表示该咧取值范围是-999.99~999.99

* DECIMAL(M,D)的最大取值范围与DOUBLE类型一样，但是有效的数据范围是由M和D决定的。DECIMAL的存储空间并不是固定的，由精度值M决定，总共占用的存储空间为M+2个字节。也就是说，在一些对精度要求不高的场景下，比起占用同样字节长度的定点数，浮点数表达的数值范围可以更大一些。

* 定点数在MySQL内部是以==字符串==的形式进行存储，这就决定了他一定是精准的。

* 当DECIMAL类型不指定精度和标度时，<font color='red'>其默认为DECIMAL(10,0)</font>。当数据的精度超出了定点数类型的精度范围时，则MySQL同样会进行四舍五入处理。

* **浮点数 vs 定点数**

  * 浮点数相对于定点数的优点是在长度一定的情况下，浮点类型取值范围大，但是不精准，适用于需要取值范围大，又可以容忍微小误差的科学计算场景。（比如计算化学、分子建模、流体动力学等）

  * 定点数类型取值范围相对小，但是精准，没有误差，适合于对精度要求极高的场景（比如涉及金额计算的场景）

  * 举例

    * ```sql
      DROP TABLE IF EXISTS test_decimal1;
      CREATE TABLE test_decimal1(
      	f1 DECIMAL,
        f2 DECIMAL(5,2)
      );
      DESC test_decimal1;
      
      INSERT INTO test_decimal1(f1,f2)
      VALUES(123.123,123.456);
      
      #Out of range value for column 'f2'
      INSERT INTO test_decimal1(f2)
      VALUES(1234.34);
      
      
      mysql> SELECT * FROM test_decimal1;
      +------+--------+
      | f1   | f2     |
      +------+--------+
      |  123 | 123.46 |
      +------+--------+
      1 ROW IN SET (0.00 sec)
      
      #浮点类型边定点类型
      ALTER TABLE test_double2
      MODIFY f1 DECIMAL(5,2);
      
      SELECT * SUM(f1)
      FROM test_decimal1;
      +---------+
      | SUM(f1) |
      +---------+
      | 1.10 		|
      +---------+
      1 row in set (0.00 sec)
      
      ```
      
      

### 3.2、开发中经验

> “由于 DECIMAL 数据类型的精准性，在我们的项目中，除了极少数（比如上商品编号）用到整数类型外，其他的数值都用的是DECIMAL，原因就是这个项目所处的零售行业，要求精准，一分钱也不能差。”--来自某项目经理

## 4、位类型：BIT

BIT类型中存储的是二进制值，类似010110

| 二进制字符串类型 | 长度 | 长度范围 | 占用空间          |
| ---------------- | ---- | -------- | ----------------- |
| BIT(M)           | M    | 1<=M<64  | 约为(M+7)/8个字节 |

BIT类型，如果没有指定(M)<font color='gree'>,默认是1位</font>。这个1位，表示只能存1位的二进制值，这里(M)是表示二进制的位数，位数最小值为1，最大值为64。

```sql
DROP TABLE IF EXISTS test_bit1;
CREATE TABLE test_bit1(
	f1 BIT,
	f2 BIT(5),
	f3 BIT(64)
);
INSERT INTO test_bit1(f1)
VALUES(1);

INSERT INTO test_bit1(f2)
VALUES(23);

#Data too long for column 'f1' at row 1
INSERT test_bit1(f1)
VALUES(2);

SELECT * FROM test_bit1;

显示是以16进制显示
+------------+------------+------------+
| f1         | f2         | f3         |
+------------+------------+------------+
| 0x01       | NULL       | NULL       |
| NULL       | 0x17       | NULL       |
+------------+------------+------------+
2 rows in set (0.00 sec)

SELECT BIN(f2),HEX(f2)
 FROM test_bit1;
+---------+---------+
| BIN(f2) | HEX(f2) |
+---------+---------+
| NULL    | NULL    |
| 10111   | 17      |
+---------+---------+
2 rows in set (0.00 sec)

#可以看到，使用b+0查询数据时，可以直接查询出存储的十进制数据的值。

SELECT f2 + 0
FROM test_bit1;
+--------+
| f2 + 0 |
+--------+
|   NULL |
|     23 |
+--------+
2 rows in set (0.00 sec)
```

## 5、日期与时间类型

MySQL有多种表示日期和时间的数据类型，不同的版本可能有所差异，MySQL8.0版本支持的日期和时间类型主要有：YEAR类型、TIME类型、DATETIME类型和TIMESTAMP类型。

* ==YEAR==类型通常用来表示年
* ==DATE==类型通常用来表示年、月、日
* ==TIME==类型通常用来表示时、分、秒
* ==DATETIME==类型通常用来表示年、月、日、时、分、秒
* ==TIMESTAMP==类型通常用来表示带时区的年、月、日、时、分、秒（**注意这里的显示是带时区的日期：底层存储是时区+时间戳**）

| 类型      | 名称     | 字节 | 日期格式            | 最小值                  | 最大值                 |
| --------- | -------- | ---- | ------------------- | ----------------------- | ---------------------- |
| YEAR      | 年       | 1    | YYYY或YY            | 1901                    | 2155                   |
| TIME      | 时间     | 3    | HH:MM:SS            | -838:59:59              | 838:59:59              |
| DATE      | 日期     | 3    | YYYY-MM-DD          | 1000-01-01              | 9999-12-03             |
| DATETIME  | 日期时间 | 8    | YYYY-MM-DD HH:MM:SS | 1000-01-01 00:00:00     | 9999-12-31 23:59:59    |
| TIMESTAMP | 日期时间 | 4    | YYYY-MM-DD HH:MM:SS | 1970-01-01 00:00:00 UTC | 2038-01-19 03:14:07UTC |

 

### 5.1、YEAR类型

YEAR类型用来表示年份，在所有的日期时间类型中所占用的存储空间最小，只需要==1个字节==的存储空间。

在MySQL中，YEAR有以下几种存储格式：

* 以4为字符串或数字格式表示YEAR类型，其格式为YYYY最小值1901，最大值2155.
* 以2位字符串格式表示YEAR类型，最小值为00，最大值为99.
  * 当取值为01到69时，表示2001到2069
  * 当取值为70到99时，表示1970到1999
  * 当取值整数的0或00添加的话，那么是0000年。
  * 当取值是日期/字符串的'0'添加的话，是2000年。

**从MySQL5.5.27**开始，**2位格式的YEAR已经不推荐使用**。YEAR默认格式就是`YYYY`，没必要携程YEAR(4)，从**MySQL8.0.19**开始，**不推荐使用指定显示宽度的YEAR(4)数据类型。**



```sql
DROP TABLE IF EXISTS test_year;
CREATE TABLE test_year(
	f1 YEAR,
	f2 YEAR(4)
);
DESC test_year;

+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| f1    | year | YES  |     | NULL    |       |
| f2    | year | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
INSERT INTO test_year
VALUES('45','71');
INSERT INTO test_year
VALUES(0,'0');
mysql> SELECT * FROM test_year;
+------+------+
| f1   | f2   |
+------+------+
| 2045 | 1971 |
| 0000 | 2000 |
+------+------+
2 rows in set (0.00 sec)
```



### 5.2、DATE类型

DATE类型表示日期，没有时间部分，格式位==YYYY-MM-DD==，其中，YYYY表示年份，MM表示，DD表示天数。需要==3个字节==的存储空间。在向DATE类型的字段插入数据时，同样需要满足一定的格式条件。

* 以==YYYY-MM-DD==格式或者==YYYYMMDD==格式表示的字符串日期，其中最小取值为1000-01-01，最大取值为9999-12-03。YYYYMMDD格式会被转化为YYYY-MM-DD格式。
* 以==YY-MM-DD==格式或者==YYMMDD==格式表示的字符串日期，此格式中，年份为两位数值的格式转换行为：与上文相同。
* 使用<font color='orange'>CURRENT_DATE()</font>或<font color='orange'>NOW()</font>函数，会插入当前系统的日期。
* 接受数字输入



```sql
DROP TABLE IF EXISTS test_date1;
CREATE TABLE test_date1(
	f1 DATE
);
INSERT INTO test_date1
VALUES('2020-10-01'),('20201001'),(20201001);

INSERT INTO test_date1
VALUES ('00-01-01'), ('000101'), ('69-10-01'), ('691001'), ('70-01-01'), ('700101'),
('99-01-01'), ('990101');

INSERT INTO test_date1
VALUES (CURRENT_DATE()), (NOW());
SELECT *
FROM test_date1;
+------------+
| f1         |
+------------+
| 2020-10-01 |
| 2020-10-01 |
| 2020-10-01 |
| 2000-01-01 |
| 2000-01-01 |
| 2069-10-01 |
| 2069-10-01 |
| 1970-01-01 |
| 1970-01-01 |
| 1999-01-01 |
| 1999-01-01 |
| 2022-11-18 |
| 2022-11-18 |
+------------+
```

### 5.3、TIME类型

TIME类型用来表示时间，不包含日期部分。在MySQL中，需要==3个字节==的存储空间来存储TIME类型的数据，可以使用==HH:MM:SS==格式来表示TIME类型，其中，HH表示小时，MM表示分钟，SS表示秒。

在MySQL中，向TIME类型的字段插入数据时，也可以使用几种不同的格式。

* 可以使用带有冒号的字符串，比如`D HH:MM:SS`、`HH:MM:SS`、`HH:MM`、`D HH`、或`SS`格式，都能被正确的插入TIME类型的字段中。

  * 其中D表示天，<font color='gree'>其最小值为0，最大值为34。</font>
  * （D 会转化为24小时进行求和运算 D*24+HH）。
  * 当使用带有冒号并且不带D的字符串表示时间时。表示当天的时间，比如12:10表示12:10:00，而不是00:12:10

* 可以使用不带有冒号的<font color='green'>字符串</font>或者<font color='green'>数字</font>，格式为`HHMMSS`或`HHMMSS`

  * 如果插入一个不合法的字符串或者数字，MySQL在存储数据时，会将其自动转化为00:00:00进行存储。比如1210，MySQL会将最右边的两位解析成秒，表示00:12:10，而不是12:10:00。

* 使用==CURRENT_TIME()==或者==NOW()==，会插入当前系统的时间。

  ```sql
  DROP TABLE IF EXISTS test_time1;
  CREATE TABLE test_time1(
  	f1 TIME
  );
  INSERT INTO test_time1
  VALUES('2 12:30:29'), ('12:35:29'), ('12:40'), ('2 12:40'),('1 05'), ('45');
  INSERT INTO test_time1
  VALUES ('123520'), (124011),(1210);
  INSERT INTO test_time1
  VALUES (NOW()), (CURRENT_TIME());
  SELECT * FROM test_time1;
  ```

### 5.4、DATETIME类型

DATETIME类型在所有的日期时间类型中占用的村粗空间最大，总共需要==8==个字节的存储空间。在格式上为DATE类型和TIME类型的组合，可以表示为==YYYY-MM-DD HH:MM:SS==，其中YYYY表示年份，MM表示月份，DD表示日期，HH表示小时，MM表示分钟，SS表示秒。

* 以==YYYY-MM-DD HH:MM:SS== 格式或者==YYYYMMDDHHMMSS==格式的字符串插入DATETIME的字段时
  * 以YYYYMMDDHHMMSS格式的数字插入DATETIME类型的字段时，会被转化为YYYY-MM-DD HH:MM:SS格式
  * 使用函数 ==CURRENT_TIMESTAMP()==和==NOW()==，可以向DATETIME类型的字段插入系统的当前日期和时间。

```sql
DROP TABLE test_datetime1;
CREATE TABLE test_datetime1(
	dt DATETIME
);
INSERT INTO test_datetime1
VALUES ('2021-01-01 06:50:30'), ('20210101065030');
INSERT INTO test_datetime1
VALUES ('99-01-01 00:00:00'), ('990101000000'), ('20-01-01 00:00:00'),
('200101000000');
INSERT INTO test_datetime1
VALUES (20200101000000), (200101000000), (19990101000000), (990101000000);
INSERT INTO test_datetime1
VALUES (CURRENT_TIMESTAMP()), (NOW());
SELECT * FROM test_datetime1;

+---------------------+
| dt                  |
+---------------------+
| 2021-01-01 06:50:30 |
| 2021-01-01 06:50:30 |
| 1999-01-01 00:00:00 |
| 1999-01-01 00:00:00 |
| 2020-01-01 00:00:00 |
| 2020-01-01 00:00:00 |
| 2020-01-01 00:00:00 |
| 2020-01-01 00:00:00 |
| 1999-01-01 00:00:00 |
| 1999-01-01 00:00:00 |
| 2022-11-18 14:11:27 |
| 2022-11-18 14:11:27 |
+---------------------+
12 rows in set (0.00 sec)
```

### 5.5、TIMESTAMP类型

TIMESTAMP类型也可以表示日期时间，其显示格式与DATETIME类型相同，都是==YYYY-MM-DD HH:MM:SS==，需要4个字节的存储空间。但是TIMESTAMP存储的时间范围比DATETIME要小很多，只能存储`1970-01-01 00:00:01 UTC`~`2038-01-19 03:14:07 UTC` 之间的时间。其中UTC表示世界统一时间，也叫作世界标准时间。

*  <font color='red'>存储数据的时候需要对当前时间所在的时区进行转换，查询数据的时候再将时间转换回当前的时区。</font>因此，<font color='gree'>使用TIMPSTAMP存储的同一个时间值，在不同的时区查询时回显示不同的时间</font>

向TIMESTAMP类型的字段插入数据时，当插入的数据格式满足==YY-MM-DD HH:MM:SS==和==YYMMDDHHMMSS==时，两位数值的年份同样符合YEAR类型的规则条件，只不过表示的时间范围要小很多。



```sql
DROP TABLE IF EXISTS test_timestamp1;
CREATE TABLE test_timestamp1(
	ts TIMESTAMP
);
INSERT INTO test_timestamp1
VALUES 
('1999-01-01 03:04:50'),
('19990101030405'),
('99-01-01 03:04:05');

INSERT INTO test_timestamp1
VALUES
('2020@01@01@00@00@00'),
('20@01@01@00@00@00');

INSERT INTO test_timestamp1
VALUES
(CURRENT_TIMESTAMP()),
(NOW());

#Incorrect datetime value
INSERT INTO test_timestamp1
VALUES ('2038-01-20 03:14:07');

SELECT * FROM test_timestamp1;
mysql> SELECT * FROM test_timestamp1;
+---------------------+
| ts                  |
+---------------------+
| 1999-01-01 03:04:50 |
| 1999-01-01 03:04:05 |
| 1999-01-01 03:04:05 |
| 2020-01-01 00:00:00 |
| 2020-01-01 00:00:00 |
| 2022-11-18 15:53:48 |
| 2022-11-18 15:53:48 |
+---------------------+
```

### 5.6、**TIMESTAMP和DATETIME的区别**

* TIMESTAMP存储空间比较小，表示的日期时间范围也比较小
* <font color='gree'>底层存储方式不同</font>
  * <font color='DeepSkyBlue'>TIMESTAMP底层存储的是毫秒值，距离1970-1-1 0:0:0 0毫秒的毫秒值。</font>
* <font color='DeepSkyBlue'>两个日期标胶大小或日期计算时，TIMESTAMP更方便、更快。</font>
* <font color='gree'>TIMESTAMP和时区有关。</font>
  * <font color='deepskyblue'>TIMESTAMP会根据用户的时区不同，显示不同的结果。</font>
  * <font color='deepskyblue'>而DATETIME则只能反映出插入时当地的时区，其它时区的查看数据必然会有误差的。</font>



```sql
DROP TABLE IF EXISTS temp_time;
CREATE TABLE temp_time(
d1 DATETIME,
d2 TIMESTAMP
);

INSERT INTO temp_time VALUES('2021-9-2 14:45:52','2021-9-2 14:45:52');
INSERT INTO temp_time VALUES(NOW(),NOW());
SELECT * FROM temp_time;
+---------------------+---------------------+
| d1                  | d2                  |
+---------------------+---------------------+
| 2021-09-02 14:45:52 | 2021-09-02 14:45:52 |
| 2022-11-18 16:09:45 | 2022-11-18 16:09:45 |
+---------------------+---------------------+
#修改当前的时区
SET time_zone = '+9:00';
SELECT * FROM temp_time;
+---------------------+---------------------+
| d1                  | d2                  |
+---------------------+---------------------+
| 2021-09-02 14:45:52 | 2021-09-02 15:45:52 |
| 2022-11-18 16:09:45 | 2022-11-18 17:09:45 |
+---------------------+---------------------+
```

总结：

用得最多的日期时间类型，就是 **DATETIME** 。虽然 MySQL 也支持 YEAR（年）、 TIME（时间）、 DATE（日期），以及 TIMESTAMP 类型，但是在实际项目中，尽量用 DATETIME 类型。因为这个数据类型 **包括了完整的日期和时间信息**，**取值范围也最大**，**使用起来比较方便**。毕竟，如果日期时间信息分散在 好几个字段，很不容易记，而且查询的时候，SQL 语句也会更加复杂。

此外，**一般存注册时间、商品发布时间等，不建议使用DATETIME存储**，而是使用 时间戳 ，因为 DATETIME虽然直观，但不便于计算。

```sql
select UNIX_TIMESTAMP();
mysql> select UNIX_TIMESTAMP();
+------------------+
| UNIX_TIMESTAMP() |
+------------------+
|       1668759249 |
+------------------+

```

## 6、文字文本类型

MySQL中，文本字符串总体上分为 ==CHAR== 、 ==VARCHAR== 、 ==TINYTEXT== 、==TEXT== 、 ==MEDIUMTEXT== 、 ==LONGTEXT==、==ENUM==、 ==SET== 等类型。

6.1、CHAR与VARCHAR类型

CHAR和VARCHAR类型都可以存储比较短的字符串。

| 字符串（文本）类型 | 特点     | 长度 | 长度范围                | 占用的存储空间 待处理        |
| ------------------ | -------- | ---- | ----------------------- | ---------------------------- |
| CHAR(M)            | 固定长度 | M    | 0<=M<=255               | M个字符 ？（M*字符集）个字节 |
| VARCHAR(M)         | 可变长度 | M    | 0<=M<=21845 0<=X<=65535 | M个字符 ？X个字节            |

### 6.1、CHAR类型

* CHAR(M) 类型一般需要预先定义字符串长度。如果不指定(M)，则表示长度默认是1个字符。
* 数据的实际长度比CHAR类型声明的长度小，则会在==右侧填充==空格以达到指定的长度。当MySQL检索CHAR类型的数据时，CHAR类型的字段会<font color='orange'>去除</font>**尾部的空格。**
* 定义CHAR类型字段时，声明的字段长度即为CHAR类型字段所占的存储空间的字符数。

```sql
#char类型
DROP TABLE IF EXISTS test_char1;
CREATE TABLE test_char1(
c1 CHAR,
c2 CHAR(5),
#max 255 
c3 CHAR(256) #错误
);

DESC test_char1;

INSERT INTO test_char1(c1)
VALUES('a');

#Data too long for column 'c1' at row 1
INSERT INTO test_char1(c1)
VALUES('ab');

INSERT INTO test_char1(c2)
VALUES('ab');

INSERT INTO test_char1(c2)
VALUES('hello');

INSERT INTO test_char1(c2)
VALUES('尚');

INSERT INTO test_char1(c2)
VALUES('硅谷');

#Data too long for column 'c2' at row 1
INSERT INTO test_char1(c2)
VALUES('尚硅谷IT教育');

INSERT INTO test_char1(c2)
VALUES('尚硅谷教育');

SELECT * FROM test_char1;

#检索到char类型去掉空格 取出
SELECT CONCAT(c2,'***')
FROM test_char1;

#检索到char类型去掉空格 存入
INSERT INTO test_char1(c2)
VALUES('ab  ')
#取出 存入 都一样
SELECT CHAR_LENGTH(c2)
FROM test_char1;


```

### 6.2、VARCHAR 类型

* VARCHAR(M)定义时，==必须指定==长度M，否则报错。

  * **4.0版本以下**，varchar(100)，指的是**100字节**，如果存放UTF8汉字时，只能存33个（每个汉字3字节）

    **5.0版本以上**，varchar(100)，指的是**100字符**，无论存放的是数字、字母还是UTF8汉字（每个汉字3字节），都可以存放100个。

```sql
DROP TABLE IF EXISTS test_varchar1;
CREATE TABLE test_varchar1(
	NAME VARCHAR #错误
)
#Column length too big for column 'NAME' (max = 21845);
CREATE TABLE test_varchar1(
	NAME VARCHAR(65535) #错误
)

CREATE TABLE test_varchar3(
NAME VARCHAR(5)
);
INSERT INTO test_varchar3
VALUES('尚硅谷'),('尚硅谷教育');
#Data too long for column 'NAME' at row 1
INSERT INTO test_varchar3
VALUES('尚硅谷IT教育');
```

###  **哪些情况使用 CHAR 或 VARCHAR 更好**

| 类型       | 特点     | 空间上       | 时间上 | 使用场景               |
| ---------- | -------- | ------------ | ------ | ---------------------- |
| CHAR(M)    | 固定长度 | 浪费存储空间 | 效率高 | 存储小数据，速度要求高 |
| VARCHAR(M) | 可变长度 | 节省存储空间 | 效率低 | 非CHAR的情况           |

使用的情况如下：

1. 存储很短的信息。比如门牌号码101，201...这样很短的信息应该用char，<font color='gree'>因为varchar还要占个byte用于存储信息长度</font>，本来打算节约存储的，结果得不偿失。
2. 固定长度的。比如使用uuid作为主键，那用char应该更合适。因为它固定长度，varchar动态根据长度的特性就消失了，而且还要占个长度信息。
3. 十分频繁改变的column。因为varchar每次存储都要有**额外的计算**，**得到长度等工作**，如果是一个非常频繁改变的，那就要有很多的精力用于计算，而这些对于char来说是不需要的。
4. 具体存储引擎中的情况：
   1. ==MyISAM== 数据存储引擎和数据列：MyISAM数据表，最好使用固定长度（char）的数据列代替可变场度（varchar）的数据列。这样使得整个表静态化，从而使==数据检索更快==，用空间换时间
   2. ==MEMORY== 存储引擎和数据列：MEMORY数据表目前都是用固定长度的数据行存储，因此无论使用CHAR或VARCHAR列都没有关系，**两者都是作为CHAR类型处理的。**
   3. ==InnoDB== 存储引擎，建议使用VARCHAR类型。因为对于InnoDB数据表，内部的行存储格式并没有区分固定长度和可变长度列（所有数据行都使用指向数据列值得头指针），而且**主要影响性能的因素是数据行使用的存储总量**（人话就是数据存储总量），由于char平均占用的空间多余varchar，所以除了简短并且固定长度的，其它考虑varchar。（尽量都用varchar）这样节省空间，对磁盘I/O和数据存储总量比较好。

### 6.3、TEXT类型

在MySQL中，TEXT用来保存文本类型的字符串，总共包含4种类型，分别为==TINYTEXT、TEXT、MEDIUMTEXT、LONGTEXT==类型

在向TEXT类型的字段保存和查询数据时，系统自动按照实际长度存储，不需要预先定义长度，这一点和VARCHAR类型相同。

| 文本字符串类型 | 特点               | 长度 | 长度范围                       | 占用的存储空间 |
| -------------- | ------------------ | ---- | ------------------------------ | -------------- |
| TINYTEXT       | 小文本、可变长度   | L    | 0<=L<=255                      | L+2 个字节     |
| TEXT           | 文本、可变长度     | L    | 0<=L<=65535                    | L+2 个字节     |
| MEDIUMTEXT     | 中等文本、可变长度 | L    | 0<=L<=16777215                 | L+3 个字节     |
| LONGTEXT       | 大文本、可变长度   | L    | 0<=L<=4294967295（相当于 4GB） | L+4 个字节     |

**由于实际存储的长度不确定，MySQL不允许TEXT类型的字段做主键**。遇到这种情况，你只能采用CHAR(M)，或者 VARCHAR(M)。

```sql
CREATE TABLE test_text(
tx TEXT
);
INSERT INTO test_text
VALUES('atguigu ');
SELECT CHAR_LENGTH(tx)
FROM test_text; #10

```

**开发中经验：**

TEXT文本类型，可以存比较大的文本段，搜索速度稍慢，因此如果不是特别大的内容，建议使用CHAR，VARCHAR来代替。还有TEXT类型不用加默认值，**加了也没用。**而且text和blob类型的数据删除后容易导致“空洞”，使得文件碎片比较多，所以频繁操作（不含查询）的表不建议包含TEXT类型字段，建议单独分出去，单独用一个表。

## 7、ENUM类型

ENUM类型也叫作枚举类型，ENUM类型的取值范围需要在定义字段时进行指定。设置字段值时，ENUM类型**只允许从成员中选取单个值**，**不能一次选取多个值。**

| 文本字符串类型 | 长度 |    长度范围     | 占用的存储空间 |
| :------------: | :--: | :-------------: | :------------: |
|      ENUM      |  L   | 1 <= L <= 65535 |   1或2个字节   |

<font color='gree'>其所需要的存储空间由定义ENUM类型时指定的成员个数决定。</font>

* 当ENUM类型包含1～255个成员时，需要1个字节的存储空间； 
* 当ENUM类型包含256～65535个成员时，需要2个字节的存储空间。
* ENUM类型的成员个数的上限为65535个。

```sql
DROP TABLE IF EXISTS test_enum;
CREATE TABLE test_enum(
#定义成员 不忽视大小写
	season ENUM('A春','夏','秋','冬','unknow')
);

INSERT INTO test_enum
VALUES('a春'),('秋');

#插入 忽略大小写
INSERT INTO test_enum
VALUE('UNKNOW');

#可以使用索引进行枚举元素的调用
INSERT INTO test_enum
VALUES(1),('3');
#错误 没有该成员
INSERT INTO test_enum
VALUE('AB');

#没有限制非空的情况下，可以添加null值。
INSERT INTO test_enum
VALUES (NULL);

SELECT * FROM test_enum;
```



## 8、SET类型

当SET类型包含的成员个数不同时，其所占用的存储空间也是不同的，具体如下：

| 成员个数范围（L表示实际成员个数） | 占用的存储空间 |
| --------------------------------- | -------------- |
| 1<=L<=8                           | 1个字节        |
| 9<=L<=16                          | 2个字节        |
| 17<=L<=24                         | 3个字节        |
| 25<=L<=32                         | 4个字节        |
| 33<=L<=64                         | 8个字节        |

SET类型在存储数据时成员个数越多，其占用的存储空间越大。注意：SET类型在选取成员时，可以<font color='gree'>一次 选择多个成员</font>，这一点与ENUM类型不同。

```sql
DROP TABLE IF EXISTS test_set;
CREATE TABLE test_set(
	str SET ('A','B','C')
);
INSERT INTO test_set (str)
VALUES ('A'),('A,B');

#插入重复的SET类型成员时，MySQL会自动删除重复的成员
INSERT INTO test_set (str)
VALUES ('A,B,C,A');

#向SET类型的字段插入SET成员中不存在的值时，MySQL会抛出错误。
INSERT INTO test_set(str)
VALUES ('A,B,C,D');

SELECT * 
FROM test_set;
```

枚举和set

```sql
CREATE TABLE temp_mul(
gender ENUM('男','女'),
hobby SET('吃饭','睡觉','打豆豆','写代码')
);

INSERT INTO temp_mul VALUES('男','睡觉,打豆豆'); #成功

# Data truncated for column 'gender' at row 1
INSERT INTO temp_mul VALUES('男,女','睡觉,写代码'); #失败

# Data truncated for column 'gender' at row 1
INSERT INTO temp_mul VALUES('妖','睡觉,写代码');#失败

INSERT INTO temp_mul VALUES('男','睡觉,写代码,吃饭'); #成功
```

## 9、二进制字符串类型

MySQL中的二进制字符串类型主要存储一些二进制数据，比如可以存储图片、音频和视频等二进制数据。

MySQL中支持的二进制字符串类型主要包括**BINARY**、**VARBINARY**、**TINYBLOB**、**BLOB**、**MEDIUMBLOB**和**LONGBLOB**类型

### 9.1、BINARY与VARBINARY类型

* BINARY和VARBINARY类似于CHAR和VARCHAR，只是他们存储的是二进制字符串。

* `BINARY[(M)]`

  * BINARY（M）为固定长度的二进制字符串，M表示最多能存储的**字节数**，取值范围是0~255个字符。
  * 如果未指定（M），表示只能存储==1个字节==。
  * 如果字段值不足（M）个字节，将在右边填充'\0'以补齐指定长度。

* `VARBINARY(M)`

  * VARCHAR(M)为可变长度的二进制字符串，M表示最多能存储的字节数，总字节数不能超过行的字节长度限制（65535）
  * 另外还要考虑额外字节开销，VARBINARY类型的数据除了存储数据本身外，还需要1或2个字节来存储数据的字节数。
  * VARBINARY类型==必须指定(M)==，否则报错。

  | 二进制字符串类型 | 特点     | 值的长度             | 占用空间  |
  | ---------------- | -------- | -------------------- | --------- |
  | BINARY(M)        | 固定长度 | M （0 <= M <= 255）  | M个字节   |
  | VARBINARY(M)     | 可变长度 | M（0 <= M <= 65535） | M+1个字节 |

```sql
DROP TABLE IF EXISTS test_binary1;
CREATE TABLE test_binary1(
f1 BINARY,
f2 BINARY(3),
#error
#f3 varbinary 
f4 VARBINARY(10)
)
DESC test_binary1;
INSERT INTO test_binary1(f1,f2)
VALUES('a','abc');
SELECT * FROM test_binary1;

#Data too long for column 'f1' at row 1
INSERT INTO test_binary1(f1)
VALUES('ab');
INSERT INTO test_binary1(f2,f4)
VALUES('ab','ab');

SELECT LENGTH(f2),LENGTH(f4)
FROM test_binary1;

```



### 9.2、BLOB类型

BLOB是一个==二进制大对象==，可以容纳可变数量的数据。

MySQL中的BLOB类型包括TINYBLOB、BLOB、MEDIUMBLOB和LONGBLOB 4种类型，他们可容纳值得最大长度不同。可以存储一个二进制的大对象，比如

`图片`、`音频`和`视频`等。

需要注意的是，在实际工作中，往往不会在MySQL数据库中使用BLOB类型存储大对象数据，通常会将图片、音频和视频文件存储到==服务器的磁盘上==，并将图片、音频和视频的访问路径存储到MySQL中。

| 二进制字符串类型 | 值得长度 |         长度范围          | 占用空间  |
| :--------------: | :------: | :-----------------------: | :-------: |
|     TINYBLOB     |    L     |         0<=L<=255         | L+1个字节 |
|       BLOB       |    L     |  0<=L<=65535(相当于64KB)  | L+3个字节 |
|    MEDIUMBLOB    |    L     | 0<=L<16777215(相当于16MB) | L+3个字节 |
|     LONGBLOB     |    L     | 0<=4294967295(相当于4GB)  | L+4个字节 |



```sql
#10.2 Blob类型
CREATE TABLE TEST_BLOB1(
id INT,
img MEDIUMBLOB
);
#logyong 点击上传图片
INSERT TEST_BLOB1(id) VALUES(1001);
```

**TEXT和BLOB得使用注意事项：**

在使用text和blob字段类型时要注意以下几点，以便更好的发挥数据库的性能。

①BLOB和TEXT值也会引起自己的一些问题，特别是执行了大量的删除或更新操作的时候。删除这种值会在数据表中留下很大的“==空洞==”，以后填入这些“==空洞==”的记录可能长度不同。为了提高性能，建议定期使用OPTIMIZE TABLE 功能对这类表进行==碎片整理==。

②如果需要对大文本字段进行模糊查询，MySQL提供了==前缀索引==。但是仍然要在不必要的时候避免检索大型的BLOB或TEXT值。例如，SELECT * 查询就不是很好的想法，除非你能够确定作为约束条件的WHERE子句只会找到所需要的数据行。否则，你可能毫无目的地在网络上传输大量的值。

③把BLOB或TEXT列==分离到单独的表==中。在某些环境中，如果把这些数据列移动到第二张数据表中，可以让你把原数据表中的数据列转换为固定长度的数据行格式，那么它就是有意义的。这会==减少主表中的碎片==，使你得到固定长度数据行的性能优势。它还使你在主数据表上运行SELECT*查询的时候不会通过网络传输大量的BLOB或TEXT值。

## 10、JSON类型

JSON（JavaScript Object Notation）是一种轻量级的 ==数据交换格式== 。简洁和清晰的层次结构使得 JSON 成 为理想的数据交换语言。它易于人阅读和编写，同时也易于机器解析和生成，并有效地提升网络传输效率。**JSON 可以将 JavaScript 对象中表示的一组数据转换为字符串，然后就可以在网络或者程序之间轻 松地传递这个字符串，并在需要的时候将它还原为各编程语言所支持的数据格式。**

MySQL5.7中。已经支持JSON数据类型。

当需要检索JSON类型的字段数的某个具体值时，可以**使用“->”和“->>”符号。**

```SQL
DROP TABLE IF EXISTS test_json;
CREATE TABLE test_json(
	js json
);

INSERT test_json (js) 
VALUES
  (
    '
{
    "name":"songhk",
    "age":18,
    "address":{
        "province":"beijing",
        "city":"beijing"
    }
}'
  ) ;
DROP TABLE IF EXISTS test_json;
CREATE TABLE test_json(
	js VARCHAR(200)
);

INSERT test_json (js) 
VALUES
  (
    '
{
    "name":"songhk",
    "age":18,
    "address":{
        "province":"beijing",
        "city":"beijing"
    }
}'
  ) ;
SELECT * FROM test_json;
SELECT CONCAT(js -> '$.name') AS NAME,js -> '$.age' AS age
,js -> '$.address.province' AS province,js->'$.address.city' AS city
FROM test_json;
```

![image-20221205162138714](MySql.assets\image-20221205162138714.png)

varchar和json性能基本相同，在不进行json读取情况下使用varchar更好。

## 11、空间类型

YySQL 空间类型扩展支持地理特征的生成、存储和分析。这里的地理特征表示世界上具有位置的任何东 西，可以是一个实体，例如一座山；可以是空间，例如一座办公楼；也可以是一个可定义的位置，例如 一个十字路口等等。MySQL中使用 <font color='orange'>Geometry</font><font color='orange'>（几何）</font> 来表示所有地理特征。Geometry指一个点或点的 集合，代表世界上任何具有位置的事物。 

MySQL的空间数据类型（Spatial Data Type）对应于OpenGIS类，包括单值类型：GEOMETRY、POINT、 LINESTRING、POLYGON以及集合类型：**MULTIPOINT**、**MULTILINESTRING**、**MULTIPOLYGON**、 **GEOMETRYCOLLECTION** 。

* **Geometry**是所有空间集合类型的**基类**，其它类型如**POINT**(点)、**LINESTRING**(线串)、**PLOYGON**(多边形)都是Geometry的 子类。
  * Point，顾名思义就是点，有一个坐标值。例如POINT(121.213342 31.234532)，POINT(30 10)， 坐标值支持DECIMAL类型，经度（longitude）在前，维度（latitude）在后，用空格分隔。
  * LineString，线，由一系列点连接而成。如果线从头至尾没有交叉，那就是简单的 （simple）；如果起点和终点重叠，那就是封闭的（closed）。例如LINESTRING(30 10,10 30,40 40)，点与点之间用逗号分隔，一个点中的经纬度用空格分隔，与POINT格式一致。
  * Polygon，多边形。可以是一个实心平面形，即没有内部边界，也可以有空洞，类似纽扣。最简单的就是只有一个外边界的情况，例如POLYGON((0 0,10 0,10 10, 0 10))
  * 

![image-20221205164852041](MySql.assets\image-20221205164852041-16702301381131.png)



* **MultiPoint**、**MultiLineString**、**MultiPolygon**、**GeometryCollection**这4种类型都是集合类，<font color='gree'>是多个Point、LineString或Polygon组合而成。</font>

![image-20221205165118867](MySql.assets\image-20221205165118867.png)



## 12、小结及选择建议

在定义数据类型时，如果确定时==整数==，就用==INT==；如果是==小数==，一定用定点数类型==DECIMAL==;如果是日期与时间，就用==DATETIME==（建议用timestamp **2070年过期**）

这样做的好处是，首先确保你的系统不会因为数据类型定义出错。不过，凡事都是有两面的，可靠性好，并不意味着高效。比如，TEXT虽然使用方便，但是效率不如CHAR(M)和VARCHAR(M)。

关于字符串的选择，建议参考如下阿里巴巴的《Java开发手册》规范：

**阿里巴巴《Java开发手册》之MySQL数据库：**

* 任何字段如果为非负数，必须是UNSIGNED
* 【强制】小数类型为 DECIMAL，禁止使用 FLOAT 和 DOUBLE。
  * 说明：在存储的时候，FLOAT 和 DOUBLE 都存在精度损失的问题，很可能在比较值的时候，得 到不正确的结果。如果存储的数据范围**超过** DECIMAL 的**范围**，**建议将数据拆成整数和小数并 分开存储。**
* 【 强制 】如果存储的字符串长度几乎相等，使用 CHAR 定长字符串类型。
* 【 强制 】VARCHAR 是可变长字符串，不预先分配存储空间，长度不要超过 **5000**。如果存储长度大 于此值，定义字段类型为 TEXT，独立出来一张表，用主键来对应，避免影响其它字段索引效率。











# 十三、约束

## 1、约束概述

### 1.1、为什么要他

数据完整性是指数据的精确性和可靠性。塔是防止数据库中存在不符合语义规定的数据和防止因错误信息的输入输出造成无效操作或错误信息而提出的。

为了保证数据的完整性，SQL规范以约束的方式对**表数据进行额外的条件限制。**从以下四个方面考虑：

* ==实体完整性（Entity Integrity）：==
* ==域完整性（Domain Integrity）：==例如：年龄范围0-120，性别范围“男/女”

* ==引用完整性（Referential Integrity）==：
* ==用户自定义完整性（User-defined Integrity）==：例如：用户名唯一

### 1.2、他是什么

约束时表级的强制规定

可以在**创建表时规定约束（通过 CREATE TABLE语句）**，或者在**表创建之后通过ALTER TABLE语句规定约束**。

### 1.3 约束的分类

* **根据约束数据列的限制**，约束可分为：

  * **单列约束**：每个约束只约束一列。
  * **多列约束**：每个约束可约束多列数据

* **根据约束的作用范围**，约束可分为：

  * **列级约束**：只能作用在一个列上，跟在列的定义后面。
  * **表级约束**：可以作用在多个列上，不与列一起，，而是单独定义。

  

|            | 位置         | 支持的约束类型             | 是否可以起约束名     |
| ---------- | ------------ | -------------------------- | -------------------- |
| 列级约束： | 列的后面     | 语法都支持，但外键没有效果 | 不可以               |
| 表级约束： | 所有列的下面 | 默认和非空不支持，其它支持 | 可以（主键没有效果） |



* **根据约束起的作用**，约束可分为：
  * NOT NULL 非空约束，规定某个字段不能为空
  * UNIQUE 唯一约束 ，规定某个字段在整个表中是唯一的
  * PRIMARY KEY 主键（非空且唯一）约束
  * FOREIGN KEY 外键约束
  * CHECK 检查约束
  * DEFAULT 默认值约束




* 查看某个表已有的约束

```sql
#information_schema数据库名（系统库）
#table_constraints表名称（专门存储各个表的约束）
SELECT * FROM information_schema.table_constraints
WHERE table_name = 'test_json';


例子
mysql> select * from information_schema.table_constraints where table_name='lab_gdt';
+--------------------+-------------------+-----------------+--------------+------------+-----------------+----------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA | CONSTRAINT_NAME | TABLE_SCHEMA | TABLE_NAME | CONSTRAINT_TYPE | ENFORCED |
+--------------------+-------------------+-----------------+--------------+------------+-----------------+----------+
| def                | lims              | id              | lims         | lab_gdt    | UNIQUE          | YES      |
| def                | lims              | PRIMARY         | lims         | lab_gdt    | PRIMARY KEY     | YES      |
| def                | lims              | lab_gdt_ibfk_1  | lims         | lab_gdt    | FOREIGN KEY     | YES      |
| def                | lims              | lab_gdt_chk_1   | lims         | lab_gdt    | CHECK           | YES      |
+--------------------+-------------------+-----------------+--------------+------------+-----------------+----------+
```

## 2、非空约束

### 2.1 作用

限定某个字段/某列的值不允许为空

### 2.2 关键字

NOT NULL

### 2.3 特点

* 默认，所有的类型的值都可以是NULL，包括INT、FLOAT等数据类型
* **列级约束**
* 空字符串`''`不等于NULL，0也不等于NULL
* 该约束好像没约束名字

### 2.4 添加非空约束

* （1）建表时

```mysql
CREATE TABLE 表名称(
字段名 数据类型,
字段名 数据类型 NOT NULL,
字段名 数据类型 NOT NULL
);
```

例子：

```mysql
DROP TABLE IF EXISTS student1;
CREATE TABLE student1(
	sid INT,
  sname VARCHAR(20) NOT NULL,
  tel CHAR(11),
  cardid CHAR(18) NOT NULL
);
#success
INSERT INTO student1 VALUES(1,'张三','1234546','213345465');
#身份证号为空 fail
#Column 'cardid' cannot be null
INSERT INTO student1 VALUE(2,'李四','123456',NULL);
#成功，tel允许为空
INSERT INTO student1 VALUES(2,'李四',NULL,'1234554656');
#fail
#Column 'cardid' cannot be null
INSERT INTO student1 VALUES(3,NULL,NULL,'12579');
#Column count doesn't match value count at row 1 先看看有没有默认值，没有在赋值空
INSERT INTO student1 VALUES(3,'12579');


```

建表后

```mysql
#注意modify 和 add 是针对 列，不是约束
ALTER TABLE student1 MODIFY sid INT NOT NULL;

```

### 2.5 删除非空约束

```mysql
#相当于修改某个非注解字段，该字段允许为空
ALTER TABLE student1 MODIFY sid INT NULL;
#或者 #去掉not null，相当于修改某个非注解字段，该字段允许为空
ALTER TABLE student1 MODIFY sid INT;
```

## 3、唯一约束

### 3.1 作用

* 用来限制某个字段/某列的值不能重复

### 3.2 关键字

* UNIQUE

### 3.3 特点

* 列级约束、列级复合约束（注意是<font color='gree'>是一起的组合</font>不唯一哦）
* 唯一性约束允许列值为空
* 在创建为约束的时候，<font color='orange'>如果不给唯一约束命名，就默认和列名相同</font>
*  **MySQL会给唯一约束的列上默认创建一个唯一索引**



例子 

```mysql
  create table 表名称(
  字段名 数据类型,
  字段名 数据类型 unique,
  字段名 数据类型 unique key,
  字段名 数据类型
  );
  create table 表名称(
  字段名 数据类型,
  字段名 数据类型,
  字段名 数据类型,
  [constraint 约束名] unique key(字段名)
  );
```

举例

  ```mysql
    #表示用户名和密码组合不能重复
    DROP TABLE IF EXISTS USER;
    CREATE TABLE USER(
    id INT NOT NULL,
    NAME VARCHAR(25),
    PASSWORD VARCHAR(16),
    -- 使用表级约束语法
    CONSTRAINT uk_name_pwd UNIQUE(NAME,PASSWORD)
    );
    
    
    #重复值演示
    insert into student values(2,'李四','13710011003','101223199012015624');
    insert into student values(3,'王五','13710011004','101223199012015624'); #身份证号重复
    #ERROR 1062 (23000): Duplicate entry '101223199012015624' for key 'cardid'
    
  ```

建表后指定唯一约束

```mysql
#列级复合约束
alter table 表名称 add unique key(字段列表,...,...);
#列级约束
#方式一
alter table 表名称 add unique key(字段列表);
#方式二
alter table 表名称 modify 字段名 字段类型 unique;
```

### 3.4、删除唯一约束

* 添加唯一性约束的列上也会自动创建唯一索引
* 删除唯一约束只能通过删除唯一索引的方式删除。
* 删除时需要指定唯一索引名，唯一索引名就和唯一约束名一样。
* 如何创建唯一约束时未指定名称，如果时单列，就默认和列名相同；如果是组合列，那么默认和列表中排在第一个的列名相同，也可以自定义唯一性约束名。

```mysql
SELECT * FROM information_schema.table_constraints
WHERE table_name='表名';
```

```mysql
ALTER TABLE USER
DROP INDEX uk_name_pwd;
```

```mysql
#查看表索引
SHOW INDEX FROM USER;
mysql> SHOW INDEX FROM USER;
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| user  |          0 | uk_name_pwd |            1 | name        | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| user  |          0 | uk_name_pwd |            2 | PASSWORD    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.00 sec)
```

## 4、主键约束

### 4.1 作用

用来唯一标识表中的一行记录

### 4.2 关键字

primary key

### 4.3 特点

* 主键约束相当于**唯一约束+非空约束的组合**，主键约束列不允许重复，也不允许出现空值
* <font color='gree'>一个表最多只能有一个主键约束</font>
* 列级约束，列级复合约束（这些列不能为空，且这些列组合的值不允许重复）
* **MySQL的主键名总是PRIMARY**，自己自定义命名耶没用
* 当创建主键约束时，系统默认会在所在的列或列组合上建立对应的**主键索引**（能够根据主键查询的，就根据主键查询，效率更高）。如果删除主键约束了，主键约束对应的索引就自动删除了。
* 需要注意的一点是，**不要修改主键字段的值。**因为主键的**目的**是数据记录的唯一标识，如果修改了主键的值，就有可能会破环数据的完整性。

### 4.4 添加主键约束

```sql
create table 表名称(
	字段名 数据类型 primary key,#列级模式
  字段名 数据类型 NOT NULL,
  字段名 数据类型 NOT NULL
)
create table 表名称(
	字段名 数据类型,
  字段名 数据类型,
  字段名 数据类型,
  [constraint 约束名] primary key(字段名)#表级模式

)
#复合主键 （没有联和主键，是网上瞎说的）
create table 表名称(
字段名 数据类型,
字段名 数据类型,
字段名 数据类型,
primary key(字段名1,字段名2) #表示字段1和字段2的组合是唯一的，也可以有更多个字段
);#例子：sc表（student、course）

```

举例：

```sql
create table temp(
	id int primary key,
  name varchar(20)
)
desc temp;
+-------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id | int(11) | NO | PRI | NULL | |
| name | varchar(20) | YES | | NULL | |
+-------+-------------+------+-----+---------+-------+

#演示一个表建立两个主键约束
create table temp(
id int primary key,
name varchar(20) primary key
);
ERROR 1068 (42000): Multiple（多重的） primary key defined（定义）
```

### 4.5 删除主键约束

```sql
alter table 表名称 drop primary key;

ALTER TABLE student DROP PRIMARY KEY;

```

## 5、自增列

### 5.1 作用

某个字段的值自增

### 5.2 关键字

auto_increment

### 5.3 特点和要求

* **一个表最多只能有一个自增长列**
* 当需要产生唯一标识符或顺序值时，可设置自增长
* 自增长列约束的列必须是键列（**主键列**，**唯一键列**）
* 自增约束的列的数据类型必须是==整数类型==
* 如果自增列指定了**0和null**，会在当前最大值的基础上自增；如果自增列手动指定了具体值，直接赋值为具体值。

错误演示：

```sql
create table employee(
eid int auto_increment,
ename varchar(20)
);
# ERROR 1075 (42000): Incorrect table definition; there can be only one auto column
and it must be defined as a key
```

```sql
create table employee(
eid int primary key,
ename varchar(20) unique key auto_increment
);
# ERROR 1063 (42000): Incorrect column specifier for column 'ename' 因为ename不是整数类型
```

### 5.4 如何指定自增约束

```sql
alter table 表名称 modify 字段名 数据类型 auto_increment;#给这个字段增加自增约束
```



```sql
DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
eid INT PRIMARY KEY,
ename VARCHAR(20)

);
DESC employee;

ALTER TABLE employee MODIFY eid INT AUTO_INCREMENT ;
DESC employee;
```

### 5.5 如何删除自增约束



```sql
ALTER TABLE 表名称 MODIFY 字段名 数据类型; #去掉auto_increment相当于删除
ALTER TABLE employee MODIFY eid INT;

DESC employee;

```

### 5.6 MySQL8.0新特性-自增变量的持久化

在MySQL8.0之前自增主键AUTO_INCREMENT的值如果大于max(primary key)+1,在MySQL重启后，会重置AUTO_INCREMENT=MAX(primary key)+1，这种现象在某些情况下会导致业务主键冲突或者其它难以发现的问题。下面通过案列来对比不同的版本中自增变量时否持久化。略。。。

* 在MySQL 5.7系统中，对于自增主键的分配规则，是由InnoDB数据字典 内部一个 **计数器** 来决定的，而该计数器只在 **内存中维护** ，并不会持久化到磁盘中。当数据库重启时，该计数器会被初始化
* MySQL 8.0将自增主键的计数器持久化到 **重做日志** 中。每次计数器发生改变，都会将其写入重做日志 中。如果数据库重启，InnoDB会根据重做日志中的信息来初始化计数器的内存值。

## 6、外键约束

### 6.1、作用

限定某个表的某个字段的引用完整性

比如：员工表的员工所在部门的选择，必须在部门表能够找到对应的部分。

### 6.2、关键字

FOREIGN KEY

### 6.3、主表和从表/父表和子表

主表（父表）：被引用的表，被参考的表

从表（子表）：引用别人的表，参考别人的表

### 6.4、特点

* 从表的外键列，必须引用主表的**主键**或**唯一约束**列
  * 为什么？
    * 因为被依赖/被参考的值必须是唯一的
* 在创建外键约束时，如果不给外键约束命名，**默认名不是列名，而是自动产生一个外键名（例如：student_ibfk_1）**,也可以指定外键约束名。
* 创建（CREATE）表时就指定外键约束的话，先创建主表，再创建从表
* 删表时，先删从表（或先删除外键约束），再删除主表
* 当主表的记录被从表参照时，主表的记录将不允许删除，如果要删除数据，需要先删除从表中依赖该记录的数据，然后菜可以删除主表的数据。
* 是在==从表==中指定外键约束，==并且一个表可以建立多个外键约束==
* **从表的外键列**与主表被参照的列名字**可以不相同**，但是**数据类型必须一样**，逻辑意义一致。如果类型不一样，创建子表时，就会出现错误==ERROR 1005 (HY000): Can't create table'database.tablename'(errno: 150)==

* 删除外键约束后，必须==手动==删除对应的索引。



### 6.5、添加外键约束

1. 建表时

```sql
create table 主表名称(
	字段1 数据类型 primary key,
  字段2 数据类型
)

create table 从表名称(
	字段1 数据类型 primary key,
  字段2 数据类型，
  [CONSTRAINT <外键约束名称>] FOREIGN KEY (从表的某个字段) references 主表名（被参考字段）
)
```

```sql
create table dept( #主表
did int primary key, #部门编号
dname varchar(50) #部门名称
);
create table emp(#从表
eid int primary key, #员工编号
ename varchar(5), #员工姓名
deptid int, #员工所在的部门
foreign key (deptid) references dept(did) #在从表中指定外键约束
#emp表的deptid和和dept表的did的数据类型一致，意义都是表示部门的编号
);
```

2. 建表后

```sql
ALTER TABLE 从表名 ADD [CONSTRAINT 约束名] FOREIGN KEY （从表的字段） REFERENCES 主表名（被引用字段）[on update xx][on delete xx];
```

```sql
ALTER TABLE emp1
ADD [CONSTRAINT emp_dept_id_fk] FOREIGN KEY(dept_id) REFERENCES dept(dept_id);
```

```sql
create table dept(
did int primary key, #部门编号
dname varchar(50) #部门名称
);
create table emp(
eid int primary key, #员工编号
ename varchar(5), #员工姓名
deptid int #员工所在的部门
);
#这两个表创建时，没有指定外键的话，那么创建顺序是随意
alter table emp add foreign key (deptid) references dept(did);

```

### 6.6、演示问题

略

### 6.7、约束等级 ⭐⭐

* cascade方式==：在父表update/delete记录时，**同步**update/delete掉子表的匹配记录
* ==set null方式==：在父表上update/delete记录时，**将子表上匹配记录的列设为null**，但是要注意子表的外键列不能未not null
* ==no action方式==：如果子表中有匹配的记录，则不允许对父表对应候选键进行update/delete操作
* ==restrict方式==：同no action，都是立即检查外键约束
* ==set default方式==：（在可视化工具SQLyog中可能显示空白）：父表有变更时，子表将外键列设置成一个**默认的值**，**但Innodb不能识别**
* 如果没有指定等级，就相当于<font color='gree'>Restrict</font>方式。

> #### 推荐方式
>
> ```sql
> ON UPDATE CASCADE ON DELETE RESTRICT
> ```
>
> 

(1)演示1： `on update set null on delete cascade`

```sql
create table dept(
did int primary key, #部门编号
dname varchar(50) #部门名称
);
create table emp(
eid int primary key, #员工编号
ename varchar(5), #员工姓名
deptid int, #员工所在的部门
foreign key (deptid) references dept(did) on update set null on delete cascade
#把修改操作设置为set null等级，把删除操作设置为级联删除等级
);
insert into dept values(1001,'教学部');
insert into dept values(1002, '财务部');
insert into dept values(1003, '咨询部');
insert into emp values(1,'张三',1001); #在添加这条记录时，要求部门表有1001部门
insert into emp values(2,'李四',1001);
insert into emp values(3,'王五',1002);
mysql> select * from dept;
+------+--------+
| did | dname |
+------+--------+
| 1001 | 教学部 |
| 1002 | 财务部 |
| 1003 | 咨询部 |
+------+--------+
3 rows in set (0.00 sec)
mysql> select * from emp;
+-----+-------+--------+
| eid | ename | deptid |
+-----+-------+--------+
| 1 | 张三 | 1001 |
| 2 | 李四 | 1001 |
| 3 | 王五 | 1002 |
+-----+-------+--------+
3 rows in set (0.00 sec)
#修改主表，从表对应的字段设置为null
mysql> update dept set did = 1004 where did = 1002;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1 Changed: 1 Warnings: 0
mysql> select * from dept;
+------+--------+
| did | dname |
| 1003 | 咨询部 |
| 1004 | 财务部 | #原来did是1002
+------+--------+
3 rows in set (0.00 sec)
mysql> select * from emp;
+-----+-------+--------+
| eid | ename | deptid |
+-----+-------+--------+
| 1 | 张三 | 1001 |
| 2 | 李四 | 1001 |
| 3 | 王五 | NULL | #原来deptid是1002，因为部门表1002被修改了，1002没有对应的了，就设置为
null
+-----+-------+--------+
3 rows in set (0.00 sec)
#删除主表的记录成功，主表的1001行被删除了，从表相应的记录也被删除了
mysql> delete from dept where did=1001;
Query OK, 1 row affected (0.00 sec)
mysql> select * from dept;
+------+--------+
| did | dname | #部门表中1001部门被删除
+------+--------+
| 1003 | 咨询部 |
| 1004 | 财务部 |
+------+--------+
2 rows in set (0.00 sec)
mysql> select * from emp;
+-----+-------+--------+
| eid | ename | deptid |#原来1001部门的员工也被删除了
+-----+-------+--------+
| 3 | 王五 | NULL |
+-----+-------+--------+
1 row in set (0.00 sec)

```

### 6.8、删除外键约束

流程如下：

```sql
（1）第一步先查看约束名和删除外键约束
SELECT * FROM information_schema.table_constraints WHERE table_name='表名称'#查看某个表的约束名

ALTER TABLE 从表名 DROP  FOREIGN KEY 外键约束名；
（2）第二步查看索引名和删除索引（注意，只能手动删除）
SHOW INDEX FROM 表名称；#查看某个表的索引名
ALTER TABLE 从表名 DROP INDEX 索引名；

```

**问题1：如果两个表之间有关系（一对一、一对多），比如：员工表和部门表（一对多），它们之间是否 一定要建外键约束？**

答：不是的

**问题2：建和不建外键约束有什么区别？**

* 答：建外键约束，你的操作（创建表、删除表、添加、修改、删除）会受到限制，从语法层面受到限 制。例如：在员工表中不可能添加一个员工信息，它的部门的值在部门表中找不到。 
* 不建外键约束，你的操作（创建表、删除表、添加、修改、删除）不受限制，要保证数据的 引用完整 性 ，只能依 靠程序员的自觉 ，或者是 在Java程序中进行限定 。例如：在员工表中，可以添加一个员工的 信息，它的部门指定为一个完全不存在的部门。

**问题3：那么建和不建外键约束和查询有没有关系？**

答：没有

> 在MySQL里，外键约束是有成本的，需要消耗系统资源。对于**大并发的SQL操作**，有可能会不适合。比如大型网站的中央数据库，可能会==因为外键约束的系统开销而变得非常慢==，所以，MySQL允许你不使用系统自带的外键约束，在==应用层面==完成检查数据的一致性的逻辑。也就是说，即使你不用外键约束，也要想办法通过应用层面的附加逻辑，来实现外键约束的功能，确保数据的一致性。

### 6.9 阿里开发规范

【 **强制** 】不得使用外键与级联，一切外键概念必须在应用层解决。

**说明：**（概念解释）学生表中的 student_id 是主键，那么成绩表中的 student_id 则为外键。如果更新学 生表中的 student_id，同时触发成绩表中的 student_id 更新，即为级联更新。外键与级联更新适用于 **单机低并发** ，不适合 **分布式** 、 **高并发集群** ；级联更新是**强阻塞**，存在数据库 **更新风暴** 的风险；外键影响 数据库的 **插入速度** 。

## 7、CHECK约束

### 7.1 作用

检查某个字段的值是否符合xx要求，一半值的是值得范围

### 5.2、关键字

CHECK

### 5.3、说明：MySQL5.7不支持

MySQL5.7可以使用check约束，但check约束对数据验证没有任何作用。添加数据时，没有热河错误或警告

但是==MySQL8.0中可以使用check约束了==

### 5.4、例子

```sql
gender char check('男' or '女')
age INT check(age > 20)
sex char(2) check(sex in('男','女'))
CHECK(height>=0 AND height<3)
```

## 8、DEFAULT约束

### 8.1、作用

给某个字段/某列指定默认值，一旦设置默认值，在插入数据时，如果此字段没有显示赋值，则赋值为默认值。

### 8.2、关键字

DEFAULT

### 8.3如何给字段加默认值

（1）建表时

```sql
create table 表名称(
字段名 数据类型 primary key,
字段名 数据类型 unique key not null,
字段名 数据类型 unique key,
字段名 数据类型 not null default 默认值,
);
create table employee(
eid int primary key,
ename varchar(20) not null,
gender char default '男',
tel char(11) not null default '' #默认是空字符串
);

```

（2）建表后

```sql
alter table 表名称 modify 字段名 数据类型 default 默认值;
#如果这个字段原来有非空约束，你还保留非空约束，那么在默认值约束时，还得保留非空约束，否则非空约束就被删除了
#同理，在给某个字段加默认值约束也一样，如果这个字段原来有默认值约束，你想保留，也要在modify语句中保留默认值约束，否则就删除了
alter table 表明成 modify 字段名 数据类型 default 默认值 not null;
```



## 9、面试

==面试1、为什么建表时，加`not null default` 或 `default 0`==

答：不想让表中出现null值。

==面试2、为什么不想要null的值==

答：（1） 不好比较。null是一种特殊值，比较时只能用专门的is null 和 is not null来比较。碰到运算符，通常返回null。

（2）效率不高。影响提高索引效果。因此，我们往往在建表时not null default 或 default 0

==面试3、带AUTO_INCREMENT约束的字段值是从1开始的吗？== 

答：是的，默认是1。使用时，可以在插入数据时指定一个值。此后的值在该值上自动加1

==面试4、并不是每个表都可以任意选择存储引擎？==**外键约束（FOREIGN KEY)不能跨引擎使用。**

MySQL支持多种存储引擎，每一个表都可以指定一个不同的存储引擎，需要注意的是：外键约束是用来保证数据的参照完整性，如果表之间需要关联外键，却指定了不同的存储引擎，那么这些表之间是不能创建外键约束的。所以说，存储引擎的选择也不完全是随意的。

# 十四、视图

## 1、常见的数据库对象

| 对象                  | 描述                                                         |
| --------------------- | ------------------------------------------------------------ |
| 表(TABLE)             | 表是存储数据的路基单元，以行和列的行时存在，列就是字段，行就是记录 |
| 数据字典              | 就是系统表，存放数据库相关信息的表。系统表的数据通常由数据库系统维护， 程序员通常不应该修改，只可查看 |
| 约束 (CONSTRAINT)     | 执行数据校验的规则，用于保证数据完整性的规则                 |
| 视图(VIEW)            | 一个或者多个数据表里的数据的逻辑显示，视图并不存储数据       |
| 索引(INDEX)           | 用于提高查询性能，相当于书的目录                             |
| 存储过程（PROCEDURE） | 用于完成一次完整的业务处理，没有返回值，但可通过传出参数将多个值传给调用环境 |
| 存储函数(FUNCTION)    | 用于完成一次特定的计算，具有一个返回值                       |
| 触发器（TRIGGER）     | 相当于一个事件监听器，当数据库发生特定事件后，触发器被触发，完成相应的处理。 |

> ### 为什么使用视图
>
> 相当于缓存，比再去查询多个表好

## 2、视图概述

* 视图时一种==虚拟表==，本身是==不具有数据==的，占用很少的内存空间，它是SQL中的一个重要概念
* ==视图建立在已有表的基础上==，视图依赖的这些表建立的叫==基表==
* 特点
  * 视图，可以看做事一个虚拟表，本身事不存储数据的。视图的本质，就可以看作是**存储起来的SELECT语句。**
  * 视图中SELECT语句中涉及到的表称为基表
  * 针对视图做DML操作，会影响到对应的基表中的数据，反之亦然。
  * 视图本身的删除，不会导致基表中数据的删除。
  * 视图的应用场景：针对于小型项目，不推荐使用视图。

## 3、创建视图

* 准备工作

  ```sql
  CREATE DATABASE dbtest4;
  USE dbtest4;
  
  CREATE TABLE emps
  AS
  SELECT *
  FROM atguigudb.`employees`;
  
  CREATE TABLE depts
  AS
  SELECT *
  FROM atguigudb.`departments`;
  
  SELECT * FROM emps;
  SELECT * FROM depts;
  ```

  

* **在 CREATE VIEW 语句中嵌入子查询**

```sql
  CREATE [OR REPLACE]
  [ALGORITHM={UNDEFINED | MERGE | TEMPTABLE}]
  VIEW 视图名称 [(字段列表)]
  AS 查询语句
  [WITH [CASCADED | LOCAL ] CHECK OPTION]
```

* 精简版

```sql
CREATE VIEW 视图名称
AS 查询语句
```

### 3.1、基于单表

举例：

```sql
#单表视图
#情况1：视图中的字段与基表的字段有一一对应关系
CREATE VIEW vu_emp1
AS
SELECT employee_id,last_name,salary#字段名称与表字段一致
FROM emps;

	
#确定视图中字段名的方式1：
CREATE VIEW vu_emp2
AS
SELECT employee_id emp_id,last_name lname,salary#查询语句中字段的别名会作为视图中字段的名称
FROM emps
WHERE salary > 8000;
#确定视图中字段名的方式2：
CREATE VIEW vu_emp3(emp_id,NAME,monthly_sal)
AS
SELECT employee_id,last_name,salary
FROM emps
WHERE salary > 8000;

SELECT * FROM vu_emp3;

#情况2：视图中的字段再基表中可能没有对应的字段
CREATE VIEW vu_emp_sal
AS
SELECT department_id,AVG(salary) avg_sal
FROM emps
WHERE department_id IS NOT NULL
GROUP BY department_id;

SELECT * FROM vu_emp_sal;

```

### 3.2、基于多表

```sql
CREATE VIEW vu_emp_dept
AS
SELECT e.employee_id,e.department_id,d.department_name
FROM emps e JOIN depts d
ON e.department_id=d.department_id;

SELECT * FROM vu_emp_dept;
```

### 3.3、基于视图创建视图

```sql
CREATE VIEW vu_emp4
AS
SELECT employee_id,last_name
FROM vu_emp1;

SELECT * FROM vu_emp4;
```



## 4、查看视图

语法1：查看数据库的表对象、视图对象

```SQL
SHOW TABLES;
```



语法2：查看视图的结构

```sql
DESC /DESCRIBE 视图名称；
```

语法3：查看视图的属性信息

```sql
#查看视图信息（显示数据表的存储引擎、版本、数据行书和数据大小等）
SHOW TABLE STATUS LIKE '视图名称'\G
```

![image-20230201092817392](MySql.assets\image-20230201092817392.png)

执行结果显示，注释Comment为VIEW，说明该表为视图，其它的信息为NULL，说明这是一个虚表。

语法4：查看视图的详细定义信息

![image-20230201093007437](MySql.assets\image-20230201093007437.png)

## 5、更新视图数据

#### 5.1 一般情况

MySQL支持使用INSERT、UPDATE和DELETE语句对**视图**中的数据进行**插入、更新和删除**操作。当视图中的数据发生变化时，数据表中的数据也会发生变化，反之亦然。

```sql
DROP VIEW IF EXISTS emp_tel;
CREATE VIEW emp_tel
AS 
SELECT * FROM employees;

SELECT * FROM emp_tel;

SELECT first_name,email FROM emp_tel WHERE first_name ='Lex';

UPDATE emp_tel SET email='1232' WHERE first_name='Lex';
```

#### 5.2 不可更新的视图

要视视图可更新，视图中的行和底层基本表中的行之间必须存在==一对一==的关系。另外当视图定义出现如下情况时，视图不支持更新操作：

* 在定义视图的时候指定了==ALGORITHM=TEMPTABLE==,视图将不支持INSERT和DELETE操作。
* 视图中==不包含==基表中所有被定义为==非空又未指定默认值的列==，视图将不支持**INSERT**操作。
* 在定义视图的SELECT语句中使用==JOIN联合查询==，视图将不支持**INSERT**和**DELETE**操作。
* 在定义视图的SELECT语句后的字段列表中使用了==数学表达式==或==子查询==，视图将不支持**INSERT**，也不支持**UPDATE**
* 在定义视图的SELECT语句中包含了子查询，而子查询中引用了FROM后面的表，视图将不支持INSERT、UPDATE、DELETE
* 视图定义基于一个==不可更新视图==
* 常量视图

> #### 注意：
>
> 虽然可以更新视图数据，但总的来说，视图作为`虚拟表`，主要用于`方便查询`，不建议更新视图的数据。**对视图数据的更改都是通过对实际数据表里数据的操作来完成的。**

## 6、修改、删除视图

#### 6.1 修改视图

方式1：使用**CREATE OR REPLACE VIEW** 子句==修改视图==

```sql
CREATE OR REPLACE VIEW empvu80
(id_number,name,sal,department_id)
AS
SELECT employee_id first-name || '' ||last_name,salary,deparmtent_id
FROM employees
WHERE department-id=80;
```

> 说明：CREATE VIEW 子句中各列的别名应和子查询中各列相对应

方式2：**ALTER VIEW**

修改视图的语法是：

```sql
ALTER VIEW 视图名称
AS
查询语句
```

#### 6.2 删除视图

* 删除视图只是删除视图的定义，并不会删除基表的数据

* 删除视图的语法是：

* ```sql
  DROP VIEW IF EXISTS 视图名称；
  ```

  > 说明
  >
  > 基于视图a、b创建了新的视图c，如果将视图a或者视图b删除，会导致视图c的查询失败。这样的视图c需要手动删除或修改，否则影响使用。

## 7、总结

### 7.1、视图优点

1. <font color='orange'>操作简单</font>

   不需要关心数据表之间的业务逻辑和查询条件

2. <font color='orange'>减少数据冗余</font>

   ​	而视图本身不存储数据，不占用数据存储的资源

3. <font color='orange'>数据安全</font>

   MySQL将用户对数据的==访问限制==在某些数据的结果集上，而这些数据的结果集可以使用视图来实现。用户不必直接查询或操作数据表。也可以理解视图具有==隔离性==，视图相当于在用户和实际的数据表之 间加了一层虚拟表。![image-20230203142741141](MySql.assets\image-20230203142741141.png)同时，MySQL可以根据权限将用户对数据的访问限制在某些视图上，**用户不需要查询数据表，可以直接 通过视图获取数据表中的信息。**这在一定程度上保障了数据表中数据的安全性。

4. **适应灵活多变的需求**当业务系统的需求发生变化后，如果需要改动数据表的结果，则工作量相对较大，可以使用视图来减少改动的工作量。这种方式在实际工作中使用得比较多。
5. **能够分解复杂得查询逻辑** 数据库中如果存在复杂得查询逻辑，则可以将问题进行分解，创建多个视图获取数据，再将创建得多个视图结合起来，完成复杂得查询逻辑。

### 7.2、缺点：

* 如果我们再实际数据表的基础上创建了视图，那么，**如果实际数据表的结构发生改变，我们就需要及时对相关的视图进行相应的维护。**
* 特别时嵌套的视图（就是再视图的基础上创建视图），维护会变得**比较复杂**，==可读性不好==，容易变成系统的潜在隐患。因为创建视图的 SQL 查询可能会对字段重命名，也可能包 含复杂的逻辑，这些都会增加维护的成本。

# 十五、存储过程与函数

MySQL从5.0版本开始支持存储过程和函数。存储过程和函数能够将复杂的SQL逻辑封装在一起，应用程 序无须关注存储过程和函数内部复杂的SQL逻辑，而只需要简单地调用存储过程和函数即可。

## 1、存储过程概述

### 1.1、理解

* **含义：**存储过程的英文是==Stored Procedure==。它的思想很简单，就是一组经过==预先编译的SQL语句==的封装。

* **执行过程**：存储过程预先存储再MySQLMySQL服务器上，需要执行的时候，客户端只需要想服务器端发出调用存储过程的命令，服务器端就可以把预先存储好的一系列
* **好处：**
  1. 简化操作，提高了sql语句的重用性，减少了开发程序员的压力
  2. 减少操作过程中的十五，提高效率
  3. 减少网络传输量（客户端不需要把所有的SQL语句通过网络发给服务器）
  4. 减少了SQL语句暴露再网上的风险，提高哦数据擦汗寻的安全性

* **和视图、函数的对比**

  * 它和视图有着同样的优点、清晰、安全，还可以减少网络传输量，不过它和视图不同，视图是`虚拟表`，通常不对底层数据表直接操作，而存储过程是程序化的SQL，可以==直接操作底层给数据表==，相比于面向集合的操作方式，能够实现一些更复杂的数据处理。

  * 一旦存储过程被创建出来，使用它就像使用函数一样简单，我们直接通过调用存储过程名即可。相较于函数，存储过程时`没有返回值`的。

    

### 1.2、分类

存储过程的参数类型可以是**IN**、**OUT**和**INOUT**

1. 没有参数（无参数无返回）
2. 仅仅带IN类型（有参数无返回）
3. 仅仅带OUT类型（无参数有返回）
4. 既带IN又带OUT（有参数有返回）
5. 带INOUT（有参数有返回）

注意：IN、OUT、INOUT 都可以再一个存储过程中带多个

## 2、创建存储过程

### 2.1 语法分析

语法：

```sql
CREATE PROCEDURE 存储过程名（IN|OUT|INOUT 参数名 参数类型，...）
BEGIN
	存储过程体
END
```

类型于Java中的方法：

```sql
修饰符 返回类型 方法名 (参数类型 参数名，...){
	方法体;
}
```

1. 参数前面的符号的意思

   * ==IN==：当前参数为输入参数，也就是表示入参；
     * 存储过程只是读取这个参数的值。如果没有定义参数种类，**默认就是 IN** ，表示输入参数。
   * ==OUT==：当前参数为输出参数，也就是表示出参
     * 执行完成之后，调用这个存储过程的客户端或者应用程序就可以**读取这个参数返回的值了**
   * ==INOUT==：当前参数既可以为输入参数，也可以为输出参数

2. 形参类型可以是MySQL数据库中的任意类型

3. ==characteristics==表示创建存储过程时指定的对存储过程的约束条件，器取值信息如下：

   ```sql
   LANGUAGE SQL
   | [NOT] DETERMINISTIC
   | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA}
   | SQL SECURITY {DEFINER | INVOKER}
   ```

   * ==LANGUAGE SQL==：说明存储过程执行体是由SQL语句组成的，当前系统支持的语言为SQL
   * ==[NOT] DETERMINISTIC==：指定存储过程执行的结果是否确定。
     * DETERMINISTIC表示结果是<font color='orange'>确定</font>的。**每次执行存储过程时，相同的输入会得到相同的输出**。NOT DETERMINISTIC 表示结果时**不确定的**，相同的输入可能得到不同的输出。
     * 如果没有指定任意一个值，默认为NOT DETERMINISTIC。
   * =={ CONTAINS SQL | NO SQL READS SQL DATA | MODIFIES SQL DATA}==：指明子程序使用SQL语句限制。
     * CONTAINS SQL 表示当前存储过程的子程序包含SQL语句，但是并不包含读写数据的SQL语句；
     * NO SQL 表示当前存储过程的子程序中不包含任何SQL语句。
     * READS SQL DATA表示当前存储过程的子程序中包含读数据的SQL语句
     * MODIFIES SQL DATA 表示当前存储过程的子程序中包含写数据的SQL语句
     * 默认情况下，系统会指定为**CONTAINS SQL**
   * ==SQL SECURITY {DEFINER | INVOKER}==：执行当前存储过程的权限，既指明哪些用户能够执行当前存储过程
     * ==DEFINER==表示只有当前存储过程的创建者或者定义者才能执行当前存储过程。
     * ==INVOKER==表示拥有当前存储过程的访问权限的用户能够执行当前存储过程。

4. 存储过程体中可以由有多条SQL语句，**如果仅仅一条SQL语句，则可以省略BEGIN 和 END**

   编写存储过程并不是一件简单的事情，可能存储过程中需要复杂的SQL语句

   > 1. <font color='red'>BEGIN...END：</font>中间包含了多个语句，每个语句都以（；）号为结束符
   > 2. <font color='gree'>DECLARE：</font>DECLARE 用来声明变量，使用的位置在于BEGIN...END语句中间，而且需要在其它语句使用之前进行变量声明
   > 3. <font color='orange'>SET</font>：赋值语句，用于对变量进行赋值
   > 4. **SELECT...INTO：**把从数据表中查询的结果存放到变量中，也就是为变量赋值。

5. 需要设置新的结束标记

   ```sql
   DELIMITER 新的结束标记
   ```

   因为MySQL默认的语句结束符号为分号**‘；’**为了避免于存储过程中SQL语句结束符相冲突，需要使用DELIMITER改变存储过程的结束符。

   例如：

   ​	`DELIMITER //`语句的作用是将MySQL的结束符设置为//，并以`END //`结束存储过程。存储过程定义完毕之后再使用`DELIMITER;`恢复默认结束符。DELIMITER也可以指定其它符号作为结束符。

   ```sql
   DELIMITER $
   CREATE PROCEDURE 存储过程名(IN|OUT|INOUT 参数名 参数类型，...)
   [characteristics]
   BEGIN
   	sql语句1;
   	sql语句2;
   END $
   ```

   ```sql
   DELIMITER $
   CREATE PROCEDURE select_all_data()
   BEGIN
   	SELECT * FROM employees;
   END $
   DELIMITER ;
   ```


### 2.2 代码举例

举例1：创建存储过程select_all_data()，查看 employees表的所有数据

```SQL
DELIMITER $
CREATE PROCEDURE select_all_data()
BEGIN
	SELECT * FROM employees;
END $
DELIMITER ;
```

举例2：创建存储过程avg_employee_salary()，返回所有员工的平均工资

```sql
DROP PROCEDURE IF EXISTS avg_employee_salary;
DELIMITER //
CREATE PROCEDURE avg_employee_salary()
BEGIN
  SELECT AVG(salary) AS avg_salary FROM employee;
END //
DELIMITER ;
```

举例3：创建存储过程show_max_salary()，用来查看“employees”表的最高薪资值。

```sql
DELIMITER $
CREATE PROCEDURE show_max_salary()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT '查看最高工资'
BEGIN
	SELECT MAX(salary) FROM employees;
END $
DELIMITER ;
```

举例4：创建存储过程show_min_salary()，查看“employees”表的最低薪资值。并将最低薪资通过**OUT**参数“ms” 输出

```sql
DELIMITER //
CREATE PROCEDURE show_min_salary(OUT ms DOUBLE)
	BEGIN
		SELECT MIN(salary) min_salary INTO ms FROM employees;
	END //
DELIMITER ;
```

举例5：创建存储过程show_someone_salary()，查看“employees”表的某个员工的薪资，并用**IN**参数empname 输入员工姓名。

```sql
DELIMITER //
CREATE PROCEDURE show_someone_salary(IN empname VARCHAR(20))
	BEGIN
		SELECT salary FROM employees  WHERE first_name=empname;
		
	END //
DELIMITER ;
```

举例6：创建存储过程show_someone_salary2()，查看“employees”表的某个员工的薪资，并用**IN**参数empname 输入员工姓名，用**OUT**参数empsalary输出员工薪资。

```sql
DELIMITER $
CREATE PROCEDURE show_someone_salary2(IN empname  VARCHAR(20),OUT empsalary DOUBLE)
	BEGIN
		SELECT salary INTO empsalary FROM employees WHERE first_name=empname;
	END $
```

举例7：创建存储过程show_mgr_name()，查询某个员工领导的姓名，并用**INOUT**参数“empname”输入员 工姓名，输出领导的姓名。

```sql
DROP PROCEDURE IF EXISTS show_mgr_name;
DELIMITER $
CREATE PROCEDURE show_mgr_name(INOUT empname VARCHAR(20))
	BEGIN
		SELECT first_name 
		INTO empname 
		FROM employees
		WHERE employee_id =(
			SELECT manager_id 
			FROM employees 
			WHERE first_name=empname
		);
	END $
DELIMITER ;
```



## 3、调用存储过程

### 3.1 调用格式

存储过程有多种调用方法。存储过程必须使用**CALL**语句调用，并且存储过程和数据库相关，如果要执行其它数据库中的存储过程，需要指定数据库名称，例如`CALL dbname.procname`

```sql
CALL 存储过程名（实参列表）
```

**格式：**

1. 调用in模式的参数：

   ```sql
   CALL procedure_name(值)
   ```

2. 调用out模式的参数：

   ```sql
   CALL sp1(@name);
   SELECT @name;
   ```
   
3. 调用inout 模式的参数：

   ```sql
   SET @name=值;
   CALL procedure_name(@name);
   SELECT @name;
   ```

> 问题 待处理
>
> SET @name; 该语句不能用

### 3.2 代码举例

1. 调用 有**输入参数**的存储过程：

```sql
mysql> CALL show_someone_salary('Lex');
+----------+
| salary   |
+----------+
| 17000.00 |
+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
```

2. 调用有 **输出参数**的存的过程：

   ```sql
   mysql> call show_min_salary(@value);
   Query OK, 1 row affected (0.01 sec)
   
   mysql> select @value;
   +--------+
   | @value |
   +--------+
   |   2100 |
   +--------+
   1 row in set (0.00 sec)
   
   mysql>
   ```

3. 调用有**INOUT** 类型的参数的存储过程：

   ```sql
   mysql> SET @empname='Lex';
   Query OK, 0 rows affected (0.00 sec)
   
   mysql> CALL show_mgr_name(@empname);
   Query OK, 1 row affected (0.00 sec)
   
   mysql> select @empname;
   +----------+
   | @empname |
   +----------+
   | Steven   |
   +----------+
   1 row in set (0.00 sec)
   
   mysql>
   ```

   如果你用的是 Navicat 工具，那么在编写存储过程的时候，Navicat 会自动设置 DELIMITER 为其他符号， 我们**不需要**再进行 DELIMITER 的操作。

   > ### 提醒
   >
   > **最好需要**		

### 3.3如何调试

> 交钱就能调试

在 MySQL 中，存储过程不像普通的编程语言（比如 VC++、Java 等）那样有专门的集成开发环境。因 此，你可以通过 SELECT 语句，把程序执行的中间结果查询出来，来调试一个 SQL 语句的正确性。调试 成功之后，把 SELECT 语句后移到下一个 SQL 语句之后，再调试下一个 SQL 语句。这样 逐步推进 ，就可 以完成对存储过程中所有操作的调试了。当然，你也可以把存储过程中的 SQL 语句复制出来，逐段单独 调试。



## 4、存储函数的使用

### 4.1 语法分析

学过的函数：LENGTH、SUBSTR、CONCAT等

语法格式：

```sql
CREATE FUNCTION 函数名(参数名，参数类型，...)
RETURNS 返回值类型
[characteristics]
BEGIN
	函数体 #函数体中肯定有RETURN 语句
END
```

`特点：`

* 参数列表：指定参数为==IN、OUT==或==INOUT==只对==PROCEDURE==是合法的，==FUNCTION==中总是**默认为IN参数**
* **RETURNS type** 语句表示函数返回数据的类型。
  * RETURNS子句只能对FUNCTION坐指定，对函数而言这是**强制**的，它用来指定函数的返回类型，而且函数体必须包含一个==RETURN value==语句
* characteristic 创建函数时指定的对函数的约束，取值与创建存储过程的像通，这里不再赘述。
* 函数体也可以用BEGIN...END来表示SQL代码的开始和结束。如果函数体只有一条语句，也可以省略BEGIN...END

### 4.2 调用存储函数

在MySQL中，存储函数的使用方法与MySQL内部函数的使用方法是一样的。换言之，**用户自己定义的存储函数与MySQL内部函数**是一个性质的。区别在于，存储函数是==用户自己定义==的，而内部函数是MySQL的**开发者定义**的。

```sql
SELECT 函数名(实参列表)
```

### 4.3 代码举例

* 举例1：

```sql
#创建存储函数，名称为email_by_name(),参数定义为空，该函数查询Abel的email，并返回，数据类型为字符串型。

DROP FUNCTION IF EXISTS email_by_name;
DELIMITER //

CREATE FUNCTION email_by_name()
RETURNS VARCHAR(25)
DETERMINISTIC
CONTAINS SQL
BEGIN 
	RETURN (SELECT email FROM employees WHERE last_name='_Abel');
END //
DELIMITER ;
SELECT email_by_name();
```

* 举例2：

```sql
#创建存储函数，名称为email_by_id()，参数传入emp_id，该函数查询emp_id的email，并返回，数据类型
#为字符串型。
DROP FUNCTION IF EXISTS email_by_id;
DELIMITER //

CREATE FUNCTION email_by_id(emp_id INT)
RETURNS VARCHAR(25)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
BEGIN
	RETURN (SELECT email FROM employees WHERE employee_id=emp_id);
END //
DELIMITER ;
SET @empId=102;
SELECT email_by_id(@empId);
```

* 举例3：

```sql
#创建存储函数count_by_id()，参数传入dept_id，该函数查询dept_id部门的员工人数，并返回，数据类型
#为整型。
DROP FUNCTION IF EXISTS count_by_id;
DELIMITER //
CREATE FUNCTION count_by_id(dept_id INT)
RETURNS INT
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
BEGIN 
	RETURN (SELECT COUNT(*) 
	FROM departments d 
	LEFT JOIN employees e
	ON d.department_id=e.department_id
	WHERE d.department_id=dept_id);
END //
DELIMITER ;
SET @dept_id=50;
SELECT count_by_id(@dept_id);
```

> ### **注意：**
>
> 若在创建存储函数中报错`you might want to use the less safe log_bin_trust_function_creators variable`
>
> 有两种处理方法：
>
> * 方式1：加上必要的函数特性`[NOT] DETERMINISTIC”和“{CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA}`
>
> * 方式2：
>
>   ```sql
>   SET GLOBAL log_bin_trust_function_creators=1;
>   ```
>
>   

### 4.4 对比存储函数和存储过程

|          | 关键字    | 调用语法        | 返回值                | 应用场景                   |
| -------- | --------- | --------------- | --------------------- | -------------------------- |
| 存储过程 | PROCEDURE | CALL 存储过程() | 可以理解为有0个或多个 | 一般用于更新               |
| 存储函数 | FUNCTION  | SELECT 函数()   | 只是一个              | 一般用于查询结果为一个值并 |

此外，**存储函数可以放在查询语句中使用，存储过程不行**。反之，存储过程的功能更加强大，包括能够`执行对表的操作（比如创建表，删除表等）`和事务操作，这些功能是存储函数不具备的。

## 5、存储过程和函数的查看、修改、删除

### 5.1 查看

创建完之后，怎么世道我们创建的存储过程、存储函数是否成功了呢？

MySQL存储了存储过程和函数的状态信息，用户可以使用**SHOW STATUS**语句或**SHOW CREATE** 语句来查看，也可直接从系统的information_schema数据库中查询。这里介绍3中方法。

1. 使用SHOW CREATE语句查看存储过程和函数的创建信息

```sql
SHOW CREATE {PROCEDURE | FUNCTION} 存储过程名或函数名
```

2. 使用SHOW STATUS 语句查看存储过程和函数的状态信息

```sql
SHOW {PROCEDURE | FUNCTION} STATUS [LIKE 'pattern']
```

这个语句返回子程序的特征，如数据库、名字、类型、创建者及创建和修改日期

`[LIKE 'pattern']`：**匹配存储过程或函数的名称**，可以省略。当省略不写时，会列出MySQL数据库中存在的所有存储过程或函数的信息。

例子：

```sql
mysql> SHOW CREATE FUNCTION count_by_id \G
*************************** 1. row ***************************
            Function: count_by_id
            sql_mode: STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION
     Create Function: CREATE DEFINER=`wujianmin`@`%` FUNCTION `count_by_id`(dept_id int) RETURNS int
    DETERMINISTIC
begin
        return (select count(*)
        from departments d
        left join employees e
        on d.department_id=e.department_id
        where d.department_id=dept_id);
end
character_set_client: utf8mb3
collation_connection: utf8_general_ci
  Database Collation: utf8_general_ci
1 row in set (0.00 sec)


```

```sql
mysql> SHOW PROCEDURE STATUS LIKE 'SELECT%' \G
*************************** 1. row ***************************
                  Db: atguigudb
                Name: select_all_data
                Type: PROCEDURE
             Definer: wujianmin@%
            Modified: 2023-02-04 22:45:37
             Created: 2023-02-04 22:45:37
       Security_type: DEFINER
             Comment:
character_set_client: utf8
collation_connection: utf8_general_ci
  Database Collation: utf8_general_ci
1 row in set (0.00 sec)
```

3. 从**information_schema.Routines**表中查看存储过程和函数的信息

   MySQL中存储过程和函数的信息存储在information_schema数据库下的<font color='orange'>Routines</font>表中。可以通过查询该表的记录来查询过程和函数的信息。其基本语法形式如下：

   ```sql
   SELECT * FROM information_schema.Routines
   WHERE ROUTINE_NAME='存储过程或函数的名' [AND ROUTINE_TYPE={'PROCEDURE|FUNCTION'}];
   ```

   说明：

   如果在MySQL数据库中存在存储过程和函数名称相同的情况，最好指定ROUTINE_TYPE查询条件来指明查询的是存储过程还是函数。

例如：

```sql
mysql> SELECT * FROM information_schema.Routines
    -> WHERE ROUTINE_NAME='count_by_id' AND ROUTINE_TYPE = 'FUNCTION' \G
*************************** 1. row ***************************
           SPECIFIC_NAME: count_by_id
         ROUTINE_CATALOG: def
          ROUTINE_SCHEMA: atguigudb
            ROUTINE_NAME: count_by_id
            ROUTINE_TYPE: FUNCTION
               DATA_TYPE: int
CHARACTER_MAXIMUM_LENGTH: NULL
  CHARACTER_OCTET_LENGTH: NULL
       NUMERIC_PRECISION: 10
           NUMERIC_SCALE: 0
      DATETIME_PRECISION: NULL
      CHARACTER_SET_NAME: NULL
          COLLATION_NAME: NULL
          DTD_IDENTIFIER: int
            ROUTINE_BODY: SQL
      ROUTINE_DEFINITION: begin
        return (select count(*)
        from departments d
        left join employees e
        on d.department_id=e.department_id
        where d.department_id=dept_id);
end
           EXTERNAL_NAME: NULL
       EXTERNAL_LANGUAGE: SQL
         PARAMETER_STYLE: SQL
        IS_DETERMINISTIC: YES
         SQL_DATA_ACCESS: CONTAINS SQL
                SQL_PATH: NULL
           SECURITY_TYPE: DEFINER
                 CREATED: 2023-02-10 11:36:17
            LAST_ALTERED: 2023-02-10 11:36:17
                SQL_MODE: STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION
         ROUTINE_COMMENT:
                 DEFINER: wujianmin@%
    CHARACTER_SET_CLIENT: utf8
    COLLATION_CONNECTION: utf8_general_ci
      DATABASE_COLLATION: utf8_general_ci
1 row in set (0.00 sec)
```

### 5.2 修改

修改存储过程或函数，不影响存储过程或函数功能，**只是修改相关特性**。使用ALTER语句实现。

```sql
ALTER {PROCEDURE|FUNCTION} 存储过程或函数的名 [characteristic...]
```

其中，characteristic指定存储过程或函数的特性，其取值信息与创建存储过程、函数时的取值信息**略有 不同**。

```SQL
CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
| SQL SECURITY { DEFINER | INVOKER }
| COMMENT 'string
```

* <font color='orange'>CONTAINS SQL</font> ，表示子程序包含SQL语句，但不包含读或写数据的语句。
* <font color='orange'>NO SQL</font> ，表示子程序中不包含SQL语句。
* <font color='orange'>READS SQL DATA</font> ，表示子程序中包含读数据的语句。
* <font color='orange'>MODIFIES SQL DATA</font> ，表示子程序中包含写数据的语句。 
* <font color='orange'>SQL SECURITY { DEFINER | INVOKER }</font> ，指明谁有权限来执行。
  * **DEFINER** ，表示只有定义者自己才能够执行。 
  * **INVOKER** ，表示调用者可以执行。
* <font color='orange'>COMMENT 'string'</font> ，表示注释信息。

> ##### 修改存储过程使用ALTER PROCEDURE语句，修改存储函数使用ALTER FUNCTION语句。但是，这两个语句的结构是一样的，语句中的所有参数也是一样的。

**举例1：**

修改存储过程count_by_id的定义。将读写权限改为MODIFIES SQL DATA，并指明调用者可以执行，代码如下：

```SQL
ALTER PROCEDURE count_by_id
MODIFIES SQL DATA
SQL SECURITY INVOKER 
COMMENT 'FIGHT STREAM' ;
```

### 5.3 删除

```SQL
DROP {PROCEDURE | FUNCTION } [IF EXISTS] 存储过程或函数的名
```

## 6、关于存储过程使用的争议

尽管存储过程有诸多优点，但是对于存储过程的使用，**一直都存在者很多争议**，比如有些公司对于大型项目要求使用存储过程，而有些公司在手册中明确禁止使用存储过程，为什么这些公司对存储过程的使用需求差别这么大呢？

### 6.1 优点

**1、存储过程可以一次编译多次使用。**存储过程只在创建世进行编译，之后的使用都不需要重新编译，这就提升了SQL的执行效率。

**2、可以减少开发工作量。**将代码==封装==称模块，实际上是编程的核心思想之一。这样可以把复杂的问题拆解成不同的模块，然后模块之间可以==重复使用==

，在减少开发工作量的同时，还能保证代码的结构清晰。

**3、存储过程的安全性强**。我们在设定存储过程的时候可以==设置对用户的使用权限==，这样就和视图一样具有较强的安全性。

**4、可以减少网络传输量。**因为代码封装到存储过程中，每次使用只需要调用存储过程即可，这样就减少了网络传输量。

**5、良好的封装性**。在进行相对复杂的数据库操作时，原本需要使用一条一条的SQL语句，可能要连接多次数据库才能完成的操作，现在编程了一次存储过程，只需要==连接一次即可==

### 6.2 缺点

基于上面这些优点，不少大公司都要求大型项目使用存储过程，比如微软、IBM 等公司。但是国内的阿 里并不推荐开发人员使用存储过程，这是为什么呢？

> #### 阿里开发规范
>
>  【强制】禁止使用存储过程，存储过程难以调试和扩展，更没有移植性。

存储过程虽然有诸如上面的好处，但缺点也是很明显的。

**1、可移植性差。**存储过程不能跨数据库移植，比如在 MySQL、Oracle 和 SQL Server 里编写的存储过 程，在换成其他数据库时都需要重新编写。

**2、调试困难。**只有少数 DBMS 支持存储过程的调试。对于复杂的存储过程来说，开发和维护都不容 易。虽然也有一些第三方工具可以对存储过程进行调试，但要收费。

**3、存储过程的版本管理很困难。**比如数据表索引发生变化了，可能会导致存储过程失效。我们在开发 软件的时候往往需要进行版本管理，但是存储过程本身没有版本控制，版本迭代更新的时候很麻烦。

**4、它不适合高并发的场景。**高并发的场景需要减少数据库的压力，有时数据库会采用分库分表的方 式，而且对可扩展性要求很高，在这种情况下，存储过程会变得难以维护， 增加数据库的压力 ，显然就 不适用了。

> ### 小结： 
>
> 存储过程既方便，又有局限性。尽管不同的公司对存储过程的态度不一，但是对于我们开发人员来说， 不论怎样，掌握存储过程都是必备的技能之一。

# 十六、变量、流程控制与游标

## 1、变量

在MySQL数据库的存储过程和函数中，可以使用变量来存储查询或计算中间结果数据，或者输出最终的结果数据。

在MySQL数据库中，变量分为==系统变量==以及==用户自定变量==

### 1.1 系统变量

#### (1 系统变量分类

变量由系统定义，不是用户定义，属于==服务器==层面。启动MySQL服务，生成MySQL服务实例期间，MySQL将为MySQL服务器内存中的系统变量赋值，这些系统变量定义了当前MySQL服务实例的属性、特征。这些系统变量的值要么==编译MySQL时参数==的默认值，要么是==配置文件==（例如<font color='orange'>my.ini</font>等）中的参数值。大家可以通过网址 https://dev.mysql.com/doc/refman/8.0/en/server-systemvariables.html查看MySQL文档的系统变量。

* 系统变量分为<font color='orange'>全局系统变量</font>（需要添加==global== 关键字）以及<font color='orange'>会话系统变量</font>（需要添加==session==关键字），有时也把全局系统变量简称为全局变量，有时也把会话系统变量称为local变量。==如果不写，默认会话级别==。静态变量（在MySQL服务实例运行期间它们的）<font color='orange'>静态变量</font>（在MySQL）服务实例运行期间它们的值**不能**使用set动态修改）属于特殊的全局系统变量。
* 每一个MySQL客户机成功连接MySQL服务器后，都会产生与之对应的会话。会话期间，MySQL服务实例会在MySQL服务器内存中生成与该会话对应的会话系统变量，这些**会话系统变量的初始值是全局系统变量值**的**复制**。如下图：

![xxxxxxxxx](MySql.assets\xxxxxxxxx.png)

* 全局系统变量针对于所有会话（连接）有效，但==不能跨重启==
* 会话系统变量仅针对于当前会话（连接）有效。会话期间，当前会话对某个会话系统变量值的修改，不会影响其他会话同一个会话系统变量的值。
* 会话1对某个全局系统变量值的修改会导致会话2中同一个全局系统变量值的修改。

* 全局变量和系统变量**交集**的( A ∩ B )
  * ![image-20230218120855381](MySql.assets\image-20230218120855381.png)

在MySQL中有些系统变量只能是全局的，例如 max_connections 用于限制服务器的最大连接数；有些系 统变量作用域既可以是全局又可以是会话变量，例如 character_set_client 用于设置客户端的字符集；有些系 统变量的作用域只能是当前会话，例如 pseudo_thread_id 用于标记当前会话的 MySQL 连接 ID。



#### (2 查看系统变量

* 查看所有或部分系统变量

```sql
#查看所有全局变量
SHOW GLOBAL VARIABLES;#617个

#查看与当前会话相关的所有会话变量以及全局变量。
SHOW SESSION VARIABLES;#640个
#或
SHOW VARIABLES;#640个


```

```SQL

#查看满足条件变量。
SHOW GLOBAL VARIABLES LIKE '%character_set_client%';
SHOW SESSION VARIABLES LIKE '%character_set_client%';#lower_case_table_names为全局变量
SHOW  VARIABLES LIKE '%标识符%';



```

* 查看指定系统变量

作为MySQL编码规范，MySQL中的系统变量以==两个"@"==开头，其中`@@global`仅用于标记全局系统变量，`@@session`仅用于标记会话系统变量。`@@`首先标记会话系统变量，如果会话系统变量不存在则标记全局系统变量。

```sql
#查看指定的系统变量的值
SELECT @@GLOBAL.character_set_client;
SELECT @@global.character_set_client;
#查看指定的会话变量的值
SELECT @@session.character_set_client;

#先找会话在找全局
SELECT @@character_set_client ;

```

* 修改系统变量的值

有些时候，数据库管理员需要修改系统变量的默认值，以便修改当前会话或者MySQL服务实例属性、特征。具体方法：

**方式一：**修改MySQL==配置文件==（my.ini），继而修改MySQL系统变量的值（该方法需要重启MySQL服务）

**方式二：**在MySQL服务运行期间，使用==set==命令重新设置系统变量的值。

```sql
#为某个全局变量赋值
#方式1：
SET @@global.max_connections=161;
#方式2：
SET GLOBAL max_connections=171;

#全局系统变量：针对于当前的数据库实例是有效的，一旦重启mysql服务，就失效了。

#会话系统变量：
#方式1
SET @@session.character_set_client='gbk';
#方式2
SET SESSION character_set_client='gbk';
#在当前会话有效（一个连接就是一个会话）
```

### 1.2 用户变量

#### (1 用户变量分类

用户变量是用户自己定义的，作为MySQL编码规范，MySQL中的用户变量以==一个@==开头。根据作用范围不同，又分为==会话用户变量==和==局部变量==。

* 会话用户变量：作用域和会话变量一样，只对==当前连接==会话有效。
* 局部变量：只在BEGIN和END语句块中有效，局部变量只能在==存储过程和函数==中使用。

#### (2 会话用户变量

* 变量的定义

```sql
#方式1：“=”或“:=”
SET @用户变量 = 值 ；
SET @用户变量 := 值 ；
#方式2 “:=” 或 INTO 关键字
SELECT @用户变量 :=表达式[FROM 等子句];
SELECT 表达式 INTO @用户变量 [FROM 等子句]；
```

* 查看用户变量的值（查看、比较、运算等）

```sql
SELECT @用户变量
```

```sql
SELECT @a;
SELECT @num := COUNT(*) FROM employees;
SELECT @num;
SELECT AVG(salary) INTO @avgsalary FROM employees;
SELECT @avgsalary;
SELECT @big; #查看某个未声明的变量时，将得到NULL值
```

#### (3 局部变量

定义：可以使用==DECLARE==语句定义一个局部变量

作用域：仅仅在定义它的BEGIN...END中有效

位置：**只能**放在BEGIN...END中，而且只能放在第一句

```sql
BEGIN
	#声明局部变量
	DECLARE 变量名1 变量数据类型 [DEFAULT 变量默认值];#没有默认值为nu
	DECLARE 变量名2，变量名3，变量数据类型 [DEFAULT] 变量默认值；
	#为局部变量赋值
	SET 变量名1=值;
	SELECT 值 INTO 变量名2 [FROM 子句];
	#查看局部变量的值
	SELECT 变量1,变量2,变量3;
END
```

**1、定义变量**

```sql
DECLARE 变量名 类型 [default 值];
```

**2、变量赋值**

举例：

```sql
DECLARE myparam INT DEFAULT 100;
```

**3、使用变量（查看、比较、运算等）**

```sql
SELECT 局部变量名;
```

例子：

```sql
#局部变量
DELIMITER //
DROP PROCEDURE IF EXISTS set_value//
CREATE  PROCEDURE set_value()
BEGIN
	#声明局部变量
	DECLARE  a INT DEFAULT 0;
	DECLARE b INT ;
	#DECLARE a,b INT DEFAULT 0;
	DECLARE emp_name VARCHAR(25);
	
	#赋值
	SET a=1;
	SET b :=2;
	
	SELECT last_name INTO emp_name FROM employees WHERE employee_id=101;
	SELECT a,b,emp_name;
END //
DELIMITER ;

#调用存储过程
CALL set_value();

#举例1：声明局部变量，并分别赋值为employees表中employee_id为102的last_name和salary

DELIMITER //
DROP PROCEDURE IF EXISTS test_pro//
CREATE PROCEDURE test_pro()
BEGIN
	DECLARE emp_name VARCHAR(25);
	DECLARE sal DOUBLE(8,2) DEFAULT 0.0;
		#SELECT emp_name,sal :=last_name,salary FROM employees WHERE employee_id=102;
	SELECT  last_name,salary INTO emp_name,sal FROM employees WHERE employee_id=102;

	SELECT emp_name,sal;
END //
DELIMITER ;
#举例2： 声明两个变量，求和并打印（分别使用会话用户变量，局部变量的方式实现）
#方式1：使用会话用户变量
SET @v1 =10;
SET @v2 :=20;
#查看
SET @result :=@v1+@v2;

SELECT @result;
DROP PROCEDURE IF EXISTS test_num;
DELIMITER $
CREATE PROCEDURE test_num()
BEGIN
	DECLARE value1,value2,sum_val INT DEFAULT 0;
	SET value1 = 10;
	SET value2 =20;
	SET sum_val= value1+value2;
	SELECT value1,value2,sum_val;
END $
DELIMITER ;
CALL test_num();

#举例3：创建存储过程“different_salary”查询某员工和他领导的薪资差距，并用IN参数emp_id接收员工
#id，用OUT参数dif_salary输出薪资差距结果。
DROP PROCEDURE IF EXISTS different_salary;
DELIMITER //
CREATE PROCEDURE different_salary(IN emp_id INT,OUT dif_salary DOUBLE)
BEGIN
	DECLARE emp_sal,mgr_sal DOUBLE DEFAULT 0.0;
	DECLARE mgr_id INT;
	SELECT  salary INTO emp_sal FROM employees WHERE employee_id=emp_id;
	#select manager_id into mgr_id from employees where employee_id=emp_id;
	SELECT salary INTO mgr_sal FROM employees WHERE employee_id =(SELECT manager_id FROM employees WHERE employee_id=emp_id);
	
	SELECT mgr_sal-emp_sal INTO dif_salary;
	
END //
DELIMITER ;

SET @emp_id=103;
CALL different_salary(@emp_id,@diff_sal);

SELECT @diff_sal;




```

#### (4 对比会话用户变量与局部变量

|              | 作用域              | 定义位置              | 语法                                        |
| ------------ | ------------------- | --------------------- | ------------------------------------------- |
| 会话用户变量 | 当前会话            | 会话的任何地方        | 加@符号，不用指定类型                       |
| 局部变量     | 定义它的BEGIN END中 | BENGIN END 的第一句话 | 一般不用加@（**我感觉必须**），需要指定类型 |

## 2、定义条件与处理程序（**定义异常**和**抓异常**）

​	==定义条件==是事先定义程序执行过程中可能遇到的问题，==处理程序==定义了在遇到问题时应当采取的处理方式，并且保证存储过程或函数在遇到警告或错误时能继续执行。这样可以增强存储程序处理问题的能力。

说明：定义条件和处理程序在存储过程、存储函数中都是**支持的**。



这是个存储过程（内容略）

**从存储过程得出结论：**

在存储过程中未定义条件和处理程序，且当存储过程中执行的SQL语句报错时，MySQL数据库会抛出错误，并退出当前SQL逻辑，不再向下继续执行。

## 2.1、定义条件

定义条件是给MySQL中的错误码命名，这有助于存储的程序代码更清晰。它将一个==错误名字==和==指定的错误条件==关联起来。这个名字可以随后被用在定义条件使用DECLARE语句，语法格式如下：

```sql
DECLARE 错误名称 CONDITION FOR 错误码（或错误条件）
```

错误码的说明：

* MySQL_error_code 和 sqlstate_value 都可以表示MySQL的错误。
  * **MySQL_error_code时数值类型错误代码**
  * **sqlstate_value是长度未5的字符串类型错误代码。**
* 例如，在ERROR 1418 (HY000)中，1418是MySQL_error_code，'HY000'是sqlstate_value。 
* 例如，在ERROR 1142（42000）中，1142是MySQL_error_code，'42000'是sqlstate_value。



```sql
#例子一：
#使用MySQL_error_code
DECLARE Field_Not_Be_NULL CONDITION FOR 1048;
#使用sqlstate_value
DECLARE Field_Not_Be_NULL CONDITION FOR SQLSTATE '23000';


```



可以为SQL执行过程中发生的某种类型的错误定义特殊的处理程序。定义处理程序时，使用DECLARE语句的语法如下：

```sql
DECLARE 处理方式 HANDLER FOR 错误类型 处理语句
```

* **处理方式**：处理方式有3个取值：
  * ==CONTINUE==：表示遇到错误不处理，继续执行
  * ==EXIT==：表示遇到错误马上退出
  * ==UNDO==：表示遇到错误后撤回之前的操作。MySQL中暂时不支持这样的操作。
* **错误类型**（即条件）可以有如下取值：
  * ==SQLSTATE`'字符串错误码'`==：表示长度为5的sqlstate_value类型的错误代码；
  * ==MySQL_error_code==：匹配数值类型错误代码；
  * ==错误名称==：表示DECLARE...CONDITION定义的错误条件名称
  * ==SQLWARNING==：匹配所有以01开头得SQLSTATE错误代码；
  * ==NOT FOUND==：匹配所有02开头得SQLSTATE错误代码；
  * ==SQLEXCEPTION==：匹配所有没有呗SQLWARNING或NOT FOUND捕获得SQLSTATE错误代码；
* **处理语句**：
  * 如果出现上述条件之一，则采用对应得处理方式，并执行指定的处理语句。语句可以是像`SET 变量=值`这样的简单语句，也可以是使用`BEGIN...END`编写的复合语句。

### 1 定义方式

```sql
#方法1：捕获sqlstate_value


```

