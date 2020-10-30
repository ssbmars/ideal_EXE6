

//Bo3 -> change to first to 69
.org 0x0800B546
	add		r4,89h

.org 0x0800B554
	cmp		r2,89h



//Continue receiving randomized stages after the 3rd match
//.org 0x0802E27A
//	nop

	//branch to freespace and run a few extra lines that limit the offset modifier 
	//so it doesn't read past the valid random stage data
	.org 0x0802E274
		bl		0x0803E900
	
	.org 0x0803E900
		sub		r0,1h
		add		r0,r0,r0
		cmp		r0,4h
		blt		.+4h
		mov		r0,2h
		mov		r15,r14









.close