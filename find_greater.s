.macro find_greater_average(%x, %y) # ищем номер первого элемента массива А большего среднего арифметического нашего массива
find_element_greater:
	lw a3 (%x)   #переносим элемент из массива
	addi s6 s6 1   #порядковый номер элемента
	addi %x %x 4   #двигаем на 4 байта
	ble a3 t5 find_element_greater #a3 <= t5, ищем порядковый номер элемента > average
	mv %x s9	#возвращаем указатель на начало массива
	
	lw ra (sp)
	addi sp sp 4
.end_macro
