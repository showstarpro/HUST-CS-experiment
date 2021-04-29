
addi $s0,$zero,0   #A的地址
addi $s1,$zero,4  #+的地址
addi $s2,$zero,8 #B的地址


start:
	lw $s0,0($s0)
	sub $s0,$s0,0x30
	lw $s1,0($s1)
	
	lw $s2,0($s2)
	sub $s2,$s2,0x30
	beq $s1,0x2b,ad
	beq $s1,0x2d,su
	beq $s1,0x2a,mu
	beq $s1,0x25,di
	
ad:	add $s0,$s0,$s2
	j    display

su:    sub $s0,$s0,$s2	
	j display
	
	
mu:  mul $s0,$s0,$s2
	j display

di: div $s3,$s0,$s2
	addu   $a0,$0,$s3       # display $t0
	addi   $v0,$0,34         # system call for LED display 
	syscall                 # display 

	addi   $v0,$zero,10         # system call for exit
	syscall                  # we are out of here.   

display:
	addu   $a0,$0,$s0       # display $t0
	addi   $v0,$0,34         # system call for LED display 
	syscall                 # display 

	addi   $v0,$zero,10         # system call for exit
	syscall                  # we are out of here.   

