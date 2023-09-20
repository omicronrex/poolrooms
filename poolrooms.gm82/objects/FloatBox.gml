#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ygo=PoolWater.y-16+choose(-2,2)

if (y<ygo) vspeed+=0.15 else vspeed=vspeed*0.96-0.08

vspeed=median(-7,vspeed,7)

if (bbox_top>PoolWater.y) {
    if (!underwater) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=1
} else {
    if (underwater) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=0
}

if (!place_free(x,y+1) && PoolWater.y>y+32) {
    if (instance_place(x-Player.hspeed,y,Player)) hspeed=sign(Player.hspeed) else hspeed=0
    if (instance_place(x+hspeed,y+16,object_index)) hspeed=0
} else hspeed=0

if (hspeed!=0) if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    move_contact_solid_hv(0,vspeed)
    vspeed=0
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
underwater=bbox_top>PoolWater.y
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
