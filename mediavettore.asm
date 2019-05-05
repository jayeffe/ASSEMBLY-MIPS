.data
frase1:.asciiz " mi piace il cazzo inserisci il vettore "
frase2:.asciiz " a te villano ecco il vettore "
spazio: .asciiz " "
media:.asciiz" la media e' = "
.text 

.globl main

main: 	

	addi $sp,$sp,-12
	move $s0,$sp
	
	la $a0,frase1
	li $v0,4
	syscall 
	
	
	
	li $t0,0
	
	ciclo_inserimento:
		
		beq $t0,3,uscita_inserimento
		
		mul $t1,$t0,4
		add $t1,$t1,$s0
		
		li $v0,5
		syscall
		
		sw $v0,($t1)
		
		addi $t0,$t0,1
		
		j ciclo_inserimento
		
	uscita_inserimento:
		
	la $a0,frase2
	li $v0,4
	syscall
	
	move $s0,$sp
	
	li $t0,0
	
	
	
	
	
	ciclo_stampa:
		
		beq $t0,3,uscita_stampa
		
		mul $t1,$t0,4
		add $t1,$t1,$s0
		
		lw $t2,($t1)
		
		move $a0,$t2
		li $v0,1
		syscall
		
		la $a0,spazio
		li $v0,4
		syscall
		
		addi $t0,$t0,1
		
		j ciclo_stampa
		
	uscita_stampa:
		 
		 li $t0,0
		 li $t3,0
		 
		 ciclo_media:
		
		beq $t0,3,uscita_media
		
		mul $t1,$t0,4
		add $t1,$t1,$s0
		
		lw $t2,($t1)
		
		add $t3,$t3,$t2
		
		addi $t0,$t0,1
		
		j ciclo_media
		
		uscita_media:
		div $t4,$t3,3
		
		
		la $a0,media
		li $v0,4
		syscall
		
		
		move $a0,$t4
		li $v0,1
		syscall
		
		li $v0,10
		syscall
		
		
		
		
		
		
	
		
		
		
		
		
		
	
