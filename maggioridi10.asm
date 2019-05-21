# funzione ricorsiva per vedere se tutti gli elementi sono maggiori di 10

#boolean tutti(int A[], int n)
 # if (n=0)  return  TRUE
  #     else if (A[n] <= 10 )  return FALSE
   #          else return  tutti(A, n-1)
   #end
   
.data
  stringa1:.asciiz " gli elementi sono maggiori di 10"
  stringa2:.asciiz " gli elementi non sono maggiori di 10"
  
  .align 2
  arr:.space 20
  
  .text
  
  .globl main
  
  main:
  
  la $a0,arr
  li $t0,0
  
  	loop:
  	
  		li $v0,5
  		syscall
  		
  		sw $v0,($a0)
  		
  		addi $a0,$a0,4
  		addi $t0,$t0,1
  		
  		blt $t0,5,loop
  		
  		
  		
  		la $a0,arr
  		
  		jal maggiori
  		
  			move $t1,$v0
  				beq $t1,1,maggiore
  					la $a0,stringa2
  					li $v0,4
  					syscall
  					
  					li $v0,10
  					syscall
  						
  						maggiore:
  						la $a0,stringa1
  						li $v0,4
  						syscall
  						li $v0,10
  						syscall
  		
  			maggiori:
  			
  				lw $t2,($a0)
  				move $a1,$t2
  				
  				beq $a1,0,return_true
  				blt $a1,10,return_false
  				bgt $a1,10,return_true1
  				
  				return:
  				addi $sp,$sp,-12
  				sw $a0,0($sp)
  				sw $a1,4($sp)
  				sw $ra,8($sp)
  				addi $a0,$a0,4
  				jal maggiori
  				
  				return2:
  				lw $ra,8($sp)
  				lw $a1,4($sp)
  				lw $a0,0($sp)
  				addi $sp,$sp,12
  				jr $ra
  					
  					return_true:
  					jr $ra
  						return_false:
  						addi $v0,$zero,0
  						j return
  							
  							return_true1:
  							li $t1,1
  							move $v0,$t1
  							j return
  				
  			
  		