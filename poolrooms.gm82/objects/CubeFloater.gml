#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=random(100)
stuck=0
sndd=0
ballon=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ygo=PoolWater.y-16+choose(-1,1)

if (y<ygo) vspeed+=0.2 else vspeed=vspeed*0.95-0.15

vspeed=median(-7,vspeed,7)

if (instance_place(x,y-2,Player) && Player.vspeed>=-0.5) {
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

if (bbox_top>PoolWater.y) {
    if (!underwater) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=1
} else {
    if (underwater) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=0
}

hspeed=0
if (!place_free(x,y+1) && PoolWater.y>y+32) {
    xmove=Player.input_h*2
    if (instance_place(x-xmove,y,Player) && place_free(x+xmove,y)) {
        hspeed=xmove
        if (!sndd) sndd=sound_loop_ex("drag",1,1.2)
    }
}

if (hspeed!=0) {if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
}} else if (sndd) {sound_stop(sndd) sndd=0}


if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    move_contact_solid_hv(0,vspeed)
    vspeed=0
    stuck=10
}

if (stuck) stuck-=1

time+=1
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.y>bbox_top+4) {
    sound_play_ex("537897__belanhud__balloon-pop-one",0.8,random_range(0.6,0.7))
    repeat (8) instance_create(x+random(32),y+random(32),FloaterFragment)
    instance_destroy()
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
underwater=bbox_top>PoolWater.y
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=6*sin(time/7)*cos(time/11)
if (stuck) angle=0
draw_sprite_ext(sprite_index,-1,x+16+pivot_pos_x(-16,-16,angle),y+16+pivot_pos_y(-16,-16,angle),1,1,angle,$ffffff,1)
