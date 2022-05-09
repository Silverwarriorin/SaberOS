    org $00
    
    call init_lcd
    ld hl,hello_world
    call send_string
    jp inf_loop
;Add sufficient delay
init_lcd:
    ld a,%00110000
    call send_single
    
    ld a,%00110000
    call send_single
    
    ld a,%00110000
    call send_single
    
    ld a,%00100000
    call send_single
    
    ld a,%00101000
    call send_cmd
    
    ld a,%00001000
    call send_cmd
    
    ld a,%00000001
    call send_cmd
    
    ld a,%00000100
    call send_cmd
    
    ld a,%00001111
    call send_cmd
    
    ret

inf_loop:
    in a,(0)
    call send_let
    jp inf_loop
send_cmd:   ld b,a 
    set 0,a
    res 1,a
    res 2,a
    res 3,a
    out (0),a
    
    res 0,a
    out (0),a
    ld a,b
    rlc a
    rlc a
    rlc a
    rlc a
    set 0,a
    res 1,a
    res 2,a
    res 3,a
    out (0),a
    
    res 0,a
    out (0),a
    ret
send_let: ld b,a 
    set 0,a
    set 1,a
    res 2,a
    res 3,a
    out (0),a
    
    res 0,a
    out (0),a
    ld a,b
    rlc a
    rlc a
    rlc a
    rlc a
    set 0,a
    set 1,a
    res 2,a
    res 3,a
    out (0),a
    
    res 0,a
    out (0),a
    ret

send_single:
    set 0,a
    out (0),a
    
    res 0,a
    out (0),a
    ret

send_string:
    ld a,(hl)
    and a
    ret z
    ld b,a 
    set 0,a
    set 1,a
    res 2,a
    res 3,a
    out (0),a
    
    res 0,a
    out (0),a
    ld a,b
    rlc a
    rlc a
    rlc a
    rlc a
    set 0,a
    set 1,a
    res 2,a
    res 3,a
    out (0),a
    
    res 0,a
    out (0),a
    inc hl
    jp send_string




hello_world:    defm    "Hello World!",0