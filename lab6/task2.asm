 ; Task 2: Nested Loop Pattern
    mov edx, OFFSET pattern_msg
    call WriteString

    ; First pattern: Increasing numbers
    mov ecx, 4
outer_loop1:
    mov ebx, ecx
inner_loop1:
    mov eax, 5
    sub eax, ebx
    call WriteDec
    dec ebx
    jnz inner_loop1
    call Crlf
    loop outer_loop1

    call Crlf

    ; Second pattern: Decreasing numbers
    mov ecx, 4
outer_loop2:
    mov ebx, ecx
inner_loop2:
    mov eax, ebx
    call WriteDec
    dec ebx
    jnz inner_loop2
    call Crlf
    loop outer_loop2

    exit
main ENDP
pattern_msg BYTE "Task 2: Pattern", 0
END main
