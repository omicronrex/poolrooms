#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=random_range(0.05,0.1)
image_yscale=image_xscale
image_angle=random(360)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y<PoolWater.y+2) instance_destroy()

hspeed=random_range(-1,1)
vspeed=random_range(-2,-1)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x<view_xview-100 || x>view_xview+900 || y<view_yview-100 || y>view_yview+1000) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//texture_set_interpolation(1)
draw_self()
//texture_set_interpolation(0)
