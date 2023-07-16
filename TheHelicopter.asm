.model small
.stack 64
.data
	seed   dw 13666
	two    dw 2
	ten    dw 10
	fifty  dw 50
	file_name    DB "high.txt",0             
	file_handler DW ?
	input_name        LABEL BYTE
	input_name_max    DB    11
	input_name_act    DB    ?
	high_score_player DB    11 DUP(' ')
	front_screen_page_number db 0
	back_screen_page_number db 1
	char_for_print_as_ascii db ?
	row_for_print_as_ascii db ?
	col_for_print_as_ascii db ?
	;helicopter image
	heli_image_1   db 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h ;19x9
				   db 08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,00h,00h,00h,00h
				   db 04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,03h,03h,00h,00h,00h
				   db 00h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,03h,03h,03h,03h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,03h,03h,03h,03h,03h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,03h,03h,03h,03h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,06h,00h,00h,00h,00h,06h,00h,06h,00h,00h,06h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h
 
	heli_image_2   db 00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h ;19x9
				   db 0ch,0ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0ch,00h,00h,00h,00h,00h,00h
				   db 0ch,07h,0ch,00h,00h,00h,00h,00h,00h,00h,00h,0ch,0ch,0ch,08h,08h,00h,00h,00h
				   db 00h,0ch,0ch,0ch,07h,0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch,08h,08h,08h,08h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0ch,0ch,0ch,08h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,07h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,07h,07h,07h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,00h,04h,00h,04h,00h,00h,04h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h
 
	heli_image_3   db 00h,00h,00h,00h,00h,00h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h ;19x9
				   db 07h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,05h,00h,00h,00h,00h,00h,00h
				   db 06h,07h,06h,00h,00h,00h,00h,00h,00h,00h,00h,05h,05h,05h,08h,08h,00h,00h,00h
				   db 00h,06h,05h,06h,05h,05h,05h,05h,05h,06h,05h,06h,05h,08h,08h,08h,08h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,05h,06h,08h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,05h,06h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,07h,00h,00h,00h,00h,07h,00h,07h,00h,00h,07h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,07h,07h,07h,07h,07h,07h,07h,00h
 
    fuel_image     db 00h,00h,00h,00h,00h,00h,07h,07h,07h     ; 12x9
				   db 00h,00h,00h,00h,00h,07h,07h,07h,00h
				   db 00h,00h,0ch,0ch,07h,07h,07h,00h,00h
				   db 00h,0ch,0ch,0ch,0ch,07h,0ch,00h,00h
				   db 0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch,00h
				   db 0ch,0ch,00h,0ch,0ch,0ch,00h,0ch,0ch
				   db 0ch,0ch,0ch,00h,0ch,00h,0ch,0ch,0ch
				   db 0ch,0ch,0ch,0ch,00h,0ch,0ch,0ch,0ch
				   db 0ch,0ch,0ch,00h,0ch,00h,0ch,0ch,0ch
				   db 0ch,0ch,00h,0ch,0ch,0ch,00h,0ch,0ch
				   db 0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch
				   db 00h,0ch,0ch,0ch,0ch,0ch,0ch,0ch,00h
 
	fire_image     db 00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h  ;17x17
				   db 00h,00h,00h,04h,04h,0eh,0eh,0eh,0eh,0eh,0eh,0eh,04h,04h,00h,00h,00h
				   db 00h,00h,04h,0eh,0eh,0eh,0eh,0eh,00h,0eh,0eh,0eh,0eh,0eh,04h,00h,00h
				   db 00h,04h,0eh,0eh,0eh,0eh,0eh,0eh,00h,00h,0eh,0eh,0eh,0eh,0eh,04h,00h
				   db 00h,04h,0eh,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,0eh,0eh,04h,00h
				   db 04h,0eh,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,00h,0eh,0eh,0eh,0eh,0eh,04h
				   db 04h,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,00h,00h,00h,0eh,0eh,0eh,0eh,04h
				   db 04h,0eh,0eh,00h,0eh,00h,00h,00h,00h,0eh,00h,00h,0eh,00h,0eh,0eh,04h
				   db 04h,0eh,0eh,00h,00h,00h,00h,00h,0eh,00h,00h,00h,00h,00h,0eh,0eh,04h
				   db 04h,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,00h,00h,00h,00h,0eh,0eh,0eh,04h
				   db 04h,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,00h,0eh,00h,0eh,0eh,00h,0eh,04h
				   db 04h,0eh,00h,00h,0eh,00h,00h,00h,0eh,0eh,0eh,00h,00h,00h,00h,0eh,04h
				   db 00h,04h,0eh,00h,00h,00h,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,0eh,04h,00h
				   db 00h,04h,0eh,0eh,00h,00h,00h,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,04h,00h
				   db 00h,00h,04h,0eh,0eh,0eh,00h,00h,00h,00h,00h,0eh,0eh,0eh,04h,00h,00h
				   db 00h,00h,00h,04h,04h,0eh,0eh,0eh,0eh,0eh,0eh,0eh,04h,04h,00h,00h,00h
				   db 00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h
 

	heli_x   		dw ?
	heli_y   		dw ?
	heli_fall_speed dw ?
	heli_jump_speed dw ?
	heli_width 		dw ?
	heli_height     dw ?
	heli_image_start_address dw ?
 
	top_cave_pos_y     db 320 dup(?)
	bottom_cave_pos_y  db 320 dup(?)
	cave_velocity      dw ?
	cave_gradient      db ?
	cave_color         db 0FH
	.cave_ending       dw ?
	cave_direction     db ? ;0 = down, 1 = up
	high_score    dw ?
	current_score dw 0
	fuel_count  db ?
	loop_block_count db ?
	lose_fuel_score_mark dw ?
 
	fuel_pos_y dw ?
	fuel_pos_x dw ?
	fuel_image_width dw ?
	fuel_image_height dw ?
	fuel_exist db 1
 
	fire_pos_y dw ?
	fire_pos_x dw ?
	fire_image_width dw ?
	fire_image_height dw ?
 
	fuel_block_pos_x dw ?
	fuel_block_pos_y dw ?
	;string message
	.interface_msg1 db "Score:"
	.start_screen_msg1 db "The Helicopter Game"
	.start_screen_msg2 db "Press any key to fly up  "
	.start_screen_msg3 db "Release to fall down     "
	.start_screen_msg4 db "Press 1/2/3 to change color"
	.start_screen_msg5 db "Highscore:"
	.start_screen_msg6 db "By Player:"
	.game_over_msg1 db "GAME OVER!!!!"
	.game_over_msg2 db "SPACE - TRY AGAIN"
	.game_over_msg3 db "  ESC - EXIT     "
 
	.game_over_msg4 db "   CONGRATULATION      "
	.game_over_msg5 db "YOU WON PLAYER "
	.game_over_msg6 db "YOUR NAME > "
 
;------------------------------------------------------------------------------------------code segment start------------------------------------------------------------------------------------ 
.code
main proc
	mov ax,@data
    mov ds,ax
	mov es,ax
	mov heli_image_start_address, offset heli_image_1
	call randomize_seed
	start:
	call initialize_variable
	call set_video_mode
	call start_screen
	loop_frame:
		call spawn_heli			
		call spawn_cave			
		call spawn_fuel			
		call print_interface	
		call flip_screen		
	    call check_collision
		cmp al,1
			je lose    
		cmp al,0
			je no_collision
		collide_with_fuel:	
		inc fuel_count
		mov fuel_exist,0
		mov fuel_pos_x,1   
		no_collision:
		add current_score,1
		call decrease_fuel_count	
		call update_difficulty
		mov dx, 1       
		call sleep
		call clear_back_screen
		jmp loop_frame
	lose:
		call game_over_screen
		jc start	
		call exit	
main endp
 
 
; ==================================

decrease_fuel_count proc
	cmp fuel_count,0 
	je no_need_decrease
	mov ax, current_score
	mov dx,0
	div lose_fuel_score_mark			       
	cmp dl,0			
	je reach_score_mark
	ret
	reach_score_mark:
		dec fuel_count
		ret
	no_need_decrease:
		ret
