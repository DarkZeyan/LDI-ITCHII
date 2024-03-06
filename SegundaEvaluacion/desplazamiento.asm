format PE console
entry start

include 'win32ax.inc'

section '.data' data readable writeable
num1 dd ?

section '.code' code readable executable

start:
        cinvoke printf, "Teclea un numero: ", 10
        cinvoke scanf, "%d", num1
        mov eax, [num1]
        shl eax, 1 ; El desplazamiento a la izquierda altera los bits para moverlos una posicion hacia la izquierda, de tal manera de que un numero sera duplicado.
        ; El primer valor a recibir es el registro a alterar, el segundo es el numero de posiciones a desplazar
        cinvoke printf, "El resultado es: %d %c",eax,10
        
        invoke ExitProcess,0

section '.idata' import data readable writeable
    library kernel,'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
    import kernel, ExitProcess,'ExitProcess'
    import msvcrt,\
        printf,'printf',\ 
        scanf, 'scanf'