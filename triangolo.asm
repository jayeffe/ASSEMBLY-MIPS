# lati di un triangolo verificare se sono isoscele,scaleno oppure equilatero 


.data 
numero1: .asciiz " il primo numero e' uguale ad = "
numero2: .asciiz " il secondo numero e' uguale ad = "
numero3: .asciiz " il terzo numero e' uguale ad =  "  
risultato: .asciiz " il risultato e SCALENO =  "
risultato1: .asciiz " il risultato e' ISOSCELE"
risultato2: .asciiz " il risultato e' EQUILATERO "


.text 
main:

# syscall per leggere la prima stringa
la $a0,numero1
li $v0,4
syscall

#inserimento numero 
li $v0,5
syscall

move $t0,$v0  #in $t0 ho la costante inserita nella prima stringa 

#syscall per leggere la seconda stringa 

la $a0,numero2
li $v0,4
syscall

li $v0,5
syscall


move $t1,$v0  # in $t1 ho la costante inserita nella seconda stringa 


#syscall per inserire la terza stringa 

la $a0,numero3
li $v0,4
syscall


li $v0,5
syscall



move $t2,$v0   # in $t2 ho la costante inserita nella terza stringa 

#INIZIO SE 

IF:

bne $t0,$t1,ALTRIMENTI
bne $t1,$t2 ,ALTRIMENTI 

la $a0,risultato2
li $v0,4
syscall 




j FINE 


ALTRIMENTI :
la $a0,risultato1
li $v0,4
syscall 





FINE:
li $v0,10
syscall







