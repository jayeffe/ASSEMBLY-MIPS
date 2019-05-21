################Recursive_Bubble_sort###########################
.data
a: .word 1,5,4,6,3,7,654,34,2,34
size:.word 10
prompt:.asciiz "This program sort an array with recursive bubble sort"
space: .asciiz " "
################################################################
.text
.globl main
main:
la		$a0,	prompt
li		$v0,	4
syscall
la		$a0,	a
lw		$a1,	size
jal	rec_bb
xor	$t0,	$t0,	$t0	#i=0
lw		$t1,	size			#t1--> array size
la		$t3,	a				#t2--> array pointer
print:
beq	$t0,	$t1,	exit	#if i==size stop
sll	$t2,	$t0,	2		#i*4
add	$t2,	$t3,	$t2	#a+i*4
lw		$a0,	($t2)			#a[i]
li		$v0,	1				#print integer
syscall	
la		$a0,	space			#load space string address
li		$v0,	4				#print space
addi	$t0,	$t0,	1		#i++
j	print
li		$v0,	10				#exit
syscall
####################################################################
rec_bb:
addi	$sp,	$sp,	-12
sw		$s0,	8($sp)
sw		$s1,	4($sp)
sw		$ra,	0($sp)	
move	$s1,	$a1			#n(argument of rec-bb function)
ble	$s1,	1,		exit	#case base: if(n<=1) exit
xor	$s0,	$s0,	$s0			#i=0
addi	$s1,	$s1,	-1		#n-1
loop:
beq	$s0,	$s1,	exit	#if i==(n-1), exit from loop
sll	$t0,	$s0,	1		#i*4
la		$t4,	a
add	$t0,	$t4,	$t0	#a+i*4
lw		$t1,	($t0)			#a[i]
lw		$t2,	4($t0)		#a[i+1]
ble	$t1,	$t2,	next	#if(a[i]>=a[i+1]) next comparison
move	$t3,	$t1			#temp=a[i]
sw		$t2,	($t0)			#a[i]=a[i+1]
sw		$t3,	4($t0)		#a[i+1]=temp	
next:		
addi	$s0,	$s0,	1		#i++
j	loop
exit:
move	$a1,	$s1			#pass as argument n-1
la		$a0,	a				
jal	rec_bb
lw		$s0,	8($sp)
lw		$s1,	4($sp)
lw		$ra,	0($sp)
addi	$sp,	$sp,	12
jr		$ra