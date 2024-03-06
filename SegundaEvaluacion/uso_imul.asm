;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32ax.inc'

section '.data' data readable writeable
num1: db ?
section '.code' code readable executable

start:
        ;AQUI VA EL CODIGO DEL PROGRAMA
        cinvoke printf, "Teclea el primer numero: ",10
        cinvoke scanf,"%d",num1
        mov eax, [num1] ;

        imul eax, 3 ; En imul, el resultado se puede hacer directamente con el numero que le proporcionemos. Este no necesariamente debe de cargarse en un registro

        cinvoke printf, "El resultado es: %d %c" , eax, 10


        ;TERMINAR PROGRAMA
        invoke ExitProcess,0

section '.idata' import data readable writeable
    library kernel,'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
    import kernel, ExitProcess,'ExitProcess'
    import msvcrt,\
        printf,'printf',\ 
        scanf, 'scanf'