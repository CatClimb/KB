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

待处理

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

## 3、数据绑定

Vue中有2种数据绑定的方式：

1. 单向绑定（v-bind）：数据只能从data流向页面。

2. 双向绑定（v-model）：数据不仅能从data流向页面，还可以从页面流向data

   备注：

   1. 双向绑定一般都应用在表单类元素上（如：input、select等）
   2. `v-model:value`可以简写为`v-model`，因为v-model默认手机的就是value值。

双向数据绑定如图：

![image-20211205225426038](vue.assets/image-20211205225426038.png)

```js
<body>
    <div id="root">
        <!-- 普通写法 -->
        <!-- 单向数据绑定：<input type="text" v-bind:value="name"><br><br>
        双向数据绑定：<input type="text" v-model:value="name"><br><br> -->
         <!-- 简写写法 -->
        单向数据绑定：<input type="text" :value="name"><br><br>
        双向数据绑定：<input type="text" v-model="name"><br><br>
<!-- 下列是错误的，v-model只能作用在表单类元素（输入类元素）上，不然没意义 -->
        <!-- <h2 v-model:x="name">你好啊</h2> -->
    </div>
    <script>
        new Vue({
            el:'#root',
            data:{
                name:123
            }
        })
    </script>
</body>
```

## 注意点 1：写法

data与el写法：

1. el有2种写法

   1. new Vue 的时候配置el属性
   2. 先创建Vue实例，随后再通过`vm.$mount('#root');`指定el的值。

2. data有2种写法

   1. 对象式（一般的写法）

   2. 函数式

      如何选择：目前哪种写法都可以，以后学习到组件时，data必须使用函数式，否则会==**报错**== 待处理

3. 一个重要的原则：

   由Vue管理的函数，一定不要写箭头函数，一旦写了箭头函数，this就不再是Vue实例。

```js
<body>
    <div id="root">
      {{name}}
    </div>
    <script>
        const vm=new Vue({
            // el:'#root',
            // data:{
            //     name:'写法1'
            // }
               data(){
                   console.log('@@@',this)//此处的this是vm
                   return{
                       name:'写法2'
                   }
               }
        });
        setTimeout(() => {
            vm.$mount('#root');
        }, 1000);
    </script>
</body>
```

## 4、MVVM模型

1. M 模型（Model）：对应data种的数据
2. V：视图（View）：模板

3. VM：视图模型（ViewModel）：Vue实例对象

观察发现：

1. data中所有的属性，最后都出现在了vm身上。

2. vm身上所有的属性 及 vue原型上的所有属性，在模板中都可以直接使用。

   



![image-20211205230939959](vue.assets/image-20211205230939959.png)





## 5、 Vue 数据代理

1. Vue中的数据代理：

   ​		通过vm对象来代理data对象中属性的操作（读/写）

2. Vue中数据代理的好处：

   ​		更加方便的操作data中的数据

3. 基本原理：

   ​		通过Object.defineProperty()把data对象中所有属性添加到vm上。为每一个添加到vm上的属性，都指定一个getter/setter。在getter/setter内部去操作（读/写）data中对应的属性。 
   
   

![image-20211206162405533](vue.assets/image-20211206162405533.png)



```html
<body>
    <div id="root">
        {{name}}
    </div>
    <script>
        let data={
            name:'数据代理'
        }
        new Vue({
            el:'#root',
            data
        })
    </script>
</body>
```

```js
vm._data===data
true
```

_data是对data升级，其中代理规则如下：

vm身上的`data`代理`_data`，`_data`代理`网页的数据`。

`data`代理的setter/getter如：

```terminal
get name: ƒ proxyGetter()
set name: ƒ proxySetter(val)
```

`_data`代理的setter/getter如：

```terminal
get name: ƒ reactiveGetter()
set name: ƒ reactiveSetter(newVal)
```



## 6、事件处理

事件的基本使用：

1. 使用`v-on:xxx` 或 `@xxx` 绑定事件，其中xxx是事件名（也可以是简单的js表达式）
2. 事件的回调需要配置在methods对象中，最终会在vm上
3. methods中配置的函数，不要用箭头函数！否则this就不是vm了
4. methods中配置的函数，都是被Vue所管理的函数，this的指向是vm 或 组件实例对象
5. `@click="demo"` 和 `@click="demo($event)"` 效果一致，但后者可以传参。

