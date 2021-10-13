# Maven

https://blog.csdn.net/qq_32588349/article/details/51461182

https://blog.csdn.net/u013142781/article/details/50316383

Maven 是一个项目管理工具，可以对 Java 项目进行构建、依赖管理。

# 一、概述



## 1.1Maven 功能

Maven 能够帮助开发者完成以下工作：

- 构建
- 文档生成
- 报告
- 依赖
- SCMs
- 发布
- 分发
- 邮件列表、



## 1.2 约定配置

## 1.3 特点

# 二、构建

构建生命周期







maven-antrun-plugin:run



# Maven 构建配置文件

### 1、配置文件激活

pom.xml

```xml
<profiles>
      <profile>
          <id>test</id>
          <build>
              <plugins>
                 <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-antrun-plugin</artifactId>
                    <version>1.8</version>
                    <executions>
                       <execution>
                          <phase>test</phase>
                          <goals>
                             <goal>run</goal>
                          </goals>
                          <configuration>
                          <tasks>
                             <echo>Using env.test.properties</echo>
                             <copy file="src/main/resources/env.test.properties" tofile="${project.build.outputDirectory}/env.properties" overwrite="true"/>
                          </tasks>
                          </configuration>
                       </execution>
                    </executions>
                 </plugin>
              </plugins>
          </build>
      </profile>
<profiles>
```

```terminal
mvn test -Ptest
```

提示：第一个 test 为 Maven 生命周期阶段，第 2 个 test 为**构建配置文件**指定的 <id> 参数，这个参数通过 -P 来传输，当然，它可以是 prod 或者 normal 这些由你定义的**<id>**。

### 2、通过Maven设置激活配置文件

打开 **%USER_HOME%/.m2** 目录下的 **settings.xml** 文件

**%M2_HOME%/conf/settings.xml** 

```xml

<settings xmlns="http://maven.apache.org/POM/4.0.0"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
   http://maven.apache.org/xsd/settings-1.0.0.xsd">
   ...
   <activeProfiles>
      <activeProfile>test</activeProfile>
   </activeProfiles>
</settings>

```

```terminal
mvn test
```

### 3、通过环境变量激活配置文件

pom.xml

然后在 pom.xml 里面的 <id> 为 test 的 <profile> 节点，加入 <activation> 节点：

```xml
<profile>
          <id>test</id>
          <activation>
            <property>
               <name>env</name>
               <value>test</value>
            </property>
          </activation>
          <build>
              <plugins>
                 <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-antrun-plugin</artifactId>
                    <version>1.8</version>
                    <executions>
                       <execution>
                          <phase>test</phase>
                          <goals>
                             <goal>run</goal>
                          </goals>
                          <configuration>
                          <tasks>
                             <echo>Using env.test.properties</echo>
                             <copy file="src/main/resources/env.test.properties" tofile="${project.build.outputDirectory}/env.properties" overwrite="true"/>
                          </tasks>
                          </configuration>
                       </execution>
                    </executions>
                 </plugin>
              </plugins>
          </build>
      </profile>
```

```terminal
mvn test -Denv=test
```







sdsddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdsddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss

所以说 Maven 生命周期的每一个阶段的具体实现都是由 Maven 插件实现的。



每个插件可以有多个目标。





# 远程仓库

构建java项目

```terminal
mvn archetype:generate
```

选择模板，填写groupid、artifactid

编写pom.xml

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.company.food</groupId>
  <artifactId>apple</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>jar</packaging>
  <name>apple</name>
  <url>http://maven.apache.org</url>
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
     <github.global.server>github</github.global.server>
  </properties>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
      <build>
        <plugins>
            <plugin>
                <artifactId>maven-deploy-plugin</artifactId>
                <version>2.8.1</version>
                <configuration>                   <altDeploymentRepository>internal.repo::default::file://${project.build.directory}/maven</altDeploymentRepository>
                </configuration>
            </plugin>
            <plugin>
                <groupId>com.github.github</groupId>
                <artifactId>site-maven-plugin</artifactId>
                <version >0.12</version>
                <configuration>
                    <message >Maven artifacts for ${project.version}</message>
                    <noJekyll>true</noJekyll>
                    <outputDirectory>${project.build.directory}/maven</outputDirectory><!--本地jar地址-->
                    <branch>refs/heads/main</branch><!--分支的名称-->
                    <merge>true</merge>
                    <includes>
                        <include>**/*</include>
                    </includes>
                    <repositoryName>experiment_maven</repositoryName><!--对应github上创建的仓库名称 name-->
                    <repositoryOwner>CatClimb</repositoryOwner><!--github 仓库所有者即登录用户名-->
                </configuration>
                <executions>
                    <execution>
                        <goals>
                            <goal>site</goal>
                        </goals>
                        <phase>deploy</phase>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>        
  </project>
   

```

添加以下内容到该`conf`下`settings.xml`文件

```xml
<server>
    <id>github</id>
    <username>CatClimb</username>
    <password>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</password> 
</server>
```

运行

```terminal
mvn clean deploy
```

之后上传成功

使用上传的jar包，在项目的`pom.xml`添加

```xml
<repositories>
        <repository>
            <id>maven</id>
            <url>https://raw.github.com/CatClimb/maven/main</url>
            <snapshots>
                <enabled>true</enabled>
                <updatePolicy>always</updatePolicy>
            </snapshots>
        </repository>
    </repositories>
    <dependencies>
        <dependency>
            <groupId>com.company.food</groupId>
            <artifactId>fruit</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
```

我踩的坑

![image-20210920204436850](Maven.assets/image-20210920204436850.png)

加名字

![img](https://img-blog.csdnimg.cn/20181228205720553.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3N1bnhpYW9qdQ==,size_16,color_FFFFFF,t_70)

![image-20210920204535296](Maven.assets/image-20210920204535296.png)

加 readme.mdw

 `raw.githubusercontent.com` 大概DNS污染严重

![image-20210920225645770](Maven.assets/image-20210920225645770.png)

`raw.github.com`这个还可以

