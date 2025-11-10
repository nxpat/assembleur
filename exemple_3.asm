; sum of array elements (integers)
; and write to console
; same code as ax2.asm but works for any integers
; whose sum is less than ten digits
; automatic calculation of the length of the array
;
; assemble, link and run with ./pasm exemple_3

section .text

global _start

_start:
	        mov eax, 0               ; the accumulator
	        mov ecx, 0        	 ; the counter
loop:
		add eax, [array+ecx]     ; get the i-th word and add it to the accumulator
		add ecx, 4               ; increment counter by one word
		cmp ecx, len             ; read all words?
		jne loop	

		; convert integer to string
		mov  esi, buffer
		call int_to_string   
		; eax now holds the address to pass to sys_write

		; call write syscall
		mov edx, ecx   		; length of the string
		mov ecx, eax   		; address of the string
		mov ebx, 1     		; file descriptor, in this case stdout
		mov eax, 4     		; syscall number for write
		int 0x80

		; call exit syscall
		mov eax, 1
		int 0x80

; Input:
; eax = integer value to convert
; esi = pointer to buffer to store the string in (must have room for at least 10 bytes)
; Output:
; eax = pointer to the first character of the generated string
; ecx = length of the generated string
int_to_string:
		mov ecx, 0		; initialize number of digits
		add esi, 9
		mov byte [esi], 0	; add string terminator
		mov ebx, 10
.next_digit:
		xor edx, edx      	; clear edx prior to dividing edx:eax by ebx
		div ebx          	; eax /= 10
		add dl, '0'      	; convert the remainder to ASCII 
		dec esi    		; store characters in reverse order
		mov [esi], dl		; write to buffer at esi address
		add ecx, 1		; count the number of digits
		test eax, eax           
		jnz .next_digit  	; Repeat until eax==0

		; return a pointer to the first digit (not necessarily the start of the provided buffer)
		mov eax, esi
		ret

section .data
		array dd 10, 20, 30, 40, 501
		len: equ $-array	; length of array in bytes

section .bss
		buffer resb 10		; 10 bytes memory
