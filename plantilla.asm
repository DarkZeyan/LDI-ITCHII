;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable

str_ins db 'hola mundo', 0dh, 0ah, 0h

section '.code' code readable executable

start:
        ;AQUI VA EL CODIGO DEL PROGRAMA
        mov  esi, str_ins
        call print_str
        ;TERMINAR PROGRAMA
        push 0
        call [ExitProcess]

include 'training.inc'



