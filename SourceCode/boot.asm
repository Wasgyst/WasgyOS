[org 0x7c00]
cli
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00
sti
mov ax, 0x0003
int 0x10
mov ax, 0xb800
mov es, ax
xor di, di
mov ax, 0x1f00
mov cx, 2000
rep stosw
xor di, di
mov si, msg
print:
  lodsb
  cmp al, 0
  je done
  mov ah, 0x1f
  stosw
  jmp print
done:
  jmp $
msg: db "Hello World!", 0
times 510-($-$$) db 0
dw 0x55AA
