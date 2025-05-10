.data
val1 SDWORD ?
val2 SDWORD ?
val3 SDWORD ?

.code
mov eax, val2
cdq                 ; sign-extend EAX into EDX:EAX
idiv val3           ; EAX = val2 / val3
mov esi, eax        ; save result1

mov eax, val1
cdq
idiv val2           ; EAX = val1 / val2
imul esi            ; EAX = result1 * result2

mov val1, eax
