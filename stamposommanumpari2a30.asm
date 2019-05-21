#scrivere un programma che calcoli e visualizzi la somma degli interi pari da 2 a 30

.data 

.text 

.globl main

main:

#quanti numeri vuoi inserire 
li $v0,5
syscall #inserisco il numero 

li $t0,0 #inizalizzo il contatore 

move $t1,$v0

li $t3,2
li $t4,30
li $t5,2
ciclo:
bgt $t0,$t1,salta

li $v0,5
syscall  #inserisco il numero

move $t2,$v0

blt $t2,$t3,esci
bgt $t2,$t4,esci

#verifico se il numero e pari 

div $t2,$t5
mfhi $t6

beq $t6,0,label

#effettuo la somma dei pari 


addi $t0,$t0,1
j ciclo


esci:
j ciclo
addi $t0,$t0,1

label :

add $t7,$t7,$t2
addi $t0,$t0,1
j ciclo


salta :
move $a0,$t7
li $v0,1
syscall   # stampa la somma dei numeri pari 