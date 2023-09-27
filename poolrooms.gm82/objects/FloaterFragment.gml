#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=random_range(6,10)
direction=random(360)
friction=0.5

image_angle=random(360)
scale=choose(-1,1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_yscale=speed/10

image_xscale=image_yscale*scale

if (speed<=0) instance_destroy()
