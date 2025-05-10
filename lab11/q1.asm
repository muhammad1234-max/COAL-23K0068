; EAX contains original number
mov ebx, eax        ; Copy EAX to EBX

shl eax, 4          ; EAX = EAX * 16
mov ecx, ebx        
shl ecx, 1          ; ECX = EBX * 2
add eax, ecx        ; EAX += ECX
add eax, ebx        ; EAX += original => Total = EAX * 21
