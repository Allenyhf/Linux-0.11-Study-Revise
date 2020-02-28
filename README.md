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
### BIOS显示字符串"Hello humanbeings! Welcome to YOUNIX!"

![截图](/images/show-string.png)
### 载入setup，跳转到setup代码段运行，并显示字符串“Now we are in setup...”
![截图](/images/setup.png)
### 通过中断，读取当前光标位置和内存大小，并显示在屏幕
![截图](/images/cur_mem.png)


