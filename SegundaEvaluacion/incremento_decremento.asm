;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32ax.inc'

section '.data' data readable writeable
num1: dd ?
num2: dd ?
section '.code' code readable executable

start:
        ;AQUI VA EL CODIGO DEL PROGRAMA

        ; Las funciones INC y DEC funcionan para incrementar o decrementar el valor de una variable o registro en 1. Practicamente siendo utiles para aplicaciones de contadores

        cinvoke printf, "Teclea el primer numero: ",10
        cinvoke scanf,"%d",num1
        cinvoke printf, "Teclea el segundo numero: ",10
        cinvoke scanf,"%d",num2

        mov eax, [num1] ;
        inc eax
        cinvoke printf, "El resultado es: %d %c" , eax, 10
        mov eax, 0 ; Se limpia el acumulador

        mov eax, [num2]
        dec eax

        cinvoke printf, "El resultado es: %d %c" , eax, 10


        ;TERMINAR PROGRAMA
        invoke ExitProcess,0

section '.idata' import data readable writeable
    library kernel,'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
    import kernel, ExitProcess,'ExitProcess'
    import msvcrt,\
        printf,'printf',\ 
        scanf, 'scanf'