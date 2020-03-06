# syscall 笔记
## 在系统调用表添加相应表项
- 在include/linux/sys.h中，添加extern函数声明
- 找到sys_call_table[]，在该处末尾添加相应系统调用
## 修改系统调用数目
- 在kernel/system_call.s中
- 修改nr_system_call
- 否则无法正常运行

##修改makefile
- 修改kernel/Makefile
- 在OBJS末尾添加who.o
- 在依赖处，添加如下
　- who.s who.o: who.c ../include/linux/kernel.h ../include/unistd.h ../include/errno.h
 
##编写系统调用代码
- 内核中可以使用printk()函数帮助调试
- printk与printf用法相同
- 要将内核中的数据拷贝到用户空间,需要使用指针
- 不是将用户空间传来的指针直接指向内核空间的数据，否则会发生段错误
- 应当使用include/asm/segment.h中的函数
##重新编译内核
- 在linux-0.11目录下
- make clean
- make
## 运行内核
## 添加__NR_
- 修改linux-0.11中的include/unistd.h，不是源码树哦
- 编号要与sys_call_table对应
##　编写测试代码



