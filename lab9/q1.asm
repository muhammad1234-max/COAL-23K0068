.model small
.stack 100h
.data
    arr db 10, 20, 30, 40, 50
    msg db 'Array elements: $'

.code
main:
    mov ax, @data
    mov ds, ax

    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov cx, 5
    mov si, 0

print_loop:
    mov al, arr[si]
    call PrintNumber
    call PrintNewLine
    inc si
    loop print_loop

    mov ah, 4ch
    int 21h

; Procedure to print AL as a number
PrintNumber proc
    xor ah, ah
    mov bx, 10
    div bx
    add al, '0'
    push ax
    mov al, ah
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    pop ax
    mov dl, al
    mov ah, 02h
    int 21h
    ret
PrintNumber endp

PrintNewLine proc
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret
PrintNewLine endp

end main
