#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0
image_yscale=0

repeat (20) instance_create_moving(x+gauss_range(-10,10),y,WaterSplashDrop,gauss_range(0,3),gauss_range(90-60,90+60))

alarm[0]=20
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,PoolWater.y,WaterSplash2)
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale+=1/10
image_yscale+=1/30
y+=0.75

image_alpha-=1/20
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_self()
texture_set_interpolation(0)
