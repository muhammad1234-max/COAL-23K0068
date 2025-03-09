MOV AX, 7FF0h    ; Load AX with 7FF0h
ADD AL, 10h      ; CF = 1  SF = 0  ZF = 1  OF = 0
ADD AH, 1        ; CF = 0  SF = 1  ZF = 0  OF = 1
ADD AX, 2        ; CF = 0  SF = 1  ZF = 0  OF = 0
