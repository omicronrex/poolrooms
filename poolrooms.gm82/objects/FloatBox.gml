#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=random(100)
stuck=10
sndd=0
underwater=0
checksolid=0

tex=sprite_get_texture(sprite_index,0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ygo=PoolWater.y-16+choose(-2,2)

with (Pirror) if (active==2 || active==3) other.ygo=999

if (y<ygo) vspeed+=0.15 else vspeed=vspeed*0.98-0.08

vspeed=median(-7,vspeed,7)

if (bbox_top>PoolWater.y) {
    if (underwater==1) instance_create(mean(bbox_left,bbox_right),PoolWater.y,WaterSplash1)
    underwater=2
} else if (bbox_bottom>PoolWater.y) {
    if (underwater==0) instance_create(mean(bbox_left,bbox_right),PoolWater.y,WaterSplash1)
    if (underwater==2) instance_create(mean(bbox_left,bbox_right),PoolWater.y,WaterSplash2)
    underwater=1
} else {
    underwater=0
}

hspeed=0
if (!place_free(x,y+1)) {stuck=10 if (PoolWater.y>y+32 && !instance_place(x,y-2,MovingSolid)) {
    xmove=Player.input_h*!Player.dead
        if (instance_place(x-xmove,y,Player)) if (place_free(x+xmove,y)) {
        hspeed=xmove
        if (!sndd) sndd=sound_loop("drag")
    }
}}

if (hspeed!=0) {if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
}} else if (sndd) {sound_stop(sndd) sndd=0}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    if (vspeed>1.5 && bbox_bottom<PoolWater.y) {
        sound_play_pitch(choose("thud1","thud2","thud3"))
    }
    move_contact_solid_hv(0,vspeed)
    vspeed=0
    stuck=10
}

if (stuck) stuck-=1

if (checksolid) {
    if (!place_free(x,y)) {
        move_outside_solid(90,1)
        move_outside_solid(270,1)
        vspeed=0
    } else checksolid-=1
}

time+=1

angle=4*sin(time/7)*cos(time/11)
if (stuck) angle=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bbox_bottom>PoolWater.y) underwater=1
if (bbox_top>PoolWater.y) underwater=2
