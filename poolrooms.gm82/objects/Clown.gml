#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sndd=0
underwater=0
clowning=0

image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y<PoolWater.y) vspeed+=0.15 else vspeed=vspeed*0.98+0.08

vspeed=median(-7,vspeed,7)

if (bbox_top>PoolWater.y) {
    if (underwater==1) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=2
} else if (bbox_bottom>PoolWater.y) {
    if (underwater==0) instance_create(x+16,PoolWater.y,WaterSplash1)
    if (underwater==2) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=1
} else {
    underwater=0
}

hspeed=0
image_index=0
clowning=0
if (!place_free(x,y+1) && inside_view() && !Player.dead /* && !instance_place(x,y-1,MovingSolid)*/) {
    xmove=sign(Player.x-x)
        if (instance_place(Player.x-16,y,Player)) {
        hspeed=xmove
        clowning=1
        image_index=1+(xmove>0)
    }
}

if (hspeed!=0) {if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
    clowning=0
    image_index=0
}}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    if (vspeed>1) {
        sound_play_pitch("debris_stone_hard_07")
    }
    move_contact_solid_hv(0,vspeed)
    vspeed=0
    stuck=10
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bbox_bottom>PoolWater.y) underwater=1
if (bbox_top>PoolWater.y) underwater=2
