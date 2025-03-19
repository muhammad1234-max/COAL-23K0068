
TITLE lab3
INCLUDE Irvine32.inc

.data
	val1 WORD ?
	val2 SBYTE -11
	val3 SDWORD -45
	val4 WORD 100,200,300
	color BYTE "Navy Blue",0
	a  BYTE  11h
    b  BYTE  10h
    c  BYTE  30h
    d  BYTE  40h
	E BYTE 14
	result DWORD ?
    wArray BYTE 10,20,30
    dArray DWORDS 50 DUP(?)
    testString DWORD 500 DUP("test")
    bArray BYTE 20 DUP(0)

	
.code
	main PROC
		movzx eax, a   
        movzx ebx, b   

        add eax, ebx   
        mov edx, eax   

        movzx eax, a    
        movzx ebx, b    
    
        sub eax, ebx   
    
        sub edx, eax   

        movzx eax, c 
        add edx, eax   

        movzx eax, d 
        add edx, eax    

        mov ebx, edx   
        mov result, ebx  

        call ExitProcess 	
	main ENDP

END main
