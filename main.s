.data 
array: .space 40
array_B: .space 40
enter_number: .asciz "Enter number "
colon: .asciz ": "
array_size: .asciz "Enter the number of elements: "
final_array: .asciz "Array B: "
space: .asciz " "
overflow_exception: .asciz "Error! Overflow exception."


.globl enter_number colon array_size final_array space overflow_exception 
.include "fill_array.s" 
.include "average.s"
.include "find_greater.s"
.include "copy_array.s"
.include "output.s"
.text

	la t0 array #array 
	la t1 array
	mv s9 t1
	
	sw ra (sp)
	addi sp sp -4
	fill_array(t0, t1) #Ввод элементов массива с клавиатуры (t0 - массив A, t1 - указатель на конец массива)
	
	sw ra (sp)
	addi sp sp -4
	average_num(t0, t1) #Поиск среднего арифмитического(t0 - массив A, t1 - указатель на конец массива)
	
	sw ra (sp)
	addi sp sp -4
	find_greater_average(t0, t1) #Поиск номера первого элемента массива А большего среднего ариф.(t0 - массив A, t1 - указатель на конец массива)
	
	la t3 array_B
	mv s8 t3
	
	sw ra (sp)
	addi sp sp -4
	copy_of_array_A(t0, t1, t3) #Формируем массив B из сумм соседних элементов A(t0 - массив A, t1 - указатель на конец массива, t3 - массив B)
output:
	sw ra (sp)
	addi sp sp -4
	output(t3) #Вывод массива B (t3 - массив B)
	
exit:
	li a7 10
	ecall
	
error:
	li a7 4
	la a0 overflow_exception
	ecall
	j exit
