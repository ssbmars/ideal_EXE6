kaizouLoader:
	push	r14

	cmp		r0, 0xDD	// TextPetで用意したフラグかチェック
	bne 	@@originalProcessing	// 違ったら元々の処理だけやって抜ける

	push	r2-r5		// 自作の処理をする前にレジスタの値を保持
	ldr		r2,=kaizouLoaderXtra|1
	bx		r2

	@@originalProcessing:
	mov		r1,0x80
	ldr		r1,[r5,r1]

	pop		r15

.pool

// Hook
.org loadPasswordIndex // パスワードチェック関数の内部（会話から呼び出せるのでTextPetと連携しやすい）
	bl kaizouLoader




.org 0x08911200
.area 0x7F0

kaizouLoaderXtra:
	mov		r0,0x0
	ldr		r2,=2009D1Ch	// パスワード入力で一番左のケタの数値が格納されるアドレス（レジスタに格納されてるWARAMのアドレスを表示したらたまたま見つけた）
	ldrb	r1,[r2]		// 100の位
	mov		r3,0x64
	mul		r1,r3		// x100
	add		r0,r1
	add		r2,1h		//ldr	r2, =0x02009D1D
	ldrb	r1,[r2]		// 10の位
	mov		r3,0xA
	mul		r1,r3		// x10
	add		r0,r1
	add		r2,1h		//ldr	r2, =0x02009D1E
	ldrb	r1,[r2]		// 1の位
	add		r0,r1

	//sanitize the ID
	cmp		r0,75h	//0x75 is the highest existing ID
	bgt		@@flagbadID
	cmp		r0,0h
	bgt		@@isclean

@@flagbadID:
	mov		r2,0h		//set value that says why the ID is invalid (BAD ID)
	b		@@invalid


@@isclean:
	
	ldr		r2,=loadKaizouCard|1
	mov		r14,r15
	bx		r2
	;bl loadKaizouCard	// 改造カードのロード（r0 = カードID）

	//check if MB limit	reached
	ldr		r0,=65F0h
	lsl		r3,8h
	lsr		r3,8h
	cmp		r0,r3
	bne		@@jump5
	mov		r2,1h		//set value that says why the ID is invalid (MB)
	b		@@invalid


	//check if Duplicate
	@@jump5:
	cmp		r2,7Fh
	bne		@@jump6
	mov		r2,2h		//set value that says why the ID is invalid (DUPLICATE)
	b		@@invalid


	//EXPERIMENTAL: try to load modcard name archives while in overworld
	@@jump6:
	push 	r1

	ldr		r1,=201D000h
	ldr		r0,=0F400F4h
	ldr		r2,[r1]
	cmp		r2,r0
	beq		@@alreadyloaded


	ldr		r0,=cardNameAddress
	ldr		r0,[r0]
	lsl		r0,r0,1h
	lsr		r0,r0,1h

	sub		r1,4h
	mov		r2,80h
	swi		11h
	//ldr		r5,=memcopyCardNames|1
	//mov		r14,r15
	//bx		r5
	;bl		memcopyCardNames

@@alreadyloaded:
	pop		r1

	//check if the ID is of a card with a banned CS
	mov		r5,0h
	//check invis CS
	cmp		r1,8h
	beq		@@warnInvis
	cmp		r1,65h
	beq		@@warnInvis
	b		@@checkStatusCS
	@@warnInvis:
	mov		r5,1h
	b		@@warnEnd
	@@checkStatusCS:
	//check stun-type CS
	cmp		r1,17h
	beq		@@warnStatus
	cmp		r1,25h
	beq		@@warnStatus
	cmp		r1,62h
	beq		@@warnStatus
	b		@@warnEnd

	@@warnStatus:
	mov		r5,2h


	@@warnEnd:
	//attempt at displaying modcard name	
	ldr		r0,=201D000h	//modcard names offset
	lsl		r1,r1,1h		//turn ID into offset pointer
	ldrh 	r1,[r0,r1]
	add		r0,r0,r1
	
	ldr		r2,=20336FCh	//text address to overwrite
	mov		r3,0h

	@@loop:
		ldrb 	r4,[r0,r3]	//read modcard text
		cmp		r4,0E6h		//skip to end if END byte is	read
		beq		@@finish
		cmp		r4,0E9h		//replace newline byte with space
		bne		@@jump2
		mov		r4,0h
		@@jump2:
		strb 	r4,[r2,r3]	//overwrite textbox data
		add		r3,1h
		cmp		r3,8h
		bge		@@finish
		b		@@loop

	@@invalid:
	//write "Error" in place of a modcard name
	mov		r5,0h

	ldr		r0,=2033750h	//starting address to	read
	lsl		r2,5h
	add		r0,r2			//turn invalid ID indicator into address pointer

	ldr		r2,=20336FCh
	mov		r3,0h


	@@loop2:
		ldrb 	r4,[r0,r3]	//read modcard text
		cmp		r4,0E6h
		beq		@@finish
		strb 	r4,[r2,r3]	//overwrite textbox data
		add		r3,1h
		cmp		r3,12h
		bge		@@finish
		b		@@loop2



	ldr		r2,=20336FCh	//text address to overwrite
	
	
	@@finish:
	mov		r0,0h
	@@loop3:
	strb 	r0,[r2,r3]
	add		r3,1h
	cmp		r3,13h
	blt		@@loop3

	//warning to avoid equipping banned effects
	ldr		r2,=2033719h
	mov		r3,0h

	cmp		r5,1h
	blt		@@wipemessage
	bgt		@@jump3
	ldr		r0,=2033800h	//invis message
	b		@@jump4
	@@jump3:
	ldr		r0,=20337C0h	//status message
	@@jump4:
	strb 	r3,[r2]
	add		r2,2h

	@@loop4:
	ldrb 	r4,[r0,r3]	//read
	cmp		r4,0E6h
	beq		@@finish2
	strb 	r4,[r2,r3]	//overwrite
	add		r3,1h
	cmp		r3,30h
	bge		@@finish2
	b		@@loop4

@@wipemessage:
	mov		r4,0E6h
	strb 	r4,[r2]
	mov		r4,0h
	add		r2,2h
@@loop5:
	strb 	r4,[r2,r3]	//overwrite
	add		r3,1h
	cmp		r3,30h
	bge		@@finish2
	b		@@loop5




@@finish2:
	mov		r0, 0xDD	// 一応もとの値に戻しとく
	pop		r2-r5
	mov		r1,0x80
	ldr		r1,[r5,r1]

	pop		r15
	.pool

.endarea