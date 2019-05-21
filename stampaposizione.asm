#stampare la posizione 2 del vettore
.data 

frase1:.asciiz" inserisci il vettore "
frase2:.asciiz " stampa il vettore "
spazio:.asciiz" " 


.text 

.globl main

main:


la $a0,frase1
li $v0,4
syscall

addi $sp,$sp,-12
move $s0,$sp

move $a0,$s0
jal inserisci 

move $a0,$sp
jal stampa 




li $v0,10
syscall

#inseriamo il vettore 

inserisci:
move $t9,$a0
li $t0,0 #contatore
ciclo_inserimento:

beq $t0,3,uscita_inserimento

#Accessi alla memoria
mul $t1,$t0,4
add $t1,$t1,$t9


li $v0,5
syscall

sw $v0,($t1)



addi $t0,$t0,1  #avanzo nel vettore 

j ciclo_inserimento

uscita_inserimento :

la $a0,frase2
li $v0,4
syscall

jr $ra

stampa:
move $t9,$a0
li $t0,0

stampas :
beq $t0,3,uscita_stampas

mul $t1,$t0,4
add $t1,$t1,$t9

lw $t2,($t1)

move $a0,$t2
li $v0,1
syscall

la $a0,spazio
li $v0,4
syscall

addi $t0,$t0,1

j stampas 



uscita_stampas:


lw $t0,4($sp) #carico dalla memoria e lo metto nel registro $t0 il valore

move $a0,$t0
li $v0,1
syscall

jr $ra




