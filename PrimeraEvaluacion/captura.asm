;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable


pedir1 db 'Teclea el primer numero: \n', 0 
pedir2 db 'Teclea el segundo numero: \n', 0 

section '.code' code readable executable

start:
        ;AQUI VA EL CODIGO DEL PROGRAMA
        mov esi, pedir1
        call print_str
        

        call read_hex
        mov edx, eax    
        
        
        mov esi, pedir2
        call print_str
        

        call read_hex
        add eax, edx    


        call print_eax

        ;TERMINAR PROGRAMA
        push 0
        call [ExitProcess]

include 'training.inc'



