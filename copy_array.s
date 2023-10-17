.macro copy_of_array_A(%x, %y, %b) # копируем массив
copy_array:
	lw a3 (%x) 	#переносим элемент из массива
	addi %x %x 4
	add a4 a4 a3 	#a4 + a3 = сумма
	sw a4 (%b)    #сохраняем эл в массив
	addi %b %b 4
	addi a5 a5 1
	bne a5 s6 copy_array   #сравниваем начало массива с концом 
	mv %b s8    #возвращаем указатель на начало массива	
	lw ra (sp)
	addi sp sp 4
.end_macro
