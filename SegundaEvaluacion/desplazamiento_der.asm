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
        shr eax, 1 ; El desplazamiento a la derecha posiciona los bits del numero especificado hacia la derecha, esto provoca que su valor se reduzca a la mitad.
        ; El primer valor a recibir es el registro a alterar, el segundo es el numero de posiciones a desplazar
        cinvoke printf, "El resultado es: %d %c",eax,10

        invoke ExitProcess,0

section '.idata' import data readable writeable
        library kernel,'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
        import kernel, ExitProcess,'ExitProcess'
        import msvcrt,\
                printf,'printf',\ 
                scanf, 'scanf'