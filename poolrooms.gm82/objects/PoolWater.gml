#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=0
distortion=24

x=-32
image_xscale=room_width/32+32
image_yscale=room_height/32

onwater=savedata("onwater")
if (savedata("wlevelRoom")==room) {
    global.water_level=savedata("wlevel")
    y=global.water_level
    with (FloatBox) {
        do {
            yo=y
            y=approach(y,PoolWater.y-16,32)
            if (!place_free(x,y)) {
                y=yo break
            }
        } until (abs(y-(PoolWater.y-16))<16)
    }

    with (FloatSpike) y=median(ystart,PoolWater.y-16,ystart+32)
} else global.water_level=y
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=3

n=surface_set("noise",128,128)
draw_clear($0)
draw_set_blend_mode(bm_add)
    texture_set_interpolation(1)
        draw_background_tiled_extra(bgNoise1,time*0.05546,time*0.051235,1,1,0,$303030,1,0,0)
        draw_background_tiled_extra(bgNoise1,-time*0.05546,-time*0.051235,1,1,0,$303030,1,0,0)

        draw_background_tiled_extra(bgNoise2,time*0.025346,-time*0.0256456,1,1,0,$303030,1,0,0)
        draw_background_tiled_extra(bgNoise2,-time*0.025346,time*0.0256456,1,1,0,$303030,1,0,0)

        draw_background_tiled_extra(bgNoise3,-time*0.1231,time*0.168156,1,1,90,$303030,1,0,0)
        draw_background_tiled_extra(bgNoise3,time*0.1231,-time*0.168156,1,1,90,$303030,1,0,0)
    texture_set_interpolation(0)
draw_set_blend_mode(0)
surface_reset()

y=approach(lerp(y,global.water_level,1/100),global.water_level,1/10)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dy=median(-608,y-view_yview,608)

s=surface_get("clone",global.APPwidth,global.APPheight)
surface_copy(s,0,0,application_surface)

if (room==rmTitle) {
    surface_set_target(s)
    draw_set_blend_mode(bm_subtract)
    draw_background(bgTitleMask,0,0)
    draw_set_blend_mode(0)
    surface_set_target(application_surface)
}

shader_pixel_set(global.shader_water)

texture_set_stage("Water",surface_get_texture(s))
texture_set_stage_interpolation("Water",1)
texture_set_stage_repeat("Water",tr_clamp,tr_clamp,0)
texture_set_stage("Manifold",surface_get_texture(n))
texture_set_stage_repeat("Manifold",tr_wrap,tr_wrap,0)
texture_set_stage_interpolation("Manifold",1)
shader_pixel_uniform_color("colorto",color_reverse($087d4d))
shader_pixel_uniform_f("distort",distortion/800,distortion/608)
shader_pixel_uniform_f("surface",-view_xview/global.APPwidth,dy/global.APPheight)

texture_set_interpolation(1)
draw_primitive_begin(pr_trianglestrip)
draw_vertex_texture_color(-0.5,-0.5+dy,0,0,$33,1)
draw_vertex_texture_color(-0.5+800,-0.5+dy,1,0,$33,1)
draw_vertex_texture_color(-0.5,-0.5+dy+608,0,1,$ff,1)
draw_vertex_texture_color(-0.5+800,-0.5+dy+608,1,1,$ff,1)
draw_vertex_texture_color(-0.5,-0.5+dy+1216,0,2,$ff,1)
draw_vertex_texture_color(-0.5+800,-0.5+dy+1216,1,2,$ff,1)
draw_primitive_end()
texture_set_interpolation(0)

shader_reset()

with (Player) if (hydrolitis>0 && !dead) draw_healthbar(x-view_xview-50,y-view_yview-30,x-view_xview+50,y-view_yview-20,hydrolitis*100,0,$408000,$408000,0,1,1)
