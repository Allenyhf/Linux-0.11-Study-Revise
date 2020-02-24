# bootsect修改笔记
## 汇编－链接指令
- as86 -0 -a -o bootsect.o bootsect.s
- ld86 -0 -s -o bootsect bootsect.o
## 去掉bootsect头部的文件系统
- dd bs=1 if=bootsect of=Image skip=32
## 覆盖linux-0.11目录的Image文件
- cp boot/Image ../Image
## BIOS启动界面字符串
### 步骤
- 读取光标位置
  - 使用0x10中断的0x03功能
- 写字符串
  - es:bp指向待显示的字符串
  - cx存储待显示的字符串字节数
  - 使用0x10中断的0x13功能
