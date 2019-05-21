#elimina carattere da una stringa 

.data 
str:.space 100
stringa1:.asciiz " la stringa senza carattere e'"
.text 

.globl main

main:

la $a0,str
li $a1,98
li $v0,8
syscall




elimina:
	
la $a0,str
move $t9,$a0 #passo la testa del vettore 

li $t0,0 #contatore i 
li $t4,1 #contatore j 

ciclo_esterno:

	lb $t1,($t9) #carico la lettere in $t1
	
	beqz $t1,uscita_totale
	
	beq $t1,'a',cancella
	
	addi $t9,$t9,1
	addi $t0,$t0,1
	
	j ciclo_esterno
	
	cancella:

	
	move $t7,$t9 #passo la testa del corrente in $t7
	
	add $t8,$t4,$t9 #avanzo al successivo 
	
	
	ciclo_interno:
		
		lb $t5,($t8) #carico il successivo
	
	
		
		sb $t5,($t7) #faccio la sb nel corrente 
		
		beqz $t5,uscita_interno
		
		addi $t8,$t8,1 #avanzo nel successivo 
		addi $t7,$t7,1 #avanzo nel corrente 
		
		j ciclo_interno
	
	
	uscita_interno:
		
	
		
		j ciclo_esterno
	
	
	
	
uscita_totale:

la $a0,str
li $v0,4
syscall				

li $v0,10
syscall







