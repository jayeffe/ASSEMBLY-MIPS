# calcolare la media dei voti di una classe dopo un determinato esame svolto 
# uso del ciclo while 

.data 

voto:.asciiz " inserisci il voto "
media:.asciiz " la media sara' uguale ad = "

.text 

.globl main 

main:

li $t0,0 # inizializzo la somma uguale a 0 
li $t1,1 # iniziallo il contatore uguale ad 1
li $t2,10 #carico la costante 10 all'interno del registro $t2


ciclo:
blt $t1,$t2,salto

div $t0,$t2

mflo $t5

move $a0,$t5
li $v0,1
syscall

li $v0,10
syscall



salto:
la $a0,voto
li $v0,4
syscall

li $v0,5
syscall

move $t3,$v0

add $t0,$t0,$t3
addi $t1,$t1,1

j ciclo