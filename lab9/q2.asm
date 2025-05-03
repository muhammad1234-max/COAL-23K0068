.model small
.stack 100h
.data
    arr db 5 dup(?)
    prompt db 'Enter a digit (0-9): $'
    msg db 'You entered: $'

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5
    mov si, 0

input_loop:
    mov dx, offset prompt
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov arr[si], al
    inc si
    call PrintNewLine
    loop input_loop

    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov cx, 5
    mov si, 0

print_loop:
    mov al, arr[si]
    call PrintDigit
    call PrintNewLine
    inc si
    loop print_loop

    mov ah, 4ch
    int 21h

PrintDigit proc
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    ret
PrintDigit endp

PrintNewLine proc
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret
PrintNewLine endp

end main
