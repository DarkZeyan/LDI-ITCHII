;----------------------------------------
; Plantilla para programas en lenguaje
; ensamblador
;----------------------------------------

format PE console
entry start

include 'win32a.inc'
section '.code' code readable executable

start:
        invoke MessageBox, 0 , titulo, saludo, 0
        invoke ExitProcess,0
        ret

section '.data' data readable writeable
titulo db 'Hola',0
saludo   db 'Hello World',0

section '.idata' import data readable writeable

    library kernel, 'KERNEL32.DLL',\
            user, 'USER32.DLL'

    import kernel,\
            ExitProcess, 'ExitProcess'
    import user,\
            MessageBox, 'MessageBoxA'


    ;Terminar programa
    ;push 0
    ;call [ExitProcess]

;include 'training.inc'

