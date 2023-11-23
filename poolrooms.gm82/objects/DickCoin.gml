#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
vspeed=-12
gravity=0.6
sound_play("dcoin")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>4) {
    instance_create(x,y,Blink)
    instance_destroy()
}
