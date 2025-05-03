.model small
.stack 100h
.data
    arr db 10, 20, 30, 40, 50
    sum dw 0
    avg db ?

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5
    mov si, 0
    xor ax, ax

sum_loop:
    mov al, arr[si]
    cbw                 ; Extend AL to AX
    add sum, ax
    inc si
    loop sum_loop

    mov ax, sum
    mov bl, 5
    div bl              ; AL = quotient (avg)
    mov avg, al

    call PrintNumber

    mov ah, 4ch
    int 21h

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

end main
