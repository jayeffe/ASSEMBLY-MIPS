.data

immettimatrice: .asciiz "immetti gli elementi nella matrice 3x3: \n"
inseriscielemento: .asciiz "immetti elemento numero["
parentesichiusa: .asciiz "]: "
messaggiostampa: .asciiz "Ecco a te la matrice inserita: \n"
spazio: .asciiz " "
accapo: .asciiz "\n"
messaggiofinale: .asciiz "ecco a te la matrice con le righe ordinate in modo crescente: \n"

.text

.globl main

main:	

	addi $sp,$sp,-36
	move $a0,$sp
	
	jal inserisci_matrice
	
	la $a0,accapo
	li $v0,4
	syscall
	
	move $a0,$sp
	
	jal stampa_matrice
	
	move $a0,$sp
	
	jal ordina_righe
	
	move $a0,$sp
	
	jal stampa_matrice
	
	#Termina il programma
	
	li $v0,10
	syscall
	

inserisci_matrice:
	
	move $t9,$a0
	
	la $a0,immettimatrice
	li $v0,4
	syscall
	
	la $a0,accapo
	li $v0,4
	syscall
	
	li $t0,1
	
	ciclo_inserimento_matrice:
		
		beq $t0,10,uscita_inserimento
		
		mul $t1,$t0,4
		add $t1,$t1,$t9
		
		la $a0,inseriscielemento
		li $v0,4
		syscall
		
		move $a0,$t0
		li $v0,1
		syscall
		
		la $a0,parentesichiusa
		li $v0,4
		syscall
				
		li $v0,5
		syscall
		
		sw $v0,($t1)
		
		addi $t0,$t0,1
		
		j ciclo_inserimento_matrice
		
	uscita_inserimento:
		
		jr $ra
		
stampa_matrice:
	
	move $t9,$a0
	
	la $a0,messaggiostampa
	li $v0,4
	syscall
	
	li $t0,1
	
	li $t6,3
	
	ciclo_stampa:
		
		beq $t0,10,uscita_stampa
		
		mul $t1,$t0,4
		add $t1,$t1,$t9
		
		lw $t2,($t1)
		
		move $a0,$t2
		li $v0,1
		syscall
		
		la $a0,spazio
		li $v0,4
		syscall
		

		div $t0,$t6
		
		mfhi $t7
		
		bne $t7,0,non_accapo
		
		la $a0,accapo
		li $v0,4
		syscall
		
		non_accapo:
			
			addi $t0,$t0,1
			
			j ciclo_stampa
			
	uscita_stampa:
		
		jr $ra
		
		
ordina_righe:
	
	move $t9,$a0
	
	la $a0,messaggiofinale
	li $v0,4
	syscall
	
	li $t0,1
	li $t3,2
	
	ciclo_ordinamento:
		
		beq $t0,10,uscita_ordinamento
		
		
		blt $t0,4,loop_uno
		blt $t0,7,loop_due
		blt $t0,10,loop_tre
		
		loop_uno:
		addi $t3,$t0,1
		
		loop_interno: 
			
		beq $t3,4,uscita_loop_interno
		
		mul $t1,$t0,4
		add $t1,$t1,$t9
		
		mul $t4,$t3,4
		add $t4,$t4,$t9
		
		lw $t2,($t1) #Qui carico il corrente
		lw $t5,($t4) #Qui carico il successivo
		
		blt $t2,$t5,non_swap
		
		move $t7,$t2
		move $t2,$t5
		move $t5,$t7
		
		sw $t2,($t1)
		sw $t5,($t4)
		
		
		non_swap:
		
		addi $t3,$t3,1
		
		j loop_interno
		
		uscita_loop_interno:
			
			addi $t0,$t0,1
			
		
			j ciclo_ordinamento
	
		loop_due:
			addi $t3,$t0,1
		
			loop_interno2: 
			
			beq $t3,7,uscita_loop_interno2
		
			mul $t1,$t0,4
			add $t1,$t1,$t9
		
			mul $t4,$t3,4
			add $t4,$t4,$t9
		
			lw $t2,($t1) #Qui carico il corrente
			lw $t5,($t4) #Qui carico il successivo
		
			blt $t2,$t5,non_swap2
		
			move $t7,$t2
			move $t2,$t5
			move $t5,$t7
		
			sw $t2,($t1)
			sw $t5,($t4)
		
		
			non_swap2:
		
			addi $t3,$t3,1
		
			j loop_interno2
		
			uscita_loop_interno2:
			
				addi $t0,$t0,1
			
		
				j ciclo_ordinamento
				
				
		loop_tre:
			addi $t3,$t0,1
		
			loop_interno3: 
			
			beq $t3,10,uscita_loop_interno3
		
			mul $t1,$t0,4
			add $t1,$t1,$t9
		
			mul $t4,$t3,4
			add $t4,$t4,$t9
		
			lw $t2,($t1) #Qui carico il corrente
			lw $t5,($t4) #Qui carico il successivo
		
			blt $t2,$t5,non_swap3
		
			move $t7,$t2
			move $t2,$t5
			move $t5,$t7
		
			sw $t2,($t1)
			sw $t5,($t4)
		
		
			non_swap3:
		
			addi $t3,$t3,1
		
			j loop_interno3
		
			uscita_loop_interno3:
			
				addi $t0,$t0,1
			
		
				j ciclo_ordinamento		
		
			
	
		uscita_ordinamento:
		
		 	 
		
			jr $ra