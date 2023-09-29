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
    if (a<0) if (!irandom(4)) instance_create(x+16+random_range(-6,6),y+16+random_range(-6,6),Bubbles)
    if (a>0) instance_create(view_xview+random(800),view_yview+608+gauss(200),Bubbles)
    if (abs(y+16-PoolWater.y)<8) {
        with (Valve) check=0
        sound_play_pitch("00C4_0008")
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
    with (Valve) check=0
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

    sound_play_ex("save"+string(irandom_range(1,6)),1,random_range(0.4,0.6))

    check=1
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop("floodLOOP2")
sound_stop("drainGlugA_2")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprValve,0,x+16,y+16)
texture_set_interpolation(1)
draw_sprite_ext_fixed(sprValve,1,-0.5+x+17,-0.5+y+17,1,1,valve,$80,1)
draw_sprite_ext_fixed(sprValve,1,-0.5+x+15,-0.5+y+15,1,1,valve,$8080ff,1)
draw_sprite_ext_fixed(sprValve,1,-0.5+x+16,-0.5+y+16,1,1,valve,$ff,1)
texture_set_interpolation(0)
