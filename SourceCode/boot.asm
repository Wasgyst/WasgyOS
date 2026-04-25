[org 0x7c00]
cli
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00
sti
PCPoint: dw 0x0000
mov ax, 0x0003
int 0x10
mov ax, 0xb800
mov es, ax
xor di, di
mov ax, 0x1f00
mov cx, 2000
rep stosw
xor di, di
mov word [PCPoint], continue1
mov si, msg
print:
  lodsb
  cmp al, 0
  je done
  mov ah, 0x0e
  int 0x10
  jmp print
done:
  jmp word [PCPoint]
msg: db "WasgyOS Setup", 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, "PRESS ENTER TO CONTINUE OR ESC TO EXIT", 0
keywait:
mov ah, 0x00
int 0x16
ret
continue1:
call keywait
cmp al, 0xD
je next
cmp al, 0x1B
je exit
jmp continue1
exit:
jmp 0xFFFF:0x0000
next:
jmp $
times 510-($-$$) db 0
dw 0x55AA