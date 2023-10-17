.macro fill_array(%x, %y) # макрос для ввода значений массива с клавиатуры 
	li s1 1 #constans
	li s2 10
	li s3 2
	la a0 array_size
	li a7 4
	ecall
	
	mv %y %x #копируем массив
	li a7 5 #вводим кол-во элементов в массиве и сохр a0
	ecall

	mv t2 a0 #t2 кол-во эл массива
	bgt t2 s2 error #длина массива > 10
	bltz t2 error #t2 < 0

find_end:
	addi %y %y 4 	#ищем конец массива
	sub t2 t2 s1  	#t2 - s1
	bnez t2 find_end 	#if t2 != 0 

fill_array:
	la a0 enter_number
	li a7 4
	ecall 
	
	addi a2 a2 1 #порядковый номер
		
	mv a0 a2
	li a7 1
	ecall 	#выводим порядковый номер числа
	
	li a7 4
	la a0 colon
	ecall 	#Выводим :
	
	li a7 5
	ecall 	#Вводим элемент массива
	mv t2 a0
	
	sw t2 (%x) 	#сохр значения
	addi %x %x 4
	bltu %x %y fill_array  	#if %x < %y / сравниваем начало массива с концом 

la %x array 

lw ra (sp)
addi sp sp 4
.end_macro
