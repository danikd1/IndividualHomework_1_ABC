.macro output(%b) 
	la a0 final_array
	li a7 4
	ecall	
	
print_array:
	lw a0 (%b)  #переносим элемент из массива
	li a7 1
	ecall
	la a0 space
	li a7 4
	ecall
	
	addi %b %b 4
	sub s6 s6 s1 # s6 = s6 - 1
	bnez s6 print_array #выпол пока не 0
	
	lw ra (sp)
	addi sp sp 4
.end_macro

