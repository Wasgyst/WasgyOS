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
xor ax, ax
mov di, ax
mov ax, 0x1f00
mov cx, 2000
rep stosw
xor ax, ax
mov es, ax
mov di, ax
mov si, msg
fixESfortext:
  mov ax, 0xb800
  mov es, ax
  jmp printcontinue
fixDIfortext:
  xor di, di
  jmp printcontinue1
print:
  lodsw
  cmp al, 0
  je done
  push ax
  mov ax, es
  cmp ax, 0xb800
  jne fixESfortext
  printcontinue:
  cmp di, 1999
  ja fixDIfortext
  printcontinue1:
  stosw
  jmp print
done:
  jmp $
msg:db 0x1f, "H", 0x1f, "e", 0x1f, "l", 0x1f, "l", 0x1f,  "o", 0x1f, " ", 0x1f, "W", 0x1f, "o", 0x1f, "r", 0x1f, "l", 0x1f, "d", 0x1f, "!", 0, 0
times 510-($-$$) db 0
dw 0x55AA
