.macro tester (%x, %x_end, %y)
	loop_checker:
	lw a6 (%x)
	lw a5 (%y)
	bne a5 a6 error
	addi %y %y 4
	addi %x %x 4
	blt %x %x_end loop_checker
.end_macro 

.macro test_num (%x, %resx, %lentest, %lenres, %ans)
	la t1 %x #начало исходного массива A
	mv t2 t1 
	add t2 t2 %lentest #конец исходного масиива A
	
	la t3 %ans  #указатель на начало массива ans
	mv t4 t3   
	add t4 t4 %lenres	#указатель на конец ans
	la t6 %resx #указатель на начало массива - ответа/result 
.end_macro
