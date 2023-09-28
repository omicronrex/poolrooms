#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=-999
angle=0
dy=0
active=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) if (Player.vspeed<0 && instance_place(xstart,y-Player.vspeed*2,Player) && !instance_place(xstart,y,Player)) {
    x=xstart
    active=1
    sound_play("bump")
    instance_create(x,y,DickCoin)
}

if (active) {
    angle=min(180,angle+180/8)
    dy=dsin(angle)*-12
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,-1,x,y+dy)
