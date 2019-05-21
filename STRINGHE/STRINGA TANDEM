#verifica di una stringa tandem

.data
inserisci: .asciiz "inserisci la stringa "
str: .space 100
str_tandem: .asciiz "tandem "
non_tandem: .asciiz "non_tandem"


.text



.globl main
main:

la $a0,inserisci
li $v0,4
syscall

la $a0,str
li $v0,8
li $a1,98
syscall

la $a0,str
jal strlen


move $a1,$v0
la $a0,str
jal tandem


esci:
li $v0,10
syscall

strlen:
move $t9,$a0
li $t0,0
ciclo_lunghezza:
lbu $t2,($t9)
beqz $t2,esci_len

addi $t0,$t0,1 

addi $t9,$t9,1
j ciclo_lunghezza
esci_len:
subi $v0,$t0,1
jr $ra 

tandem:
move $t9,$a0
move $t8,$a1 #lunghezza 
li $t0,2

#ricordo che per accedere all'elemento effettivo la lunghezza devo togliere 1 

li $t5,0
div $t8,$t0
mflo $t3 



ciclo_tandem:

add $t7,$t3,$t9
lbu $t6,($t7)
beqz $t6,esci_tandem 
#ora la testa punta la meta

lbu $t2,($t9)

beq $t2,$t6,tandems

add $t9,$t9,1
j ciclo_tandem

tandems:
addi $t5,$t5,1

add $t9,$t9,1
j ciclo_tandem

esci_tandem:

beq $t5,$t3,is_tandem

la $a0,non_tandem

li $v0,4
syscall 


jr $ra 

is_tandem:
la $a0,str_tandem
li $v0,4
syscall


jr $ra 