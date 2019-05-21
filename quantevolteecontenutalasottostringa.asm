#Data una stringa di caratteri dire quante volte è contenuta in essa la sottostringa 'con'.

.data 
str:.space 100
str1:.space 100
messaggio:.asciiz " la stringa e' contenuta volte "
accapo:.asciiz "\n"
.text 

.globl main

main:

#inserisco la prima stringa 

la $a0,str
li $a1,98
li $v0,8
syscall

#inserisco la seconda stringa 
la $a0,str1
li $a1,98
li $v0,8
syscall

la $a0,str #carico la prima stringa
la $a2,str1 #carico la seconda stringa 
jal lunghezza	#chiamo funzione lunghezza

la $a0,str#carico la testa della stringa
la $a2,str1#carico la testa della stringa2
jal sottostringa #chiamo funzione sottostringa 

li $v0,10 #fine del programma 
syscall


	lunghezza:
	move $t9,$a2
	li $t1,0
	ciclo_lunghezza:
	lbu $t0,($t9)
	beq $t0,'\0',esci_ciclolunghezza
	addi $t1,$t1,1 #contatore della lunghezza
	addiu $t9,$t9,1#avanzo nella seconda stringa 
	j ciclo_lunghezza
		
		esci_ciclolunghezza:
		addi $t1,$t1,-1 #faccio meno un alla lunghezza per tener conto anche dello spazio finale 
		
		move $a0,$t1
		li $v0,1 #stampo la lunghezza
		syscall
		#stampo del messaggio 
		la $a0,accapo
		li $v0,4
		syscall
		
		
		jr $ra
		
		sottostringa:
		move $t8,$a0 #muovo la testa della prima stringa 
		move $t9,$a2 #muovo la testa della seconda stringa 
		li $t1,0
		ciclo:
		
		lbu $t2,($t8) #carico il carattere 
		lbu $t3,($t9) #carico il carattere 
		
		
		beq $t2,'\0',esci_ciclo
		beq $t3,10,esci_ciclo1 
		
		beq $t2,$t3,andiamo
		move $t9,$a2 #rimuovo la testa 
		addiu $t8,$t8,1#avanzo nella prima stringa 
		li $t4,0 #flag uguale  a zero 
		j ciclo
		
		andiamo:
		addiu $t8,$t8,1#avanzo nella prima stringa
		addiu $t9,$t9,1#avanzo nella seconda stringa
		li $t4,1#flag uguale ad 1 
		j ciclo
		
		esci_ciclo1:
		beq $t4,0,ok #controllo del flag 
		
		addi $t1,$t1,1 #incremento il conatatore per vedere quante volte è contenuta la sottostringa
		move $t9,$a2 #ricarico la testa del vettore 
		j ciclo
		
		
			ok:
			move $t9,$a2 #ricarico la testa del vettore 
			j ciclo
						esci_ciclo:
						#stampo del messaggio
						la $a0,messaggio
						li $v0,4
						syscall
						
					
						#stampo messaggio1
						move $a0,$t1
						li $v0,1
						syscall
						
						jr $ra #torno al main
		
		
		
		
		
		
		
		



