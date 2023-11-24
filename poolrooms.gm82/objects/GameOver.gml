#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=global.GUIwidth div 2
y=global.GUIheight div 2
alarm[0]=40/dt
active=0

distortion=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    distortion=min(24,distortion+0.2)

    shader_pixel_set(global.shader_gameover)

    texture_set_stage("Manifold",surface_get_texture(surface_get("noise",128,128)))
    texture_set_stage_repeat("Manifold",tr_wrap,tr_wrap,0)
    texture_set_stage_interpolation("Manifold",1)
    shader_pixel_uniform_f("distort",distortion/535,distortion/90)

    draw_self()

    shader_reset()
}
