# Linux-0.11-Study-Revise
## Description
Study and revise Linux Kernel 0.11

## Files
### bootsect.s 
- 8086 assembling  source file.
- This file shows string in the screen "Hello humanbeings! Welcome to YOUNIX!"
- then load the setup.s　and jump to setup to execute.
### setup.s
- This file outputs current cursor position and prints the memory size.
### bootsect-revise-note
### bootsect-study-note 
### show-string.png
- screenshot when Linux kernel is running.

## 描述
研读和修改Linux内核0.11

## 文件
### bootsect.s
- 8086汇编源文件
- 这个文件是在屏幕上显示字符串"Hello humanbeings! Welcome to YOUNIX!"
- 然后将setup.ｓ读入并跳转到setup运行

### 
- 这个文件输出当前光标的位置，并打印内存大小
### bootsect-revise-note
- bootsect.s修改笔记
### bootsect-study-note 
- bootsect.s研读笔记


## 进度
## lab1　操作系启动引导
### BIOS显示字符串"Hello humanbeings! Welcome to YOUNIX!"

![截图](/images/show-string.png)
### 载入setup，跳转到setup代码段运行，并显示字符串“Now we are in setup...”
![截图](/images/setup.png)
### 通过中断，读取当前光标位置和内存大小，并显示在屏幕
![截图](/images/cur_mem.png)

### lab2 添加系统调用
### 添加含有一个参数的系统调用iam
- 函数原型: int iam(const char* name)
- 功能：传入字符串指针，将字符串存到内核中字符串sys_name，字符串长度不大于25;返回字符串长度，若超过25，返回-1
- 测试：在linux-0.11中，编写一个iam.c程序，编译运行测试。根据系统调用返回结果，打印结果

### 添加含有两个参数的系统调用whoami
- 函数原型: int whoami(char* name, int size)
- 功能：传入字符串指针，将内核中的字符串sys_name拷贝到name指向的空间，size指明name分配得到的空间;返回字符串长度，若超过size，返回-1
- 测试：在linux-0.11中，编写一个whoami.c程序，编译运行测试。根据系统调用返回结果，打印得到的字符串

![截图](/images/syscall.png)
### 添加含有三个参数的系统调用store_myinfo与get_myinfo
- 函数原型: int store_myinfo(const char* name, const char* sex, int age)
- 功能：分别将name和sex指向的字符串，存储到内核中sys_name和sys_sex指向的空间；将age赋给sys_age。name长度小于20，sex长度小于5，超过返回-1，否则成功则返回０.
- 测试:在linux-0.11中，编写一个storemyinfo.c程序，编译运行测试。根据系统调用返回结果，打印结果

- 函数原型: int get_myinfo(char* name, char* sex, unsigned long* addr_age)
- 功能：分别将内核中sys_name和sys_sex指向的字符串，复制给name和sex指向的空间，将sys_age的值，复制给addr_age指向的空间。失败返回-1，成功返回０
 - 测试：在linux-0.11中，编写一个getmyinfo.c程序，编译运行测试。根据系统调用返回结果，打印得到的字符串









