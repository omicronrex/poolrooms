#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=random_range(0.05,0.1)
image_yscale=image_xscale
image_angle=random(360)
gravity=0.1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>PoolWater.y) image_alpha-=0.1
if (image_alpha<0) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_self()
texture_set_interpolation(0)
