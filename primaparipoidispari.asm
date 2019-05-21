# esercizio che controlla se un numero è pari e poi dispari e inserisce prima i pari e poi i dispari 

.data

 stringa1:.asciiz " inserisci vettore "
 stringa2:.asciiz " stampa vettore "
 stringa3:.asciiz " "
 stringa4:.asciiz " vettore invertito " 
 stringa5:.asciiz " nuovo vettore ordinato "

.text

.globl main

main:

addi $sp,$sp,-20
move $s0,$sp

la $a0,stringa1
li $v0,4
syscall


move $a0,$s0
jal inserisci

move $a0,$s0
jal stampa

 

move $a0,$s0
jal pari


move $a0,$s0
jal stampas

li $v0,10
syscall



inserisci:
move $t9,$a0
li $t0,0

ciclo_inserisci:
beq $t0,5,esci_cicloinserisci

mul $t1,$t0,4
add $t1,$t1,$t9

li $v0,5
syscall

sw $v0,($t1)

addi $t0,$t0,1

j ciclo_inserisci

esci_cicloinserisci:
jr $ra



stampa:
move $t9,$a0
li $t0,0

la $a0,stringa2
li $v0,4
syscall

ciclo_stampa:
beq $t0,5,esci_ciclostampa

mul $t1,$t0,4
add $t1,$t1,$t9


lw $t2,($t1)

move $a0,$t2
li $v0,1
syscall

la $a0,stringa3
li $v0,4
syscall

addi $t0,$t0,1

j ciclo_stampa

esci_ciclostampa:
jr $ra

pari:
move $t9,$a0
li $t0,0
li $t8,2

ciclo_esterno:
beq $t0,5,esci_esterno


addi $t3,$t0,1


ciclo_interno:
beq $t3,5,esci_interno

mul $t1,$t0,4
add $t1,$t1,$t9

lw $t2,($t1)

mul $t4,$t3,4
add $t4,$t4,$t9

lw $t7,($t4)

div $t2,$t8
mfhi $t6

beq $t6,0,esci

sw $t7,($t1)
sw $t2,($t4)

addi $t3,$t3,1

j ciclo_interno

esci:
addi $t3,$t3,1
j ciclo_interno

esci_interno:
addi $t0,$t0,1
j ciclo_esterno

esci_esterno:
jr $ra

stampa_vettores:
move $t9,$s0
li $t0,0

la $a0,stringa5
li $v0,4
syscall

stampas:
move $t9,$a0
li $t0,0

la $a0,stringa5
li $v0,4
syscall



ciclo_stampas:
beq $t0,5,uscita_stampas

mul $t1,$t0,4
add $t1,$t1,$t9

lw $t2,($t1)

move $a0,$t2
li $v0,1
syscall


la $a0,stringa3
li $v0,4
syscall

addi $t0,$t0,1

j ciclo_stampas

uscita_stampas:
jr $ra

