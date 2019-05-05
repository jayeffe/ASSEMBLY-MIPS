
.data 

numero: .asciiz " inserisco un numero "
dispari : .asciiz " il numero è dispari"
pari: .asciiz "Il numero è pari!"
.text 

.globl main

main:


la $a0,numero
li $v0,4
syscall 

j aCazzo

ritorno:

li $v0,5
syscall 

move $t0,$v0

li  $t1,2
div $t0,$t1



mfhi $t1



bne $t1,$zero,esci

la $a0,pari
li $v0 4
syscall


j termina
esci:


la $a0,dispari
li $v0,4
syscall

termina:
li $v0,10
syscall

aCazzo:
	j ritorno
