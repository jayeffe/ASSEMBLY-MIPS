# verificare se un numero e' palindromo o meno 

.data
frase1:.asciiz " il numero e' palindromo"
frase2:.asciiz " il numero non e' palindromo "

.text 

.globl main

main:

#inserisco un numero di 5 cifre 
li $v0,5
syscall

move $t6,$v0
li $t1,1
li $t9,10
ciclo:
bgt $t1,5,esci


div $t6,$t9 #divido il numero per 10 

mfhi $t5 #contiene il resto 

beq $t1,2,salta

j if2
salta:
move $t2,$t5 #memorizzo l'ultima cifra $t2

addi $t1,$t1,1
j ciclo



if2:
beq $t1,3,label

j if3

label:
move $t3,$t5 #memorizzo in $t3 la seconda cifra 

addi $t1,$t1,1
j ciclo

if3:
beq $t1,4,label2


label2:

move $t7,$t5 #memorizzo a quarta cifra 

addi $t1,$t1,1
j ciclo


esci:
beq $t5,$t2,vai

la $a0,frase2
li $v0,4
syscall

vai:
beq $t7,$t3,stampo

la $a0,frase2
li $v0,4
syscall

stampo:

la $a0,frase1
li $v0,4
syscall