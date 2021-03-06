.globl begtext,begbss,endtext,enddata,endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text

SETUPLEN=2
SETUPSEG=0x07e0
entry _start	!程序从_start开始执行
_start:
　　!使用0x10中断的0x03功能,读取光标位置
    mov ah,#0x03	!中断功能号0x03
　　xor bh,bh		!页号置零
    int 0x10		!开启0x10中断

    mov cx,#43		!显示字符数量:43
　　mov bx,#0x0007      !页面0,分区７(正常模式)
　　mov bp,#msg1        !es:bp指向待显示的字符串
    mov ax,#0x07c0	!修改es
    mov es,ax
　　mov ax,#0x1301      
　　　　　　　　 !ah:0x13　功能号 al:0x01 使用bl的属性值,即光标停止字符串末尾
    int 0x10 		!开启中断

load_setup:
    mov dx,#0x0000      !磁头0，驱动器0
    mov cx,#0x0002      !扇区2,磁道0
    mov bx,#0x0200	!
    mov ax,#0x0200+SETUPLEN !ah:读扇区到内存，al:扇区数量
　　int 0x13
    jnc ok_load_setup   !读取完毕
    mov dx,#0x0000　　　!否则读取错误
    mov ax,#0x0000	!重置磁头，驱动器
　　int 0x13
    jmp  load_setup	

ok_load_setup:
    jmpi 0,SETUPSEG

!死循环
!inf_loop:
    !jmp inf_loop
 
msg1:
    .byte 13,10		!回车换行
    .ascii "Hello humanbeings! Welcome to YOUNIX~"
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
