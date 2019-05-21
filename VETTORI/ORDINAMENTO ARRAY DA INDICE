.data
inserisci: .asciiz "inserisci elementi "

spazio: .asciiz " "
accapo: .asciiz "\n"
vett: .space 40
indice: .asciiz "inserire l'indice " 
.align 2



.text



.globl main
main:

la $a0,inserisci
li $v0,4
syscall

la $a0,vett
jal inserimento



la $a0,accapo
li $v0,4
syscall


la $a0,vett
jal stampa

la $a0,indice
li $v0,4
syscall

li $v0,5
syscall


move $a1,$v0
la $a0,vett
jal ordina


la $a0,accapo
li $v0,4
syscall


la $a0,vett
jal stampa

esci:
li $v0,10
syscall

inserimento:
move $t9,$a0
li $t0,0
ciclo_inserimento:
beq $t0,10,esci_inserimento
mul $t1,$t0,4
add $t1,$t1,$t9

li $v0,5
syscall

sw $v0,($t1)



add $t0,$t0,1
j ciclo_inserimento
esci_inserimento:

jr $ra




stampa:
move $t9,$a0
li $t0,0
ciclo_stampa:
beq $t0,10,esci_stampa
mul $t1,$t0,4
add $t1,$t1,$t9

lw $t2,($t1)

move $a0,$t2
li $v0,1
syscall

la $a0,spazio
li $v0,4
syscall

add $t0,$t0,1
j ciclo_stampa
esci_stampa:
jr $ra 

ordina:
move $t9,$a0
move $t0,$a1 #passo l'indice 

loop_ordina:
beq $t0,10,esci_ordina
add $t1,$t0,1
ciclo_interno:
beq $t1,10,esci_interno
#carico il corrente con indirizzo $t0

mul $t2,$t0,4
add $t2,$t2,$t9
lw $t3,($t2)

#carico il successivo con indirizzo j 
mul $t4,$t1,4
add $t4,$t4,$t9
lw $t5,($t4)

bgt $t3,$t5,swap

addi $t1,$t1,1 
j ciclo_interno

swap:

sw $t3,($t4)
sw $t5,($t2)


addi $t1,$t1,1 
j ciclo_interno

esci_interno:

add $t0,$t0,1
j loop_ordina
esci_ordina:
jr $ra 

