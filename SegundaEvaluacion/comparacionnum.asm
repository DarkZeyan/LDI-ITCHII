
format PE console
entry start

include 'win32ax.inc' ; Se incluye la libreria de windows ax

section '.data' data readable writeable
num1: dd ?  ; Se define la variable num1 con contenido no definido con tamaño dword
num2: dd ?  ; Se define la variable num2 con contenido no definido con tamaño dword

section '.code' code readable executable

start:
        cinvoke printf, "Teclea el primer numero: ",10
        cinvoke scanf, "%d", num1
        cinvoke printf, "Teclea el segundo numero: ",10
        cinvoke scanf, "%d", num2
        mov eax, [num1] ; Se mueve el contenido de la variable num1 al registro eax
        mov ebx, [num2] ; Se mueve el contenido de la variable num2 al registro ebx


        cmp eax,ebx ; Se compara el contenido del registro eax con el del registro ebx;
        je iguales ; En caso de que sean iguales (Su carry sea 0) Se manda a la rutina de iguales    EAX==EBX
        jg mayor ; En caso de que el carry indique que el numero es mayor, se envia a la rutina de mayor EAX>EBX
        jl menor ; Si el numero guardado en eax es menor, se envia a la subrutina de menor EAX<EBX

        

mayor:  ;Rutina para cuando eax sea mayor que ebx
        cinvoke printf, "El numero: %d es mayor %c", eax,10 ; Se imprime eax, ya que es el numero mayor de los dos y se indica, se utiliza %d para imprimir el digito y %c para el salto de linea 
        cinvoke printf, "El numero: %d es menor", ebx,10 ; Se imprime ebx, es el numero menor de los dos y se utiliza %d para posicionar el numero.
        jmp finalizar ; Se envia el flujo del programa a la rutina finalizar
menor: ; Rutina para cuando eax sea menor que ebx
        cinvoke printf, "El numero: %d es menor %c", eax,10 ; Se imprime eax, ya que es el numero menor de los dos y se indica, se utiliza %d para imprimir el digito y %c para el salto de linea 
        cinvoke printf, "El numero: %d es mayor", ebx,10 ; Se imprime ebx, es el numero mayor de los dos y se utiliza %d para posicionar el numero.
        jmp finalizar ; Se envia el flujo del programa a la rutina finalizar
iguales: ; Rutina para cuando el contenido de eax sea el mismo de ebx
        cinvoke printf, "Ambos numeros son iguales",10 ; El carry de diferencia de ambos numeros resultado de la comparacion es 0, por ende se imprime el mensaje de que ambos numeros son iguales
        jmp finalizar  ; Se envia el flujo del programa a la rutina 
finalizar:
        ;TERMINAR PROGRAMA
        invoke ExitProcess,0


section '.idata' import data readable writeable
        library kernel, 'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
        import kernel, ExitProcess,'ExitProcess'
        import msvcrt, \
                printf, 'printf',\ 
                scanf, 'scanf'