```html
<body>
    <div id="root">
        <h2>欢迎来到{{name}}</h2>
        <!-- <button v-on:click="showInfo1">点我提示信息1(不传参)</button> -->
        <button @click="showInfo1">点我提示信息1(不传参)</button>
        <button @click="showInfo2($event,66)">点我提示信息2(传参)</button>
    </div>
    <script>
        const vm=new Vue({
            el:'#root',
            data:{
                name:'事件处理'
            },
            methods: {
                showInfo1(e){
                    console.log('事件目标：', e.target);
                    console.log('事件目标文本：', e.target.innerText);
                    console.log('this :>> ', this);//此处this指vm
                },
                showInfo2(e,tmp){
                    console.log('The param is: ', tmp);
                    console.log('object :>> ', e.target);
                }
            },
        })
    </script>
</body>
```

### 6.1、事件修饰符

Vue中的事件修饰符：

   				1. prevent：阻止默认事件（常用）
   				2. stop：阻止事件冒泡（常用）（由内往外冒）
   				3. once：事件只触发一次（常用）
   				4. capture：使用事件的捕获模式（由外往内捕获）
   				5. self：只有event.target是当前操作的元素时才触发事件
   				6. passive：事件的默认行为立即执行。无需等待事件回调执行完毕。

```html
<body>
    <div id="root">
        <h2>欢迎来到{{name}}</h2>
        <!-- 1. prevent：阻止默认事件（常用） -->
        <a href="http://www.baidu.com" @click.prevent="showInfo1">prevent</a>
        <!-- 2. stop：阻止事件冒泡（常用） -->
        <div class="box1" @click="showInfo2">
            <div class="box2" @click="showInfo2">
                <button @click.stop="showInfo2">stop</button>
            </div>
        </div>

        <!-- 3. once：事件只触发一次（常用） -->
        <div class="box2">
            <button @click.once="showInfo3">once</button>
        </div>
        <!-- 4. capture：使用事件的捕获模式 -->
        <div class="box1" @click.capture="showInfo4(1)">
            <div class="box2" @click.capture="showInfo4(2)">
                <button @click.capture="showInfo4(3)">capture</button>
            </div>
        </div>
        <!-- 5. self：只有event.target是当前操作的元素时才触发事件 -->
        <div class="box1" @click.self="showInfo5">
            <button @click="showInfo5">self</button>
        </div>
        <!-- 6. passive：事件的默认行为立即执行。无需等待事件回调执行完毕。 -->
        
        <!-- <ul class="list" @scroll="showInfo6"> -->
        <ul class="list" @wheel.passive="showInfo6"><!--会出现问题 卡-->
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
    </div>
    <script>
        $('*').css({'marginTop':"10px"});
        $('.box1').css({
            'alignItems': 'center',
            'height':'150px',
            'backgroundColor':"skyblue"
    });
        $('.box2').css({
            'textAlign':'center',
            'height':'75px',
            'width':'800px',
            'backgroundColor':"green"});
        $('.list').css({
        
        'height':'200px',
        'width':'200px',
        'backgroundColor':"peru",
        'overflow':'auto'});
        $('li').css({
        
        'height':'100px',
        });
        
        const vm=new Vue({
            el:'#root',
            data:{
                name:'事件修饰符'
            },
            methods: {
                showInfo1(){
                    alert('点我提示信息1');
                },
                showInfo2(){
                    alert('点我提示信息2');
                },
                showInfo3(){
                    alert('点我提示信息3');
                },
                showInfo4(a){
                    // alert('点我提示信息4 params is: '+a)
                    console.log('a :>> ', a);
                },
                showInfo5(){
                    alert('点我提示信息5');
                },
                showInfo6(){
                    for(let i=0;i<1000000;i++){
                        console.log('#');
                }
                },
            },
        })
    </script>
</body>
```



### 6.2、键盘事件

1. vue中常用的按键别名：

   回车=>enter

   删除=>delete（捕获“删除”和“退格”键）

   退出=>esc

   空格=>space

   换行=>tab（特殊，必须配合keydown去使用，keyup不行，会切换聚焦）

   上=>up

   下=>down

   左=>left

   右=>right

2. Vue未提供别名的按键，可以使用按键原始的key名去绑定，但注意要转为kebab-case(短横线命名)
3. 系统修饰键（用法特殊）：ctrl、alt、shift、meta（是window图标）
   1. 配合keyup使用：按下修饰键的同时，再按下其它键，随后释放其他键，事件才被触发。
   2. 配合keydown使用：正常触发事件。
4. 也可以使用keyCode取指定具体的按键（不推荐）
5. `Vue.config.keyCodes.自定义键名=键码`，可以取定制按键别名。

```html
<body>
   <div id="root">
    <input type="text" placeholder="请输入" @keyup="showInfo">
    <input type="text" placeholder="请输入" @keyup.enter="showInfo">
    <input type="text" placeholder="请输入" @keyup.ctrl.y="showInfo">
    <input type="text" placeholder="请输入" @keyup.haha="showInfo">
   </div>
    <script>
        Vue.config.productionTip = false;
        Vue.config.keyCodes.haha=13;
        'use strict';  
        const vm=new Vue({
           el:'#root',
           methods:{
               showInfo(e){
                   console.log(e.key,e.keyCode);
                //    console.log(e.target.value);
               }
           }
        });
    </script>
</body>
  
```

## 7、计算属性与监听属性

### 7.1、计算属性

1. 定义：要用的属性不存在，要通过已有属性计算得来。
2. 原理：顶层借助了`Object.defineProperty`方法提供的getter和setter
3. get函数什么时候执行？
   1. 初次读取时会执行一次。
   2. 当依赖的数据发生改变时会被再次调用。
4. 优势：与methods实现相比，内部有缓存机制（复用），效率更高，调试方便。
5. 备注：
   1. 计算属性最终会出现在vm上，直接读取使用即可。
   2. 如果计算属性要被修改，拿必须写set函数去响应修改，且set中要引起计算时依赖的数据发生改变。



```html
<body>
    <div id="root">
        性：<input type="text" v-model="firstName"><br><br>
        名：<input type="text" v-model="lastName"><br><br>
        <span>{{fullName}}</span>
    </div>
    <script>
        'use strict';
        Vue.config.productionTip = true;
        const vm=new Vue({
            el:'#root',
            data:{
                firstName:'张',
                lastName:'三'
            },
            computed:{
                //完整写法
                // fullName:{
                    //get()什么时候调用？1.初次读取时。2.所依赖的数据发生变化时。
                //     get(){
                //         //console.log('this :>> ', this); 这里this是vm
                //         return this.firstName+'-'+this.lastName;
                //     },
                //     set(value){
                //         let arr=value.split('-');
                //         this.firstName=arr[0];
                //         this.lastName=arr[1];
                //     }
                // },
                //简写 不包含 set
                fullName(){
                    return this.firstName+'-'+this.lastName;
                }
            }
        });
    </script>
</body>
```

### 7.2、监听属性

监听属性watch：

1. 当被监视的属性变化时，回调函数自动调用，进行相关操作
2. 监视的属性必须存在，才能进行监视！
3. 监听的两种写法：（可以简写哦）
   1. new Vue时传入watch配置
   2. 通过vm.$watch监视）

