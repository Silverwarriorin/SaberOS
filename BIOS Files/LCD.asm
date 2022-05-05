    org $00

    nop
    nop
    nop
;Add sufficient delay
    ld a,%00110001
    out (0),a
    ld a,%00000000
    out (0),a

    nop
    ld a,%00110001
    out (0),a
    ld a,%00000000
    out (0),a

    nop
    ld a,%00110001
    out (0),a
    ld a,%00000000
    out (0),a

    nop
    ld a,%00100001
    out (0),a
    ld a,%00000000
    out (0),a

    nop



    nop
    ld a,%00100001
    out (0),a
    ld a,%00000000
    out (0),a
    nop
    ld a,%10000001
    out (0),a
    ld a,%00000000
    out (0),a
    
    

    nop
    ld a,%00000001
    out (0),a
    ld a,%00000000
    out (0),a
    nop
    ld a,%10000001
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
    ld a,%00010001
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
send_cmd: ld a,h
    rrca
    rrca
    rrca
    rrca
    ld b,%00000001
    or b
    out (0),a
    ld a,l
    ld a,%00000000
    out (0),a
    rrca
    rrca
    rrca
    rrca 
    ld b,%00000001
    or b
    out (0),a
    ld a,%00000000
    out (0),a
    ret


send_let: ld a,h
    out (0),a
    ld a,l
    ld a,%00000000
    out (0),a
    ld a,%00000000
    out (0),a
    ret