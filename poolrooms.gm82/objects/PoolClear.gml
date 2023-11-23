#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (TextDraw) {
    text+="##Game clear!#Time: "+format_time(savedatap("time"))+
    "#Deaths: "+string(savedatap("deaths"))
}

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
