#Scrivere un programma che chieda all’utente in input delle parole e che calcoli 
#la somma totale dei caratteri di tutte le parole che iniziano con la lettera ‘p’. Utilizzare 
#‘$’ come carattere di controllo per terminare l’inserimento del testo.


.data 
str:.space 100
.text 

.globl main

main:

la $a0,str
li $a1,98
li $v0,8
syscall

la $a0,str
jal inserimento

li $v0,10
syscall


	inserimento:
	move $t9,$a0
	li $t0,0
	li $t2,0 #flag 
		ciclo_inserimento:
		lbu $t1,($t9) #carico il carattere 
		beq $t1,'\n',esci_ciclo #esco dal ciclo se è uguala all'accapo
		beq $t2,1,continua #se il flag è uguale ad 1 è presente la p
		beq $t1,'p',conta 
		addiu $t9,$t9,1
		j ciclo_inserimento
			
			conta:
			addiu $t9,$t9,1 #avanzo nella stringa
			li $t2,1 #aggiorno il flag 
			j ciclo_inserimento #torno nel ciclo
			
			continua:
			beq $t1,32,esci #controllo se è uguale ad uno spazio
			addi $t0,$t0,1 #conto i caratteri dopo la p
			addiu $t9,$t9,1 #avanzo nella stringa 
				j ciclo_inserimento
				esci:
				li $t2,0 #rimetto il flag a zero
				j ciclo_inserimento
				
					esci_ciclo:
					move $a0,$t0 #porto a video il contatore 
					li $v0,1
					syscall
					
					jr $ra
