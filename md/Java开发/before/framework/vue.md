# Vue

## 一、Vue概述

#### Vue是什么？

一套用于构建用户界面的渐进式JavaScript框架

#### Vue特点

* 采用==**组件化**==模式，提高代码复用率、且让代码更好维护。 如：

![image-20211110161734779](vue.assets/image-20211110161734779.png)

* ==**声明式编码**==（一蹴而就。与之相反为命令式编码），让编码人员无需直接操作DOM，提高开发效率。

* 使用==**虚拟DOM**==+==**优秀的Diff（不同）算法**==，尽量复用DOM节点。如：

  ![image-20211110162634270](vue.assets/image-20211110162634270.png)

## 1、安装并创建实例

下载（一个开发的、一个生产的）

![image-20211110172230927](vue.assets/image-20211110172230927.png)

html引入.js

消除提示

* 安装 chrome DevTool插件

* 设置Vue全局变量：

  * ```terminal
    Vue.config.productionTip=false; //设置为 false 以阻止 vue 在启动时生成生产提示。
    ```

写容器并绑定Vue实例：（声明式渲染）

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="../js/vue.js"></script>    
</head>
<body>
    <!-- 准备好一个容器如下： -->
    <div id="root">
        <h1>{{who}}报道</h1>
        <h1>{{how}}</h1>
    </div>
    <script >
        Vue.config.productionTip=false//设置为 false 以阻止 vue 在启动时生成生产提示。
        //创建Vue实例
        const vm=new Vue({
            el:'#root', //el用于指定当前Vue 实例为哪个容器服务，值通常为css选择器字符串
            //le:document.getElementById('root') 笨重
            data:{
                who:'We',
                how:'do'
            }
        })
        // axios({
        //     url:'http://????'
        // })
    </script>    
    
</head>
</body>
</html>
```

## 2、初识Vue：（总结）

1. Vue工作，就必须创建一个Vue实例，且要传入配置对象。（如：el data）
2. root容器代码依然符合html规范，只是混入了一些特殊Vue语法。
3. root容器里的代码被称为【==**Vue模板**==】
4. 一个实例不能接管多个容器（要==**一对一**==）
5. 只是开发中只有一个Vue实例，并且会配合这组件一起使用
6. {{xxx}}中的`xxx`要写==**js表达式**==，且xxx可以自动读取到data中的所有属性。
7. 一旦data中的数据==**发生改变**==，模板（页面）中用到该数据的地方也会==**自动更新**==。
   1. 除了`Object.freeze()`，这会==**阻止修改**==现有的 property
8. 只有当实例被创建时就已经存在于 `data` 中的 property 才是==**响应式**==的。之后加入的属性为==**非响应式**==

# 二、模板语法

## 1、插值语法

功能：用于解析标签体内容

写法：{{xxx}},xxx是js表达式，且可以直接读取到data中的所有属性。

## 2、指令语法

功能：用于解析标签（包括：标签属性、标签体内容、绑定事件、…）

写法：如：v-bind:href=“xxx”或简写为:href=“xxx”,xxx同样要写js表达式。

```html
<body>
    <div id="r">
        {{name.toUpperCase()}}
        <a :href="url.toUpperCase()">尚硅谷1</a>
        <a :href="Iterate.url">尚硅谷2</a>
    </div>
<script>
    const vm=new Vue({
        el:'#r',
        data:{
            name:'a',
            url:'http://www.baidu.com',
            Iterate:{
                url:'http://www.blibli.com'
            }
        }
    })
</script>    
</body>
```



