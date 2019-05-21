#capire come funziona la sw e lw 
.data

.text

.globl main

main:

add $sp,$sp,-20


li $t0,3

sw $t0,8($sp) #ho traseferito il contenuto nella posizione 3 della memoria ossia in 8

lw $t1,8($sp) #ho trasferito la parola dalla memoria in un registro

move $a0,$t1
li $v0,1
syscall

li $v0,10
syscall

