#include <stdio.h>

int i = 0x12345678;
int flag = 0;
 int main(void)
{
 printf("The logical/virtual address of i is 0x%08x",&flag);
 fflush(stdout);
 while(i)
 {
  if(flag == 1)
  {
   printf("halo yhf\n");
   flag = 0; 
  }
 }
    

 return 0;
}