```html
<body>
    <div id="root">
        <h2>今天天气很{{info}}</h2>
        <button @click="changeWeather">切换天气</button>
    </div>
    <script>
        const vm=new Vue({
            el:'#root',
            data:{
                isHot:true,
            },
            computed:{
                info(){
                    return this.isHot ? '炎热':'凉爽'
                }
            },
            methods: {
                changeWeather(){
                    this.isHot=!this.isHot
                }
            },
            watch:{
                // isHot:{
                //     immediate:true,//初始化时让handler被调用
                //     //handler什么时候调用？当isHot发生改变时。
                //     handler(newVaule,oldValue){
                //         console.log('isHot被修改了 newvalue is: '+newVaule+' and oldvalue is: '+oldValue);
                //     }
                // },
                //简写
                isHot(newVaule,oldValue){
                        console.log('isHot被修改了 newvalue is: '+newVaule+' and oldvalue is: '+oldValue);
                    }
            }
        })
        // vm.$watch('isHot',{
        //     immediate:true,//初始化时让handler被调用
        //     //handler什么时候调用？当isHot发生改变时。
        //     handler(newVaule,oldValue){
        //         console.log('isHot被修改了 newvalue is: '+newVaule+' and oldvalue is: '+oldValue);
        //         console.log(this);
        //     }
        // })
        //简写
        vm.$watch('isHot',function(newValue,oldValue){
            console.log('isHot被修改了 newvalue is: '+newValue+' and oldvalue is: '+oldValue);
            console.log(this);
        })
    </script>
</body>
```



### 7.3、深度监视

深度监视：

1. Vue中的watch默认不检测对象内部值得改变（一层）
2. 配置`deep:true`可以检测对象内部值的改变（多层）

备注：

1. Vue自身可以检测对象内部值的改变，但Vue提供的watch默认不可以
2. 使用watch时根据数据的具体结构，决定是否采用深度监视。

```html
<body>
    <div id='root'>
        <button @click="numbers.a++">a+1</button>
        <button @click="numbers.b++">b+1</button>
        <span>{{numbers.c}}</span>
    </div>
    <script>
        const vm=new Vue({
            el:"#root",
            data() {
                return {
                    numbers:{
                        a:1,
                        b:2,
                        c:3
                    }
                }
            },
            watch:{
                numbers:{
                    deep:true,
                    handler(newValue,oldValue){
                        console.log('numbers值发生变化了',newValue);
                    },
                    // 'numbers.a':{
                    //     handler(newValue,oldValue){
                    //     console.log('a变了');
                    //     }
                    // },
                    // 'numbers.b':{
                    //     handler(newValue,oldValue){
                    //     console.log('b变了');
                    //     }
                    // }   
                }             
            }
        });
    </script>
</body>
```

### 7.4、计算属性与监听属性的区别

computed和watch之间的区别：

1. computed能完成的功能，watch都可以完成。
2. watch能完成的功能，computed不一定能完成。例如watch可以进行==**异步操作**==。
3. computed==**有返回**==，watch==**没有返回**==

两个重要的小原则：

1. 所被Vue管理的函数，最好写成普通函数，这样this的指向才是vm 或 组件实例对象。
2. 所有不被Vue所管理的函数（定时器的回调函数，ajax的回调函数、Promise等）。最好写成箭头函数，这样this的指向才是vm 或 组件实例对象。

```html
<body>
    <div id="root">
        性：<input type="text" v-model="firstName"><br><br>
        名：<input type="text" v-model="lastName"><br><br>
        <span>{{fullName}}</span>
    </div>
    <script>
        'use strict';
        Vue.config.productionTip = true;
        const vm=new Vue({
            el:'#root',
            data:{
                firstName:'张',
                lastName:'三',
                fullName:'张-三'
            },
            //无法异步
            computed:{
                // fullName(){
                //     setTimeout(() => {
                //         return this.firstName+'-'+this.lastName;
                //     }, 1000);
                //     return this.firstName+this.lastName
                // }
            },
            //可以异步
            watch:{
                firstName(val){
                    setTimeout(() => {
                        this.fullName=val+'-'+this.lastName;
                    }, 1000);
            
                },
                lastName(val){
                    setTimeout(() => {
                        this.fullName=this.firstName+'-'+val;
                    }, 1000);
                }
            }
        });
    </script>
</body>
```

## 8、样式绑定

样式绑定

1. class样式

   写法：（`:class="xxx"` xxx可以是字符串、对象、数组）

   1. 字符串写法适用于：类名不确定，要动态获取。
   2. 对象写法适用于：要绑定多个样式，个数不确定，名字也不确定。
   3. 数组写法适用于：要绑定多个样式，个数确定，名字也确定，但不确定用不用。

2. style样式

   1. `:style="{fontSize:xxx}"`其中xx是动态值
   2. `:style="[a,b]"`其中 a、b是样式对象。

