#inverti stringa con funzione ricorsiva

.data 
stringa:.space 100
stringa1:.asciiz " la stringa ricorsivamente invertita è la seguente "
.text

.globl main

main:

#inserisco la striinga
la $a0,stringa
li $a1,98
li $v0,8
syscall

la $a0,stringa
jal inverti 



la $a0,stringa
li $v0,4
syscall

li $v0,10
syscall



	inverti:
		lbu $t0,($a0)
		beq $t0,0,return_0
		
		addi $sp,$sp,-8
		sw $t0,0($sp)
		sw $ra,4($sp)
		addiu $a0,$a0,1
		jal inverti
		
		lw $ra,4($sp)
		lw $t0,0($sp)
		addi $sp,$sp,8
		
		sb $t0,($a0)
		addiu $a0,$a0,1
		jr $ra
			
			return_0:
			move $v0,$zero
			jr $ra
		
