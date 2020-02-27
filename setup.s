.globl begtext,begbss,endtext,enddata,endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text



entry _start	!程序从_start开始执行
_start:
　　!使用0x10中断的0x03功能,读取光标位置
    mov ah,#0x03	!中断功能号0x03
　　xor bh,bh		!页号置零
    int 0x10		!开启0x10中断

    mov cx,#22		!显示字符数量:22
　　mov bx,#0x0007      !页面0,分区７(正常模式)
　　mov bp,#msg2        !es:bp指向待显示的字符串
    mov ax,cs 		!修改es
    mov es,ax
　　mov ax,#0x1301      
　　　　　　　　 !ah:0x13　功能号 al:0x01 使用bl的属性值,即光标停止字符串末尾
    int 0x10 		!开启中断




!死循环
inf_loop:
   jmp inf_loop
 
msg2:
    .byte 13,10		!回车换行
    .ascii "Here is setup..."
    .byte 13,10,13,10
.org 510		!以下字节从地址510开始

boot_flag:
    .word 0xAA55
!启动盘具有有效引导扇区的标志，供BIOS识别，必须位于引导扇区最后两字节
.text
endtext:
.data
enddata:
.bss
endbss:
