 %macro print 2
    mov edx, %1
    mov ecx, %2
    mov ebx, 1
    mov eax, 4
    int 0x80
%endmacro


section .text

    global _start

_start:
    mov ax, [value]

    and ax, 1
    cmp ax, 0

    je _even


_odd:
    print len1, message1
    jmp _end


_even:
    print len2, message2

_end:

    mov     eax, 1 ;
    int 0x80


section .data
    value db 3
    message1 db "The value is odd", 0xA, 0xD
    len1 equ $ - message1
    message2 db "The value is even", 0xA, 0xD
    len2 equ $ - message2

