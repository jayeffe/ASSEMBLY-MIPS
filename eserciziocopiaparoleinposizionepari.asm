 # data una stringa stampare le parole in posizione pari  in un altro vettore 
 
 
 .data 
 str:.space 100
 str2:.space 200
 spazio:.asciiz " "
 
 .text 
 
 .globl main
 
 main:
 
 #inserisco la stringa 
 
 la $a0,str
 li $a1,98
 li $v0,8
 syscall
 
 la $t0,str #carico la testa della stringa $t0
 la $t1,str2 #carico la testa della stringa in $t1
 li $t3,0 #flag dove zero sarà uguale a le parole in poszione dispari 
 li $t5,0 #contatore prima stringa 
 li $t6,0 #contatore seconda stringa
 
 	ciclo_copia:
 		li $t3,0
 		
 			beq $t8,'\n',esci
 			add $t4,$t5,$t0 #accedi alla prima stringa
 			lb $t8,($t4)#carico il carattere 
 			beq $t8,' ',andiamo #confronto se è uno spazio 
 			addi $t5,$t5,1 #incremento il contatore 
 			j ciclo_copia 
 		
 						andiamo:
 							addi $t5,$t5,1 #incremento il contatore 
 							beq $t8,'\n',fine_ciclo #controllo se è uguale a backslah
 							li $t3,1 #aggiorno il flag 
 							add $t4,$t5,$t0 #accesso alla prima stringa 
 							add $t7,$t6,$t1#accesso alla seconda stringa 
 			
 							lb $t8,($t4)#lo carico in $t8
 							beq $t8,' ',andiamo2
 							sb $t8,($t7) #salvo il carattere in $t7 ossia nella memoria della seconda stringa 
 							addi $t6,$t6,1#avanzo nella seconda stringa 
 							j andiamo
 			
 								andiamo2:
 								addi $t5,$t5,1#avanzo nella prima 
 								j ciclo_copia
 							
 					
 									fine_ciclo:
 				
 			
 											esci:
 											la $a0,str2
 											li $v0,4
 											syscall
 											la $a0,spazio
 											li $v0,4
 											syscall
 											li $v0,10
 											syscall
 				
 		
 
 
 
 