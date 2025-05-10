; Assume AX and BX initialized
mov cx, ax
and cx, 1           ; Get LSB
shl cx, 15          ; Move to MSB position (bit 15)
and bx, 7FFFh       ; Clear MSB of BX
or bx, cx           ; Set MSB using cx


; Assume AX and BX initialized
mov cx, 1           ; Shift 1 bit
shrd bx, ax, cl     ; BX = (BX >> 1) | (AX LSB into MSB of BX)
