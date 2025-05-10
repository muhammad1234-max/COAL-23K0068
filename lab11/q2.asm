mov ax, -128        ; AX = FF80h
mov eax, eax        ; clear upper 16 bits

shl eax, 16         ; Shift AX to high word => EAX = FF800000h
sar eax, 16         ; Arithmetic shift right (sign extend) => EAX = FFFFFF80h
