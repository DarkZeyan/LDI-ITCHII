;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable

pedir1 db 'Teclea el primer numero: ', 0 
pedir2 db 'Teclea el segundo numero: ', 0 
resultado db 'El resultado es: ', 0 

section '.code' code readable executable

start:
        ;AQUI VA EL CODIGO DEL PROGRAMA
        mov esi, pedir1
        call print_str

        call read_int
        mov edx, eax    

        mov esi, pedir2
        call print_str

        call read_int
        add eax, edx    

        mov esi, resultado
        call print_str

        ; Mostrar el resultado en decimal
        mov ebx, eax
        call print_int

        ;TERMINAR PROGRAMA
        push 0
        call [ExitProcess]

include 'training.inc'
