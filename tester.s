.data 
	test1: .word 2 4 6 8 10
	res1: .word 2 6 12 20
	ans1: .space 40
	
	correct: .asciz "All tests are correct!"
	incorrect: .asciz "You have problems with tests! Try again later..."
	.globl correct incorrect
.text
	.include "average.s"
	.include "find_greater.s"
	.include "copy_array.s"
	.include "helptester.s"
	li s1 20
	li s2 16
	li a2 5
	la s9 test1
	la s8 ans1
	test_num(test1, res1, s1, s2, ans1)
	average_num(t1, t2)
	find_greater_average(t1, t2)
	copy_of_array_A(t1, t2, t3)
	tester(t3,t4,t6)
	
	j done
	error:	la a0 incorrect
	li a7 4
	ecall
	j end
	done:	la a0 correct
	li a7 4
	ecall
	end:
