#Data una sequenza di numeri visualizzare il numero massimo e quello minimo

.data 
messaggio:.asciiz " quanti numeri vuoi inserire "

.text 

.globl main

main:

la $a0,messaggio
li $v0,4
syscall

li $v0,5
syscall


move $t0,$v0

li $t1,0 # contatore del ciclo
li $t2,0 # contatore minimo
li $t3,0 #contatore massimo 

ciclo:
beq $t1,$t0,fine

li $v0,5
syscall



move $t4,$v0

bgt $t4,$t3,label
blt $t4,$t3 label2



j continua

continua:
addi $t1,$t1,1
j ciclo


label:

move $t3,$t4


j continua 

label2:
move $t2,$t4

j continua  

fine:
 
 
 move $a0,$t2
 li $v0,1
 syscall
 

 
 move $a0,$t3
 li $v0,1
 syscall
 
 
 
 li $v0,10
 syscall
