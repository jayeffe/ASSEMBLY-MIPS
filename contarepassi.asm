# fare un programma dove il registro $t0 con con passa da -25 a + 25 con passi di (+1)

.data 
ciao: .asciiz "inizio programma "
risultato: .asciiz" il risultato e'  =  "
.text 
.globl main

main:

la $a0,ciao
li $v0,4
syscall

li $t0,-25
li $t1,1
ciclo:

beqz $t0 fine_ciclo

add $t0 $t0,$t1
 
 la $a0,risultato
li $v0,4
syscall 

move $a0,$t0

li $v0,1
syscall
 
 


j ciclo

fine_ciclo:




li $v0,10
syscall
