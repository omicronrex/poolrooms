#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (30) instance_create_moving(x+gauss_range(-10,10),y,WaterSplashDrop,gauss_range(1,5),gauss_range(90-40,90+40))

silent=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!silent) sound_play(choose("splashLarge_1","splashLarge_5"))
instance_destroy()
