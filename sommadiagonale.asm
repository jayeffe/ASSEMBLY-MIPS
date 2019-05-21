#Dato un array A[ N ][ N] di elementi interi, 
#determinare: -La somma degli elementi sulla diagonale principale -
#L’elemento massimo e posizione fra gli elementi della diagonale principale

.data 

inserimento:.asciiz "inserisci matrice "
spazio:.asciiz " "
duepunti:.asciiz ":"
accapo:.asciiz " \n "
stampas:.asciiz " la matrice e' la seguente "
stringa2:.asciiz " la somma della diagonale principale e' ="
stringa3:.asciiz " il massimo della diagonale principale e'= "
stringa4:.asciiz " in posizione = "


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
jal diagonale 

move $a0,$sp
jal massimodiagonale 



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

addi $t9,$t9,4 #avanzo nella stringa 
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

diagonale:
move $t9,$a0
li $t0,0
li $t5,0 # contatore della diagonale 
ciclo_diagonale:
beq $t0,3,esci_ciclodiagonale 
li $t1,0
	
	ciclo_interno:
		beq $t1,3,esci_ciclointerno
		
		#controllo se $t0 e $t1 sono uguali 
		beq $t0,$t1,sommo
		addi $t9,$t9,4
		addi $t1,$t1,1
		j ciclo_interno
		
		sommo:
		
		lw $t2,($t9)
		add $t5,$t5,$t2
		
		addi $t9,$t9,4
		addi $t1,$t1,1
		j ciclo_interno
		
		esci_ciclointerno:
		addi $t0,$t0,1
		j ciclo_diagonale
		
		esci_ciclodiagonale:
		la $a0,stringa2
		li $v0,4
		syscall
		
		move $a0,$t5
		li $v0,1
		syscall
		
		la $a0,accapo
		li $v0,4
		syscall
		
		
		jr $ra
		
massimodiagonale:
move $t9,$a0
li $t0,0

lw $t2,($t9) #prendo il primo elemento

ciclo_diagonales:
beq $t0,3,esci_ciclodiagonales 
li $t1,0
	
	
	ciclo_internos:
	
		beq $t1,3,esci_ciclointernos
		
		#controllo se $t0 e $t1 sono uguali 
			beq $t0,$t1,confronto
			j ok
				
				confronto:
					lw $t3,($t9)
					bgt $t2,$t3,ok
					move $t2,$t3
					addi $t9,$t9,4
					addi $t1,$t1,1
					j ciclo_internos
		
						ok:
						addi $t9,$t9,4
						addi $t1,$t1,1
						j ciclo_internos

						esci_ciclointernos:
						addi $t0,$t0,1
						j ciclo_diagonales
		
						esci_ciclodiagonales:
							la $a0,stringa3
							li $v0,4
							syscall
							
							move $a0,$t2
							li $v0,1
							syscall
							
							la $a0,stringa4
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
							
							jr $ra
		
		
		
		