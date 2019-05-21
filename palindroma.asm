#parola palindroma 

.data 
str:.space 100
stringa1:.asciiz " la stringa e' palindroma"
stringa2:.asciiz " la stringa non e' palindroma "

.text 

.globl main

main:

la $a0,str
li $a1,98
li $v0,8
syscall

#calcolo la lunghezza della stringa 

lunghezza:
la $t0,str
li $t1,0

ciclo_lunghezza:
lb $t2,($t0)
beqz $t2,fine_ciclo

addi $t1,$t1,1
addi $t0,$t0,1
j ciclo_lunghezza

fine_ciclo:
move $v0,$t1


addi $v0,$v0,-2

move $a1,$v0

palidnroma:
la $t0,str
li $t4,0
ciclo_palindroma:
add $t3,$t0,$t4
lb $t6,($t3)

add $t7,$t0,$a1
lb $t5,($t7)

addi $t4,$t4,1
beq $a1,$t4,esci
beq $t6,$t5,palindroma
li $t9,0
addi $a1,$a1,-1
j ciclo_palindroma
palindroma:
li $t9,1
addi $a1,$a1-1
j ciclo_palindroma



esci:
beq $t9,1,stampo
la $a0,stringa2
li $v0,4
syscall

li $v0,10
syscall

stampo:
la $a0,stringa1
li $v0,4
syscall

li $v0,10
syscall






