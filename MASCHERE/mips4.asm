#void reverse(char *str) 
#{ 
 #  if (*str) 
 #  { 
  #     reverse(str+1); 
  #     printf("%c", *str); 
  # } 
#} 


.data
insert: .asciiz "inserisci la stringa "

str: .space 100


.text

.globl main
main:

la $a0,insert
li $v0,4
syscall

la $a0,str
li $v0,8
li $a1,98
syscall



la $a0,str
jal reverse

la $a0,str
li $v0,4
syscall 


esci:
li $v0,10
syscall


reverse:
lbu $t0,($a0) #carico il carattere della strringa nel registro t0
beq $t0,0,return0

#chiamata ricorsiva
addi $sp,$sp,-8 
#salvo il corrente 
sw $t0,4($sp)



sw $ra,0($sp)

addi $a0,$a0,1
jal reverse
lw $ra,0($sp)
lw $t0,4($sp)




  addi $sp,$sp,8 #Ripristino lo stack

sb $t0,($a0)# per modificarlo nella stringa basta ricaricarlo nello stesso posto
	
	addi $a0,$a0,1
	jr $ra


jr $ra 
return0:
move $v0,$zero

jr $ra 