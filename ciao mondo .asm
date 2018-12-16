.data
stringa: .asciiz "ciao mondo \n"

.text

li $v0,4 #stampa la stringa
la $a0,stringa 
syscall

li $v0,10
syscall