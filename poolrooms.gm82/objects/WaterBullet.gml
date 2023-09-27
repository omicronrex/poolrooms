#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
life=300

alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (20) instance_create(x,y,Bubbles)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speed>2) instance_create(x,y,Bubbles)

speed=max(0,speed-1-random(1))
vspeed=1

if (!place_free(x+hspeed,y)) {move_contact_solid_hv(hspeed,0) hspeed=0}
if (!place_free(x,y+vspeed)) {
    vspeed=0
    life-=1
    image_alpha=min(1,life/100)
}

if (!life) instance_destroy()
