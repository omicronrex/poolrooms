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

tex=sprite_get_texture(sprite_index,2)
image_speed=0

seen=savedatap("dickmove"+string(room)+"_"+string(xstart)+"_"+string(y))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) if (Player.vspeed<0 && instance_place(xstart,y-Player.vspeed+1,Player) && !instance_place(xstart,y,Player)) {
    x=xstart
    active=1
    tex=sprite_get_texture(sprite_index,1)
    seen=1
    savedatap("dickmove"+string(room)+"_"+string(xstart)+"_"+string(y),1)
    sound_play("bump")
    instance_create(x+16,y-16,DickCoin)
    with (Player) {y+=vspeed move_outside_solid(270,abs(vspeed)) vspeed=0}
}

if (active) {
    angle=min(180,angle+180/8)
    dy=dsin(angle)*-12
}
