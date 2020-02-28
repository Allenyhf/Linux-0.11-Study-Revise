.globl begtext,begbss,endtext,enddata,endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text
 
INITSEG = 0X9000


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

    mov ax,cs
    mov es,ax
    mov ax,#INITSEG
    mov ss,ax
    mov sp,#0xff00





    mov ax,#INITSEG
    mov ds,ax
    mov ah,#0x03	!读取光标位置
　　xor bh,bh
    int 0x10		
    mov [0],dx

    mov ah,#0x88
    int 0x15
    mov [2],ax		!读取内存大小

　!mov ah,#0x0f
   !int 0x10		!读显卡信息
   !mov [4],bx		!bh:当前显示页
　!　mov [6],ax		!ah:字符列数  al:显示模式

　　mov ax,#0x0000
    mov ds,ax
    lds si,[4*0x41]
    mov ax,#INITSEG
    mov es,ax
    mov di,#0x0004	!目的地址　es:di
    mov cx,#0x10
    rep			!传输16字节
    movsb
    

    !prepare
    mov ax,cs
    mov es,ax
    mov ax,#INITSEG
    mov ds,ax

    !cursor
    mov ah,#0x03
    xor bh,bh
    int 0x10
    mov cx,#18         
    mov bx,#0x0007     
    mov bp,#msg_cursor
    mov ax,#0x1301
    int 0x10
    mov dx,[0]
    call print_hex
    !mem size
    mov ah,#0x03
    xor bh,bh
    int 0x10
    mov cx,#14
    mov bp,#msg_memory
    mov ax,#0x1301
    int 0x10
    mov dx,[2]
    call print_hex

    ! kb
    mov ah,#0x03    
    xor bh,bh
    int 0x10
    mov cx,#2
    mov bx,#0x0007 
    mov bp,#msg_kb
    mov ax,#0x1301  
    int 0x10 





!死循环
inf_loop:
   jmp inf_loop
 
!16进制打印栈顶的16位数
print_hex:
   mov cx,#4	
  ! mov dx,(bp)

print_digit:
   rol dx,#4
   mov ax,#0xe0f
   and al,dl
   add al,#0x30
   cmp al,#0x3a
   jl outp
   add al,#0x07

outp:
   int 0x10
   loop print_digit
   ret


print_nl:
  mov ax,#0xe0d
  int 0x10

  mov al,#0xa
  int 0x10
  ret



msg2:
    .byte 13,10		!回车换行
    .ascii "Here is setup..."
    .byte 13,10,13,10

msg_cursor:
    .byte 13,10
    .ascii "Cursor position:"
msg_memory:
    .byte 13,10
    .ascii "Memory Size:"
msg_cyles:
    .byte 13,10
    .ascii "Cyls:"
msg_heads:
    .byte 13,10
    .ascii "Heads:"
msg_sectors:
    .byte 13,10
    .ascii "Sectors:"
msg_kb:
    .ascii "KB"


.org 510  

boot_flag:
    .word 0xAA55
!启动盘具有有效引导扇区的标志，供BIOS识别，必须位于引导扇区最后两字节
.text
endtext:
.data
enddata:
.bss
endbss:
