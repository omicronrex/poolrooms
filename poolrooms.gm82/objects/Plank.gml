#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
woah=0
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
if (instance_place(x,y-4,Player)) {
    if (!woah && abs(Player.x-x)>32) woah=20
    if (woah==180) {
        sound_play_ex("119793__lmbubec__springboard-a",1,0.3)
        Player.vspeed=-20*abs(Player.x-x)/96
    }
}

if (woah) {
    woah+=20
    if (woah>=360) woah=0
}

image_angle=sign(image_xscale)*dsin(woah)*-8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
