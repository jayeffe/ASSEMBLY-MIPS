##lettura e stampa stringa

.data
str: .space 100
.text
.globl main

##MAIN
main:
	#lettura
	la $a0, str #passo in $a0 la stringa
	li $v0, 8 #carico in $v0 il numero della syscall per leggere le stringhe
	li $a1, 98 #imposto il limite della stringa. il limite va fatto dimensione -2 perchè anche l'accapo viene inserito nella stringa
		   #quindi hai bisogno di uno spazio per il terminatore e uno per l'andata a capo
	syscall
	
	#stampa
	
	la $a0, str
	li $v0, 4 #carico la syscall per la stampa delle stringhe
	syscall
	
	li $v0, 10 #questa è la syscall per terminare il programma
	syscall