decrease_fuel_count endp
; ==================================

spawn_fuel proc
	mov ax,current_score
	mov dx,0
	div fifty	    
	cmp dl,0
	je put_fuel_to_right_side
	continue_spawn_fuel:
	call draw_fuel
	ret
 
	put_fuel_to_right_side:
		mov fuel_pos_x,310
		mov ah,0
		mov al,top_cave_pos_y[310]
		mov fuel_pos_y,ax
		add fuel_pos_y,30
		mov fuel_exist,1
		jmp continue_spawn_fuel
spawn_fuel endp
 
; ==================================

draw_fuel proc
	cmp fuel_exist,1
	je proceed_draw_fuel		
		ret				
	proceed_draw_fuel:
	mov cx,fuel_pos_x 
	mov dx,fuel_pos_y 
	mov si,offset fuel_image     
	draw_fuel_horizontal:
		mov al,[si]    
		cmp al,00h     
			je skip_draw_pixel_2
		mov ah,0ch 
		mov bh,back_screen_page_number 
		int 10h    
		skip_draw_pixel_2:
		inc si
		inc cx     
		mov ax,cx          
		sub ax,fuel_pos_x
		cmp ax,fuel_image_width
			jng draw_fuel_horizontal
 
		mov cx,fuel_pos_x 
		inc dx       
 
		mov ax,dx              
		sub ax,fuel_pos_y
		cmp ax,fuel_image_height
			jng draw_fuel_horizontal
 
	mov ax,cave_velocity	
	sub fuel_pos_x,ax
	js fuel_out_of_bound   
	ret
	fuel_out_of_bound:
		mov fuel_exist,0
	ret
draw_fuel endp
 
; ==================================

initialize_variable proc	
	mov heli_x,50 			
	mov heli_y,100			
	mov heli_fall_speed,5	
	mov heli_jump_speed,8   
	mov heli_width,18       
	mov heli_height,8		
	mov cave_velocity,10	
	mov cave_gradient,1		
	mov cave_color,0fh
	mov current_score,0
	mov si,0
	mov cx,320
	.reset_top_cave_pos:			
		mov top_cave_pos_y[si],40
		inc si
		loop .reset_top_cave_pos
 
	mov si,0
	mov cx,320
	.reset_bottom_cave_pos:			
		mov bottom_cave_pos_y[si],160
		inc si
		loop .reset_bottom_cave_pos
 
	call read_highscore_from_file		
 
	mov fuel_pos_x,300 			
	mov fuel_pos_y,100			
	mov fuel_image_width,8      
	mov fuel_image_height,11		
 
	mov fire_pos_x,15 			
	mov fire_pos_y,18		
	mov fire_image_width,16     
	mov fire_image_height,16		
 
	mov fuel_count,1
	mov lose_fuel_score_mark,100
	ret
initialize_variable endp
 
; ==================================

