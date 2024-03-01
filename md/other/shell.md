# 一、shell

## 1、概述

### 1.1 分类

流行的shell有ash、bash、ksh、csh、zsh等。默认 **bash**

### 1.2 脚本文件描述

#### 结构描述

```sh
#指定shell（解释器）
#!/bin/bash
#...命令
```

#### 运行描述

```terminal
#第一种：给文件增加执行权限
[root@localhost ~]$ chmod u+x test.sh
[root@localhost ~]$ ./test.sh  #绝对路径或相对路径执行
#第二种：直接
[root@localhost ~]$ bash test.sh
```

## 2、重定向

#### 2.1 设备描述符

| 设备 |   设备名    | 文件描述符 |     类型     |
| :--: | :---------: | :--------: | :----------: |
| 键盘 | /dev/stdin  |     0      |   标准输入   |
| 终端 | /dev/stdout |     1      |   标准输出   |
| 终端 | /dev/stderr |     2      | 标准错误输出 |

特殊：重定向到 /dev/null 上，则不输出

#### 2.2 重定向符

* 输出重定向：`>` 、`>>`
* 输入重定向：`<`、`<<`
* 重定向方式：分为**追加**、**覆盖**、、**读取**、**标识符限定输入**（`>` 、`>>`、`<`、`<<`）
* 标识符限定输入：读到指定标识符时停止读取
* 特殊使用：2>&1。简写(&>)。理解（指针）

> 注意
>
> 命令也是一种简写的重定向
>
> ```sh
> history > /dev/stdout #等效于
> history >1 #等效于
> history
> ```
>
> 

## 3、变量

### 3.1 命名规范

1. 基本一样
2. **等号左右**两侧**不能空格**
3. 不能使用标点符号，不能使用bash里的关键字（可用help命令查看保留关键字）
4. 环境变量大写
5. 变量调用`"$variable"`or`${variable}`or`$variable`

### 3.2 变量分类

1. 用户自定义变量
2. 环境变量：系统自带环境变量、用户自定义环境变量
3. 位置参数变量：类似函数体的参数
4. 预定义变量：shell自带的，预先制定的一些变量

### 3.3 普通变量使用

```shell
#定义变量
[root@localhost ~]$ name="shen chao"


#调用变量
[root@localhost ~]$ echo $name 
#输出变量name的值
shen chao


#变量查看 
#使用set命令
#-u 调用未声明变量 报错
-bash: file: unbound variable
#-x 执行命令之前输出命令
[root@localhost ~]$ ls
+ls --color=auto
#+<参数> 撤回之前的参数
[vagrant@10 ~]$ set +x

#变量删除
[root@localhost ~]$ unset 变量名

```

### 3.4 环境变量使用

```sh
#环境变量声明
[root@localhost ~]$  export AGE="18"

#set命令可以查看所有变量，而env命令只能查看环境变量。
[vagrant@10 ~]$ env
XDG_SESSION_ID=8
HOSTNAME=10.0.2.15
SELINUX_ROLE_REQUESTED=
TERM=xterm-256color
SHELL=/bin/bash
HISTSIZE=1000
SSH_CLIENT=10.0.2.2 50072 22
SELINUX_USE_CURRENT_RANGE=
SSH_TTY=/dev/pts/0
USER=vagrant
...
```

### 3.5  位置参数及其使用

| 位置参数变量 |                            作用                            |
| :----------: | :--------------------------------------------------------: |
|      $n      |    **$0**表示**脚本程序的名称**，$1~$9表示命令传入参数     |
|      $*      |        代表命令行的所有参数，把所有变量看成一个整体        |
|      $@      | 这个变量也代表命令行中所有的参数，不过$@把每个参数区分对待 |
|      $#      |             这个变量代表命令行中所有参数的个数             |

使用

```sh
#脚本
#!/bin/bash
#位置参数变量$0~10
echo '$n：'
echo $0
echo $1
echo $10
echo '$*：'
echo '$*：'
echo $*
for i in "$*"
        do
                echo "for：$i"
        done

echo '$@：'
echo $@
echo '$@：for'
for i in "$@"
        do
                echo "for: $i"
        done
echo '$#：'
echo $#

#result
[vagrant@10 ~]$ bash a.sh 1 2 3 4 5 6 7 8 9 10 11
$n：
a.sh
1
10
$*：
$*：
1 2 3 4 5 6 7 8 9 10 11
for：1 2 3 4 5 6 7 8 9 10 11
$@：
1 2 3 4 5 6 7 8 9 10 11
$@：for
for: 1
for: 2
for: 3
for: 4
for: 5
for: 6
for: 7
for: 8
for: 9
for: 10
for: 11
$#：
11
```

### 3.6 预定义变量及其使用

| 预定义变量 |                             作用                             |      |
| :--------: | :----------------------------------------------------------: | ---- |
|     $!     | 最后一次执行的命令的返回状态（值**为0**表示上个命令**正确执行**，**非0**表示执行**不正确**） |      |
|     $$     |                当前进程（脚本）的进程号（PID)                |      |
|     $!     |             后台运行的最后一个进程的进程号(PID)              |      |

使用

```sh
#!/bin/bash
#预定义变量使用
ls > /dev/null

if [ $? -eq 0 ]
then
        ls_cmd='正确'
else
        ls_cmd='不正确'
fi
echo "ls 命令执行$ls_cmd。(当前脚本的PID为：$$)"
cd /homes > /dev/null 2>&1
cd_cmd=$([ $? -eq 0 ] && echo '正确' || echo '不正确')
echo "cd 命令执行$cd_cmd。(当前脚本的PID为：$$)"

cat ./pre_variable.sh > /dev/null 2>&1 &
cat_cmd=$([ $? -eq 0 ] && echo '正确' || echo '不正确')
echo "cat 命令执行$cat_cmd。(当前脚本的PID为：$$)(后台运行的最后一个进程PID为：$!)"

#result
[vagrant@10 ~]$ bash pre_variable.sh
ls 命令执行正确。(当前脚本的PID为：3656)
cd 命令执行不正确。(当前脚本的PID为：3656)
cat 命令执行正确。(当前脚本的PID为：3656)(后台运行的最后一个进程PID为：3659)

```

3.7 只读变量

```sh
#!/bin/bash
a=10
#语法：readonly 变量名
readonly a
a=20   #会报错readonly variable
echo $a
```



## 4、特殊符号使用

不太详尽 待处理

|   符号   |                             作用                             |
| :------: | :----------------------------------------------------------: |
| ''单引号 |               特殊符号不转义，不生效，直接输出               |
| ""双引号 |                      特殊字符转义、生效                      |
| ``反引号 |                 括起来时系统命令和()作用一样                 |
|   $()    |      和反引号作用一样，用来引用系统命令。**(推荐使用)**      |
|    ()    |     用于一串命令执行时，()中的命令会在**子Shell**中运行      |
|    {}    | 用于一串命令执行时，{ }中的命令会在当前Shell中执行。也可以用于变量变形与替换。 |
|   [ ]    |                       用于变量的测试。                       |
|    #     |              在Shell脚本中，#开头的行代表注释。              |
|    $     | 用于调用变量的值，如需要调用变量name的值时，需要用$name的方式得到变量的值。 |
|    \     |                            转义符                            |





