#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field thingy: instance
//field dingy: instance

var bepis;bepis="##You have found yourself and#escaped the Poolrooms!##Time: "
+format_time(savedatap("time"))+" - Resets: "+string(savedatap("deaths"))

thingy.text+=bepis
dingy.text+=bepis

savedatap("clear",true)
savedata("diff",3)
savedatap("diff",3)
difficulty=3
savedata_write()

t=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=0.02
shader_draw_shadertoy(global.shader_rain,0,0,800,608,t)

texture_set_interpolation(1)
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_rect(0,0,800,608,0,1-t)
