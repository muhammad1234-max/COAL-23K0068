INCLUDE Irvine32.inc

.DATA
    numEmployees EQU 5         ; Number of employees

    ; Arrays to store employee details
    empID      DWORD numEmployees DUP(?)
    empName    BYTE  numEmployees DUP(30 DUP(?))  ; 30-byte names
    birthYear  DWORD numEmployees DUP(?)
    salary     DWORD numEmployees DUP(?)

    totalSalary DWORD 0
    msgEmpID   BYTE "Enter Employee ID: ", 0
    msgEmpName BYTE "Enter Employee Name: ", 0
    msgBirthYr BYTE "Enter Year of Birth: ", 0
    msgSalary  BYTE "Enter Annual Salary: ", 0
    msgTotal   BYTE "Total Annual Salary of all employees: ", 0

    newline    BYTE 0Dh, 0Ah, 0   ; Newline for formatting output

.CODE
main PROC
    ; Take input for all employees
    MOV ECX, numEmployees
    XOR ESI, ESI  ; Index for arrays

InputLoop:
    ; Prompt and take Employee ID
    MOV EDX, OFFSET msgEmpID
    CALL WriteString
    CALL ReadInt
    MOV empID[ESI * 4], EAX

    ; Prompt and take Employee Name
    MOV EDX, OFFSET msgEmpName
    CALL WriteString
    MOV EDX, OFFSET empName[ESI * 30]
    MOV ECX, 30
    CALL ReadString

    ; Prompt and take Year of Birth
    MOV EDX, OFFSET msgBirthYr
    CALL WriteString
    CALL ReadInt
    MOV birthYear[ESI * 4], EAX

    ; Prompt and take Annual Salary
    MOV EDX, OFFSET msgSalary
    CALL WriteString
    CALL ReadInt
    MOV salary[ESI * 4], EAX

    INC ESI
    LOOP InputLoop

    ; Calculate total salary
    XOR EAX, EAX
    MOV ECX, numEmployees
    XOR ESI, ESI

CalcTotalSalary:
    ADD EAX, salary[ESI * 4]
    INC ESI
    LOOP CalcTotalSalary

    MOV totalSalary, EAX  ; Store total salary

    ; Display total salary
    CALL Crlf
    MOV EDX, OFFSET msgTotal
    CALL WriteString
    MOV EAX, totalSalary
    CALL WriteInt

    ; Exit program
    CALL ExitProcess, 0

main ENDP
END main
