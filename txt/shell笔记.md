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

#只读变量
```
myUrl="https://www.google.com"
readonly myUrl
```terminal
#删除变量

```
myUrl="https://www.google.com"
readonly myUrl
unset
```terminal

