; MOV AX 3d      ;  Error: Missing comma between operands.
MOV AX, 3Dh      ;  Fixed: Added a comma.

    ; MOV 23, AX     ;  Error: First operand cannot be an immediate value.
    MOV [23h], AX    ;  Fixed: Using memory address instead.

    ; MOV CX, CH     ;  Error: Cannot move an 8-bit register (CH) into a 16-bit register (CX).
    MOV CL, CH       ;  Fixed: Moving between registers of the same size.

    ; MOVE AX, 1h    ;  Error: "MOVE" is an invalid instruction (should be MOV).
    MOV AX, 1h       ;  Fixed: Changed "MOVE" to "MOV".

    ; ADD 2, CX      ;  Error: Immediate value cannot be the destination.
    ADD CX, 2        ;  Fixed: Correct order (destination first).

    ; ADD 3, 6       ;  Error: Both operands cannot be immediate values.
    MOV AX, 3        ;  Fixed: Store value in register first.
    ADD AX, 6

    ; INC AX, 2      ;  Error: INC only increments by 1 and does not accept an immediate operand.
    ADD AX, 2        ;  Fixed: Used ADD instead of INC for a custom increment.
