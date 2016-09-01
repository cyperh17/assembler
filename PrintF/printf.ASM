format mz

jmp start

printf:
	push bp
	mov bp, sp
	push ax
	push bx

	mov ax, cs
	mov ds, ax

	mov bx, [ss:bp+4]
	mov [text+0], 37h
	mov [text+1], 24h

	mov dx, text

	mov ah, 9h
	int 21h

	pop bx
	pop ax
	pop bp
ret

plus:
	push bp
	mov bp, sp
	push ax
	push bx

	mov ax, [ss:bp+4]
	mov bx, [ss:bp+6]
	add ax, bx
	mov [ss:bp+4], ax

	pop bx
	pop ax
	pop bp
ret

start:
	push 23
	push 11

	call plus

	pop bx
	pop ax

	push bx

	call printf

	pop bx
exit:
	mov ax, 4c00h
	int 21h

text db ?