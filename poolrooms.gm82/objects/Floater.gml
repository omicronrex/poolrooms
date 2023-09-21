#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ygo=PoolWater.y-8+choose(-1,1)

if (y<ygo) vspeed+=0.2 else vspeed=vspeed*0.9-0.15

vspeed=median(-7,vspeed,7)

if (bbox_top>PoolWater.y) {
    if (!underwater) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=1
} else {
    if (underwater) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=0
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
