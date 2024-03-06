;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32ax.inc'

section '.data' data readable writeable
nombre: dt ?
edad dd ?
        
section '.code' code readable executable

start:
        ;AQUI VA EL CODIGO DEL PROGRAMA
        cinvoke printf, "Teclea tu nombre: ",10
        cinvoke scanf,"%s",nombre
        cinvoke printf, "Teclea tu edad: ",10
        cinvoke scanf,"%d",edad
        cinvoke printf, "tu nombre es:  %s %c", nombre,10
        cinvoke printf, "tu edad es: %d %c ",[edad],10



        
        ;TERMINAR PROGRAMA
        invoke ExitProcess,0

section '.idata' import data readable writeable
      library kernel,'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
      import kernel, ExitProcess,'ExitProcess'
      import msvcrt,\
           printf,'printf',\ 
           scanf, 'scanf'