```html
<body>
    <div id="root">
        
        <!-- class绑定样式-字符串写法。适用于：样式的类名不确定，需要动态绑定 -->
        <div class="basic" :class="mood" @click="changeMood">{{name}}</div><br><br>
        <!-- class绑定样式-数组写法。适用于：要绑定的样式个数不确定，名字也不确定-->
        <div class="basic" :class="yangshiArr">{{name}}</div><br><br>
        <button @click="ys1">ys1</button>
        <button @click="ys2">ys2</button>
        <button @click="ys3">ys3</button><br><br>
        <!-- class绑定样式-对象写法。适用于：要绑定的样式个数确定、名字也确定，但要动态决定用不用 -->
        <div class="basic" :class="yangshiObj">{{name}}</div><br><br>
        <!-- style绑定样式-对象写法。 -->
        <div class="basic" :style="styleObj1">{{name2}}</div><br><br>
        <!-- style绑定样式-s数组写法。 -->
        <div class="basic" :style="[styleObj1,styleObj2]">{{name2}}</div><br><br>
    </div>
    <script>
        const vm=new Vue({
            el:'#root',
            data:{
                name:'class',
                name2:'style',
                mood:'normal',
                moodArr:['normal','happy','sad'],
                yangshiArr:['yangshi1'],
                yangshiObj:{
                    yangshi1:true,
                    yangshi2:false,
                    yangshi3:false
                },
                styleObj1:{
                    fontSize:'40px',
                    borderRadius:'20px',
                },
                styleObj2:{
                    color:'red',
                    backgroundColor: 'orange'
                },
            },
            methods: {
                changeMood(){
                    this.mood=this.moodArr[Math.floor(Math.random(3)*3)];
                },
                ys1(){
                    // if(this.yangshiArr.indexOf('yangshi1')<0){
                    //     this.yangshiArr.push('yangshi1')
                    // }else{
                    //     this.yangshiArr.splice(this.yangshiArr.indexOf('yangshi1'),1)
                    // }
                    this.yangshiObj.yangshi1=!this.yangshiObj.yangshi1;
                },
                ys2(){
                    // if(this.yangshiArr.indexOf('yangshi2')<0){
                    //         this.yangshiArr.push('yangshi2')
                    // }else{
                    //     this.yangshiArr.splice(this.yangshiArr.indexOf('yangshi2'),1)
                    // }
                    this.yangshiObj.yangshi2=!this.yangshiObj.yangshi2;
                },
                ys3(){
                    // if(this.yangshiArr.indexOf('yangshi3')<0){
                    //         this.yangshiArr.push('yangshi3')
                    // }else{
                    //     this.yangshiArr.splice(this.yangshiArr.indexOf('yangshi3'),1)
                    // }
                    this.yangshiObj.yangshi3=!this.yangshiObj.yangshi3;
                }
                    
            },
            
        })
    </script>
</body>
```



## 9、条件渲染与列表渲染

### 9.1、条件渲染

1. v-if 

   写法：

   * v-if="表达式"
   * v-else-if="表达式"
   * v-else="表达式"

   适用于：切换频率低的场景。

   特点：不展示的DOM元素==**直接被移除**==

   注意：v-if可以和:v-else-if、v-else一起使用，但要求结构不能被“打断”。

2. v-show

   写法：v-show=“表达式”

   适用于：切换频率较高的场景。

   特点：不展示的DOM元素未被移除，仅仅是使用**样式隐藏掉**（也就是 display:none）

3. 备注: 使用v-if的时,元素可能无法获取到，而使用v-show一定可以获取到。`<template></template>`这个标签会在虚拟DOM转换为真实DOM时消掉。只能和v-if一起使用

   ```html
   <body>
   <div id="root">
   	<div v-if="isShow">{{name}}</div>
   	<div v-show="isShow">{{name}}</div>
   	<button @click="n<3?n++:n=1">{{n}}</button>
   	<div v-if="n===1">Angular</div>
   	<!--<div>ss</div>  -->
   	<div v-else-if="n===2">React</div>
   	<div v-else>Vue</div>
   	<!-- template只能配合v-if使用 -->
   	<template v-if="isShow">
   		<h2>1</h2>
   		<h2>2</h2>
   		<h2>3</h2>
   	</template>
   	<div v-if="isShow">
   		<h2>a</h2>
   		<h2>b</h2>
   		<h2>c</h2>
   	</div>
   		
   </div>
   <script type="text/javascript">
   'use strict';
   	const vm=new Vue({
   		el:'#root',
   		data:{
   			name:'talent',
   			isShow:true,
   			n:1
   		}
   	})
   </script>
   </body>
   ```

   

