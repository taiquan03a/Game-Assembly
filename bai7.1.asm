.model small
.stack 100h
.data
    tb1 db 10,13,'nhap so thap phan: $'
    tb2 db 10,13,'so dang nhi phan la: $'
    str db 5 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    ;int tb1
    mov ah,9
    lea dx,tb1
    int 21h 
    
    ;nhap str
    mov ah,10
    lea dx,str
    int 21h
    
    lea si,str+2   ;lay dia chi phan tu dau tien cua str
    mov cl,str+1   ;lay so luong phan tu trong str
    mov ch,0       
    mov al,0
    mov bl,10
    mov bh,0  ; coi khoi tao dem so luong phan tu trong nhi phan
    lap1:
        mul bl        ;al=al*10
        mov dl,[si]   ;dl = gia tri hien tai str
        sub dl,'0'    ;chuyen sang so
        add al,dl     ;al = al + dl
        inc si
        loop lap1
    
    mov cl,2 
    lap2:
        mov ah,0     ;phan du =0
        div cl       ;al/2
        push ax      ;day ax vao stack
        inc bh       ;tang gia tri dem
        cmp al,0     ;neu al != tiep tuc lap
        jne lap2
    ;in tb2
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,2 
    mov cl,bh     ;cl = dem
    xuat:
        pop dx     ;pop gia tri trong stack
        mov dl,dh  
        add dl,'0' ;chuyen so
        int 21h
        loop xuat
    
    mov ah,4ch
    int 21h
    main endp
end
    