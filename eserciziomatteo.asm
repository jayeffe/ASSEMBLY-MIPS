.data

str:.space 100
stringa1:.asciiz " la stringa e lunga caratteri '"


.text 

.globl main 

main :

        la $a0, str #passo in $a0 la stringa
	li $v0, 8 #carico in $v0 il numero della syscall per leggere le stringhe
	li $a1, 98
		   #quindi hai bisogno di uno spazio per il terminatore e uno per l'andata a capo
	syscall
	
	
	la $t0,str #carico la testa della stringa in t0
	
	li $t1,0 #prima parola
	
	
	ciclo_esterno:
	lb $t2,($t0)
	beq $t2,'\n' ,fine_ciclo
	
	
	beq $t4,0,vediamo
	
	vediamo:
	
	beq $t2,32,vado
	beq $t1,0,modifica
	
	blt $t2, 97, continua2
	bgt $t2, 122, continua2
	
	#per passare da minuscolo a minuscolo basta sottrarre -32 al carattere
	j modifica
	
	continua2:
	addi $t2,$t2, +32
	sb $t2,($t0)# per modificarlo nella stringa basta ricaricarlo nello stesso posto
	
	addi $t0,$t0,1
	j ciclo_esterno
	
	modifica:
	blt $t2,65,continua
	bgt $t2,91,continua
	addi $t0,$t0,1
	j ciclo_esterno
	
	continua:
	addi $t2,$t2,-32
	sb $t2,($t0)
	addi $t0,$t0,1
	j ciclo_esterno
	
	vado:
	li $t1,1
	addi $t0,$t0,1
	j ciclo_esterno
	
	
	
	fine_ciclo:
	la $a0,str
	li $v0,4
	syscall
	
	li $v0,10
	syscall
	
	
	
