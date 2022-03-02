# 一、Mybatis

1. 接口式编程

   原生： Dao ===》DaoImpl

   mybatis： Mapper ===》 xxMapper.xml

2. SqlSession代表和数据库的一次会话，用完必须关闭

3. SqlSession和connection一样她都是非线程安全。每次使用都应该去获取新的对象

4. mapper接口没有实现类，但是mybatis会为这个接口生成一个代理对象。

   EmployeeMapper empMapper=sqlSession.getMapper()

5. 两个重要的配置文件：

   ​	mybatis的全局配置文件：包含数据库连接池信息，事务管理器信息等。。。系统运行环境信息（可以使用代码的方式）

   ​	sql的映射文件：保存了每一个sql语句的映射信息：

   ​				将sql抽取出来

# 二、Mybatis-Plus

1