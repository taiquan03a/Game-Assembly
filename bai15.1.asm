.model small
.stack 100h

.data
    arr db 100 dup('$')
    n db 50 dup('$')
    count db 0  
    tb0 db 10,13,'nhap so luong phan tu: $'
    tb01 db 10,13,'nhap cac phan tu: $'
    tb1 db 10,13,'so luong so chia het cho 11 la: $'
    tb2 db 10,13,'tong cua mang la: $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;in tb0
    mov ah,9
    lea dx,tb0
    int 21h
    ;nhap n
    mov ah,10
    lea dx,n
    int 21h
    lea si,n+2   ;lay dia chi phan tu dau tien cua str
    mov cl,n+1   ;lay so luong phan tu trong str
    mov ch,0       
    mov al,0
    mov bl,10
    mov bh,0  ; coi khoi tao dem so luong phan tu trong nhi phan
    
    ;chuyen n tu string sang int
    input1:
        mul bl        ;al=al*10
        mov dl,[si]   ;dl = gia tri hien tai str
        sub dl,'0'    ;chuyen sang so
        add al,dl     ;al = al + dl
        inc si
        loop input1
        
    mov cl,al       
    mov dl,al
    mov dh,0
    push dx    ;day n vao stack
    
    ;in tb01
    mov ah,9
    lea dx,tb01
    int 21h
    
    ;nhap cac phan tu cua mang
    mov ch,0
    lea di,arr   ;di lay dia chi dau tien cua arr
    
    mov dl,0
    mov bh,10
    input2: 
        next:
        mov ah,1
        int 21h 
        cmp al,20h    ;neu la dau cach thi nhay nhan next2
        je next2      
        ;chuyen arr[i] tu string sang int
        sub al,'0'    ;chuyen al tu ky tu sang so
        mov bl,al     
        mov al,dl     
        mul bh        ;al=al*10
        add al,bl     ;al=al+bl
        mov dl,al     ;luu al vao dl
        jmp next      ;nhay nhan next
        next2:
        cmp dl,0      ;neu dl=0 nhay input2
        je input2
        mov [di],dl   ;gia tri cua dia chi di = dl
        mov dl,0
        mov bh,10
        inc di
        loop input2
        
    
    pop dx        ;lay gia tri n
    mov cx,dx
    
    lea si,arr          ;lay dia chi phan tu dau tien cua mang
    mov al,[si]         ;lay gia tri dau tien cua mang al = 11
    mov bl,count        ;gan bl = count =0
    mov dl,11           ;dl = 11
    mov bh,0
    
    ;duyet qua cac phan tu trong mang
    lap:
        mov al,[si]         ;al gan gia tri cua mang, si++
        add bh,al      ;bh = bh + al
        mov ah,0       ;gan ah = 0
        div dl         ; al = al/dl , ah la phan du cua phep chia
        cmp ah,0       ;so sanh ah voi 0
        jne continue   ;neu ah != 0 nhay den nhan continue
        inc bl         ;neu ah == 0 bl++
        continue:
        inc si
        loop lap 
    
    ;in ra thong bao tb1    
    mov ah,9
    lea dx,tb1
    int 21h
    mov dl,bh
    mov dh,0
    push dx
    
    mov cl,bl
    call xuat
    
    ;in ra thong bao tb2
    mov ah,9
    lea dx,tb2
    int 21h 
    
    pop dx
    mov cl,dl
    call xuat
    
    mov ah, 4Ch   ; k?t thúc chýõng tr?nh
    int 21h
    main endp
    ;ham xuat
    xuat proc    
    ;gan gia tri xuat vao al
    mov ax,0
    mov al,cl
    mov cx,0
    mov bx,10 
    ;push cac chu so cua ket qua vao stack
    lap1:
        mov dx,0  
        xor ah,ah ;ah=0
        div bx
        push dx
        inc cx
        cmp ax,0
        jnz lap1
    mov ah,2
    ;pop va in cac chu so cua ket qua
    lap2:
        pop dx
        add dl,'0'
        int 21h
        loop lap2
    ret
    xuat endp
    
end main
