#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
woah=0
special=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y-4,Player) && y<PoolWater.y) {
    if (special==-1) {
        if (y==ystart) {
            sound_play_ex("woodbreak",1,0.3)
            gravity=0.5
        }
    } else {
        if (!woah && abs(Player.x-x)>32) woah=20
        if (woah==180) {
            sound_play_ex("119793__lmbubec__springboard-a",1,0.3)
            Player.vspeed=-20*abs(Player.x-x)/96
            if (special) {Player.vspeed=-30 lock_controls() special=-1}
        }
    }
}

if (woah) {
    woah+=20
    if (woah>=360) woah=0
}

image_angle=sign(image_xscale)*dsin(woah)*-8

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    if (vspeed>2) {
        sound_play("wood1")
    }
    move_contact_solid_hv(0,vspeed)
    vspeed=0
    gravity=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field special: bool

if (special && savedata("woohoo")) special=-1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self_floored()