### 9.2、列表渲染

v-for指令

1. 用于展示列表数据
2. 语法：v-for="(item,(index or key)) in xxx" :key="yyy"
3. 可遍历：数组、对象、字符串（不常用）、指定次数（不常用）  



```html
<body>
<div id="root">
	<ol>
		<!--遍历数组元素  不写默认为:key="index"   -->
		<li v-for="(obj,index) in persons" :key="obj.id">
		{{obj.name}}-{{obj.age}}
		</li>
	</ol>
	<ol>
		<!--遍历对象的属性 -->
		<li v-for="(value,key) in car" :key="key">
		{{key}}-{{value}}
		</li>
	</ol>
	<ol>
		<!--遍历字符串 -->
		<li v-for="(value,index) in str" :key="index">
		{{value}}-{{index}}
		</li>
	</ol>
	<ol>
		<!--遍历指定次数 -->
		<li v-for="(value,index) in 5" :key="index">
		{{value}}-{{index}}
		</li>
	</ol>
</div>
<script type="text/javascript">
	'use strict';
	const vm=new Vue({
		el:'#root',
		data:{
			persons:[
			         {id:'01',name:'张三',age:18},
			         {id:'02',name:'李四',age:19},
			         {id:'03',name:'王五',age:20},

         	],
	         car:{
	        	 name:'奥迪A8',
	        	 price:'70万',
	        	 color:'黑色'
	         },
	         str:'hello'
			        
		}
	})
</script>
</body>
```

### 9.3、key的作用与原理

![image-20211206205900262](vue.assets/image-20211206205900262.png)

面试题：react、vue中的key有什么作用？（key的内部原理）

1. 虚拟DOM中key的作用：

   key是虚拟DOM对象的标识，当数据发生变化时，Vue会根据【新数据】生成【新的虚拟DOM】、随后Vue进行【新虚拟DOM】与【旧虚拟DOM】的差异比较，比较规则如下：

2. 对比规则:

   1. 旧虚拟DOM中找到了与新虚拟DOM相同的key：
      1. 若虚拟DOM中内容没变，直接使用之前的真实DOM！
      2. 若虚拟DOM中内容变了，则生成新的真实DOM，随后替换页面中之前的真实DOM。
   2. 旧虚拟DOM中未找到与新虚拟DOM相同的key
      1. 创建新的真实DOM，随后渲染到页面。

3. 用index作为key可能会引发的问题：

   1. 若对数据进行：逆序添加、逆序删除等破坏顺序的操作：

      ​		会产生没有必要的真实DOM更新===》界面效果没问题，但效率低。

   

   1. 如果结构中还包含输入类的DOM：

      ​		会产生错误DOM更新===》界面有问题。

4. 开发中如何选择key？：

   1. 最好使用每条数据的唯一表示作为key，比如id、手机号、身份证等unique的值。
   2. 如果不存在对数据的逆序添加、逆序删除等破坏顺序操作，仅用于渲染列表用于展示，使用index作为key时没有问题的。

    ```html
   <body>
   <div id="root">
   	<ol>
   		<li v-for="(obj,index) in persons" :key="index">
   		{{obj.name}}-{{obj.age}}<input >
   		</li>
   	</ol>
   	<button @click="persons.unshift({id:'04',name:'老六',age:21})">添加老六</button>
   </div>
   <script type="text/javascript">
   	'use strict';
   	const vm=new Vue({
   		el:'#root',
   		data:{
   			persons:[
   			         {id:'01',name:'张三',age:18},
   			         {id:'02',name:'李四',age:19},
   			         {id:'03',name:'王五',age:20},
            	],
   		},
   	})
   </script>
   </body>
    ```

   





















































