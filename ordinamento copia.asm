.data 

inserimento:.asciiz "inserisci matrice "
spazio:.asciiz " "
duepunti:.asciiz ":"
accapo:.asciiz " \n "
stampas:.asciiz " la matrice e' la seguente "
stringa2:.asciiz " iniziamo la somma delle colonne "
stringa3:.asciiz "......................................"


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
jal ordinamento

move $a0,$sp
jal stampa


la $a0,accapo
li $v0,4
syscall






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

ordinamento:
	move $t9,$a0
	move $t4,$t9
li $t1,0
li $t0,1

ciclo_ordinamento:
beq $t0,3,esci_cicloordinamento
li $t1,0
ciclo_interno:
beq $t1,2,esci_interno

lw $t3,($t9)

addi $t4,$t4,4

lw $t2,($t4)

bgt $t3,$t2,swap
addi $t1,$t1,1
j ciclo_interno

swap:
sw $t3,($t4)
sw $t2,($t9)
addi $t1,$t1,1
addi $t9,$t9,4

j ciclo_interno

esci_interno:
addi $t0,$t0,1
addi $t4,$t4,-8
addi $t9,$t9,-8

j ciclo_ordinamento

esci_cicloordinamento:
move $t9,$a0
move $t4,$t9

addi $t9,$t9,12
addi $t4,$t4,12
li $t0,0
ciclo_ordinamento1:
beq $t0,2,esci_cicloordinamento1
li $t1,0
ciclo_interno1:
beq $t1,2,esci_interno1

lw $t3,($t9)

addi $t4,$t4,4

lw $t2,($t4)

bgt $t3,$t2,swap2
addi $t1,$t1,1
j ciclo_interno1

swap2:
sw $t3,($t4)
sw $t2,($t9)
addi $t1,$t1,1
addi $t9,$t9,4

j ciclo_interno1

esci_interno1:
addi $t0,$t0,1
addi $t4,$t4,-8
addi $t9,$t9,-8

j ciclo_ordinamento1

esci_cicloordinamento1:
move $t9,$a0
move $t4,$t9

addi $t9,$t9,24
addi $t4,$t4,24
li $t0,0
ciclo_ordinamento2:
beq $t0,2,esci_cicloordinamento2
li $t1,0
ciclo_interno2:
beq $t1,2,esci_interno2

lw $t3,($t9)

addi $t4,$t4,4

lw $t2,($t4)

bgt $t3,$t2,swap3
addi $t1,$t1,1
j ciclo_interno2

swap3:
sw $t3,($t4)
sw $t2,($t9)
addi $t1,$t1,1
addi $t9,$t9,4

j ciclo_interno2

esci_interno2:
addi $t0,$t0,1
addi $t4,$t4,-8
addi $t9,$t9,-8

j ciclo_ordinamento2
esci_cicloordinamento2:
jr $ra
