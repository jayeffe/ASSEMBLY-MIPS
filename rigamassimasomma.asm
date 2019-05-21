#somma di riga massima di una matrice 
.data 

inserimento:.asciiz "inserisci matrice "
spazio:.asciiz " "
duepunti:.asciiz ":"
accapo:.asciiz " \n "
stampas:.asciiz " la matrice e' la seguente "
stringa2:.asciiz " iniziamo la somma delle colonne "

.text

.globl main

main:

#matrice 3x3(9*4 = 36)
addi $sp,$sp,-36
move $s0,$sp

move $a0,$s0
jal inserisci 

move $a0,$s0
jal stampa

move $a0,$s0
jal sommarigamassima

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

la $a0,spazio
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

	sommarigamassima:
		move $t9,$a0
		li $t0,0
		
	ciclo_esterno:
		beq $t0,3,esci_cicloesterno
		
		li $t1,0
		li $t4,0 # contatore delle somme

		
		ciclo_interno:
			beq $t1,3,esci_ciclointerno
			
			lw $t2,($t9)
			
			add $t4,$t4,$t2
			
			addi $t9,$t9,4
			addi $t1,$t1,1
			j ciclo_interno
			
			esci_ciclointerno:
			
				move $a0,$t4
				li $v0,1
				syscall
				
				
				la $a0,spazio
				li $v0,4
				syscall
				
				beq $t0,0,riga1
				j controllo2
					
					riga1:
					move $t5,$t4
					addi $t0,$t0,1
				        j ciclo_esterno
				        
				controllo2:
				beq $t0,1,riga2
				j controllo3
				
					riga2:
					move $t6,$t4
					addi $t0,$t0,1
					j ciclo_esterno
				
				controllo3:
				beq $t0,2,riga3
				
				addi $t0,$t0,1
				j ciclo_esterno
					
					riga3:
					move $t7,$t4
					addi $t0,$t0,1
					j ciclo_esterno
				
				
				
			
				esci_cicloesterno:
				li $t1,0
				move $t8,$t5
				
				
				
				
				ciclo_massimo:
				beq $t1,3,esci_ciclomassimo
				
				bgt $t8,$t6,esci
				bgt $t6,$t7,rigamassima2
				
					move $a0,$t7
					li $v0,1
					syscall
					
					
					jr $ra
				
				esci:
				bgt $t8,$t7,massimoriga1
				
				move $a0,$t7
				li $v0,1
				syscall
				
				jr $ra
				
				massimoriga1:
					
					
					move $a0,$t8
					li $v0,1
					syscall
					
					jr $ra		
				rigamassima2:
					
					move $a0,$t6
					li $v0,1
					syscall
					
					
					
					esci_ciclomassimo:
					jr $ra
				
				
			
			
			


