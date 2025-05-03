.model small
.stack 100h
.data
    arr db 25, 70, 33, 90, 60
    minVal db ?

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5
    mov si, 0

    mov al, arr[si]     ; Assume first element is min
    mov minVal, al
    inc si
    dec cx

find_min:
    mov al, arr[si]
    cmp al, minVal
    jge skip
    mov minVal, al
skip:
    inc si
    loop find_min

    mov al, minVal
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
