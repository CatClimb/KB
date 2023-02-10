 MS -DOC
	MS-DOS（微软磁盘操作系统），是美国微软公司提供的磁盘操作系统。在美国微软公司推出Windows1.0、Windows3.0、1995年8月24日推出的操作系统Windows 95以前，磁盘操作系统是IBM PC及兼容机中的最基本配备，而MS-DOS则是个人电脑中最普遍使用的磁盘操作系统之一。
 批处理 即批处理脚本

 是什么？
 是一种简单的脚本语言 由操作系统内嵌的敏玲解释器解释运行。
 为啥这么说？
 看bat脚本和sh脚本不同os的批处理脚本区别？
 https://blog.csdn.net/qq_16072507/article/details/88866432


 window上 批处理学习
 在哪执行？
 cmd.exe 上 （模拟以前dos的命令终端）

 作用：
	 操作文件
	 创建病毒
	
 使用前提：
	 不区分大小写 放屁
	 外部命令难说 如 psql -u 不行
	 入门使用：
		 关闭 盘符和路径的显示
			 echo off
		 暂停
			 pause

	 命令分类：
		 内部命令：cls ipconfig
		 外部命令： java python
	
 windows自带工具的cmd命令
 https://www.cnblogs.com/klchang/p/4771101.html

set的命令使用：
	
	rem 等待用户输入
	set /p varname=终端提示信息
	echo %varname%

批处理运算操作：
	 算数运算符
	 加减乘除 取余

		 使用方式：

			 命令模式： 
				set /a 1+2  
				 /A 是计算的缩写
			 文本模式：
			 @echo 不会显示当前以及之后命令和盘符和路径
				@echo off
				rem 环境变量
				set /a bianliang1=1+2 
				echo %bianliang1% 
			pause
			
	优先级：
		()
	重定向运算：
		> 右边内容覆盖原有文件内容
		>> 追加文件内容
		> 和 < 也可用于关系运算
	多命令运算符：
		&& ||  短路作用 
	管道运算符：
		|
		dir | find ".txt"
	
命令 net user 显示该计算机的用户
命令 dir 			查看当前目录内容
命令 type 文件名      查看文件内容
命令 netstat -an 	显示所有连接且数字化显示  
命令 命令名字 /? 查看帮助信息
命令 net  

基本命令
	命令格式：
		命令 子命令 参数 操作 选项
			net user 
			net user /?
			net user /help
			

	批处理文件参数传递：
		@echo off
		echo %1
		echo %2
		net user %1 %2 /add
		pause
		
		终端使用： net user xxx yyy /add	

	注释命令： rem  或 ::
	
	颜色命令： color 0a 终端前景色和背景色
	标题命令： title 标题名
	日期命令： date /T
	时间命令： time /t
	启动命令： start /? 启动一个单独的窗口以运行指定的程序或命令。
	netstat -ano | findstr 8080
	调用其他bat文件命令：
	@echo off
	call 2.bat
	注意 只能在主脚本文件传递，但无法传递给调用的脚本
	
	任务列表查看命令： tasklist  该工具显示在本地或远程机器上当前运行的进程列表
			使用：
				tasklist /s 192.168.56.10 /u vagrant /p vagrant
			注意： RPC服务要开启 且 必须（感觉啊因为测不行没这命令，不知道其他linux什么情况）是windows
				tasklist /?
				tasklist /fi "pid eq 5580" /fo "" > test.csv
				
	任务关闭命令： taskkill
		taskkill /im notepad.exe
		taskkill /pid 15236 /T
	查看文件结构：
		tree
	关机命令：
		shutdown /i 打开关机操作对话框
		shutdown /h /t 10   10秒后关机
	计划任务命令：
		at命令过时了变成schtasks.exe
		SCHTASKS /CREATE /TN plan_name /TR notepad /SC MINUTE  每分钟打开记事本
		SCHTASKS /DELETE /TN plan_name //删除计划
		SCHTASKS /CREATE /TN plan_name /TR notepad /SC MINUTE /ST 15:12 /ET 15:14
		schtasks /Query /TN open_text_file 
	
		注意终止计划： 模式是就绪
	命令所在目录：
		where xxx
	批处理环境变量：
		set
		echo %USERPROFILE% echo %userprofile%
文件和目录相关命令：
	目录显示命令：	
		dir /ah 显示当前目录的所有隐藏文件
	创建和删除目录命令：
		mkdir 等价于 md
		rmdir 等价于 rd
	目录切换命令：
		chdir 等价于 cd
		cd 不带参数执行 返回当前工作目录
	目录重命名：
		ren 。。。 rename 原名 新名
	目录复制：
		copy test1 test2  目录内也被复制
	文件删除：
		del c:\1\*.txt
	文件剪切命令：
		move 1.txt test.txt
网络相关命令：
	 net user
	 net user xxx	
	 用户组命令：
		net localgroup Guests ftpUser /add
		net localgroup Guests ftpUser /delete
	ping:
	telnet:  too low 不加密   linux 上监听 nc -l -p 端口号
	tracert：
	ipconfig 网络适配器
	ipconfig /all
	arp命令：（arp 地址解析协议）
		arp /a
		arp -s 192.168.0.104 aa-aa-aa-aa-aa-aa arp不安全 arp欺骗
命令：
	systeminfo
服务开启命令：
	net start [service]
	
