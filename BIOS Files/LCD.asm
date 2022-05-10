    org $00
    ld hl,$FFFF
    call nop_loop
    call init_lcd
    ld hl,hello_world
    call send_string
    ld b,$0A
    call move_loop
    ld a,%00111110
    call send_let
    jp inf_loop
;Add sufficient delay
init_lcd:
    ld a,%00110000
    call send_single
    ld hl,$4000
    call nop_loop
    
    ld a,%00110000
    call send_single
    ld hl,$4000
    call nop_loop

    ld a,%00110000
    call send_single
    ld hl,$4000
    call nop_loop

    ld a,%00100000
    call send_single
    ld hl,$4000
    call nop_loop

    ld a,%00101000
    call send_cmd
    ld hl,$4000
    call nop_loop

    ld a,%00001000
    call send_cmd
    ld hl,$4000
    call nop_loop

    ld a,%00000001
    call send_cmd
    ld hl,$4000
    call nop_loop

    ld a,%00000110
    call send_cmd
    ld hl,$4000
    call nop_loop

    ld a,%00001111
    call send_cmd
    ld hl,$4000
    call nop_loop

    ret

move_loop:
    ld a,%00010100
    call send_let
    djnz move_loop
    ret
inf_loop:
    nop
    jp inf_loop
send_cmd:   ld b,a 
    set 0,a
    res 1,a
    res 2,a
    res 3,a
    out (0),a
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
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
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
    ret
send_let: ld b,a 
    set 0,a
    set 1,a
    res 2,a
    res 3,a
    out (0),a
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
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
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
    ret

send_single:
    set 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
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
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
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
    ld hl,$4000
    call nop_loop
    res 0,a
    out (0),a
    ld hl,$4000
    call nop_loop
    inc hl
    jp send_string




hello_world:    defm    "0K RAM",0


nop_loop:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec hl
    ld a,$FF
    and h
    jp nz,nop_loop
lower:
    ld a,$FF
    and l
    jp nz,nop_loop
    ret