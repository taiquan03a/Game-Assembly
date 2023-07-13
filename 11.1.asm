.model small
.stack 100h
.data
arr db 100 dup('$')  
cnt equ ($-arr) 
n db 50 dup('$')
tb0 db 10,13,'nhap so luong phan tu: $'
tb01 db 10,13,'nhap cac phan tu: $'               
tb1 db 10,13,'Gia tri lon nhat la:$'
tb2 db 10,13,'Gia tri nho nhat la:$'  
max db ?
min db ?
.code
main proc
    mov ax, @data ; khai bao dia chi cua phan vung du lieu
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
    mov bh,0  khoi tao dem so luong phan tu trong nhi phan
    
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
        
    ;khoi tao tinh min,max
    pop dx        ;lay gia tri n
    mov cx,dx
    lea si,arr    ;si lay dia chi dau tien cua arr
    mov bl,[si]
    mov bh,[si]
    mov max,bl
    mov min,bh
    inc si
    
    lap:
        lodsb        ;duyet qua cac gia tri cua arr
        mov bl,max     
        cmp bl,al    ;neu max >= arr[i],nhay nhan continue1
        jge continue1
        mov max,al   ;neu max <= arr[i],cap nhap max
        continue1:  
        mov bh,min     
        cmp bh,al    ;neu min >= arr[i],nhay nhan continue2
        jl continue2
        mov min,al   ;neu min<= arr[i] cap nhap min
        continue2:        
        loop lap
         
        ;in tb1
        mov ah,9
        lea dx,tb1
        int 21h
        
        ;in max
        mov cl,bl
        call xuat
        
        ;in tb2
        mov ah,9
        lea dx,tb2
        int 21h
        
        ;in min
        mov cl,min
        call xuat
   mov ah,4ch
   int 21h
         
   main endp

   ;ham xuat 
   xuat proc
    mov al,cl   ;gan gia tri xuat vao al
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
end
        