start_screen proc	
 .start_screen_begin:
	call draw_heli
	call draw_cave
 
	mov ax,1300h          
	mov bh,back_screen_page_number 
	mov bl,1011b			
	lea bp,.start_screen_msg1
	mov cx,19				
	mov dh,2				
	mov dl,10				
	int 10h
 
	mov ax,1300h
	mov bh,back_screen_page_number
	mov bl,1011b			
	lea bp,.start_screen_msg2
	mov cx,25				
	mov dh,11				
	mov dl,12				
	int 10h
 
	mov ax,1300h
	mov bh,back_screen_page_number  
	mov bl,1011b			
	lea bp,.start_screen_msg3
	mov cx,25				
	mov dh,12				
	mov dl,12				
	int 10h
 
	mov ax,1300h
	mov bh,back_screen_page_number  
	mov bl,1011b			
	lea bp,.start_screen_msg4
	mov cx,27				
	mov dh,13				
	mov dl,12				
	int 10h
 
	mov ax,1300h
	mov bh,back_screen_page_number  
	mov bl,1011b			
	lea bp,.start_screen_msg5
	mov cx,10				
	mov dh,22				
	mov dl,2				
	int 10h
 
	mov ax,high_score			
	mov row_for_print_as_ascii,22
	mov col_for_print_as_ascii,12
	call print_as_ascii
 
	mov ax,1300h
	mov bh,back_screen_page_number 
	mov bl,1011b			
	lea bp,.start_screen_msg6
	mov cx,10				
	mov dh,22				
	mov dl,18				
	int 10h
 
	mov ax,1300h
	mov bh,back_screen_page_number 
	mov bl,1111b			
	lea bp,high_score_player 
	mov ch,0
	mov cl,input_name_act				
	mov dh,22				
	mov dl,28				
	int 10h
 
	call flip_screen
	mov ah,07h
	int 21h
	cmp al,31h
		je change_to_heli_image_1
	cmp al,32h
		je change_to_heli_image_2
	cmp al,33h
		je change_to_heli_image_3
	ret
	change_to_heli_image_1:
		mov heli_image_start_address, offset heli_image_1
		jmp .start_screen_begin
 
	change_to_heli_image_2:
		mov heli_image_start_address, offset heli_image_2
		jmp .start_screen_begin
 
	change_to_heli_image_3:
		mov heli_image_start_address, offset heli_image_3
		jmp .start_screen_begin
start_screen endp
 
; ==================================

update_difficulty proc		
	cmp current_score,100
		je phase_1
	cmp current_score,200
		je phase_2
	cmp current_score,300
		je phase_3
	cmp current_score,400
		je phase_4
	cmp current_score,500
		je phase_5
	cmp current_score,600
		je phase_6
	cmp current_score,700
		je phase_7
	ret
	phase_1:	
		add top_cave_pos_y[319],4			
		sub bottom_cave_pos_y[319],4
		mov cave_gradient, 2
		ret
	phase_2:
		add top_cave_pos_y[319],4			
		sub bottom_cave_pos_y[319],4
		mov cave_color,0eh
		ret
	phase_3:
		add top_cave_pos_y[319],4			
		sub bottom_cave_pos_y[319],4
		ret
	phase_4:
		mov cave_velocity,12
		mov lose_fuel_score_mark,75
		ret
	phase_5:
		mov cave_velocity,14
		mov cave_color,0ch
		ret
	phase_6:
		mov cave_velocity,16
		mov lose_fuel_score_mark,50
		ret
	phase_7:
		mov cave_velocity,18
		mov cave_color,04h
		mov cave_gradient, 3
		ret
update_difficulty endp
 
; ==================================

check_collision proc	
    mov si,heli_width
	add si,50
	mov ax,heli_y
	cmp al,top_cave_pos_y[si]
		jbe collide_with_cave
	cmp al,bottom_cave_pos_y[si]
		jae collide_with_cave

	add ax,heli_height
	cmp al,top_cave_pos_y[si]
		jbe collide_with_cave
	cmp al,bottom_cave_pos_y[si]
		jae collide_with_cave
 
	mov ax,heli_x
	mov bx,fuel_pos_x
	add bx,fuel_image_width
	cmp bx,ax
		jb no_collide
 
	mov ax,heli_x
	add ax,heli_width
	mov bx,fuel_pos_x
	cmp fuel_pos_x,ax
		ja no_collide	
 
	mov ax,heli_y
	mov bx,fuel_pos_y
	add bx,fuel_image_height
	cmp bx,ax
		jb no_collide
 
	mov ax,heli_y
	add ax,heli_height
	mov bx,fuel_pos_y
	cmp fuel_pos_x,ax
		ja no_collide	
 
	mov al,2
	ret
 
	no_collide:
		mov al,0
		ret
 
	collide_with_cave:
		mov al,1
		ret
check_collision endp
 
; ==================================

