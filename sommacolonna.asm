.data 
spazio:.asciiz " "
accapo:.asciiz "\n"
stringa1:.asciiz "inserisci matrice"
stringa2:.asciiz "la matrice e' la seguente "
duepunti:.asciiz" : "

.text 

.globl main

main:

addi $sp,$sp,-36 #(9*4)
move $s0,$sp

move $a0,$s0
jal inserisci

move $a0,$s0
jal stampa 

move $a0,$s0
jal sommacolonna 

addi $sp,$sp,36

li $v0,10
syscall

	inserisci:
	move $t9,$a0
	li $t0,0
		ciclo_esterno:
		beq $t0,3,esci_cicloesterno
			li $t1,0
			ciclo_interno:
			beq $t1,3,esci_ciclointerno
			
			la $a0,stringa1
			li $v0,4
			syscall
			
			la $a0,spazio
			li $v0,4
			syscall
			
			move $a0,$t0
			li $v0,1
			syscall
			
			la $a0,spazio
			li $v0,4
			syscall
			
			move $a0,$t1
			li $v0,1
			syscall
			
			la $a0,duepunti
			li $v0,4
			syscall
			
			li $v0,5
			syscall
			
			sw $v0,($t9)
			addi $t9,$t9,4
			addi $t1,$t1,1
			j ciclo_interno
					esci_ciclointerno:
					addi $t0,$t0,1
					j ciclo_esterno
						
						esci_cicloesterno:
						jr $ra
						
						stampa:
						move $t9,$a0
						li $t0,0
						
						la $a0,stringa2
						li $v0,4
						syscall
						
						la $a0,accapo
						li $v0,4
						syscall
						
							
							ciclo_esternos:
							beq $t0,3,esci_cicloesternos
							li $t1,0
								ciclo_internos:
								beq $t1,3,esci_ciclointernos
								
								lw $t3,($t9)
								
								move $a0,$t3
								li $v0,1
								syscall
								
								la $a0,spazio
								li $v0,4
								syscall
								
								addi $t9,$t9,4
								addi $t1,$t1,1
								j ciclo_internos
									
									esci_ciclointernos:
									la $a0,accapo
									li $v0,4
									syscall
									
									addi $t0,$t0,1
									j ciclo_esternos
									
										esci_cicloesternos:
										jr $ra
								
										
							sommacolonna:
							move $t9,$a0
							
							li $t0,0
											
							ciclo_somma:
							move $t8,$t9
							beq $t0,3,esci_somma
							li $t1,0
							ciclo_internosomma:
							beq $t1,3,esci_ciclointernosomma
								
							 lw $t3,($t8)			
							addi $t8,$t8,12
											
						     
											
							add $t4,$t4,$t3
							addi $t1,$t1,1
							j ciclo_internosomma
												
							esci_ciclointernosomma:
							addi $t0,$t0,1
							addi $t9,$t9,4
												
							move $a0,$t4
							li $v0,1
							syscall
							
							li $t4,0
												
						      j ciclo_somma
												
							esci_somma:
						        jr $ra
										
								
			
