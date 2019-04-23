;hello.asm
;  turns on an LED which is connected to PB5 (digital out 13)

.include "./m328Pdef.inc"

	ldi r16,0b00100000
	out DDRB,r16
	out PortB,r16
Start:		
	ldi r16,0b00100000
	out PortB,r16
	jmp loop1
end1:
	ldi r16,0b00000000
	out PortB,r16
	
	ldi r17, 160000 ; 1 cycle
	jmp loop2

loop1:	nop        ; 1 cycle
	dec r17    ; 1 cycle
	brne loop1 ; 2 cycles when jumping, 1 otherwise
	jmp end1

loop2:	nop        ; 1 cycle
	dec r17    ; 1 cycle
	brne loop1 ; 2 cycles when jumping, 1 otherwise
	jmp Start