game_over_screen proc	
	mov ax,current_score
	cmp high_score,ax
	jb broke_record
		mov ah,02h
		mov bh,front_screen_page_number
		mov dh,11			
		mov dl,14			
		int 10h
		mov si,0
		print_game_over_animation:
			mov ah,02h
			mov dl,.game_over_msg1[si]
			int 21h
			mov dx,2		
			call sleep
			inc si
			cmp si,13
			jb print_game_over_animation
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1111b			
		lea bp,.game_over_msg2	
		mov cx,17				
		mov dh,12				
		mov dl,12				
		int 10h
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1111b			
		lea bp,.game_over_msg3	
		mov cx,17				
		mov dh,13				
		mov dl,12				
		int 10h
 
		.get_input_for_end_or_start_again:
			mov ah,07h
			int 21h
 
			cmp al,32
			je play_again
			cmp al,27
			je end_game
			jmp .get_input_for_end_or_start_again
 
		end_game:
			clc
			ret
		play_again:
			stc	
			ret
 
 
	broke_record:
		mov high_score,ax
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1011b			
		lea bp,.game_over_msg4	
		mov cx,23				
		mov dh,12				
		mov dl,10				
		int 10h
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1011b			
		lea bp,.game_over_msg5	
		mov cx,15				
		mov dh,13				
		mov dl,10				
		int 10h
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1111b			
		lea bp,high_score_player 
		mov ch,0
		mov cl,input_name_act				
		mov dh,13				
		mov dl,25				
		int 10h
 
		mov ax,1301h
		mov bh,front_screen_page_number
		mov bl,1011b			
		lea bp,.game_over_msg6	
		mov cx,12				
		mov dh,14				
		mov dl,10				
		int 10h
 
		MOV AH,0AH
		LEA DX,input_name  
		INT 21H
		XOR AH,AH
		MOV AL,input_name_act
		MOV SI,AX         
		MOV high_score_player[SI],' '
 
		call write_highscore_to_file
		stc
		ret
game_over_screen endp
 
 
; ==================================

print_interface proc	
	mov ax,1300h
	mov bh,back_screen_page_number 
	mov bl,1011b			
	lea bp,.interface_msg1		
	mov cx,6				
	mov dh,1				
	mov dl,2				
	int 10h
	mov ax,current_score
	mov row_for_print_as_ascii,1
	mov col_for_print_as_ascii,8
	call print_as_ascii
 
	mov cx,fire_pos_x
	mov dx,fire_pos_y
	mov si,offset fire_image
	draw_fire_interface_horizontal:
		mov al,[si]
		mov ah,0ch
		mov bh,back_screen_page_number
		int 10h
		inc si
		inc cx 
		mov ax,cx
		sub ax,fire_pos_x
		cmp ax,fire_image_width
			jng draw_fire_interface_horizontal
 
		mov cx,fire_pos_x
		inc dx 
 
		mov ax,dx 
		sub ax,fire_pos_y
		cmp ax,fire_image_height
			jng draw_fire_interface_horizontal
 
	cmp fuel_count,0
	je no_need_print_fuel_block
 
	mov al, fuel_count
	mov loop_block_count,al
 
	mov fuel_block_pos_x,36
	mov fuel_block_pos_y,18
	print_fuel_block:
		mov cx,fuel_block_pos_x
		mov dx,fuel_block_pos_y
		draw_fuel_block_horizontal:
			mov al,0eh
			mov ah,0ch 
			mov bh,back_screen_page_number 
			int 10h
			inc cx
			mov ax,cx
			sub ax,fuel_block_pos_x
			cmp ax,5
				jng draw_fuel_block_horizontal
 
			mov cx,fuel_block_pos_x
			inc dx 
 
			mov ax,dx
			sub ax,fuel_block_pos_y
			cmp ax,15 
				jng draw_fuel_block_horizontal
 
		add fuel_block_pos_x,8
		dec loop_block_count
		cmp loop_block_count,0
		jne print_fuel_block
	ret
	no_need_print_fuel_block:
	ret
print_interface endp
 
 
; ==================================

spawn_cave proc	
	call update_cave_pos
	call draw_cave
	ret
spawn_cave endp
 
 
; ==================================

