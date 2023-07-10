#Shell环境
支撑环境有：
Bourne shell (/usr/bin/sh或/bin/sh)
Bourne Again Shell (/bin/bash)
C Shell (usr/bin)
K Shell (usr/bin/ksh)
Shell for Root (sbin/sh)

#调用方式
1、作为可执行程序
```
.test.sh #执行脚本
```terminal
2、作为解释器参数
```
/bin/sh test.sh
```terminal


#变量定义

```
your_name="asdasd"
echo $your_name
echo ${your_name}
```terminal
##注意
加不加都行，加花括号是为了帮助解释器识别变量的边界
比如赭红

#只读变量
```
myUrl="https://www.google.com"
readonly myUrl
```terminal
#删除变量

```
unset variable_name

```terminal
##注意
只读变量不能被删除

#变量类型
1、局部变量 ：仅在当前shell实例中有效
2、环境变量： 所有的程序，包括shell启动的程序，都能访问环境变量
3、shell变量：shell变量是由shell程序设置的特殊变量。

#Shell字符串
可以用单引号或双引号

##注意
单引号里的任何字符都会原样输出（包括但不限于：转义字符、变量等）；
单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

#!/bin/sh