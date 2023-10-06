#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=random(100)
stuck=0
ballon=0

image_speed=0
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
ygo=PoolWater.y-8+choose(-1,1)

if (y<ygo) vspeed+=0.2 else vspeed=vspeed*0.95-0.15

vspeed=median(-7,vspeed,7)

if (bbox_top>PoolWater.y) {
    if (!underwater) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=1
} else {
    if (underwater) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=0
}

if (instance_place(x,y-2,Player) && Player.vspeed>=-0.5 && !Player.dead) {
    if (!ballon) ballon=6
    else {
        if (Player.input_h!=0) ballon+=1
        else ballon=5
    }
} else ballon=0

if (ballon>5) {
    ballon=1
    sound_play_pitch("balloon_walk"+string(irandom_range(1,10)))
}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    move_contact_solid_hv(0,vspeed)
    vspeed=0
    stuck=10
}

if (stuck) stuck-=1

time+=1
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
underwater=bbox_top>PoolWater.y
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=8*sin(time/7)*cos(time/11)
if (stuck) angle=0
draw_sprite_ext(sprite_index,1,x+16+pivot_pos_x(-16,-16,angle),y+16+pivot_pos_y(-16,-16,angle),1,1,angle,cor,1)
draw_sprite_ext(sprite_index,2,x+16+pivot_pos_x(-16,-16,angle),y+16+pivot_pos_y(-16,-16,angle),1,1,angle,$ffffff,1)
