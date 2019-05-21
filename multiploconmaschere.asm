#verifica se un numero è un multiplo di 7 attraverso le maschere 

.data 
nonmultiplo:.asciiz " non multiplo"
stringa:.asciiz " multiplo"

.text 

.globl main

main:

#inserisci un numero 

li $v0,5
syscall

move $t0,$v0

li $t1,7

and $t2,$t1,$t0

beq $t2,0,multiplo

la $a0,nonmultiplo
li $v0,4
syscall

li $v0,10
syscall
	
	multiplo:
	la $a0,stringa
	li $v0,4
	syscall
	
	li $v0,10
	syscall