if-else 结构
	@echo off

	set v=hello
	if %v%==hello (echo ok) else (echo no)   rem 不加()也只能执行一条 
	pause>nul rem 把废话去掉
	
判断文件存在

if exist 222.bat  (echo yes) else (echo no)  必须结合if使用


@echo off
set tmp_path=F:\data\knowledge_data\work\3.bat
if exist %tmp_path% (
	echo file is find!
	del %tmp_path%
) else (
	echo file is not find
)
pause>nul


遍历目录
	FOR /D %variable IN (set) DO command [command-parameters]
	for /d in( 路径/ * ) do 具体操作
	
	脚本文件 用 %% 终端用 %
	
	@echo off
	for /d %%a in(*) do echo %%a
	pause>nul
	rem 当前目录下的所有直接目录		

遍历目录和子目录下文件
	FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]
	for /r 目录路径 %%v in (匹配规则 例如 *.py) do 执行操作 %%v rem r  recursive  递归
	
	rem 打印了该目录下的所有文件全路径名
	@echo off
	for /r "F:\data\knowledge_data\work" %%v in (*) do echo %%v
	pause>nul
	
	等价于
	rem 遍历当前目录下所有目录,"/\."三者效果相同
	for /r %%i in (.) do @echo %%i
	for /r %%i in (\) do @echo %%i
	for /r %%i in (/) do @echo %%i
	
遍历数字
	FOR /L %variable IN (start,step,end) DO command [command-parameters]
	for /L %%v in (start,step,end) do 具体操作
	
	@echo off
for /l %%v in (1,1,20) do ping %1.%%v rem 逗号为分隔符，其他分隔符也行 可以写成 (1=1=20);
pause>nul

遍历文件内容
	FOR /F [“options”] %variable IN (file-set) DO command [command-parameters]
	FOR /F [“options”] %variable IN (“string”) DO command [command-parameters]
	FOR /F [“options”] %variable IN (‘command’) DO command [command-parameters]
	for /f "选项" %%v in (文件名) do 具体操作
	选项解析：
		delims=xxx rem 单个用的话为行结束符，配合token用则为分隔符 默认 delims为空白符 可以不写
			rem 读取当前目录的a.txt，并显示每一行的内容(每一行内容遇到空格即终止）
			for /f %i in (a.bat) do @echo %i
			rem 读取多个文件，并显示每一行的内容(每一行内容遇到空格即终止）
			for /f %i in (a.bat b.txt) do @echo %i

		skip=x rem 指在文件开始时忽略的行数。
			for /f "skip=%1" %%v in (t1.txt) do echo %%v
			 rem 取每行第一个字符串 默认分隔符为空格
			for /r "F:\data\knowledge_data\work" %v in (*) do echo %v 
		tokens=x,y,m-n
			rem 指每行的哪一个符号被传递到每个迭代 的 for 本身。
			rem 这会导致额外变量名称的分配。m-n格式为一个范围。
			rem 通过 nth 符号指定 mth。如果符号字符串中的最后一个字符星号，
			rem 那么额外的变量将在最后一个符号解析之后分配并接受行的保留文本。
			for /f "delims=| tokens=1-5" %%i in (t1.txt) do @echo %%i %%j %%k %%l %%m
			rem i j k l m 可不是乱写的
		usebackq
			rem usebackq指示集中的是文件路径
			for /f "usebackq" %%a in (“C:\Documents and Settings\\note.txt”) do echo %%a
			rem usebackq后面集中的单引号指定是字符串
			for /f "usebackq" %%a in ('C:\Documents and Settings\\note.txt') do echo %%a
			rem 集中的命令以``尖引号
			for /f "usebackq" %i in (`dir /s /b`) do @echo %i
			rem 效果和上面相同，集中命令以单引号‘’
			for /f  %i in ('dir /s /b') do @echo %i
		eol=c - 指一个行忽略的开始字符(就一个)
			rem 组合提取指定文件中的内容
			for /f "eol=; tokens=1,2* delims=|" %%i in (d:\test.txt) do echo %%i %%j %%k
for循环详解
	https://blog.csdn.net/feihe0755/article/details/103930692
	
goto 语句：

	循环创建嵌套重复目录
	
	@echo off 
	cd 路径 
	:goto_module_name
	md Virus
	cd Virus
	goto goto_module_name
	pause>nul
	exit

计算机信息网页展示

	@echo off
	echo. >log.txt
	echo Log File >> log.txt
	echo. >>log.txt
	echo User : %username% >> log.txt
	date /t >> log.txt
	time /t >> log.txt
	echo. >> log.txt
	echo Process Ran by %username% >> log.txt
	echo. >>log.txt
	tasklist >> log.txt
	echo. >> log.txt
	echo. >> log.txt
	echo Network Activities >> log.txt
	netstat -s >> log.txt
	exit
	
用户交互使用 goto
	
	@echo off
	echo 1.a
	echo 2.b
	echo 3.c
	echo 4.d
	:first
	set /p opt=Enter your option:
	if %opt%==1 goto one
	if %opt%==2 goto two
	if %opt%==3 goto three
	if %opt%==4 goto four
	echo Invalid option
	goto first

	:one
	echo you choice one
	pause>nul
	exit


	:two
	echo you choice two
	pause>nul
	exit

	:three
	echo you choice three
	pause>nul
	exit

	:four
	echo you choice four
	pause>nul
	exit
	
bat to exe Converter


等待命令
timeout 7