[org 0x7c00]
cli
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov ax, 0x7c00
mov sp, ax
mov bp, ax
sti
mov ax, 0xb800
mov ds, ax
xor ax, ax
mov di, ax
mov ax, 0x1f00
mov cx, 2000
rep stosw
xor ax, ax
mov ds, ax
mov di, ax
mov si, msg
print:
  lodsb
  cmp al, 0
  je done
  mov ah, 0x0e
  int 0x10
done:
  jmp $
msg: db "Hello World!", 0
times 510-($-$$) db 0
dw 0x55AA
