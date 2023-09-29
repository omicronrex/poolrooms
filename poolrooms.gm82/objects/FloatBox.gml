#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=random(100)
stuck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ygo=PoolWater.y-16+choose(-2,2)

if (y<ygo) vspeed+=0.15 else vspeed=vspeed*0.98-0.08

vspeed=median(-7,vspeed,7)

if (bbox_top>PoolWater.y) {
    if (!underwater) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=1
} else {
    if (underwater) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=0
}

hspeed=0
if (!place_free(x,y+1) && PoolWater.y>y+32) {
    xmove=sign(x+16-Player.x)*2
    if (instance_place(x-xmove,y,Player)) if (!instance_place(x+hspeed,y+16,object_index)) {
        hspeed=xmove
    }
}

if (hspeed!=0) if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    if (vspeed>2 && bbox_bottom<PoolWater.y) {
        sound_play(choose("thud1","thud2","thud3"))
    }
    move_contact_solid_hv(0,vspeed)
    vspeed=0
    stuck=10
}

if (stuck) stuck-=1

time+=1
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
angle=4*sin(time/7)*cos(time/11)
if (stuck) angle=0
texture_set_interpolation(1)
draw_sprite_ext(sprite_index,-1,x+16*image_xscale+pivot_pos_x(-16*image_xscale,-16*image_yscale,angle),y+16*image_yscale+pivot_pos_y(-16*image_xscale,-16*image_yscale,angle),image_xscale,image_yscale,angle,$ffffff,1)
texture_set_interpolation(0)
