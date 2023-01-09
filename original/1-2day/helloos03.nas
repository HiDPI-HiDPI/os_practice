; hello-os
; TAB=4

		ORG		0x7c00			; ????v???O????????????????????

; ?????W???I??FAT12?t?H?[?}?b?g?t???b?s?[?f?B?X?N??????L?q

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; ?u?[?g?Z?N?^????O?????R?????????i8?o?C?g?j
		DW		512				; 1?Z?N?^??????i512????????????????j
		DB		1				; ?N???X?^??????i1?Z?N?^????????????????j
		DW		1				; FAT?????????n????i?????1?Z?N?^?????????j
		DB		2				; FAT?????i2????????????????j
		DW		224				; ???[?g?f?B???N?g??????????i?????224?G???g???????j
		DW		2880			; ????h???C?u??????i2880?Z?N?^????????????????j
		DB		0xf0			; ???f?B?A??^?C?v?i0xf0????????????????j
		DW		9				; FAT????????i9?Z?N?^????????????????j
		DW		18				; 1?g???b?N????????Z?N?^???????i18????????????????j
		DW		2				; ?w?b?h????i2????????????????j
		DD		0				; ?p?[?e?B?V???????g??????????????K??0
		DD		2880			; ????h???C?u????????????x????
		DB		0,0,0x29		; ???????????????l?????????????????
		DD		0xffffffff		; ?????{?????[???V???A?????
		DB		"HELLO-OS   "	; ?f?B?X?N????O?i11?o?C?g?j
		DB		"FAT12   "		; ?t?H?[?}?b?g????O?i8?o?C?g?j
		RESB	18				; ???????18?o?C?g?????????

; ?v???O?????{??

entry:
		MOV		AX,0			; ???W?X?^??????
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SI??1???
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; ?????\???t?@???N?V????
		MOV		BX,15			; ?J???[?R?[?h
		INT		0x10			; ?r?f?IBIOS??��o??
		JMP		putloop
fin:
		HLT						; ??????????CPU???~??????
		JMP		fin				; ???????[?v

msg:
		DB		0x0a, 0x0a		; ???s??2??
		DB		"hello, world"
		DB		0x0a			; ???s
		DB		0

		RESB	0x7dfe-$		; 0x7dfe????0x00????????

		DB		0x55, 0xaa

; ?????u?[?g?Z?N?^??O???????L?q

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