update_cave_pos proc
	MOV SI,0
	MOV AX, 320	
	SUB AX,cave_velocity
	MOV .cave_ending,AX
	shift_cave_to_left: 
		mov di,si
		add di,cave_velocity
		mov al,top_cave_pos_y[di] 
		mov top_cave_pos_y[si],al
		mov al,bottom_cave_pos_y[di] 
		mov bottom_cave_pos_y[si],al
		inc si
		cmp si,.cave_ending
			jb shift_cave_to_left
 
	mov di,si	
	sub di,1
	replace_cave_right_side_position:
		call random   
		mov dx,0
		div two			 
		mov cave_direction, dl 
		mov bl,cave_gradient 
		cmp cave_direction,0
			je downward_cave_pos
		upward_cave_pos:
			neg bl					
		downward_cave_pos:
		mov ah,bottom_cave_pos_y[di] 
		add ah,bl					
		mov al,top_cave_pos_y[di]    
		add al,bl					 
		cmp al,0
			jb cave_out_of_bound
		cmp al,199
			ja cave_out_of_bound
		cmp ah,0
			jb cave_out_of_bound
		cmp ah,199
			ja cave_out_of_bound
 
		mov bottom_cave_pos_y[si],ah
		mov top_cave_pos_y[si],al
 
		end_update_cave_pos:
			inc di
			inc si
			cmp si,320
			jb replace_cave_right_side_position
		ret
		cave_out_of_bound:
			mov ah,bottom_cave_pos_y[di]
			mov bottom_cave_pos_y[si],ah
			mov al,top_cave_pos_y[di]
			mov top_cave_pos_y[si],al
			jmp end_update_cave_pos
update_cave_pos endp
 
 
; ==================================

draw_cave proc
	mov si,0   
	draw_cave_1:
		mov dh,0
		mov dl,top_cave_pos_y[si] 
		draw_top_cave:
			MOV CX,SI 
			mov ah,0ch 
			mov al,cave_color 
			mov bh,back_screen_page_number
			int 10h    
			sub dl,13  
			cmp dl,top_cave_pos_y[si]
			jb draw_top_cave
 
		mov dh,0
		mov dl,bottom_cave_pos_y[si]  
		draw_bottom_cave:
			MOV CX,SI
			mov ah,0ch 
			mov al,cave_color 
			mov bh,back_screen_page_number 
			int 10h    
			add dl,13	
			cmp dl,199
			jb draw_bottom_cave
		inc si
		cmp si,320
		jb draw_cave_1
	ret
draw_cave endp
 
; ==================================

spawn_heli proc
	cmp fuel_count,0
	je fall 
	call kbhit
		test al,al
		jz fall
		jump:
			mov ax,heli_jump_speed
			sub heli_y, ax
			jmp skip
		fall: 
			mov ax,heli_fall_speed
			add heli_y, ax	
		skip:
			call draw_heli
	ret
spawn_heli endp
 
; ==================================

draw_heli proc
	mov cx,heli_x 
	mov dx,heli_y 
	mov si,heli_image_start_address     
	draw_heli_horizontal:
		mov al,[si]   
		cmp al,00h    
			je skip_draw_pixel
		mov ah,0ch
		mov bh,back_screen_page_number 
		int 10h    
		skip_draw_pixel:
		inc si
		inc cx    
		mov ax,cx         
		sub ax,heli_x
		cmp ax,heli_width
			jng draw_heli_horizontal
 
		mov cx,heli_x
		inc dx       
		mov ax,dx             
		sub ax,heli_y
		cmp ax,heli_height
			jng draw_heli_horizontal
	ret
draw_heli endp
 
; ==================================

read_highscore_from_file proc	
	mov ah,3dh               
	mov al,0h
	lea dx,file_name
	int 21h
	mov file_handler,ax
 
	mov ah,3fh              
	mov bx,file_handler
	mov cx,2
	lea dx,high_score
	int 21h  
 
	mov ah,3fh              
	mov bx,file_handler
	mov cx,1
	lea dx,input_name_act
	int 21h  
 
	mov ah,3fh             
	mov bx,file_handler
	mov cx,11
	lea dx,high_score_player
	int 21h  
 
	mov ah,3eh              
	mov bx,file_handler
	int 21h
	ret
