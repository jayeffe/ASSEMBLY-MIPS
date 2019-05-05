# sostituisci carattere 
.data
str :.space 100 
car: .space 5
crt: .asciiz "a"
.text 
.globl main 

main:

la $a0,str
li $v0,8
li $a1,98
syscall

la $a0,car
li $v0,8
li $a1,3
syscall

la $t9,car 
lb $t8,($t9) # byte del carattere
la $t0,str #testa della stringa 
li $t2,0
la $t4,crt
lb $t5,($t4)
ciclo:
 lb $t1,($t0) 
 beqz $t1,fine_ciclo
 
 bne $t1,$t8,continua
 sb $t5, ($t0)
 
 
 
 continua:
 add $t0,$t0,1
 
 j ciclo
 
 
 
 fine_ciclo:
 la $a0,str
 li $v0,4
 syscall
 
 
 li $v0, 10 #questa � la syscall per terminare il programma
 syscall
 
 
 
 
 
 
 
 
 

 
 


