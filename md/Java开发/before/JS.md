# JavaScript

# 一、JavaScript概述

## 1、JS是什么

JS是一门世界上最流行的脚本语言。

* ==**脚本语言**==：不需要编译，运行过程中有js解释器（js引擎）==**逐行来进行解释并执行**==。
* 可以基于Node.js（不更新了，作者不爽，要开发Deno）技术进行服务器端编程
* 是一门面向对象语言

## 2、JS作用

* 表单动态效验
* 网页特效
* 服务端开发（Node.js）
* 桌面程序（Electron）
* App（Cordova）
* 控制硬件-物联网（Ruff）
* 游戏开发（cocos2d-js）

## 3、HTML/CSS/JS的关系

* 标记语言——描述类语言
  * HTML是身体
  * CSS是装饰
* 脚本语言——编程类语言
  * JS是动作

## 4、浏览器执行JS介绍

浏览器分为：

* 渲染引擎
  * 用来解析HTML与CSS，俗称内核
    * 如：chorme的blink，老版本的webkit
* JS引擎
  * JS解释器。读取JS一条代码并执行
    * 如：chorme的V8

## 5、JS组成

* [ECMASCript](https://baike.baidu.com/item/ECMAScript/1889420)（JS语法）
* **DOM**（页面文档对象模型）
  * 是处理可扩展标记语言的标准编程`接口`，通过它可以操作页面上的各种元素。
* **BOM**（浏览器对象模型）
  * 通过它可以操作浏览器。
    * 如：弹出对话框、控制跳转、获取分辨率等。

# 二、入门

## 1、引入JavaScript

script标签type属性默认为==**“text/javascript”**==。

* ==**行内**==
  * 些在HTML标签的事件属性中
  * HTML使用双引号，JS使用单引号
  * 可读性差
  * 特殊情况下使用
* ==**内嵌**==
  * 常用方式
* ==**外部**==
  * 规范
  * 注意事项：
    * 必须是双标签
    * 必须没内容

```html
<!DOCTYPE html>
<html>
    <head>
        <title>js1</title>
        <!-- 1、内嵌式js -->
        <!-- <script>
            alert('s');
        </script> -->
        <!-- 3、外部js（外部引用js） -->
        <!-- <script src="my.js">
        </script> -->
    </head>
    <body>
        <!-- 2、行内式js -->
        <!-- <input type="button" value="aa" onclick="alert('ss')"/> -->
        <!--这里也可以放
        <script></script>-->
    </body>
</html>
```

my.js文件：

```js
alert('sss')
```

## 2、基本语法

### 2.1、注释

* 单行注释 `//`
* 多行注释 `/**/`

### 2.2、变量

* 声明变量
  * `var age;` (var为 variable的意思)

* 赋值 
  * `age=18`

### 2.3、变量作用域

* var变量（过时）

  * 在最外层函数的外部声明var变量，作用域是==**全局的**==。并且可以在window中使用。
  * 
  * var声明的变量会被==**undefined初始化**==。
  * var可以重新声明同名的变量，会覆盖。（缺陷）
  * 变量提升
    * 一种JS机制：变量和函数声明会移至作用域==**顶部**==。
  * 函数作用域（和let体现为for循环）

* let变量（ES6 这更好）

  * 不会自动初始化
  * 在最外层函数的外部声明var变量，作用域是全局的。==**不可以**==在window中使用。
  * 变量提升
    * 一种JS机制：变量和函数声明会移至作用域==**顶部**==。
  * 块级作用域（这更好）

* 

  > 注意：JS有个严格检查模式
  >
  > 启用：必须在代码第一行加入`‘use strict’;`
  >
  > 作用：预防JS随意性出现的问题
  >
  > 


### 2.4、if、for、switch语句

* 分号必须写（不写系统帮忙写，消耗资源，可能写错位置）
* 跟java一样 略

### 2.5、 IO语句

| 方法             | 说明                           | 归属   |
| ---------------- | ------------------------------ | ------ |
| alert(msg)       | 浏览器弹出警示框               | 浏览器 |
| console.log(msg) | 浏览器控制台打印输出信息       | 浏览器 |
| prompt(info)     | 浏览器弹出输入框，用户可以输入 | 浏览器 |

### 2.6、数据类型

* number

  * 不区分小数和整数

  * ```js
    123
    123.1
    1.123e3
    -99
    NaN 这个与所有数值都不相等，包括自己 通过isNaN(NaN)来判断
    Infinity
    ```

  * 尽量==**避免**==使用==**浮点数进行运算**==，存在精度损失。

* 字符

* 字符串

* 布尔值

* null 

* undefined

* 数组

  * 数组元素类型可以不同，数组是中括号[]

  * ```js
    var arr =[1,2,3,4,'ss'.null,true];//比下面的代码可读性高
    new Array(1,2,3,4,'hello');
    ```

  * 

* 对象

  * 是大括号{}

  * ```js
    var person={
    	name:'qinjiang',
        age:3,
        tags: ['js','java','...']
    };
    var myName=person.name;
    ```

### 2.7、运算符

```
== 类型不一样，值一样，为true
==== 类型一样，值一样，为true
```

其它与java差不多。

# 三、基础

## 1、数据类型

### 1.1、字符串

1. 需要用单引号或双引号

2. 注意转义字符 `\`

   ```
   \'
   \n
   \t
   \u4e2d   \u#### Unicode字符
   \x41   ASCLL字符
   ```

3. 多行字符串编写

   ```js
   var a='sjij
   		sdji
   		sdoj';
   ```

4. 模板字符串

   ```
   var a='name';
   var b='hello${a}';  //el表达式
   ```

   

5. 字符串不可变

6. 常用方法

   ```js
   var a='aaasd';
   a.toUpperCase();
   a.toLowerCase();
   a.indexOf('字符');  //返回索引
   a.substring(1,3);// 包含前面不包含后面 [1,3)
   ```

### 1.2、 数组

1. Arrray可以包含任意的数据类型

2. 数组字符串可变 

   > 注意：
   >
   > 给数组length赋值，数组长度会发生变化。赋值过小元素就会丢失。数组越界undefined

3. 常用方法

   ```js
   let arr =[1,2,3,4,'ss'.null,true];
   arr.indexOf('元素'); //返回索引
   arr.slice(1,3) //[ ) 返回新数组
   arr.push('1') //栈压入
   arr.pop()//栈弹出
   arr.unshift('1') //栈压入
   arr.shift()//栈弹出
   arr.sort()//排序
   arr.reverse()
   arr.concat([1,2,3])//拼接 返回新数组
   arr.join('-')//使用特定的字符串连接 返回字符串
   arr.fill(1) //注意会降维 有值和无值都会填充
   
   ```

4. 多维数组

   ```js
   var arr=[[1,2],[3,4]];
   arr[1][1] //result: 4
   ```

   

### 1.3、对象

1. {}表示一个对象，若干键值对描述属性：xxx:xxx，多个属性之间使用逗号隔开，最后一个属性不加逗号！

```js
var person={
    name:'wujian',
    age:3,
    email:'24736743@qq.com',
    score:0
}
paerson.name='min';

```

2. 调用一个不存在的属性不会报错，只会返回undefined

3. 动态的删减属性

4. ```javascript
   delete person.name //返回true
   ```

5. 动态的添加属性

   ```js
   person.haha='haha'//返回 'haha'
   ```

6. 健必须是字符串，值是任意对象。

7. 判断属性( 方法 )是否在这个对象中

   ```js
   'age' in person//返回true or false
   //继承的
   'toString' in person
   ```

   

8. 常用方法

   ```js
   person.hasOwnProperty('toString'); //不是自身拥有的方法 返回 false
   ```

## 2、流程控制

forEach()

```js
arr.forEach(function (e){
    console.log(e)
})//遍历数组
```

for  in

```js
for(var num in arr){ // num存的不是元素，是下标
 	console.log(arr[num])
}
```

​	
