.data

accapo: .asciiz "\n"

spazie: .asciiz " "

.text

.globl main


main:

	addi $sp, $sp, -36
	
	move $s0,$sp
	
	
	move $a0,$s0
	
	
	jal inserisci
	
	move $a0,$s0
	
	jal stampa
	
	
	move $a0,$s0
	
	
	jal min
	
	move $a0,$v0
	
	li $v0,1
	syscall
	
	
	
	
	
	
	li $v0,10
	syscall
	


inserisci:
	
	move $t9,$a0
	
	li $t0,0
	
	cicloIn:
	
		beq $t0,9,uscitaIn
		
		mul $t1,$t0,4
		add $t1,$t1,$t9
		
		
		li $v0,5
		syscall
		
		sw $v0,($t1)
		
		
		addi $t0,$t0,1
		
		j cicloIn
		
		
	uscitaIn:
		
		jr $ra
		
		
		
stampa:

	move $t9,$a0
	
	li $t0,0
	
	li $t3,3
	
	cicloOut:
	
		beq $t0,9,uscitaOut
		
		mul $t1,$t0,4
		add $t1,$t1,$t9
		
		
		lw $t2,($t1)
		
		div $t0,$t3
		
		mfhi $t4
		
		bne $t4,0,continua
		
		la $a0,accapo
		li $v0,4
		syscall
		
		continua:
		
		
		
		
		move $a0,$t2
		
		li $v0,1
		syscall
		
		la $a0,spazie
		li $v0,4
		syscall
		
		
		addi $t0,$t0,1
		
		j cicloOut
		
		
	uscitaOut:
		
		jr $ra
	
	
	
	
min:
	move $t9,$a0
	
	li $t0,0
	
	cicloMin:
	
		beq $t0,9,uscitaMin
		
		mul $t1,$t0,4
		add $t1,$t1,$t9
		
		
		lw $t2,($t1)
		
		
		bne $t0,0,continuamin
		
		move $t3,$t2
		
		continuamin:
			
			blt $t3,$t2,dopo
			
			move $t3,$t2
			
		dopo:
	
		addi $t0,$t0,1
		
		j cicloMin
		
		
	uscitaMin:
	
		move $v0,$t3
		
		jr $ra
	
	
	
	
	