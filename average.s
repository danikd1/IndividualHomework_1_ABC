.macro average_num(%x, %y) # макрос подсчета сумм
find_average:
	lw a3 (%x) 	#переносим элемент из массива
	add a1 a1 a3 	#s4 + t2 = сумма 
	addi %x %x 4 	#двигаем на 4 байта
	bltu %x %y find_average 	#if %x < %y / сравниваем начало массива с концом
	div t5 a1 a2  #среднее ариф
	mv %x s9  #возвращаем указатель на начало массива
	
	lw ra (sp)
	addi sp sp 4
.end_macro
