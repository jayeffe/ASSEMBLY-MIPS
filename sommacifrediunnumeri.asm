.data 

.text 

.globl main

main:

#inserisco il numero 

li $v0,5
syscall

move $s0,$v0
move $a0,$s0

jal somma

move $a0,$v0
li $v0,1
syscall

li $v0,10
syscall


		somma:
		move $t9,$a0
		
		bgt $t9,0,continua
		not $t9,$t9
	        addiu $t9,$t9,1
			
			continua:
			li $t0,1 #carico il contatore ad 1 
			
			ciclo1:
			bgt $t0,$t9,exit
			
			mulu $t0,$t0,10
			
			j ciclo1
			
				exit:
				li $t2,0 #qui inserisco la somma delle cifre 
				
				ciclo2:
					blt $t0,1,uscita_tot
					
					div $t9,$t0
					mfhi $t9
					mflo $t1 # qui ho la cifra 
					
					add $t2,$t2,$t1
					
					div $t0,$t0,10
					j ciclo2
					
					uscita_tot:
					move $v0,$t2
					jr $ra
					
				
			
			
		