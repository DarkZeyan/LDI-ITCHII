format PE GUI 4.0
entry start

include 'win32a.inc'

section '.code' executable readable writeable

start: 
    push 0
    push titulo
    push saludo
    push 0
    
    call [MessageBox]
    push 0
    call [ExitProcess]

section '.data' data readable writeable

titulo db 'Hola', 0
saludo db 'Hello World',0

section '.idata' import data readable
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
