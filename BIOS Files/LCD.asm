    org $00

    nop
    nop
    nop
;Add sufficient delay
    ld a,%00110000
    call send_cmd
    nop
    ld a,%00110000
    call send_cmd
    nop
    ld a,%00110000
    call send_cmd

    nop
    ld a,%00100001
    call send_cmd

    nop



    nop
    ld a,%00101000
    call send_cmd
    
    

    nop
    ld a,%00001000
    call send_cmd
    
    
    nop
    ld a,%00000001
    call send_cmd

    
    



    nop
    ld a,%00000001
    out (0),a
    ld a,%00000000
    out (0),a
    nop
    ld a,%01100001
    out (0),a
    ld a,%00000000
    out (0),a
    nop
    


    nop
    ld a,%00000001
    out (0),a
    ld a,%00000000
    out (0),a
    nop
    ld a,%11110001
    out (0),a
    ld a,%00000000
    out (0),a
    
    nop
    ld a,%01000011
    out (0),a
    ld a,%00000000
    out (0),a
    nop
    ld a,%10000011
    out (0),a
    ld a,%00000000
    out (0),a
    nop

    ld hl,%0110001101010011
    call send_let
    

inf_loop:
    nop
    jp nz,inf_loop
send_cmd:   ld b,a 
    set 0,a
    res 1,a
    res 2,a
    res 3,a
    out (0),a
    ;delay
    ld a,$00
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
    ;delay
    ld a,$00
    out (0),a
    ret
send_let: ld b,a 
    set 0,a
    set 1,a
    res 2,a
    res 3,a
    out (0),a
    ;delay
    ld a,$00
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
    ;delay
    ld a,$00
    out (0),a
    ret


