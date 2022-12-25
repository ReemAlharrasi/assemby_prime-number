
Include Irvine32.inc

.data
N DWORD ?
prompt1 BYTE "Enter an integer N: ",0
Msg1 BYTE " prime numbers are:   ",0

.code
main PROC
    mov edx,offset prompt1          ;display read input message
    call WriteString  
	call ReadInt                    ;read input
	mov ecx, eax                    ; check numbers from 1 to N and print if they are prime numbers
	mov N, 1
	call crlf
	mov edx,offset msg1
	call WriteString  
	call crlf
next:
    push ecx
	mov eax, N
	call primecheck
	call display
	inc N
	pop ecx
	loop next

	call WaitMsg
	exit
main ENDP

primecheck PROC
	cmp eax, 2   ;for values: 1 and 2
	ja continue
	mov ebx, 1
	ret
continue:
     sub eax, 2
     mov ecx,eax
	 mov esi,2
Loop1: 
      mov eax,N
	  mov edx, 0
	  div esi
	  cmp edx,0
	  je break
	  inc esi
	  loop loop1
      mov ebx,1  ;prime number
	  ret  
break:
      mov ebx,0  ;not a prime number
      ret    
primecheck ENDP

display PROC   
    cmp ebx,0
	jne print
    ret
print:
    mov eax,N
	call WriteInt
	call crlf
    ret
display ENDP

END main