#eliminare la riga in una determinata posizione scelta dall'utente 

.data 

inserimento:.asciiz "inserisci matrice "
spazio:.asciiz " "
duepunti:.asciiz ":"
accapo:.asciiz " \n "
stampas:.asciiz " la matrice e' la seguente "
stringa2:.asciiz " qaule riga vuoi eliminare "

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
jal eliminariga

move $a0,$sp
jal stampass 



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

	eliminariga:
	
	move $t9,$a0
	li $t0,0
		
		la $a0,stringa2
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		
		move $t3,$v0 # qui ho il numero di riga che voglio eliminare 
		
		li $t0,0 #azzero il contatore delle righe 
		ciclo_esterno:
		move $t8,$t9 #muovo la testa del vettore in $t8 per scorre fra le colonne 
		
		beq $t0,3,esci_esterno #controllo $t0 e' uguale a 3
		
		eliminas:
			move $t8,$t9 #muovo la testa del vettore in $t8 per scorre fra le colonne 
			beq $t3,0,elimina2 # controllo se elimino la prima riga 
			beq $t0,$t3,elimina #controlo se il numero che ho inserite e' uguale al numero attuale della riga 
			li $t1,0 
		ciclo_interno:
				beq $t1,3,esci_interno
				addi $t9,$t9,4 #avanzo nella matrice 
				addi $t8,$t8,12 #vanzo nelle colonne 
				addi $t1,$t1,1 #incremento quello delle colonne 
				j ciclo_interno
				elimina:
				li $t1,0
				beq $t2,3,esci_elimina
				
				lw $t4,($t9)#scambio
				
				addi $t8,$t8,12 #avanzo nelle colonne 
				lw $t5,($t8)#scambio
				
				sw $t4,($t8)#scambio
				sw $t5,($t9)#scambio
				addi $t9,$t9,4 #avanzo nella matrice 
				addi $t2,$t2,1 #incremento il contatore 
				j eliminas
				elimina2:
				li $t1,0 #azzero il contatore delle colonne 
					ciclo:
					move $t8,$t9 # i risposto la tsta del vettore 
					beq $t1,3,esci_elimina2
					lw $t4,($t9)
					addi $t8,$t8,24 #avanzo nelle colonne 
					lw $t5,($t8) #scambio
					sw $t4,($t8)#scambio
					sw $t5,($t9)#scambio
					addi $t9,$t9,4 #avanzo nella matrice 
					addi $t1,$t1,1 #incremento il conattore delle colonne 
					j ciclo
				
				esci_elimina2:
					addi $t0,$t0,3 # aggiorno e torno su 	
					j ciclo_esterno
							esci_elimina:
							esci_interno:
							addi $t0,$t0,1 #incremento il contatore delle righe 
							j ciclo_esterno
				
							esci_esterno:
							jr $ra
				
			stampass:
				move $t9,$a0

				li $t0,0
					ciclo_righess:
					beq $t0,2,esci_righess

					li $t1,0

						ciclo_colonness:
						beq $t1,3,esci_colonness

						lw $t3,($t9)

						move $a0,$t3
						li $v0,1
						syscall

						la $a0,spazio
						li $v0,4
						syscall

						addi $t9,$t9,4
						addi $t1,$t1,1
						j ciclo_colonness

								esci_colonness:
								la $a0, accapo #per ogni riga un accapo
								li $v0, 4
								syscall
			
								addi $t0, $t0,1
								j ciclo_righess
								
								
								esci_righess:
								jr $ra

