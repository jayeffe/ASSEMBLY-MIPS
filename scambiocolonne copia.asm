#scambio prima colonna con la seconda esercizio sulle matrici 

.data 

inserimento:.asciiz "inserisci matrice "
spazio:.asciiz " "
duepunti:.asciiz ":"
accapo:.asciiz " \n "



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
jal scambiocolonne

move $a0,$sp
jal stampa

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

sommariga:
move $t9,$a0

li $t0,0

li $t5,0 #contatore somma 

ciclo_righe1:
beq $t0,3,esci_righe1



li $t1,0
li $t5,0


ciclo_colonne1:
beq $t1,3,esci_colonne1

lw $t3,($t9)

add $t5,$t5,$t3

addi $t9,$t9,4
addi $t1,$t1,1
j ciclo_colonne1

esci_colonne1:

addi $t0,$t0,1

move $a0,$t5
li $v0,1
syscall


j ciclo_righe1

esci_righe1:
jr $ra
	
	scambiocolonne:
	move $t9,$a0
		li $t1,0
		ciclo_esterno:
			beq $t1,3,esci_cicloesterno
				
				move $t8,$t9
				move $t7,$t9
				addi $t7,$t7,4
				ciclo_interno:
				beq $t1,3,esci_ciclointerno
				
				
				lw $t3,($t8)
				
				
				
				lw $t6,($t7)
				
				
				sw $t3,($t7)
				sw $t6,($t8)
				addi $t8,$t8,12
				addi $t7,$t7,12
				addi $t1,$t1,1
				
				j ciclo_interno
					
						esci_ciclointerno:
						addi $t1,$t1,3
						
							esci_cicloesterno:
							jr $ra
