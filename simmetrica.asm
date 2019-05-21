# determinare se una matrice è simmetrica 

.data 

inserimento:.asciiz "inserisci matrice "
spazio:.asciiz " "
duepunti:.asciiz ":"
accapo:.asciiz " \n "
stampas:.asciiz " la matrice e' la seguente "
stringa	:.asciiz " la matrice e' simmetrica "
stringa2:.asciiz " la matrice non e' simmetrica "

.text

.globl main

main:

#matrice 3x3(9*4 = 36)
addi $sp,$sp,-36

move $a0,$sp
jal inserisci 

move $a0,$sp
jal stampa

move $a0,$sp
jal simmetrica

addi $sp,$sp,36
li $v0,10
syscall



inserisci:
move $t9,$a0

li $t0,0 #contatore delle righe 
ciclo_righe:

beq $t0,3,fine_righe

li $t1,0 #contatore delle colonne 

ciclo_colonne:
beq $t1,3,fine_colonne

la $a0,inserimento
li $v0,4
syscall

move $a0,$t0 #stampo contatore righe 
li $v0,1
syscall

la $a0,spazio
li $v0,4
syscall

move $a0,$t1 #stampo contatore colonne 
li $v0,1
syscall

la $a0,duepunti
li $v0,4
syscall

li $v0,5 #inserisci eleemnto
syscall

sw $v0,($t9) #salvo nella matrice 

addi $t9,$t9,4 #avanzo nella matrice
addi $t1,$t1,1 #incremento il contatore delle righe 

j ciclo_colonne

fine_colonne:
addi $t0,$t0,1 #incremento il contatore delle colonne
j ciclo_righe 

fine_righe:
jr $ra

stampa:
move $t9,$a0

li $t0,0
ciclo_righes:
beq $t0,3,esci_righes

li $t1,0

ciclo_colonnes:
beq $t1,3,esci_colonnes

lw $t3,($t9)

move $a0,$t3
li $v0,1
syscall

la $a0,spazio
li $v0,4
syscall

addi $t9,$t9,4
addi $t1,$t1,1
j ciclo_colonnes

esci_colonnes:
la $a0, accapo #per ogni riga un accapo
li $v0, 4
syscall
			
addi $t0, $t0,1
j ciclo_righes

esci_righes:
jr $ra



	simmetrica:
		move $t9,$a0
		li $t0,0
		li $t6,0
		
			ciclo_esterno:
				move $t8,$t9 #lo utilizzo per muovermi fra le colonne 
				beq $t0,3,esci_cicloesterno
				li $t1,0
				
				
					ciclo_interno:
					beq $t1,2,esci_ciclointerno
					
					addi $t9,$t9,4
					lw $t3,($t9)
					
					addi $t8,$t8,12
					lw $t5,($t8)
					
					
					beq $t3,$t5,simmetricas 
						li $t6,0
						addi $t1,$t1,2
						j ciclo_interno
						
						simmetricas:
							li $t6,1
							addi $t1,$t1,1
							j ciclo_interno
							
							esci_ciclointerno:
								addi $t9,$t9,12
								lw $t3,($t9)
								addi $t9,$t9,8
								lw $t5,($t9)
								
								beq $t3,$t5,si
									
									li $t6,0
									j esci_cicloesterno
									si:
								li $t6,1
								addi $t0,$t0,3
								j ciclo_esterno
							
							esci_cicloesterno:
								beq $t6,1,stampass
									
									la $a0,stringa2
									li $v0,4
									syscall
									jr $ra
										stampass:
										la $a0,stringa
										li $v0,4
										syscall
										jr $ra
				
