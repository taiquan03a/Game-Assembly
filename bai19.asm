.model small
.stack 100h

.data
    str1 db 'nguyentaiquan$'
    str2 db 'entai$'
    count dw 0
    m db 5
    n db 13
    index dw ?
    dau db 1
    cuoi db 0
    tb1 db 10,13,'xau B khong phai con xau A$'
    tb2 db 10,13,'xau B la con xau A$'
    tb3 db 10,13,'vi tri dau xau B trong xau A la: $'
    tb4 db 10,13,'vi tri cuoi xau B trong xau A la: $'

.code
    mov ax, @data
    mov ds, ax

    lea si, str1  ; Dua dia chi cua chuoi str1 vao thanh ghi SI
    lea di, str2  ; Dua dia chi cua chuoi str2 vao thanh ghi DI
    mov index,di

    mov cl, m     ; Gan gia tri do dai chuoi str2 vao CX
    mov ch, n     ; Gan gia tri do dai chuoi str1 vao BX
    
    mov dh,dau
    mov bl,cuoi 
    cmp [di], '$'
    je endd1       ; Neu chuoi str2 rong thi ket thuc chuong trinh

start:         
    mov al, [di]
    cmp [si], al  ; So sanh ki tu hien tai cua chuoi str1 voi ki tu dau tien cua chuoi str2
    jne next      ; Neu khac nhau, chuyen sang nhan next
    cmp di,index
    jne continue
    mov bh,dh
    continue:
    ;inc si        ; Neu giong nhau, tang thanh ghi SI len 1
    inc di        ; Tang thanh ghi DI len 1 de so sanh tiep ki tu tiep theo cua chuoi str2  
    inc dh
    cmp [di], '$' ; Neu ki tu hien tai cua chuoi str2 la dau ket thuc chuoi chuyen sang nhan foundd 
    je foundd
    inc si
    jmp start     ; Con 0 thi chuyen sang lenh start

next:
    dec ch
    cmp ch, cl    ; neu bx nho hon cx thi thoat
    jl endd1
    inc si        ; tang con tro si toi ki tu khac nhau
    inc dh
    lea di,str2 
    jmp start     ; quay lai lenh start de xet tiep 


endd1: 
    cmp bl,0     ;so sanh vi tri cuoi cung voi 0
    je endd2     ;neu vi tri cuoi == 0 -> B khong phai con A nhay nhan endd2
    ;B la con A
    ;in thong bao B la con A
    
    lea dx,tb2 
    mov ah,9
    int 21h 
    
    ;in thong bao vi tri dau cua B trong A
    lea dx,tb3
    mov ah,9
    int 21h 
    
    ;in vi tri dau cua B trong A
    add bh,'0'
    mov cl,bh
    mov dl, cl
    mov ah,2
    int 21h 
    
    ;in thong bao vi tri ket thuc cua B trong A
    mov ah,9
    lea dx,tb4
    int 21h
    
    ;in ra vi tri ket thuc
    sub bl,1
    add bl,'0'
    mov cl,bl
    mov dl,cl 
    mov ah,2
    int 21h
    
    ;ket thuc chuong trinh
    mov ah, 4ch   
    int 21h 
          
endd2: 
    ;in ra thong bao B khong phai la con A
    mov ah,9
    lea dx,tb1
    int 21h
    
    ;ket thuc chuong trinh
    mov ah,4ch
    int 21h 
    
foundd:
    ;gan vi tri cuoi cho bl
    mov bl,dh
    jmp endd1     ; xet tiep lenh start
    
end