# somma di due numeri 

.data
prompt:                 .asciiz ">  "   #carattere del promt
cks:                    .asciiz "la checksum dei dati immessi"
.text
.globl main

main:

ciao:
li $s1,0
                        li $t0,10
                        li $v0,4
                        la $a0,prompt
                        syscall
                        li $v0,5
                        syscall
               si:         
                        addu $s1,$s1,$v0
                        sub  $t0,$t0,1
                        bnez $t0, ciao
                        xori $s1,$s1,-1
                        addi $s1,$s1,1
                        li $v0,4
                        la $a0,cks
                        syscall
                       
                        si2: 
                        li $v0,1
                        move $a0,$s1
syscall
                        li $v0,10
                        syscall