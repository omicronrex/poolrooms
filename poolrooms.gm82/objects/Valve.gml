#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
check=0
valve=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (check) {
    valve+=a
    if (abs(y+16-PoolWater.y)<8) {
        with (Valve) check=0
        sound_play("00C4_0008")
        sound_stop("floodLOOP2")
        sound_stop("drainGlugA_2")
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.water_level!=y+16) {
    with (valve) check=0
    sound_stop("floodLOOP2")
    sound_stop("drainGlugA_2")

    if (global.water_level<y+16) {
        sound_play("drainGlugA_2")
        a=-3
    } else {
        a=3
        sound_play("floodLOOP2")
    }
    global.water_level=y+16
    sound_play("00CB_000D")
    check=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprValve,0,x+16,y+16)
texture_set_interpolation(1)
draw_sprite_ext_fixed(sprValve,1,x+17,y+17,1,1,valve,$80,1)
draw_sprite_ext_fixed(sprValve,1,x+15,y+15,1,1,valve,$8080ff,1)
draw_sprite_ext_fixed(sprValve,1,x+16,y+16,1,1,valve,$ff,1)
texture_set_interpolation(0)