read_highscore_from_file endp
 
 
; ==================================

write_highscore_to_file proc	
	mov ah,3dh              
	mov al,1h
	lea dx,file_name
	int 21h
	mov file_handler,ax
 
	mov ah,40h               
	mov bx,file_handler
	mov cx,2
	lea dx,high_score
	int 21h 
 
	mov ah,40h                 
	mov bx,file_handler
	mov cx,1
	lea dx,input_name_act
	int 21h 
 
	mov ah,40h                
	mov bx,file_handler
	mov cx,11
	lea dx,high_score_player
	int 21h 
 
 
	mov ah,3eh               
	mov bx,file_handler
	int 21h
	ret
write_highscore_to_file endp
 
; ==================================

kbhit proc
	mov al, 0			
	mov ah, 1		
	int 16h			
	jz .kbhit_end			
	mov ax, 0	
	int 16h			
	ret		
 
	.kbhit_end:
		mov ax, 0		
		ret
kbhit endp
 
; =================================

randomize_seed proc
	mov ax, 0			
	int 1Ah			
	mov seed, dx 		
	ret
randomize_seed endp
 
 
; ================================

random proc
	mov ax, seed
	mov dx, 33333
	mul dx				
 
	inc ax				
	mov seed, ax	
	mov ax, dx		
	ret
random endp
 
 
; ============================================================

sleep proc
	mov ax, 0	
	mov bx, dx	
 
	int 1ah		
	add bx, dx	
 
	.wait:
		int 1ah		
		cmp dx, bx
		jne .wait	
		ret
sleep endp
 
; ============================================================

print_as_ascii proc
	push ax			
	push cx
	push dx
 
	xor cx,cx
	xor dx,dx
	mov bx, 10             
 
	div_by_ten:                            
		div ten
		push dx 
		inc cx    
		xor dx,dx
		cmp ax, 0   
		jne div_by_ten                   
 
	display_ascii:     
		xor dx,dx		
		pop dx       
		add dl, 30h             	         
		mov char_for_print_as_ascii, dl
 
		push cx
		mov ax,1300h
		mov bh,back_screen_page_number  
		mov bl,1111b			
		lea bp,char_for_print_as_ascii
		mov cx,1				
		mov dh,row_for_print_as_ascii		
		mov dl,col_for_print_as_ascii		
		int 10h
		pop cx
 
		inc col_for_print_as_ascii
		loop display_ascii  
 
	pop dx			
	pop cx		
	pop ax	
	ret
print_as_ascii endp 
 
flip_screen proc
	mov ah,05h		
	mov al,back_screen_page_number		
	int 10h
 
	xor back_screen_page_number,1
	xor front_screen_page_number,1
	ret
 
	; push ds	
	; push es
	; mov ax, 0a000h
	; mov es, ax
	; xor di, di
 
	; mov ax, 0a200h
	; mov ds, ax
	; xor si, si
 
	; mov cx, 4000 
	; rep movsw  
 
 
	; mov ax, 0a200h
	; mov es, ax        
	; mov ax, 0h  
	; xor di, di      
	; mov cx, 4000
	; rep stosw              
 
	; pop es
	; pop ds
	ret
flip_screen endp
clear_back_screen proc
	push es
	cmp back_screen_page_number,0
	je clear_page_0
	mov ax, 0a200h
	.clear_screen_continue:
	mov es, ax             
	mov ax, 0h   
	xor di, di         
	mov cx, 4000  
	rep stosw           
	mov ax,0600h
	mov bh,61h
	pop es
	ret
	clear_page_0:
		mov ax, 0a000h
		jmp .clear_screen_continue
clear_back_screen endp
set_video_mode proc
	mov ax, 000dh	
	int 10h			
	ret
set_video_mode endp
 
exit proc
	call set_video_mode
	mov ax,4c00h
	int 21h
exit endp
end main 