#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
image_xscale=2
image_yscale=2
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
    instance_create(x+16,y+16,Blink)
    instance_destroy()
}
